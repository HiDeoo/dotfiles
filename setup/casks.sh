#!/usr/bin/env bash

apps=(
  alfred
  appcleaner
  calibre
  couleurs
  discord
  dropbox
  fantastical
  firefox
  google-chrome
  imageoptim
  insomnia
  iterm2
  karabiner-elements
  licecap
  rectangle
  the-unarchiver
  visual-studio-code
  vlc
)

echo "Installing Casks."

brew install --cask "${apps[@]}"

echo "Installing Quick Look plugins."

brew install --cask syntax-highlight sbarex-qlmarkdown qlvideo

xattr -r -d com.apple.quarantine "/Applications/Syntax Highlight.app"

exit 0
