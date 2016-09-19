#!/bin/bash
brew()
{
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    sh ./brew.sh
}

zsh()
{
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    sh ../zsh/plugins-config.sh
}

ruby()
{
    sh ../ruby/ruby-basic-config.sh
}

vim()
{
    sh ../vim/vim-install.sh
    return
}

brew
zsh
ruby
vim
