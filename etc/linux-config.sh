#!/bin/bash

position=${HOME}/dotfiles

toolkits_config() {
    sudo apt-get -y install gcc
    sudo apt-get -y install make
    sudo apt-get -y install tmux
    sudo apt-get -y install nmap
    sudo apt-get -y install tree
    sudo apt-get -y install pstree
    sudo apt-get -y install curl
    sudo apt-get -y install zsh
    sudo apt-get -y install ack-grep
    sudo apt-get -y install autojump
    sudo apt-get -y install links
    sudo apt-get -y install vim
    sudo apt-get -y install vim-gtk
        vim_require
    sudo apt-get autoremove
}

monaco_font_conf() {
    git clone https://github.com/cstrap/monaco-font.git ~/dotfiles
    cd ~/dotfiles/monaco-font/
    ./install-font-ubuntu.sh  http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
    rm -rf ~/dotfiles/monaco-font
}

vim_require() {
    sudo apt-get -y install vim-nox
    sudo apt-get -y install vim-gtk
    sudo apt-get -y install vim-gnome
    sudo apt-get -y install vim-athena
}

develop_config() {
    bash $position/zsh/zsh-config.sh
    bash $position/vim/bootstrap.sh
    bash $position/ruby/ruby-rails-install.sh
}

nesessary() {
    toolkits_config
    vim_require
}

install() {
    nesessary
    develop_config
    monaco_font_conf
}


################################################ Main
if [ -d $position ];then
    install
else
    echo "not found $position"
    exit
fi
