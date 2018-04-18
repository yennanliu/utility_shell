

#!/bin/bash


echo 'plz run this shell as command form below'
echo 'bash gpg_encrypt_decrypt_demo.sh <your_email>.com <encrypt_file>. <decrypt_file>'

echo '-----------------'
echo 'your_email : ' $1
echo 'encrypt_file : ' $2 
echo 'decrypt_file : ' $3 
echo '-----------------'


# encrypt the csv data 
echo 'encrypt the data ..... '
gpg --encrypt --recipient $1  $2



echo 'decrypt the data ..... '
# decrypt the csv data 
gpg --decrypt  $2.gpg > $3 

