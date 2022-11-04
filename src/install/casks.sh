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
  font-fira-code-nerd-font
  google-chrome
  gpg-suite-no-mail
  imageoptim
  iterm2
  karabiner-elements
  macupdater
  microsoft-edge-dev
  rectangle
  sf-symbols
  the-unarchiver
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

echo "Installing iTerm2 Shell Integration."

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

exit 0
