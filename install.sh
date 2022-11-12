#!/bin/bash

# update the system
apt update
apt upgrade

echo 'Install node'
# install node
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.shv
bash nodesource_setup.sh
sudo apt install -y nodejs
node -v
# update npm
npm install -g npm
# install yarn
npm install -g yarn
su -c "yarn config set prefix ~/.yarn-global" $USERNAME

# install python
echo "Install python"
apt install -y python3-neovim
apt install -y python-pip python3-dev
apt install -y python3-setuptools
easy_install3 pip

# install rg
echo "Install RG search"
sudo apt install -y ripgrep

# install zsh
apt install -y -y zsh
# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh $USERNAME
echo 'SHELL=/bin/zsh' >> /etc/environment
# change user to $USERNAME
chown -R $USERNAME:$USERNAME ~/.zshrc ~/.oh-my-zsh

echo "Install Docker"
# install latest Docker
curl -sL https://get.docker.io/ | sh
# install latest docker-compose
curl -L "$(curl -s https://api.github.com/repos/docker/compose/releases | grep browser_download_url | head -n 4 | grep Linux | grep -v sha256 | cut -d '"' -f 4)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# fix ownership of home
chown -R $USERNAME:$USERNAME ~/

echo "Intall some dev tools"
apt install -y git php-cli unzip
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# clean the box
apt -y autoclean
apt -y clean
apt -y autoremove
