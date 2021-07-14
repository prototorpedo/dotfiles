#!bin/bash

sudo pacman-db-upgrade && sync

sudo pacman -R vim-tiny i3lock chromium firefox

echo "Updating..."
sudo pacman -Syu

echo "Essentials..."
sudo pacman -Sy $(cat ./data/essentials.list | grep -v '#')
echo "Done essentials..."
sleep 1

echo "Extras..."
yay -Sy $(cat ./data/extra.list | grep -v '#')
echo "Done extras..."
sleep 1

echo "Development..."
yay -Sy $(cat ./data/development.list | grep -v '#')
echo "Done development..."
sleep 1

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)

### Vim spf13
curl http://j.mp/spf13-vim3 -L -o - | sh

### npm no sudo
wget -O- https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | zsh

npm install -g @angular/cli @vue/cli yarn eslint eslint-plugin-vue sass-lint typescript json-server nodemon

# composer (php)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '795f976fe0ebd8b75f26a6dd68f78fd3453ce79f32ecb33e7fd087d39bfeb978342fb73ac986cd4f54edd0dc902601dc') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# # docker
systemctl enable docker.service
systemctl start docker.service

# Add firewall rule
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0

sudo groupadd docker
sudo gpasswd -a $USER docker

# .zshrc, bash_aliases, bash_functions, etc.
cp -TRv ./files/ $HOME/

# Sublime Text config
dropbox ~
cd ~/.config/sublime-text-3/Packages/
rm -r User
ln -s ~/Dropbox/Sublime/User

echo "Done!!!!"
