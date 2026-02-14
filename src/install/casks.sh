#!/usr/bin/env bash

apps=(
  1password
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
  iina
  imageoptim
  mimestream
  obs
  obsidian
  orbstack
  raycast
  sf-symbols
  shottr
  stats
  steermouse
  the-unarchiver
  visual-studio-code
)

echo "Installing Casks."

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

brew install --cask "${apps[@]}"

echo "Installing Quick Look plugins."

brew install --cask syntax-highlight qlmarkdown qlvideo

xattr -r -d com.apple.quarantine "/Applications/Syntax Highlight.app"

exit 0
