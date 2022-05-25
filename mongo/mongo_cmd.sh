# 1) install

# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
brew tap mongodb/brew
brew update

brew install mongodb-community@5.0


"""
To start mongodb/brew/mongodb-community now and restart at login:
  brew services start mongodb/brew/mongodb-community
Or, if you don't want/need a background service you can just run:
  mongod --config /usr/local/etc/mongod.conf
==> Summary
🍺  /usr/local/Cellar/mongodb-community/5.0.7: 11 files, 182.5MB, built in 4 seconds
==> Running `brew cleanup mongodb-community`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
==> Caveats
==> mongodb-community
To start mongodb/brew/mongodb-community now and restart at login:
  brew services start mongodb/brew/mongodb-community
Or, if you don't want/need a background service you can just run:
  mongod --config /usr/local/etc/mongod.conf
"""

# 1') debug for outdated CLI tool (homebrew)
# https://coady.tech/macos-command-line-tools-outdated/
sudo rm -rf /Library/Developer/CommandLineTools 
sudo xcode-select --install 

brew update && brew upgrade

# 2) run
brew services start mongodb-community@5.0

# 3) stop
brew services stop mongodb-community@5.0

# 4) access mongo shell
mongo
