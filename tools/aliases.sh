##### aliases config

# cp, rm, tar etc
alias vi=vim
alias tar_bz2='tar -jcpv -f'
alias tar_unbz2='tar -jxt -f'
alias viewbz2='tar -jtv -f'
alias rm="rm -i"
alias h="history | tail -n 50"

alias df='df -h'
alias du_sum_directory='du -hs'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cleanup_ds_store_files="find . -type f -name '*.DS_Store' -ls -delete"

alias k9="kill -9"

alias lsof_listen="lsof -i TCP -s TCP:LISTEN -n -P"
