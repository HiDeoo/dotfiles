#!/usr/bin/env bash

echo "Installing Node.js LTS."

fnm install --lts

echo "Installing corepack."

pnpm add -g corepack

echo "Installing ni."

pnpm add -g @antfu/ni
