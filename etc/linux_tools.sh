#!/usr/bin/env bash
# linux utility tools

wget -P /tmp https://dev.mysql.com/get/mysql-apt-config_0.8.9-1_all.deb
sudo dpkg -i /tmp/mysql-apt-config_0.8.9-1_all.deb

echo "start install common tools..."

sudo apt-get update
sudo apt-get -y install git emacs mysql-server make gcc net-tools

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

sudo apt-get -y upgrade
sudo apt-get -y autoremove
printf "tools config have done\n"
