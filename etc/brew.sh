#!/usr/bin/env bash

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local $ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    progrm_exists $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

install_tools_and_cask() {
    brew install "wget --with-iri" "the_silver_searcher" "aria2" \
                 "ctags" "zsh" "rbenv" "ruby-build" \
                 "vim --override-system-vi" "nmap" "autojump"
    brew cleanup
}


install_package() {
    program_must_exist "brew"
    if [[ $? -eq 0 ]]; then
        install_tools_and_cask
    else
        error "brew command not found."
    fi
}

install_package
