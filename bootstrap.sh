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
        if [ -e $position/Mac/necessary-config.sh ]; then
            bash $position/Mac/necessary-config.sh
        fi
    else
        if [ -e $position/Linux/necessary-config.sh ]; then
            bash $position/Linux/necessary-config.sh
        fi
    fi
}

matchPlatform

echo "\n\ta_^ seccess 😃\n"
