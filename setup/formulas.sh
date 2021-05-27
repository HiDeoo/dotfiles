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
  fnm
  fzf
  gh
  git
  git-delta
  git-extras
  grep
  htop
  jq
  prettyping
  python
  streamlink
  the_silver_searcher
  trash
  vim
  wget
  zsh
)

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

exit 0
