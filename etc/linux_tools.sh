#!/usr/bin/env bash
# linux utility tools

declare -r today="date_formate='date +"%Y_%m_%d_%H_%M"'"

printf "start config deb sources config...\n"
if [[ -f "${HOME}/.dotfiles/etc/sources.list" ]]; then
    mv /etc/apt/sources.list "/etc/apt/sources_list_${today}.backup"
    cp "${HOME}/.dotfiles/etc/sources.list" /etc/apt/sources.list
fi

wget -P /tmp https://repo.mysql.com//mysql-apt-config_0.8.9-1_all.deb
sudo dpkg -i /tmp/mysql-apt-config_0.8.9-1_all.deb
sudo apt-get update

echo "Start install common tools..."
tools=(git aria2 emacs mysql-server make gcc nginx net-tools)
sudo apt-get -y install "${tools[@]}"

# config ruby env
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

if [[ -f "${HOME}/.aliases.sh" ]]; then
    echo 'source ~/.aliases.sh"' >> ~/.bashrc
fi

sudo apt-get upgrade
sudo apt-get autoremove
printf "tools config have done\n"
