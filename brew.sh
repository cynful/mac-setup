#!/usr/bin/sh

# check for Homebrew, if not then install
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

PACKAGES=(
    pipenv
    go
    jq
    yq
    skopeo
    shellcheck
    yamllint
    pre-commit
    hub
)
# install homebrew packages
brew install ${PACKAGES[@]}

brew tap caskroom/cask
CASKS=(
    visual-studio-code
    google-chrome
    flux
    rectangle
    slack
    signal
    discord
)
# install casks
brew cask install ${CASKS[@]}

brew cleanup

cp settings.json ~/Library/Application Support/Code/User/settings.json
