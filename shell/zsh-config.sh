#!/bin/bash

oh_my_zsh=$HOME/.oh-my-zsh
name=`whoami`

msg() {
    printf "%b\n" "$1" >&2
}

oh_my_zsh() {
    if [[ ! -e $oh_my_zsh ]]; then
        wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
        if [[ -e $HOME/.zshrc ]]; then
            sed -i 's/plugins=(git.*)/plugins=(common-aliases git autojump rails)/' ~/.zshrc  # add plugins
        fi
    else
        printf "have oh-my-zsh directory on you $HOME."
        printf "exit ..."
        exit
    fi
}

config_link_files() {
    if [[ ! -e $HOME/.gemrc ]]; then
        ln -s $HOME/dotfiles/ruby/.gemrc ~/
    fi
    if [[ ! -e $HOME/.gitconfig ]]; then
        ln -s $HOME/dotfiles/.gitconfig ~/
    fi
    if [[ ! -e $HOME/.tmux.conf ]]; then
        ln -s $HOME/dotfiles/etc/tmux.conf ~/.tmux.conf
    fi
}


install() {
    if [[ -e /usr/local/bin/wget ]]; then
        oh_my_zsh
        config_link_files
    else
        msg "not found wget command."
        msg "now exit..."
        exit
    fi
}


install
