bindkey '^ ' autosuggest-accept
alias vi=vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ovi='open -a MacVim '


#environment setting {
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    PATH="/usr/local/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
#}

#sources configuration{
    source ${HOME}/.rvm/scripts/rvm
    source ${HOME}/dotfiles/zsh/source-alias.zsh
#}