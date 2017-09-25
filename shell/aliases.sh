# aliases config

# cp, rm, tar etc
alias vi=vim
alias bz2='tar -jcpv -f'
alias unbz2='tar -jxt -f'
alias viewbz2='tar -jtv -f'
alias rm="rm -i"
alias h="history | tail -n 50"

# Show human friendly numbers and colors
alias df='df -h'
alias du_sum_directory='du -hs'
alias diff='diff -qr'

# find information in files
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cleanup_vim_backup_views_etc_files="find ~/.vimbackup ~/.vimswap ~/.vimundo ~/.vimviews -type f -delete"

alias cleanup_ds_store_files="find . -type f -name '*.DS_Store' -ls -delete"

alias k9="kill -9"

### listen port, show prossess info
alias top_load_mem="top -l 1 -s 0 | awk '/PhysMem/ || /Load Avg/ {print}'"
alias top_order_cpu="top -o cpu -n 20"
alias lsof_listen="lsof -i TCP -s TCP:LISTEN -n -P"
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
    export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
    colorflag="-G"
    export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
