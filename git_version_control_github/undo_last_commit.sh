#!/bin/sh

<<COMMENT1
"""
https://stackoverflow.com/questions/927358/how-to-undo-the-most-recent-commits-in-git

$ git commit -m "Something terribly misguided"              (1)
$ git reset HEAD~                                           (2)
<< edit files as necessary >>                               (3)
$ git add ...                                               (4)
$ git commit -c ORIG_HEAD                                   (5)

"""
COMMENT1


# show last 5 commits 
# https://stackoverflow.com/questions/16974204/how-to-get-commit-history-for-just-one-branch
git log -5 master
# reset last commit 
git reset HEAD~  