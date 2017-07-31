#!/usr/bin/env bash

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

install_develop_tools() {
    sudo apt-get -y "gcc" "make" "tmux" "ruby-build" \
                    "tree" "curl" \
                    "vim" "ruby-dev"

    sudo apt-get autoremove

    # Groom your app’s Ruby environment
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}


install_develop_tools
