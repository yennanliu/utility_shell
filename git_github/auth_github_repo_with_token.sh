#!/bin/bash
# https://stackoverflow.com/questions/18935539/authenticate-with-github-using-a-token


echo "TOKEN = " $TOKEN

for repo in dj-restaurants JavaHelloWorld
    do
        echo "repo = " $repo
        cd ~ && cd $repo && pwd
        touch test.txt
        git commit -m 'add test file'
        git remote remove origin
        git remote add origin https://$TOKEN@github.com/yennanliu/$repo
        git push --set-upstream origin main
    done