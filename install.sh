#!/bin/bash
position=${HOME}/dotfiles
platform='unknown'
unamestr=`uname`
count=0

if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='Darwin'
    count=1
fi

#if [  ! $count -lt 0 ]; then
    #sh $position/Mac/nesessary-config.sh

#else
    #sh $position/Linux/nesessary-config.sh
#fi

echo "\n\ta_^ seccess 😃\n"
