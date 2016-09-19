apt_install()
{
    sudo apt-get -y install sudo
    sudo apt-get -y install tmux
    sudo apt-get -y install vim
    sudo apt-get -y install nmap
    sudo apt-get -y install tree
    sudo apt-get -y install pstree
    sudo apt-get -y install gcc
    sudo apt-get -y install make
    sudo apt-get -y install zsh
    sudo apt-get -y install curl
    sudo apt-get -y install wireshark
    #wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - |sh
    sudo apt-get cleanup

    return
}

apt_install
