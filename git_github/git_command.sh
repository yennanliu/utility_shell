#!/bin/bash
#################################################################
# HELP COMMANDS RUN GIT VERSION CONTROL OP
#################################################################

# 0) set up local/global git username, email
# https://stackoverflow.com/questions/6116548/how-to-tell-git-to-use-the-correct-identity-name-and-email-for-a-given-project

# local set
git config user.email mahmoud@company.ccc
git config user.name 'Mahmoud Zalt'

# local get
git config --get user.email
git config --get user.name

# global set
git config --global user.email mahmoud@zalt.me
git config --global user.name 'Mahmoud Zalt'

# global get
git config --global --get user.email
git config --global --get user.name

# 1) check commit history
git log 
git log --online
git reflog

# 2) merge 
# https://git-scm.com/book/zh-tw/v2/%E4%BD%BF%E7%94%A8-Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E5%92%8C%E5%90%88%E4%BD%B5%E7%9A%84%E5%9F%BA%E6%9C%AC%E7%94%A8%E6%B3%95
# git branch 
# * master 
# * dev 
git checkout master  # go to master branch 
git merge dev  # merge dev to master 
# or 
git checkout dev2
git merge master # merge master to dev2 

# 3) pull
#git pull = git fetch + merge to local
git fetch
git pull

# 4) revert to pervious commit 
# git log --oneline 
# 7381170 start develop python code query/collect spotify recommend data
# d176073 add shell query spotify ad demo
# 7f7149a Update README.md
# ef3895b Create README.md
git reset SHA-1 — hard # git reset ef3895b — hard  # in this example

# 5) only PR (pull request) latest commits (cherry-pick) 
# https://stackoverflow.com/questions/5256021/send-a-pull-request-on-github-for-only-latest-commit
# https://gitbook.tw/chapters/faq/cherry-pick.html
git branch <new-branch> origin/master
git checkout <new-branch>
# git log --oneline  # get the commit SHA ( b67627b for example )
git cherry-pick <SHA hash of commit>
git push origin <new-branch>

# 6) delete local branch 
# https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323
git branch -D <branch_name>

# 7) delete remote branch 
# git push <remote_name> --delete <branch_name>
# e.g. : git push origin --delete my_remote_branch
git push origin --delete <branch_name>

# 8) git pull remote branch 
git checout <branch_name>
git pull origin <branch_name>

# 9) get git config 
cat .git/config

# 10) undo last commit 
# https://sethrobertson.github.io/GitFixUm/fixup.html
git reset --hard HEAD^

# 11) undo last X commits 
# https://sethrobertson.github.io/GitFixUm/fixup.html
git reset --hard HEAD~2  # git reset --hard HEAD~X <--- the last X commit you want to revert 

# 12) force sync with remote master branch 
# https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files
git fetch --all
git reset --hard origin/master

# 13) check all branches (include remote)
git branch -a

# 14) rebase
# https://www.maxlist.xyz/2020/05/02/git-merge-rebase/
git checkoutd dev1
# set up master branch as new basis of branch dev1 
git rebase master

# rebase with commit id
# http://sdlong.logdown.com/posts/736902-sharing-organize-commit-in-git-rebase-to-techniques-and-concepts
git checkout dev1 
# now consider the last commit in master branch is "a90538b1cca7e"
# so now run git branch make basis on mastet's last commit
git rebase a90538b1cca7e

# 15) statsh and apply stash
# https://stackoverflow.com/questions/20409853/git-stash-and-apply
git stash
git stash apply

# 16) git clone repo with SPECIFIC branch from remote
# https://stackoverflow.com/questions/1911109/how-do-i-clone-a-specific-git-branch
git clone -b <branch_name> <remote_repo>
# example :
# git feature001/run-on-py38 https://github.com/yennanliu/dj-restaurants.git

# 17) roll back to specific previous commit
# https://stackoverflow.com/questions/3639115/reverting-to-a-specific-commit-based-on-commit-id-with-git
#git git reset --hard c14809fac
git reset --hard <commit_id>

# 18) git force push to remote branch
# https://gitbook.tw/chapters/github/using-force-push
git push -f origin <branch_name>

# 19) git rebase
# Step 1) be in the temp branch (e.g.: 3b0f8b22), fix conflicts manually
# Step 2) Once conflicts are fixed, do "git rebase --continue"
# Step 3) if rebase successfully, then should automatically change back to the original branch
# Step 4) commit, push



# 20) clone, push priavte repo
# https://tsengbatty.medium.com/git-%E8%B8%A9%E5%9D%91%E7%B4%80%E9%8C%84-%E4%BA%8C-git-clone-with-ssh-keys-%E6%88%96-https-%E8%A8%AD%E5%AE%9A%E6%AD%A5%E9%A9%9F-bdb721bd7cf2
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Step 1) create ssh key
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

"""
- id_rsa：private key，這是給自己用的。
- id_rsa.pub：public key，這是給外部系統用的，加到 Github 帳戶就是用這個
"""

# Step 2) add public key to github
# Settings -> Personal settings -> SSH and GPG keys

# Step 3) test if can connect
ssh -T git@github.com

eval $(ssh-agent -s)

ssh-add ~/.ssh/id_rsa

ls -al ~/.ssh

# Step 4) clone priave repo

# example (NOTE !!! git clone via ssh, but NOT http)
git clone git@github.com:yennanliu/utility_shell.git


### NOTE !!! 
# if git clone via ssh, then can push directly (no need password). 
# if you setup ssh key properly at github