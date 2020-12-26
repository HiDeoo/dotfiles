#!/usr/bin/env bash

echo "Installing Yarn."

npm install -g yarn

echo "Installing Node global packages."

packages=(
  create-react-app
  now
  pouchdb-server
  source-map-explorer
  uuid
)

npm install -g "${packages[@]}"

exit 0
