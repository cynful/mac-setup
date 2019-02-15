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
    node
    pre-commit
)
# install homebrew packages
brew install ${PACKAGES[@]}

pip install virtualenv

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install 8

# paste into github.com/settings/ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
