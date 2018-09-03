#!/bin/sh



# to your ready-to-push directory 
echo "directory name : "  "$1" 
cd ~  && cd "$1"
git init
git add --all
git commit -m "Initial Commit"
git remote add origin <your_repo_url>
git push -u origin master