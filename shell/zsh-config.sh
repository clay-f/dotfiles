#!/usr/bin/env bash

oh_my_zsh=$HOME/.oh-my-zsh
name=`whoami`
[ -z "$APP_PATH" ] && APP_PATH="$HOME/dot-f"

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

oh_my_zsh() {
    if [[ ! -d $oh_my_zsh ]]; then
        bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    else
        printf "have oh-my-zsh directory on you $HOME."
        printf "exit ..."
        exit 1
    fi
}

progrm_exists() {
    local ret='0'
    command -v $1 >/dev/null 2&>1 || { local ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    progrm_exists $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit 1
    fi
}

install() {
    program_must_exist "wget"

    if [[ "$?" -eq 0 ]]; then
        oh_my_zsh
    else
        error "wget command not found."
        exit 1
    fi
}


install
