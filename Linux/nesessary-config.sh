#!/bin/bash
nesessary()
{
    sh ./apt-get.sh
    sh ../ruby/ruby-basic-config.sh
    sh ../vim/vim-install.sh
    echo "a_^"
    echo "\e[45m,30m,1 success"

    return
}

nesessary
