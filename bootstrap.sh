#!/bin/bash
APP_PATH=${HOME}/dotfiles
app_name='dotfiles'
platform='unknown'
unamestr=`uname`
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/lyf-t/dotfiles.git'
count=0


msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq 0 ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

debug() {
    if [ "$ret" -eq 1 ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

matchPlatform() {
    if [[ $unamestr == 'Linux' ]]; then
       platform='linux'
        start
    elif [[ $unamestr == 'Darwin' ]]; then
        platform='Darwin'
        count=1
        start
    fi
}

start() {
    if [ $count -gt 0 ]; then
        if [ -e $APP_PATH/Mac/mac-config.sh ]; then
            bash $APP_PATH/Mac/mac-config.sh
        fi
    else
        if [ -e $APP_PATH/Linux/linux-config.sh ]; then
            bash $APP_PATH/Linux/linux-config.sh
        fi
    fi
    ret="$?"
    debug
    msg "not found $app_name on $APP_PATH ..."
    msg "now exit ..."
    exit
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully updated $repo_name"
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi
}

do_backup() {
    if [ -e "$1" || [ -e "$2" ] || [ -e "$3" ] ]; then
        msg "Attempting to back up your original dotfiles configration."
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3"; do
            [ -e "$i" ] && [ -L "$1" ] && mv -v "$i" "$i.$today"
        done
        ret="$?"
        success "Your original vim configuration has been backed up."

    fi
}

main() {
    msg "matchPlatform start ...\n\n"
    matchPlatform
    msg "\n\nbackup now start ...\n\n"
    do_backup "$HOME/dotfiles" \
              "$HOME/.zshrc"   \
              "$HOME/.bashrc"

    msg "\n\nsync_repo now start ...\n\n"
    sync_repo "$HOME/dotfiles" \
              "$REPO_URI" \
              "master"
    start
    msg "\nThanks for installing $app_name"
    msg "`date + %Y%m%d_%s` success"
}


msg "hello world\n\n"
main
