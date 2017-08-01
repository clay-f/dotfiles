#!/usr/bin/env bash

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
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
    fi
}

config_oh_my_zsh_framework() {
    program_must_exist "wget"
    
    if [[ "$?" -eq 0 ]]; then
        bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    else
        error "wget coomand not found."
    fi
}

