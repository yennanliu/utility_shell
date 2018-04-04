#!/usr/bin/env bash


# how to generate ssh key via unix 

# ref 
# https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2



# `1) Step One—Create the RSA Key Pair

ssh-keygen -t rsa

# 2) Step Two—Store the Keys and Passphrase (optional)

# 3) Step Three—Copy the Public Key

#ssh-copy-id demo@198.51.100.0
# or 
# cat ~/.ssh/id_rsa.pub | ssh demo@198.51.100.0 "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys"
ssh-copy-id <machine_id>@<machine_ip>
