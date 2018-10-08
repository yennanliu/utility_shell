

# ref 
# https://stackoverflow.com/questions/45206507/remote-invalid-username-or-password-fatal-authentication-failed-after-two
# https://mycyberuniverse.com/en-gb/web/how-fix-fatal-authentication-failed-for-https-github-com.html


# step 1  : Creating a GitHub personal access token.
# Developer settings ->  Personal access tokens ->  Generate new token ->   select repo. ->  Generate token. -> SAVE THE Generate token. 

# step 2 :  Using a token on the command line.
cd ~ && cd <ur_need_to_push_repo>
git push origin master 
######
# Username: your_username
# Password: your_token.  <------ SHOULD BE THE TOKEN JUST GENERATED, but not ur github default password 
######