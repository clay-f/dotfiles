#!/usr/local/bin/zsh
#
# config common path, alias, helper function

export JAVA_HOME=$(/usr/libexec/java_home)
PATH="/usr/local/opt/curl/bin:/usr/local/rabbitmq_server-3.7.12/sbin:/usr/local/mongodb/bin:/usr/local/mysql/bin:/usr/local/elasticsearch/bin:/usr/local/sbin:$PATH"

load_files() {
    declare -a local arr=("$@")
    for file in "${arr[@]}"; do
	[[ -f "${file}" ]] && source "${file}"
    done
    unset file
}

load_files "${HOME}/.develop_env.sh"


kill_process_by_name() {
    kill -9 $(ps aux | grep -ie $1 | awk '!/grep/ {print $2}')
}


# cp, rm, tar etc
alias vi=vim
alias e=emacs
alias tar_bz2='tar -jcpv -f'
alias tar_unbz2='tar -jxt -f'
alias viewbz2='tar -jtv -f'
alias rm="rm -i"
alias h="history | tail -n 50"

alias df='df -h'
alias du_sum_directory='du -hs'

# find information in files
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cleanup_ds_store_files="find . -type f -name '*.DS_Store' -ls -delete"

alias k9="kill -9"

### listen port, show prossess info
alias top_load_mem="top -l 1 -s 0 | awk '/PhysMem/ || /Load Avg/ {print}'"
alias top_order_cpu="top -o cpu -n 20"
alias lsof_listen="lsof -i TCP -s TCP:LISTEN -n -P"

alias date_formate="date +\"%Y_%m_%d_%H_%M\""
