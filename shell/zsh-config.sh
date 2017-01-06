#!/bin/bash

oh_my_zsh=$HOME/.oh-my-zsh
name=`whoami`
[ -z "$APP_PATH" ] && APP_PATH="$HOME/dotfiles"

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

oh_my_zsh() {
    if [[ ! -d $oh_my_zsh ]]; then
        bash -c  "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        if [[ -e $HOME/.zshrc ]]; then
            sed -i 's/plugins=(git.*)/plugins=(common-aliases git autojump rails)/' ~/.zshrc  # add plugins
        fi
    else
        printf "have oh-my-zsh directory on you $HOME."
        printf "exit ..."
        exit
    fi
}

lnif() {
    if [[  -e "$1" ]]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$1"

    lnif "$source_path/ruby/.gemrc"      "$target_path/.gemrc"
    lnif "$source_path/.gitconfig"       "$target_path/.gitconfig"
    lnif "$source_path/etc/tmux.conf"    "$target_path/.tmux.conf"
    lnif "$source_path/etc/.wgetrc"      "target_path/.wgetrc"
}

progrm_exists() {
    local ret='0'
    command -v $1 >/dev/null 2&>1 || { local ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    progrm_exists $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

install() {
    program_must_exist "wget"

    if [[ "$?" -eq 0 ]]; then
        oh_my_zsh

        create_symlinks "$APP_PATH" \
            "$HOME"
    else
        error "wget command not found."
        exit
    fi
}


install
