#!/bin/bash
#created by F on 2016-09-19

position='${HOME}/dotfiles'

msg() {
    print "%b\n" "$1" >&2
}

debug() {
    if [[ "$ret" -eq 0 ]]; then
        msg "a error found on \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

brew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    bash $position/Mac/brew.sh
    ret="$?"
    debug
}

zsh() {
    bash $position/zsh/zsh-config.sh
    ret="$?"
    debug
}

ruby() {
    bash $position/ruby/ruby-rails-install.sh
    ret="$?"
    debug
}

vim() {
    bash $position/vim/bootstrap.sh
    ret="$?"
    debug
    return
}

if [ -d $position ]; then
    brew
    zsh
    ruby
    vim
else
    echo "\tnot found $position"
    exit
fi
