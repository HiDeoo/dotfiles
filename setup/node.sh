#!/usr/bin/env bash

echo "Installing Node global packages."

packages=(
  create-react-app
  pouchdb-server
  uuid
)

npm install -g "${packages[@]}"

exit 0
