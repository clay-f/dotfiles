#!/bin/bash

position=${HOME}/dotfiles

tools_config() {
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
    sudo apt-get -y install vim
        vim_require
    sudo apt-get autoremove
}

monaco_font_conf() {
    git clone https://github.com/cstrap/monaco-font.git ~/dotfiles
    cd ~/dotfiles/monaco-font/
    ./install-font-ubuntu.sh  http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
    rm -rf ~/dotfiles/monaco-font
}

terminal_theme_molokai() {
    git clone  https://github.com/pricco/gnome-terminal-colors-monokai.git ~/dotfiles
    cd ~/dotfiles/gnome-terminal-colors-monokai/
    ./install.sh
    rm -rf ~/dotfiles/gnome-terminal-colors-monokai
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
    tools_config
    vim_require
}

install() {
    nesessary
    develop_config
    monaco_font_conf
    terminal_theme_molokai
}


################################################ Main
if [ -d $position ];then
    install
else
    echo "not found $position"
    exit
fi
