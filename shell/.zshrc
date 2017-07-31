# Path to your oh-my-zsh installation.
export ZSH=/Users/Who/.oh-my-zsh
ZSH_THEME="robbyrussell"

export EDITOR='vim'

export PATH="$PATH:/usr/local/sbin"
plugins=(git rails z common-aliases)
source $ZSH/oh-my-zsh.sh

[[ -e "$HOME/.aliases" ]] && source $HOME/.aliases
eval "$(rbenv init -)"
