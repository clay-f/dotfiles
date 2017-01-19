uninstall() {
    dotfile_dir="$HOME/dotfiles"
    rm -rf $HOME/dotfiles
    rm -rf $HOME/.vim*

    if [ ! -d $HOME/dotfiles ]; then
        echo -e "\t\tUninstall Successed"
    fi
}

uninstall
