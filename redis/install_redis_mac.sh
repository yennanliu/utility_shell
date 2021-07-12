# https://gist.github.com/tomysmile/1b8a321e7c58499ef9f9441b2faa0aa8

brew update
brew install redis

brew services start redis

# test
redis-cli ping

# to the redis shell
redis-cli