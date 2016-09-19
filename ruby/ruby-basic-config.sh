#!/bin/bash
#created by F on 2016-09-19

rvm_ruby()
{
    curl -sSL https://get.rvm.io | bash -s stable
    rvm install 2.3.1
    gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
    gem install rails

    return
}

rvm_ruby
