#!/bin/bash

position=${HOME}/dotfiles

msg() {
    printf "%b\n" "$1" >&2
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local $ret='1'; }

    if [[ "$ret" -ne 0 ]]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exist $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

toolkits_config() {

    tools=(
        "gcc" "make" "tmux" "nmap"  \
        "tree" "pstree" "curl" "zsh" "ack-grep" "autojump"  \
        "vim" "links" "nginx" "silversearcher-ag" "ruby-dev"
    )

    for (( i = 0; i < ${#tools[*]}; i++ )); do
        sudo apt-get -y install ${tools[i]}
    done
    # sudo apt-get -y install vim-gtk        ## gvim
    sudo apt-get autoremove

    # fzf is a general-purpose command-line fuzzy finder.
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # Groom your app’s Ruby environment
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    if [[ ! -f ~/.zshrc ]]; then
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    else
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    fi
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}

nesessary() {
    toolkits_config
    bash $position/shell/zsh-config.sh
}

install() {
    progrm_exists "git"

    if [ -d $position ];then
        nesessary
    else
        echo "not found $position"
        exit
    fi
}

install
