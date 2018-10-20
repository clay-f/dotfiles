#!/usr/bin/env bash
# linux utility tools

echo "start install common tools..."

sudo apt-get update
sudo apt-get -y install git emacs mysql-server make gcc net-tools

sudo apt-get -y upgrade
sudo apt-get -y autoremove

printf "tools config have done\n"
