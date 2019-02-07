#!/usr/bin/sh

# check for Homebrew, if not then install
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

PACKAGES=(
    python  # python3
    google-go
)
# install homebrew packages
brew install ${PACKAGES[@]}

brew tap caskroom/cask
CASKS=(
    iterm2
    visual-studio-code
    google-chrome
    flux
    slack
    discord
    signal
)
brew cask install ${CASKS[@]}

brew cleanup

