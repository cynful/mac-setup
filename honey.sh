#!/usr/bin/sh

# check for Homebrew, if not then install
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

PACKAGES=(
    kubesec
    kubernetes-helm
    circleci
    terraform
    ruby             # newer ruby
    chef
    nvm              # use nvm to install node
)
# install homebrew packages
brew install ${PACKAGES[@]}

brew cleanup

GEMS=(
    bundler
    kitchen-docker
)
gem install ${GEMS[@]}
