#!/bin/bash

touch ~/.bash_profile

## homebrew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## utils
brew install wget

## git
brew install git

## vscode
brew cask install visual-studio-code

## node via nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install stable
nvm alias default stable

## robo-3t
brew cask install robo-3t

## aws cli tools
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install awscli

## docker
brew cask install docker
brew cask install kitematic

# Google Chrome
brew cask install google-chrome

## appstore cli
brew install mas

## postgresql
brew install postgresql

## freetds for talking to ms-sql
# brew install freetds
brew install freetds@0.91
brew link --force freetds@0.91

## caffeine
brew cask install caffeine

## lastpass
mas install 926036361
brew install lastpass-cli --with-pinentry
git config --global credential.helper lastpass

## BetterSnapTool
mas install 417375580

## finder list view by default
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”

# sets terminal theme to pro
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"
