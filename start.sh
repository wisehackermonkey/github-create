#!/bin/bash
echo "Github project creator by wisemonkey"
echo ""

#check if git is installed
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  echo 'to install git on ubuntu: apt-get install git'
  exit 1
fi

# Check if curl is installed
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  echo "to install on ubuntu: 'apt install curl'"
  exit 1
fi

echo "Please enter name of github project, github username, email"
echo ""
read -p "Project Name    : " project_name
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
echo Project Name set: $project_name

echo "I will set git to cache github password"
echo "so pushes wont ask for password every time"
echo "timeout will be 1 hour"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'


echo "Creating Repo..."
curl -u ''$username'' https://api.github.com/user/repos -d '{"name":"'$project_name'","auto_init":"true"}' || { echo "Creating Project on github failed : $project_name" ; exit 1;}


echo "Project github link : https://www.github.com/$username/$project_name"
echo "Finished"

