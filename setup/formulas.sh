#!/usr/bin/env bash

echo "Installing Formulas"

brew tap homebrew/dupes

apps=(
  coreutils
  ctags
  git
  git-extras
  grep
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
  trash
  vim
  wget
  xz
  zsh
)

brew install "${apps[@]}"

brew cleanup

exit 0
