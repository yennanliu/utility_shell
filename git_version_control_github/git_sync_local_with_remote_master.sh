#!/bin/bash

#################################################################
# GIT COMMAND FORCE LOCAL MASTER SYNC WITH CLOUD MASTER 
#################################################################

# https://stackoverflow.com/questions/9589814/how-do-i-force-git-pull-to-overwrite-everything-on-every-pull/9589927

git fetch origin master
git reset --hard FETCH_HEAD
git clean -df


