#!/bin/bash
read -r -p "Are you sure you want to remove dotfiles [y/N]" confirmation
if [[ "$confirmation" != y ]] && [[ "$confirmation" != Y ]]; then
    echo "Uninstall cancelled"
    exit
fi

echo "Removing ~/dotfiles"
if [[ -d ~/dotfiles ]]; then
    rm -rf ~/dotfiles
fi

echo "Thanks for trying dotfiles. it's been uninstalled."
