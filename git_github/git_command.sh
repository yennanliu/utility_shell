#!/bin/bash
#################################################################
# HELP COMMANDS RUN GIT VERSION CONTROL OP
#################################################################

# 1) check commit histroy
git log 
git log --oneline
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
