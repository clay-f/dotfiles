#!/bin/bash

position="${HOME}/dotfiles"
debug_mode='0'

msg() {
    printf "%b\n" "$1" >&2
}

debug() {
    if [[ $debug_mode -eq 1 && "$ret" -gt 1 ]]; then
        msg "a error found on \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
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

brew_config_install() {
    progrm_exists "brew"
    if [[ "$?" -ne 0 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    program_must_exist "brew"
    if [[ "$?" -eq 0 ]]; then
        bash $position/etc/brew.sh
    else
        error "brew command not found , now exit..."
        exit
    fi

    ret="$?"
    debug
}

zsh_config_install() {
    bash $position/shell/zsh-config.sh

    ret="$?"
    debug
}

ruby_config_install() {
    bash $position/ruby/ruby_config.sh

    ret="$?"
    debug
}

vim_config_install() {
    bash $position/vim/bootstrap.sh

    ret="$?"
    debug
    return
}

install() {
    if [ -d $position ]; then
        brew_config_install
        vim_config_install
        zsh_config_install
        ruby_config_install
    else
        echo "\tnot found $position"
        exit
    fi
}

install
