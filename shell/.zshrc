# Path to your oh-my-zsh installation.
export ZSH=/Users/Who/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

plugins=(common-aliases git autojump  rails)
source $ZSH/oh-my-zsh.sh

PATH="/usr/local/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/sbin:$PATH"
[[ -e "$HOME/.aliases" ]] && source $HOME/.aliases
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
