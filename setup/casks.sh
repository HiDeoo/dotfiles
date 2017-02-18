#!/usr/bin/env bash

echo "Installing Homebrew-Cask."

brew tap caskroom/cask
brew tap caskroom/versions

apps=(
  1password
  alfred
  appcleaner
  atom
  calibre
  couleurs
  discord
  dropbox
  fantastical
  firefox
  gitkraken
  google-chrome-canary
  google-chrome-dev
  imageoptim
  istat-menus
  iterm2-beta
  kaleidoscope
  karabiner-elements
  licecap
  namebench
  onyx
  postman
  robomongo
  slack
  spectacle
  spotify
  steam
  the-unarchiver
  vlc
)

echo "Installing Casks."

brew cask install "${apps[@]}"

echo "Installing Quick Look plugins."

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlvideo

exit 0
