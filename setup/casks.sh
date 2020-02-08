#!/usr/bin/env bash

echo "Installing Homebrew-Cask."

brew tap caskroom/cask
brew tap caskroom/versions

apps=(
  alfred
  appcleaner
  calibre
  couleurs
  discord
  dropbox
  fantastical
  firefox
  google-chrome-canary
  imageoptim
  insomnia
  istat-menus
  iterm2-beta
  kaleidoscope
  karabiner-elements
  licecap
  rectangle
  slack
  spotify
  steam
  the-unarchiver
  visual-studio-code
  vlc
)

echo "Installing Casks."

brew cask install "${apps[@]}"

echo "Installing Quick Look plugins."

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlvideo

exit 0
