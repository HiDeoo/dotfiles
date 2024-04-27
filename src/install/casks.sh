#!/usr/bin/env bash

apps=(
  alt-tab
  calibre
  discord
  dropbox
  fantastical
  figma
  firefox
  google-chrome-beta
  gpg-suite-no-mail
  httpie
  imageoptim
  iterm2
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

echo "Installing iTerm2 Shell Integration."

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

exit 0
