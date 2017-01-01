#!/bin/bash

oh_my_zsh=$HOME/.oh-my-zsh
name=`whoami`

msg() {
    printf "%b\n" "$1" >&2
}

oh_my_zsh() {
    if [[ ! -e $oh_my_zsh ]]; then
        wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    else
        printf "have oh-my-zsh directory on you $HOME."
        printf "exit ..."
        exit
    fi
}

config_link_files() {
    if [[ ! -e $HOME/.zshrc ]]; then
        ln -s $HOME/dotfiles/zsh/.zshrc ~/
    fi
    if [[ ! -e $HOME/.gemrc ]]; then
        ln -s $HOME/dotfiles/ruby/.gemrc ~/
    fi
    if [[ ! -e $HOME/.gitconfig ]]; then
        ln -s $HOME/dotfiles/.gitconfig ~/
    fi
    if [[ ! -e $HOME/.tmux.conf ]]; then
        ln -s $HOME/dotfiles/etc/tmux.conf ~/.tmux.conf
    fi
    if [[ ! -e $HOME/.f.zsh ]]; then
        ls -s $HOME/dotfiles/zsh/.f.zsh ~/
    fi
}


install() {
    oh_my_zsh
    config_link_files
}


install
