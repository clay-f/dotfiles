# linux utility tools

tools=(git aria2 emacs mysql-server proxy links)

for i in ${tools[@]}
do
    sudo apt-get install $i
done

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
