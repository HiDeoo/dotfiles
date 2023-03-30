#!/usr/bin/env bash

apps=(
  alfred
  appcleaner
  calibre
  discord
  dropbox
  fantastical
  figma
  firefox
  font-fira-code-nerd-font
  google-chrome-dev
  gpg-suite-no-mail
  imageoptim
  insomnia
  iterm2
  macupdater
  orbstack
  rectangle
  sf-symbols
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

echo "Installing iTerm2 Shell Integration."

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

exit 0
