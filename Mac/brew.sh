#!/usr/bin/env bash

brew_install() {

    brew update
    # Upgrade any already-installed formulae.
    brew upgrade --all

    # Install `wget` with IRI support.
    brew install wget --with-iri
    brew install vim --override-system-vi
    brew install gnu-sed --with-default-names
    brew install cmake
    brew install zsh
    brew install xz
    brew install tmux
    brew install sbcl
    brew install nmap
    brew install ack
    brew install git
    brew install lua
    brew install tree
    brew install pstree
    brew install z
    brew install zsh-syntax-highlighting
    brew install brew-cask
}

brew_cask() {
    brew tap phinze/homebrew-cask && brew install brew-cask
    brew cask install alfred
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install macvim
    brew cask install wireshark
    brew cask install dropbox
    brew cask cleanup
    brew cleanup
    return
}

brew_install
brew_cask
