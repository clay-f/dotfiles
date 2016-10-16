#!/usr/bin/env sh

uninstall_vim() {

    rm $HOME/.vimrc
    rm $HOME/.vimrc.bundles
    rm -rf $HOME/.vim
    rm -rf $HOME/.vimbackup/
    rm -rf $HOME/.vimswap/
    rm -rf $HOME/.vimundo/
    rm -rf $HOME/.vimviews/
}

uninstall_dotfiles() {
    dotfile_dir="$HOME/dotfiles"
    rm -rf $HOME/dotfiles
}

uninstall_zsh()
{
    bash ~/.oh-my-zsh/tools/uninstall.sh
}

success_uninstall()
{
    echo "\t\tUninstall Success"
}
uninstall_vim
uninstall_dotfiles
uninstall_zsh
if [ ! -d $HOME/dotfiles ]; then
    success_uninstall
fi
