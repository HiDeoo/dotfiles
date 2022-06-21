#!/usr/bin/env bash

apps=(
  alfred
  appcleaner
  calibre
  discord
  docker
  dropbox
  dynalist
  fantastical
  figma
  firefox
  google-chrome
  gpg-suite-no-mail
  imageoptim
  iterm2
  karabiner-elements
  licecap
  microsoft-edge-dev
  rectangle
  sf-symbols
  the-unarchiver
  visual-studio-code
  vlc
)

echo "Installing Casks."

brew tap homebrew/cask-versions

brew install --cask "${apps[@]}"

echo "Installing Quick Look plugins."

brew install --cask syntax-highlight sbarex-qlmarkdown qlvideo

xattr -r -d com.apple.quarantine "/Applications/Syntax Highlight.app"

exit 0
