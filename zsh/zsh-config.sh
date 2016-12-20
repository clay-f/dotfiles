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
    if [ -e ~/.zshrc ]; then
        sed -i "s/plugins=(git.*)/plugins=(common-aliases git z ruby rails)/g" ~/.zshrc
    fi
    add_plugins_config
    ln -s $HOME/dotfiles/ruby/.gemrc ~/
    ln -s $HOME/dotfiles/.gitconfig ~/
    ln -s $HOME/dotfiles/tmux/.tmux.conf ~/
}

add_plugins_config() {
        if [ ! -e $HOME/dotfiles/custom/$name.zsh ]; then
            echo "alias vi=vim" >> $oh_my_zsh/custom/$name.zsh
            echo "#sources configuration{" >> $oh_my_zsh/custom/$name.zsh
            echo -e "\tsource ${HOME}/.rvm/scripts/rvm" >> $oh_my_zsh/custom/$name.zsh
            echo -e "\tsource $HOME/dotfiles/zsh/.aliases" >> $oh_my_zsh/custom/$name.zsh
            echo "#}" >> $oh_my_zsh/custom/$name.zsh
        fi
}


############################################################################################################## Main
oh_my_zsh

add_plugins_config

config_link_files
