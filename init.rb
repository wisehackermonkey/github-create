#!/usr/bin/env ruby

# Set github username
git config --global user.name "wisehackermonkey"
git config --global user.email "oranbusiness@gmail.com"
# set cache of github password. doesnt ask you every
# time you push to github
git config --global credential.helper cache
# set default password timeout to 1 hour
git config --global credential.helper 'cache --timeout=3600'

# link to how to create new github repo from cmd
# https://gist.github.com/alexpchin/dc91e723d4db5018fef8
curl -u 'wisehackermonkey' https://api.github.com/user/repos -d '{"name":"project-start"}'