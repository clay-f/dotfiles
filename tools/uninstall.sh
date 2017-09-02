#!/bin/bash

confirm() {
    printf "Type keyword [y/n]: "
    sleep 1
}

trap 'confirm' SIGINT

input='$@'

while [[ 1 ]]; do
    printf "Type keyword [y/n]: "
    read -n 1 input
    if [[ "$input" =~ [Yy] ]]; then
        rm -rf ~/dotfiles && exit 0
    elif [[ "$input" =~ [Nn] ]]; then
            exit 0
    fi
    echo $REPLY
    bash -c "$input"
done