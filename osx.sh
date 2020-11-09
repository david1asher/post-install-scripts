#!/bin/bash

# FIELS
touch ~/.bash_profile
touch ~/.gitignore_global

# GIT CONFIG
echo ".idea" >> ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
echo ".DS_Store?" >> ~/.gitignore_global
echo "._*" >> ~/.gitignore_global
echo ".Spotlight-V100" >> ~/.gitignore_global
echo ".Trashes" >> ~/.gitignore_global
echo "ehthumbs.db" >> ~/.gitignore_global
echo "Thumbs.db" >> ~/.gitignore_global
echo "yosi" >> ~/.gitignore_global
echo ".metals" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global


# ssh keys
echo Enter your email:
read varname
ssh-keygen -t rsa -b 4096 -C $varname
pbcopy < ~/.ssh/id_rsa.pub


## homebrew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## utils
brew install wget
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

##iterm
brew cask install iterm

## git
brew install git

## vscode
brew cask install visual-studio-code

# intellij-idea
brew cask install intellij-idea

## robo-3t
brew cask install robo-3t

## sqlectron
brew cask install sqlectron

# postman 
brew cask install postman

# sequel-pro
brew cask install sequel-pro

## freetds for talking to ms-sql
# brew install freetds
# brew install freetds@0.91
# brew link --force freetds@0.91

## caffeine
# brew cask install caffeine

## lastpass
# mas install 926036361
# next 2 lines are commented out because lastpass-cli still has some issues
# brew install lastpass-cli --with-pinentry
# git config --global credential.helper lastpass

## aws cli tools
sudo pip install awscli

## node via nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install stable
nvm alias default stable

## postgresql
# brew install postgresql

#### DOCKER
brew cask install docker
sudo pip install docker-compose
brew cask install kitematic

# Google Chrome
brew cask install google-chrome

## appstore cli
brew install mas

## BetterSnapTool
mas install 417375580

# macsfancontrols
wget https://www.crystalidea.com/downloads/macsfancontrol.zip
unzip macsfancontrol.zip
mv Macs\ Fan\ Control.app /Applications

#### FINDER
# finder list view by default
# defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
# quit finder
defaults write com.apple.finder QuitMenuItem -bool true; killall Finder
# file suffix in finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# full path in finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
# disable time-machine throtelling
sudo sysctl debug.lowpri_throttle_enabled=0

#### TERMINAL
# sets terminal theme to pro
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"


npm install npm-ls-scripts -g
