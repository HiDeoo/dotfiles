#!/usr/bin/env bash

echo "Installing Formulas"

brew tap homebrew/dupes

apps=(
  ctags
  git
  git-extras
  homebrew/completions/brew-cask-completion
  htop
  mongodb
  mtr
  nvm
  perl
  python
  rtmpdump
  ruby
  the_silver_searcher
  vim
  wget
  xz
  zsh
)

brew install "${apps[@]}"

brew cleanup

exit 0
