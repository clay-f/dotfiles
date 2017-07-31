#!/usr/bin/env bash

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
    progrm_exists $1

    if [[ "$?" -ne 0 ]]; then
        error "You muse have '$1' installed  to continue."
        exit
    fi
}

brew_install() {
    tools=(
        "wget --with-iri" "the_silver_searcher" \
        "ctags" "zsh" "rbenv" "ruby-build" \
        "vim --override-system-vi" "nmap" "z"
    )
    for (( i = 0; i < ${#tools[*]}; i++ )); do
        brew install ${tools[i]}
    done

    brew_cask
}

brew_cask() {
    brew tap phinze/homebrew-cask && brew install brew-cask
    cask_tools=( "iterm2" "go2shell" "dropbox" "qlcolorcode" "qlstephen" "qlmarkdown" )
    for (( i = 0; i < ${cask_tools[*]}; i++ )); do
        brew cask install ${cask_tools[i]}
    done
    brew cleanup
}

install() {
    program_must_exist "brew"
    if [[ $? -eq 0 ]]; then
        brew_install
    else
        error "brew command not found."
    fi
}

install
