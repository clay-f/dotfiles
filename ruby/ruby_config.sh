#!/bin/bash

msg() {
    printf "%b%n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [[ "$ret" -eq 1 ]]; then
        msg "error found on function \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exist $1

    if [[ "$1" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

elasticsearch_install() {
    wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
    echo "deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main" >> /etc/apt/sources.list
    sudo apt-get update && sudo apt-get install elasticsearch
    update-rc.d elasticsearch defaults 95 10
    /etc/init.d/elasticsearch start
}

install() {
    progrm_exists "rvm"
    if [[ "$?" -ne 0 ]]; then
        curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
        curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
    fi

    ret="$?"
    debug
}

install
