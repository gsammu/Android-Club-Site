MMU Android Study Club App
==========================

For fun lah yo.

Setup Guide
-----------

```
# setup database
createdb androidclub
psql androidclub

# Inside psql --
#  create user androidclub with password 'androidclub'
#  grant all privileges on database androidclub to androidclub
#  \q

# create .env
touch .env
echo 'DATABASE_URL=postgres://androidclub:androidclub@localhost/androidclub' > .env

bundle install

# Run
foreman start
```