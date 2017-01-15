#!/bin/bash

position=${HOME}/dotfiles


msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local $ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exist $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

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
    sudo apt-get autoremove
}



develop_config() {
    bash $position/zsh/zsh-config.sh
    bash $position/vim/bootstrap.sh
}

nesessary() {
    toolkits_config
}

install() {
    progrm_exists "git"

    if [ -d $position ];then
        nesessary
        develop_config
    else
        echo "not found $position"
        exit
    fi
}


install
