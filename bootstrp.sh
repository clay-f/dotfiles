#!/bin/bash
position=${HOME}/dotfiles
platform='unknown'
unamestr=`uname`
count=0

matchPlatform()
{
    if [[ $unamestr == 'Linux' ]]; then
       platform='linux'
    elif [[ $unamestr == 'Darwin' ]]; then
        platform='Darwin'
        count=1
    echo "\n\t$platform"
        start
    fi
}

start()
{
    if [ $count -gt 0 ]; then
        if [ -e $position/Mac/necessary-config.sh ]; then
            sh $position/Mac/necessary-config.sh
        fi
    else
        if [ -e $position/Linux/necessary-config.sh ]; then
            sh $position/Linux/nescssary-config.sh
        fi
    fi
}



matchPlatform
echo "\n\ta_^ seccess 😃\n"
