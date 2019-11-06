#!/usr/bin/sh

# check for Homebrew, if not then install
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

PACKAGES=(
    bash-completion
    bash-git-prompt
    sysdig
    python  # python3
    pipenv
    google-go
    jq
    yq
    skopeo  # docker
    shellcheck
    yamllint
    pre-commit
    git-lfs
    hub
    circleci
    kubesec
    terraform
)
# install homebrew packages
brew install ${PACKAGES[@]}

brew tap caskroom/cask
CASKS=(
    iterm2
    visual-studio-code
    google-chrome
    flux
    spectacle
    slack
    discord
    signal
)
# install casks
brew cask install ${CASKS[@]}

brew cleanup
