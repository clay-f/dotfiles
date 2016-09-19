#!/bin/bash
#created by F on 2016-09-19

basic()
{
    brew install wget
    brew install lua
    brew install z
    brew install nmap
    brew install node
    brew install tree
    brew install pstree
    brew install mysql
    brew install sbcl
    brew install zsh
    brew install ack
    brew install zsh-syntax-highlighting
    brew install gnu-sed
}

brew_cask()
{
    brew tap phinze/homebrew-cask && brew install brew-cask
    brew cask install thunder
    brew cask install macvim
    brew cask install dropbox
    brew cask install flux
    brew cask install evernote
    brew cask install google-chrome
    brew cask install wireshark
    brew cask cleanup
    return
}

basic
brew_cask
