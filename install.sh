#!/bin/bash
platform='unknown'
unamestr=`uname`
count=0
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='Darwin'
    count=1
fi

if [  ! $count -lt 0 ]; then
    sh ./Mac/nesessary-config.sh

else
    sh ./Linux/nesessary-config.sh
fi

