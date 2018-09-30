#!/usr/bin/env bash

if test ! $(which brew)
then
  if test "$(uname)" = "Darwin"
  then
    echo "Installing Homebrew."

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Invalid OS."
    exit 1
  fi
else
  echo "Homebrew is already installed."
fi

exit 0
