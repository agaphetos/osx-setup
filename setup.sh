#!/bin/bash

xcode-select --install

brew tap caskroom/cask
brew tap caskroom/drivers
brew tap caskroom/fonts
brew tap caskroom/versions

brew install \
  git \
  go \
  heroku/brew/heroku \
  mas \
  mysql \
  openshift-cli \
  postgresql \
  vim \
  tree \
  wget \
  zsh

brew services

brew services start mysql

mysqladmin -u root password 'root'

brew services start postgresql

createdb `whoami`
createuser -s postgres

psql -c "ALTER USER  postgres  WITH PASSWORD 'postgres';"

curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
sudo python get-pip.py
sudo pip install virtualenv

heroku update && heroku plugins:install autocomplete && heroku autocomplete

git config --global user.name "Levin Calado"
git config --global user.email "levincalado@gmail.com"
git config --global credential.helper osxkeychain
git config --global core.editor "vim"

ssh-keygen -t rsa -C "levincalado@SP-JCalado-MacBookPro2017"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

brew cask install \
  adoptopenjdk8 \
  android-file-transfer \
  appcleaner \
  brave-browser \
  cheatsheet \
  docker \
  folx \
  font-fira-code \
  gitkraken \
  google-chrome \
  hyper \
  iterm2 \
  logitech-options \
  nordvpn \
  pgadmin4 \
  postman \
  sequel-pro \
  spotify \
  skype \
  viber \
  visual-studio-code \
  vlc

mas install 441258766 # magnet
mas install 937984704 # amphetamine
mas install 1176895641 # spark mail

export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
export GOPATH=$HOME/code
export PATH=$PATH:$(go env GOPATH)/bin

curl -L https://github.com/zchee/docker-machine-driver-xhyve/releases/download/v0.3.1/docker-machine-driver-xhyve > /usr/local/bin/docker-machine-driver-xhyve
chmod +x /usr/local/bin/docker-machine-driver-xhyve
sudo chown root:wheel /usr/local/bin/docker-machine-driver-xhyve
sudo chmod u+s /usr/local/bin/docker-machine-driver-xhyve

brew cask install minishift
