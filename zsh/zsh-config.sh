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
    add_plugins_config
    ln -s $HOME/dotfiles/zsh/.zshrc ~/
    ln -s $HOME/dotfiles/ruby/.gemrc ~/
    ln -s $HOME/dotfiles/.gitconfig ~/
    ln -s $HOME/dotfiles/etc/tmux.conf ~/.tmux.conf
    ls -s $HOME/dotfiles/zsh/.f.zsh ~/
}


install() {
    oh_my_zsh
    config_link_files
}


install
