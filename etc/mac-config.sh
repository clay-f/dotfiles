#!/bin/bash

position="${HOME}/dotfiles"

msg() {
    printf "%b\n" "$1" >&2
}

debug() {
    if [[ "$ret" -eq 0 ]]; then
        msg "a error found on \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

brew_config_install() {
    if [[ ! -e /usr/local/bin/brew ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        bash $position/etc/brew.sh

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
    brew_config_install
    zsh_config_install
    ruby_config_install
    vim_config_install
}

if [ -d $position ]; then
    install
else
    echo "\tnot found $position"
    exit
fi
