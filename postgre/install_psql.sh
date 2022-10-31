# https://medium.com/@viviennediegoencarnacion/getting-started-with-postgresql-on-mac-e6a5f48ee399

# step 1)
brew doctor
brew update

# step 2)
brew install postgresql 

# step 3) rub postgre local
brew services start postgresql

# step 4) access via psql
psql postgres

# step 5) stop postgresql
brew services stop postgresql
