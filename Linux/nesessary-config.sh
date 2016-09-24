#!/bin/bash

position=${HOME}/dotfiles

apt_install()
{
    sudo apt-get -y install sudo
    sudo apt-get -y install tmux
    sudo apt-get -y install vim
    sudo apt-get -y install nmap
    sudo apt-get -y install tree
    sudo apt-get -y install pstree
    sudo apt-get -y install gcc
    sudo apt-get -y install make
    sudo apt-get -y install zsh
    sudo apt-get -y install curl
    #wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - |sh
    sudo apt-get autoclean
}

nesessary()
{
    sh $position/ruby/ruby-basic-config.sh
    sh $position/vim/vim-install.sh
    sh $position/dotfiles/zsh/plugins-config.sh
    echo "a_^"
    echo "\e[45m,30m,1 success"

    return
}

apt_install
nesessary
