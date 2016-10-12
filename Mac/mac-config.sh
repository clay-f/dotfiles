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
    bash $position/zsh/zsh-config.sh
}

ruby() {
    bash $position/ruby/ruby-config.sh
}

vim()
{
    bash $position/vim/bootstrap.sh
    return
}

if [ -d $position ]; then
    brew
    zsh
    ruby
    vim
else
    echo "\tnot found $position"
    exit
fi
