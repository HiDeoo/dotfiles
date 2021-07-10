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
  staticcheck
  streamlink
  trash
  tree
  wget
  yarn
  zsh
)

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

exit 0
