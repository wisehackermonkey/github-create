#!/bin/bash
echo "Github project creator by wisemonkey"
echo ""
echo "Please enter name of github project, github username, email"
echo ""
read -p "Project Name    : " project_name
read -p "Username: " username
read -p "Email: " email
# project_name="tester"
# username="wisehackermonkey"
# email="oranbusiness@gmail.com"

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

if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

echo "Creating Repo..."

# data_string='"{'name':'$project_name'}"'
# echo $data_string
# '{"name":"REPO"}'
curl -u ''$username'' https://api.github.com/user/repos -d '{"name":"'$project_name'","auto_init":"true"}' || { echo "Creating Project on github failed : $project_name" ; exit 1;}


echo "Setting up and pushing repo"

git init
"$project_name By $username" > README.md
git add .
git status
git remote add origin https://www.github.com/$username/$project_name
git commit -m "automated init by Github-project-creator"
echo "Project github link : https://www.github.com/$username/$project_name"
echo "Finished"\n\n

