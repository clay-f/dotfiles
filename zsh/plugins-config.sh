#!/bin/bash
#created by F on 2016-09-19

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
if [ -e $HOME/.oh-my-zsh/custom/example.zsh ]; then
    echo "bindkey '^ ' autosuggest-accept" >> $HOME/.oh-my-zsh/custom/example.zsh
fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
