# step 1) if no path, create one
# https://stackoverflow.com/questions/25654731/usr-local-bin-no-such-file-or-directory
sudo mkdir -p -m 775 /usr/local/bin

# step 2) link
# https://stackoverflow.com/questions/25152711/subl-command-not-working-command-not-found
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/.
echo $PATH

# step 3) test
# test
subl .