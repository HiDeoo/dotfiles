#!/usr/bin/env bash

echo "Installing Formulas"

apps=(
  bat
  borgbackup
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
  pnpm
  prettyping
  python
  ripgrep
  starship
  staticcheck
  streamlink
  trash
  vsce
  wget
  yarn
  zsh
)

brew install "${apps[@]}"

brew cleanup

echo "Installing fzf key bindings."

$(brew --prefix)/opt/fzf/install

echo "Installing pnpm tab-completions."

$(brew --prefix)/opt/pnpm/bin/pnpm install-completion zsh

exit 0
