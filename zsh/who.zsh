alias vi=vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ovi='open -a MacVim '

#environment setting {
    PATH="/usr/local/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#}

#sources configuration{
    source $HOME/dotfiles/zsh/.aliases
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#}
