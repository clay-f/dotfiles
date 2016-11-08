#!/bin/bash
#this file just for fast install rvm ruby rails.
#create by F on 2016-11-08


msg() {
    printf "%b%n" "$1" >&2
}

debug() {
    if [[ "$ret" -eq 1 ]]; then
        msg "error found on function \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

ruby_rails_install() {
    if [[ ! -d $HOME/.rvm ]]; then
        curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
        curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
    fi

    elasticsearch_install

    ret="$?"
    debug
}

elasticsearch_install() {
    wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
    echo "deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main" >> /etc/apt/sources.list
    sudo apt-get update && sudo apt-get install elasticsearch
    update-rc.d elasticsearch defaults 95 10
    /etc/init.d/elasticsearch start
}

ruby_rails_install
