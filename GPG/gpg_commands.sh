#!/bin/bash


# ref  :   http://blog.ghostinthemachines.com/2015/03/01/how-to-use-gpg-command-line/

# encrypt the csv data 
gpg --encrypt --recipient <your_email_name>.com  <test>.csv

# decrypt the csv data 
gpg --decrypt  <test>.csv.gpg

