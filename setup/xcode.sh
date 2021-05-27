#!/usr/bin/env bash

if ! xcode-select --print-path &> /dev/null; then
  echo "Installing XCode Command Line Tools."

  xcode-select --install &> /dev/null

  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  [ $? -eq 0 ] || exit $?;

  sudo xcodebuild -license

  [ $? -eq 0 ] || exit $?;
else
  echo "XCode Command Line Tools are already installed."
fi

exit 0
