#!/usr/bin/env bash

uninstall_dotfiles() {
    dotfile_dir="$HOME/dotfiles"
    rm -rf $HOME/dotfiles
}

uninstall_vim() {

    rm $HOME/.vimrc
    rm $HOME/.vimrc.bundles
    rm -rf $HOME/.vim
    rm -rf $HOME/.vimbackup/
    rm -rf $HOME/.vimswap/
    rm -rf $HOME/.vimundo/
    rm -rf $HOME/.vimviews/
}

uninstall_zsh() {
    bash ~/.oh-my-zsh/tools/uninstall.sh
}

uninstall_ruby() {
    rm -rf ~/.rvm
    rm -rf ~/.gem
    rm prf ~/.gemrc
}

uninstall_tmux() {
    rm -rf ~/.tmux.conf
}

success_uninstall() {
    echo "\t\tUninstall Success"
}

main() {
    uninstall_vim
    uninstall_dotfiles
    uninstall_zsh
    uninstall_tmux
    uninstall_ruby
    if [ ! -d $HOME/dotfiles ]; then
        success_uninstall
    fi
}


main
