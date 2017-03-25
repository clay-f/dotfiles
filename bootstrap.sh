#!/usr/bin/env bash
APP_PATH="${HOME}/dotfiles"
app_name='dotfiles'
platform='unknown'
unamestr="$(uname -sm)"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/clay-f/dotfiles.git'
count=0
debug_mode='0'


msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq 0 ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ $debug_mode -eq 0 && "$ret" -gt 1 ]; then
        msg "An error occurred in function ${FUNCNAME[1]}, ${BASH_LINENO[1]}, sorry for that. "
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local $ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exist $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}


matchPlatform() {
    if [[ $unamestr =~ [Linux] ]]; then
       platform='linux'
    elif [[ $unamestr =~ [Darwin] ]]; then
        platform='Darwin'
        count=1
    fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully updated $repo_name"
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi
}

do_backup() {
    if [  -e "$1" ] || [ -e "$2" ] || [ -e "$3" ] ; then
        msg "Attempting to back up your original dotfiles configration."
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3"; do
            [ -e "$i" ] && [ -L "$i" ] && mv -v "$i" "$i.$today"
        done
        ret="$?"
        debug
        success "Your original vim configuration has been backed up."

    fi
}

lnif() {
    if [[  -e "$1" ]]; then
        ln -sf "$1" "$2"
    fi
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    lnif "$source_path/git/gitignore/global/macOS.gitignore" "$target_path/.gitignore_global"
    lnif "$source_path/ruby/.gemrc"      "$target_path/.gemrc"
    lnif "$source_path/etc/.tmux.conf"    "$target_path/.tmux.conf"
    lnif "$source_path/etc/.wgetrc"      "$target_path/.wgetrc"
    lnif "$source_path/shell/.aliases"   "$target_path/.aliases"
}


config_install() {
    "$1"
}

brew_config_install() {
    progrm_exists "brew"
    if [[ "$?" -ne 0 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    if [[ "$?" -eq 0 ]]; then
        config_install "$position/etc/brew.sh"
    else
        error "brew command not found , now exit..."
        exit 1
    fi

    ret="$?"
    debug
}

start() {
    if [ $count -gt 0 ]; then
        if [ -e $APP_PATH/etc/mac-config.sh ]; then
            brew_config_install
            config_install "./$position/shell/zsh-config.sh" \
                "./$position/vim/bootstrap.sh"
        fi
    else
        if [ -e $APP_PATH/etc/linux-config.sh ]; then
            config_install "./$APP_PATH/etc/linux-config.sh"
        fi
    fi
    ret="$?"
    debug
    msg "not found $app_name on $APP_PATH ..."
    msg "now exit ..."
    exit 1
}

main() {
    matchPlatform

    do_backup "$HOME/dotfiles"

    sync_repo "$HOME/dotfiles"  \
              "$REPO_URI"        \
              "master"

    create_symlinks "$APP_PATH" \
        "$HOME"

    start

    msg "\nThanks for installing $app_name"
    msg "`date + %Y%m%d_%s` successed"
}


main
