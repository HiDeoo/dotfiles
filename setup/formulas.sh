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
  hub
  mongodb
  mtr
  nvm
  perl
  python
  rtmpdump
  ruby
  streamlink
  the_silver_searcher
  tldr
  trash
  vim
  wget
  xz
  zsh
)

brew install "${apps[@]}"

brew cleanup

exit 0
