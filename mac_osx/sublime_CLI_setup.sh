#!/bin/sh


#################################################################
# SCRIPT SET UP SUBLIME COMMAND LINE (MAC OS X)
#################################################################

# https://gist.github.com/martinbuberl/5823ed247d279d1a2d06


# STEP 1) SETUP 
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# STEP 2) TEST 
subl test.rb  # it should open new file test.rb sublime text 
