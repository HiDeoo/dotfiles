#!/usr/bin/env bash

echo "Installing Formulas"

apps=(
  bat
  borgbackup
  cloudflared
  coreutils
  doggo
  eza
  fd
  fzf
  gh
  git
  git-delta
  git-extras
  go
  grep
  htop
  hyperfine
  jq
  neovim
  prettyping
  ripgrep
  starship
  staticcheck
  tw93/tap/mole
  wget
  zsh
)

brew tap espanso/espanso

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

echo "Installing GitHub CLI extensions."

$(brew --prefix)/opt/gh/bin/gh extension install seachicken/gh-poi

exit 0
