#!/bin/bash
#created by F on 2016-09-19

msg() {
    printf "%b%n" "$1" >&2
}

debug() {
    if [[ "$ret" -eq 0 ]]; then
        msg "error found on function \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
}

rvm_ruby()
{
    if [ ! -d $HOME/.rvm ]; then
        curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
    fi
    ret="$?"
    debug
}

rvm_ruby


