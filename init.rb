#!/usr/bin/env ruby

# Set github username
git config --global user.name "wisehackermonkey"
git config --global user.email "oranbusiness@gmail.com"
# set cache of github password. doesnt ask you every
# time you push to github
git config --global credential.helper cache
# set default password timeout to 1 hour
git config --global credential.helper 'cache --timeout=3600'