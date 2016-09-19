#!/bin/bash
#created by F on 2016-09-19

vim ()
{
    cd ~
    ln -s ${HOME}/dotfiles/vim/.vimrc .
    ln -s ${HOME}/dotfiles/vim/.vimrc.bundles .
    git clone https://github.com/VundleVim/Vundle.vim.git /.vim/bundle/vundle.vim
    vim +BundleInstall! +BundleClean +qall

    echo "a_^"
    echo "\e[45m,30m,1 success"

    return
}

vim
