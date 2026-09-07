#!/usr/bin/env bash

echo "Installing pnpm."

curl -fsSL https://get.pnpm.io/install.sh | sh -

echo "Installing Node.js LTS."

pnpm runtime set node lts -g
