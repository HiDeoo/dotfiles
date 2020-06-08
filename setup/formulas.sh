#!/usr/bin/env bash

echo "Installing Formulas"

apps=(
  bat
  coreutils
  ctags
  curl
  diff-so-fancy
  fd
  fzf
  git
  git-extras
  github/gh/gh
  grep
  htop
  jq
  mongodb
  mtr
  node
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
  yarn
  zsh
)

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

exit 0
