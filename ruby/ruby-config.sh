#!/bin/bash
#created by F on 2016-09-19

msg() {
    printf "%b%n" "$1" >&2
}

rvm_ruby()
{
    if [ ! -d $HOME/.rvm ]; then
        curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
    fi
    if [ -d $HOME/.rvm/gems/ruby-2.3.1 ]; then
        msg "found ruby install on your $HOME directory"
        msg "now begin reinstall ..."
        rvm remove 2.3.1
        rvm reinstall ruby-2.3.1
    else
        rvm install 2.3.1
        rvm --default use 2.3.1
    fi
    gem sources -l |ack 'https..+taobao.org/' >2&
    if [ "$?" != 0 ]; then
        gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
    fi
    gem install rails -v 5.0.0.1
}

rvm_ruby


