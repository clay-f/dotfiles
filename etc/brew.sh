#!/usr/bin/env bash

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [[ "$ret" -ne 0 ]]; then
        msg "a error found on \"${FUNCNAME[$i+1]}\" in ${BASH_LINENO[$i+1]}, sorry for that."
    fi
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

brew_install() {

    brew update
    # Upgrade any already-installed formulae.
    brew upgrade

    brew install git
    # Install `wget` with IRI support.
    brew install wget --with-iri
    brew install automake
    brew install openssl
    brew install cmake

    # utility tools
    brew install vim --override-system-vi
    brew install gnu-sed --with-default-names
    brew install ack
    brew install nmap
    brew install pstree
    brew install tree
    brew install autojump
    brew install lua
    brew install ctags
    brew install zsh
    brew install tmux
}

brew_cask() {
    brew tap phinze/homebrew-cask && brew install brew-cask
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install macvim
    brew cask install go2shell
    brew cask install dropbox

    brew cleanup
}

install() {
    program_must_exist "brew"
    if [[ $? -eq 0 ]]; then
        brew_install
        brew_cask
    else
        msg "brew command not found."
        msg "now exit..."
        exit
    fi
}


install
