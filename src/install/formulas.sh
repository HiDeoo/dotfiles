#!/usr/bin/env bash

echo "Installing Formulas"

apps=(
  bat
  borgbackup
  bun
  cloudflared
  coreutils
  dog
  exa
  fd
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
  ripgrep
  starship
  staticcheck
  streamlink
  trash
  wget
  zsh
)

brew tap oven-sh/bun

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

echo "Installing GitHub CLI extensions."

$(brew --prefix)/opt/gh/bin/gh extension install seachicken/gh-poi

exit 0
