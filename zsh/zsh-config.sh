#!/bin/bash
#created by F on 2016-09-19
#changed by F on 2016-10-16

oh_my_zsh=$HOME/.oh-my-zsh

msg() {
    printf "%b\n" "$1" >&2
}

oh_my_zsh() {
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

plugins_install() {
    if [ -d $oh_my_zsh/plugins ]; then
        git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
}

config_link_files() {
    if [ -e ~/.zshrc ]; then
        sed -i "s/plugins=(git..*)/plugins=(zsh-autosuggestions zsh-syntax-highlighting git brew z nmap ruby rails)/g" ~/.zshrc
    fi
    add_plugins_config
    ln -s $HOME/dotfiles/ruby/gemrc ~/
    ln -s $HOME/dotfiles/.gitconfig ~/
    ln -s $HOME/dotfiles/tmux/tmux.conf ~/
}

add_plugins_config()
{
        echo "bindkey '^ ' autosuggest-accept" >> $HOME/.oh-my-zsh/custom/f.zsh
        echo "alias vi=vim" >> $oh_my_zsh/custom/f.zsh
        echo "#sources configuration{" >> $oh_my_zsh/custom/f.zsh
        echo "\tsource ${HOME}/.rvm/scripts/rvm" >> $oh_my_zsh/custom/f.zsh
        echo "\tsource $HOME/dotfiles/zsh/source-alias.zsh" >> $oh_my_zsh/custom/f.zsh
        echo "#}" >> $oh_my_zsh/custom/f.zsh >> $oh_my_zsh/custom/f.zsh
}


if [ ! -d $HOME/.oh-my-zsh ]; then
    oh_my_zsh
else
    msg  "\tyou haved .oh-my-zsh directory on you `$HOME`"
    msg  "\t now exit..."
    exit
fi

if [ -d $HOME/.oh-my-zsh ]; then
    plugins_install
fi

config_link_files