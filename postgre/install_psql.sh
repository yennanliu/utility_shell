# https://medium.com/@viviennediegoencarnacion/getting-started-with-postgresql-on-mac-e6a5f48ee399

# step 1)
brew doctor
brew update

# step 2)
brew install postgresql 

# step 3) rub postgre local
brew services start postgresql

# step 4) access via psql
# https://alvinalexander.com/blog/post/postgresql/log-in-postgresql-database/
# psql -d mydb -U myuser -W
# psql -h myhost -d mydb -U myuser -W
psql postgres

# step 5) stop postgresql
brew services stop postgresql
