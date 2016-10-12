#!/bin/bash
#created by F on 2016-09-19
plugins_install() {
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    if [ -e $HOME/.oh-my-zsh/custom/example.zsh ]; then
        echo "bindkey '^ ' autosuggest-accept" >> $HOME/.oh-my-zsh/custom/example.zsh
    fi
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

oh_my_zsh() {
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}


oh_my_zsh
if [ -d $HOME/.oh-my-zsh ]; then
    plugins_install
fi
