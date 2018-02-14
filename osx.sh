#!/bin/bash

touch ~/.bash_profile

## homebrew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## utils
brew install wget

## appstore cli
brew install mas

## lastpass
mas install 926036361
brew install lastpass-cli --with-pinentry

## BetterSnapTool
mas install 417375580  

## vscode
brew cask install visual-studio-code

## git
brew install git

## node via nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install stable
nvm alias default stable

## robomongo
# download this:
# https://download.robomongo.org/1.1.1/osx/robo3t-1.1.1-darwin-x86_64-c93c6b0.dmg
# add extracction script using this post:
# https://stackoverflow.com/questions/11679475/extract-from-dmg

## aws cli tools
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install awscli

## docker
brew cask install dockertoolbox
brew cask install kitematic

# Google Chrome
brew cask install google-chrome

## git config --global credential.helper lastpass

## finder list view by default
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”

# sets terminal theme to pro
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"
