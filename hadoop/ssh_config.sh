#!/bin/sh

# generate keys file (public and private)
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
# add the public key in the list of the authorized keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# download the private key & remove it from the node
scp -i key.pem ubuntu@<public DNS>:~/.ssh/id_rsa .
rm ~/.ssh/id_rsa