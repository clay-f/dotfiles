#!/usr/bin/env bash

install_develop_tools() {
    sudo apt-get -y install "gcc" "make" "tmux" \
                            "tree" "curl" \
                            "vim" "ruby-dev"

    sudo apt-get autoremove

    # Groom your app’s Ruby environment
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}


install_develop_tools
