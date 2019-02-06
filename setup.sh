#!/bin/bash
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  echo 'to install git on ubuntu: sudo apt-get install git'
  exit 1
fi

echo "I will setup git for you"

echo "Please enter github account info"
read -p "Username: " username
read -p "Email: " email

echo "I will setup your local git info now.."


git config --global user.name $username
git config --global user.email $email

echo Username set: `git config --global user.name`
echo Email Set: `git config --global user.email`

echo "I will set git to cache github password"
echo "so pushes wont ask for password every time"
echo "timeout will be 1 hour"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

echo "Setting up and pushing to repo"

echo "initializing $PWD"
git init
"$project_name By $username" > README.md
"node_modules" > .gitignore

echo "Adding Content to git in dir : $PWD"
git add .
git status
echo "Setting remote origin"
git remote add origin https://www.github.com/$username/$project_name
echo "pulling remote"
git pull
echo "Commiting changes..."
git commit -m "automated init by Github-project-creator"
echo "Complete"
echo "Now exiting..."

