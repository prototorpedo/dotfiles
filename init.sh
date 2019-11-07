#!bin/bash

sudo pacman-db-upgrade && sync

sudo pacman -R vim-tiny chromium

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

npm install -g @angular/cli @vue/cli yarn

# # Virtualbox
sudo gpasswd -a $USER vboxusers
systemctl enable vboxweb.service

# # docker
systemctl enable docker.service
systemctl start docker.service

sudo groupadd docker
sudo gpasswd -a $USER docker

# .zshrc, bash_aliases, bash_functions, etc.
cp -TRv ./files/ ~/
touch ~/.zshrc-extra

echo "Done!!!!"
