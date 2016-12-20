#!/usr/bin/env bash

brew_install() {

    brew update
    # Upgrade any already-installed formulae.
    brew upgrade --all


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
    brew install z
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

    brew cask cleanup
    brew cleanup
}

brew_install
brew_cask
