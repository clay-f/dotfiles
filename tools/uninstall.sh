#!/bin/bash
confirm() {
    while [ 1 ]; do
        read -p "$1" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy] ]]; then
                remove "$HOME/dotfiles"
            return 0
        elif [[ $REPLY =~ ^[Nn] ]]; then
            return 1
        fi
    done
}

remove() {
  echo "Remove $1"
  rm -rf "$1"
}


if [[ -d $HOME/dotfiles ]]; then
    confirm "- Remove y/n ?  "
fi
