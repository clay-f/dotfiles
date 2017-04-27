# Path to your oh-my-zsh installation.
export ZSH=/Users/Who/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi
export PATH="$PATH:/usr/local/sbin:/usr/local/opt/gnu-sed/libexec/gnubin"
plugins=(git rails z common-aliases)
source $ZSH/oh-my-zsh.sh

[[ -e "$HOME/.aliases" ]] && source $HOME/.aliases
eval "$(rbenv init -)"
