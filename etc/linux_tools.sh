# linux utility tools

wget -P /tmp https://repo.mysql.com//mysql-apt-config_0.8.9-1_all.deb -D
dpkg -i mysql-apt-config_0.8.9-1_all.deb
sudo apt-get update

tools=(git aria2 emacs mysql-server make gcc nginx )

for i in ${tools[@]}
do
    sudo apt-get -y install $i
done

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
