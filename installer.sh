#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./installer.sh` then `./installer.sh`

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "Updating homebrew..."
# Update homebrew recipes
brew update

echo "Installing brew cask..."
brew tap caskroom/cask


echo "Installing programming lang..."
# Programming Languages
brew install node


echo "Installing dev tools..."
# Dev Tools
brew install git
brew install docker
brew install fzf
brew install ripgrep
brew cask install iterm2
brew cask install kitty


echo "Installing web tools..."
# Web Tools
brew cask install google-chrome


echo "Installing Entertainment..."
# Entertainment
brew cask install spotify
brew cask install whatsapp


echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-fira-code
    font-roboto
)
brew cask install ${FONTS[@]}


echo "Cleaning up..."
brew cleanupa


echo "Done...."
