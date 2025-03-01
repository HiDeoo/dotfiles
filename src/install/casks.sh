#!/usr/bin/env bash

apps=(
  alt-tab
  calibre
  discord
  dropbox
  espanso
  fantastical
  figma
  firefox
  ghostty
  google-chrome
  gpg-suite-no-mail
  httpie
  imageoptim
  macupdater
  orbstack
  raycast
  sf-symbols
  shottr
  stats
  the-unarchiver
  via
  visual-studio-code
  vlc
)

echo "Installing Casks."

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

brew install --cask "${apps[@]}"

echo "Installing Quick Look plugins."

brew install --cask syntax-highlight sbarex-qlmarkdown qlvideo

xattr -r -d com.apple.quarantine "/Applications/Syntax Highlight.app"

exit 0
