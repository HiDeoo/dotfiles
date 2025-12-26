#!/usr/bin/env bash

echo "Installing Formulas"

apps=(
  bat
  borgbackup
  bun
  cloudflared
  coreutils
  doggo
  eza
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
  hyperfine
  jq
  neovim
  prettyping
  ripgrep
  starship
  staticcheck
  trash
  tw93/tap/mole
  wget
  zsh
)

brew tap espanso/espanso
brew tap oven-sh/bun

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

echo "Installing GitHub CLI extensions."

$(brew --prefix)/opt/gh/bin/gh extension install seachicken/gh-poi

exit 0
