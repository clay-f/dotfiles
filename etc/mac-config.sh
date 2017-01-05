#!/bin/bash

position="${HOME}/dotfiles"

msg() {
    printf "%b\n" "$1" >&2
}

debug() {
    if [[ "$ret" -ne 0 ]]; then
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
        error "You must have your HOME environmental variable set to continue."
    fi
}

brew_config_install() {
    progrm_exists "brew"
    if [[ "$?" -ne 0 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        progrm_exists "brew"
        if [[ "$?" -eq 0 ]]; then
            bash $position/etc/brew.sh
        else
            msg "brew command not found."
            msg "now exit..."
            exit
        fi

        ret="$?"
        debug
    fi
}

zsh_config_install() {
    bash $position/shell/zsh-config.sh

    ret="$?"
    debug
}

ruby_config_install() {
    bash $position/ruby/ruby-rails-install.sh

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
        zsh_config_install
        ruby_config_install
        vim_config_install
    else
        echo "\tnot found $position"
        exit
    fi
}

install
