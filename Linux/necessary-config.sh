#!/bin/bash

position=${HOME}/dotfiles

apt_install()
{
    sudo apt-get -y install gcc
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
    sudo apt-get -y install lua5.3
    #wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - |sh
    sudo apt-get autoclean
}

nesessary()
{
    bash $position/ruby/ruby-basic-config.sh
    bash $position/dotfiles/zsh/plugins-config.sh
    bash $position/dotfiles/vim/vim-install.sh
    bash $position/dotfiles/vim/spf13-vim-3.0/bootstrap.sh

    return
}

if [ -d $position ];then
	apt_install
	nesessary
else
	echo "wrong"
fi
