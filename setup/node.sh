#!/usr/bin/env bash

if test ! $(which nvm)
then
  echo "Installing Node."

  export NVM_DIR='/usr/local/opt/nvm'
  [ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"

  nvm install stable
  nvm use node
  nvm alias default node
fi

echo "Installing global packages."

packages=(
  aglio
  babel-eslint
  electron
  flow-bin
  gulp
  n
  uuid
  npm-check-updates
  pouchdb-server
  typings
  yarn
)

npm install -g "${packages[@]}"

exit 0
