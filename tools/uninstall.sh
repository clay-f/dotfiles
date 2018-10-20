#!/bin/bash
#
# remove dotfiles config

confirm() {
    printf "\rType keyword [y/n]: "
    sleep 1
}

trap 'confirm' SIGINT

while [[ 1 ]]; do
    printf "Type keyword [y/n]: "
    read  -s -n 1 input
    if [[ "$input" =~ [Yy] ]]; then
        rm -rf ~/dotfiles && exit 0
    elif [[ "$input" =~ [Nn] ]]; then
            exit 0
    fi
    printf "\n"
    bash -c "$input"
done