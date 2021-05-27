#!/usr/bin/env bash

echo "Installing macFUSE"

brew install --cask macfuse

echo "Installing Formulas"

apps=(
  bat
  borgbackup/tap/borgbackup-fuse
  coreutils
  ctags
  curl
  dog
  fd
  fzf
  git
  git-delta
  git-extras
  github/gh/gh
  grep
  htop
  jq
  mongodb
  mtr
  perl
  prettyping
  python
  rtmpdump
  ruby
  Schniz/tap/fnm
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
