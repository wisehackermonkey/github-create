#!/bin/bash

echo "I will setup git for you"

echo "Please enter github account info"
read -p "Username: " username
read -p "Email: " email

echo "I will setup your local git info now.."
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi



