#!bin/bash

echo "Adding repos..."
sudo bash ./repos.sh

echo "Updating system..."
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

sudo apt-get remove --purge chromium

echo "Essentials..."
sudo apt-get install -y $(cat ./data/essentials.list | grep -v '#')
echo "Done essentials..."
sleep 1

echo "Extras..."
sudo apt-get install -y $(cat ./data/extra.list | grep -v '#')
echo "Done extras..."
sleep 1

echo "Development..."
sudo apt-get install -y $(cat ./data/development.list | grep -v '#')
echo "Done development..."
sleep 1

echo "Snaps..."
while read line; do
    if [ ${line:0:1} == "#" ]; then
        break
    fi
    sudo snap install $line
done < ./data/snaps.list
echo "Done snaps..."
sleep 1

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)

### Vim spf13
curl http://j.mp/spf13-vim3 -L -o - | sh

### npm no sudo
wget -O- https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | bash

npm install -g @angular/cli @vue/cli yarn

### Kite (python AI)
bash -c “$(wget -q -O – https://linux.kite.com/dls/linux/current)”

### Configs
git config --global user.email "calin.s.bogdan@gmail.com"
git config --global user.name "Bogdan Calin"


# # docker
#systemctl enable docker.service
#systemctl start docker.service

#sudo groupadd docker
#sudo gpasswd -a $USER docker

# .zshrc, bash_aliases, bash_functions, etc.
#cp -TRv ./files/ ~/
#touch ~/.zshrc-extra

echo "Done!!!!"
