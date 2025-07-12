#!/usr/bin/env bash

if test ! $(which brew)
then
  if test "$(uname)" = "Darwin"
  then
    echo "Installing Homebrew."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Invalid OS."
    exit 1
  fi
else
  echo "Homebrew is already installed."
fi

source ../bin/brew_init

exit 0
