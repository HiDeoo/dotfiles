#!/usr/bin/env bash

echo "Installing Formulas"

brew tap homebrew/dupes

apps=(
  coreutils
  ctags
  fzf
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
  tree
  vim
  wget
  xz
  zsh
)

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

exit 0
