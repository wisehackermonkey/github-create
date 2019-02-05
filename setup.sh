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

git config --global user.name $username
git config --global user.email $email

echo Username set: `git config --global user.name`
echo Email Set: `git config --global user.email`

echo "I will set git to cache github password"
echo "so pushes wont ask for password every time"
echo "timeout will be 1 hour"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

