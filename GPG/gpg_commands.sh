#!/bin/bash


# ref  :   http://blog.ghostinthemachines.com/2015/03/01/how-to-use-gpg-command-line/


# list all keys 
gpg --list-keys

# import new public key 
gpg --import <public_key_name>.txt
# edit and trust new public key 
gpg --edit-key  <email_in_public_key>.com

# encrypt the csv data 
gpg --encrypt --recipient <your_email_name>.com  <test>.csv

# decrypt the csv data 
gpg --decrypt  <test>.csv.gpg


# delete a public key 
# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
gpg --delete-key "User Name"







