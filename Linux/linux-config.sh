#!/bin/bash

position=${HOME}/dotfiles

apt_install()
{
    sudo apt-get -y install gcc
    sudo apt-get -y install make
    sudo apt-get -y install sudo
    sudo apt-get -y install tmux
    sudo apt-get -y install vim
    sudo apt-get -y install nmap
    sudo apt-get -y install tree
    sudo apt-get -y install pstree
    sudo apt-get -y install curl
    sudo apt-get -y install zsh
    sudo apt-get -y install lua5.3
    sudo apt-get -y install ack-grep
    sudo apt-get autoclean
}

nesessary()
{
    bash $position/zsh/zsh-config.sh
    bash $position/vim/bootstrap.sh
    bash $position/ruby/ruby-config.sh
    return
}

main() {
    if [ -d $position ];then
        apt_install
        nesessary
    else
        echo "not found $position"
        exit
    fi
}

main
