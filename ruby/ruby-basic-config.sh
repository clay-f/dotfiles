#!/bin/bash
#created by F on 2016-09-19
rvm_ruby()
{
    curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
    rvm install 2.3.1
    gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
    gem install rails -v 5.0.0.1

    return
}

link_file() {
    if [ -e ~/.zshrc ]; then
        rm ~/.zshrc
        ln -s $HOME/dotfiles/zsh/.zshrc ~/
    fi
    ln -s $HOME/dotfiles/tmux/tmux.conf ~/
    ln -s $HOME/dotfiles/ruby/gemrc ~/
    ln -s $HOME/dotfiles/.gitconfig ~/
}

link_file
rvm_ruby


