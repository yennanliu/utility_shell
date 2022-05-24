# install
# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
brew tap mongodb/brew
brew update

rew install mongodb-community@5.0

# run
brew services start mongodb-community@5.0

# stop
brew services stop mongodb-community@5.0

