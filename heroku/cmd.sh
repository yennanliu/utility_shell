# 1. get DB URL

# 1. Install Heroku CLI (if not already installed)

# brew tap heroku/brew && brew install heroku
# Login to your Heroku account:
# heroku login


# ⸻

# 2. List your apps

# heroku apps

# Pick the app that has the PostgreSQL add-on.

# ⸻

# 3. Get the database connection string

# heroku config:get DATABASE_URL -a <your-app-name>

# This returns a full Postgres connection string, something like:

# postgres://username:password@host:5432/dbname


# ⸻


# heroku addons -a <your-app-name>
# Then target the right one:
# heroku pg:psql HEROKU_POSTGRESQL_COLOR -a <your-app-name>
