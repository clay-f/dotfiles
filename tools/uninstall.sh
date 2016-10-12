#!/usr/bin/env sh


uninstall_vim() {
    app_dir="$HOME/dotfiles/vim"

    warn() {
        echo "$1" >&2
    }

    die() {
        warn "$1"
        exit 1
    }

    rm $HOME/.vimrc
    rm $HOME/.vimrc.bundles
    rm $HOME/.vim

    rm -rf $app_dir
}

uninstall_dotfiles() {
    dotfile_dir="$HOME/dotfiles"
    rm -rf $HOME/dotfiles
    echo "\t\tUninstall Success"
}

uninstall_vim
uninstall_dotfiles
