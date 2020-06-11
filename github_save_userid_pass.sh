# https://stackoverflow.com/questions/35942754/how-to-save-username-and-password-in-git

git config credential.helper store

git pull
#provide user-name and password and those details will be remembered later. #The credentials are stored in a file on the disk, with the disk permissions #of "just user readable/writable" but still in plaintext.

#if you want to change password later

git pull
#will fail, because it failed, it removes the offending user+password from the #.git-credentials file, so now run

git pull