#!/usr/bin/env bash

echo "Installing macFUSE"

brew install --cask macfuse

echo "Installing Formulas"

apps=(
  bat
  borgbackup/tap/borgbackup-fuse
  coreutils
  dog
  fd
  firebase-cli
  fnm
  fzf
  gh
  git
  git-delta
  git-extras
  go
  grep
  htop
  jq
  neovim
  prettyping
  python
  rename
  ripgrep
  streamlink
  trash
  tree
  wget
  zsh
)

brew install "${apps[@]}"

brew install yarn --without-node

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

exit 0
