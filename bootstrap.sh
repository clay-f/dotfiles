#!/bin/bash
position=${HOME}/dotfiles
platform='unknown'
unamestr=`uname`
count=0

matchPlatform()
{
    if [[ $unamestr == 'Linux' ]]; then
       platform='linux'
        start
    elif [[ $unamestr == 'Darwin' ]]; then
        platform='Darwin'
        count=1
        start
    fi
}

start()
{
	echo "now start ..."
    if [ $count -gt 0 ]; then
        if [ -e $position/Mac/mac-config.sh ]; then
            bash $position/Mac/mac-config.sh
        fi
    else
        if [ -e $position/Linux/linux-config.sh ]; then
            bash $position/Linux/linux-config.sh
        fi
    fi
}

msg() {
    printf '%b\n' "$1" >&2
}

main() {
    matchPlatform
    msg "\nThanks for installing"
    msg "`date + %Y` success"
}

main


