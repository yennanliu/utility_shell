# 1) create different key

ssh-keygen -t rsa -b 4096 -C "your_email" -f ~/.ssh/id_ed25519_account1

ssh-keygen -t rsa -b 4096 -C "your_email_2" -f ~/.ssh/id_ed25519_account2


# 2) setup config use different key for different account

vim ~/.ssh/config

# add above content

Host github.com-some_app
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_hungerapp
