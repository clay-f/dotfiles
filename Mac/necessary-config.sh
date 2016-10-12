#!/bin/bash
#created by F on 2016-09-19
position='${HOME}/dotfiles'

brew()
{
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    bash $position/Mac/brew.sh
    echo "\e[31mbrew have done"
}

zsh()
{
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    bash $position/zsh/plugins-config.sh
}

vim()
{
    bash $position/vim/bootstrap.sh
    return
}

if [ -d $position ]; then
    brew
    zsh
    vim
else
    echo "\tnot found $position"
    exit
fi
