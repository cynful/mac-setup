#!/usr/bin/env bash

# Notes:
#   Install Xcode before running this script
# xcode-select --install

# configs
# turn off sticky keys, hold press function
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# require password immediately after screensaver or sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# store screenshots in subfolder instead of directly to Desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# Github
git config --global user.name "cynful"
git config --global user.email "cynful@users.noreply.github.com"
