#!/usr/bin/env bash
set -e

declare - r APP_PATH="${HOME}/dotfiles"
declare -r app_name="dotfiles"
platform="unknown"
unamestr="$(uname -sm)"
declare -r [ -z "$REPO_URI" ] && REPO_URL='https://github.com/clay-f/dotfiles.git'
count=${count=0}
debug_mode=0


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
    if [[ $debug_mode -eq 1 && $ret -gt 1 ]]; then
        msg "An error occurred in function ${FUNCNAME[1]}, ${BASH_LINENO[1]}, sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exist $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
    fi
}

execute_command_by_file() {
    bash "$1"
}

sync_repo() {
    local repo_path="$1"
    local repo_url="$2"
    local repo_branch="$3"

    msg "Trying to update $repo_name"

    if [[ ! -e "$repo_path" ]]; then
        mkdir -p "$repo_path"
        git clone "$repo_url" "$repo_path"
        success "Successfully updated $repo_name"
    else
        cd "$repo_path" && git pull origin "$repo_branch"
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
        success "Your original vim configuration has been backed up."

    fi
}

lnif() {
    if [[  -e "$1" ]]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"


    lnif "$source_path/git/gitignore/macOS.gitignore" "$target_path/.gitignore_global"
    lnif "$source_path/ruby/gemrc"      "$target_path/.gemrc"
    lnif "$source_path/git/gitconfig"      "$target_path/.gitconfig"
    lnif "$source_path/ruby/irbrc"      "$target_path/.irbrc"
    lnif "$source_path/etc/wgetrc"      "$target_path/.wgetrc"
    lnif "$source_path/shell/aliases"   "$target_path/.aliases"

    ret="$?"
    success "Setting up link files"
    debug
}

config_package_tools_and_shell_by_sys_type() {
    count=1
    if [ $count -gt 0 ]; then
        config_brew_and_relate_tools
        (bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)")
    fi
    ret="$?"
    debug
}

config_brew_and_relate_tools() {
    program_exists "brew"
    if  [[ "$?" -ne 0 ]]; then
        (/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; 
          (program_must_exist brew) && [[ "$?" == 0 ]]  && execute_command_by_file "$APP_PATH/etc/brew.sh")
    fi
    ret="$?"
    debug
}

match_sys_os() {
    if [[ $unamestr =~ [Darwin] ]]; then
        platform='Darwin'
        count=1
    fi
}

main() {
    match_sys_os

    do_backup "$HOME/dotfiles"

    sync_repo "$HOME/dotfiles"  \
              "$REPO_URL"       \
              "master"

    create_symlinks "$APP_PATH" \
                    "$HOME"

    config_package_tools_and_shell_by_sys_type

    msg "\nThanks for installing $app_name"
    msg "`date + %Y%m%d_%s` successed"
}


main
