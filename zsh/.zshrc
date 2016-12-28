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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source $HOME/dotfiles/zsh/.aliases

PATH="/usr/local/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# local customer config
[ -f ~/.f.zsh ] && source ~/.f.zsh
