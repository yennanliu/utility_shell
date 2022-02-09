# https://myapollo.com.tw/zh-tw/polly-install-mysql-using-homebrew/

# brew install mysql
brew install mysql

# start mysql local
brew services start mysql

# stop mysql local
brew services stop mysql

# login to mysql
mysql -u root -p # no need to enter any pwd, just press enter

# remove mysql
brew uninstall mysql
brew cleanup
sudo rm -rf /usr/local/var/mysql
