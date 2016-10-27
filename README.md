# Strasbourg Startups

This is the source code of the Ruby on Rails application behind the http://www.strasbourg-startups.com website whom goal is to gather and foster the emerging startup scene in Strasbourg, France, and the surrouding area.

# Install

It's a standard Ruby on Rails app.

# How to contribute?

# Sync database from production

bundle exec rake scalingo:mongodb:backup_remote db:drop scalingo:mongodb:restore_local APP=strasbourg-startups

# MongoDB installation

With the help of Scalingo's Docker image:

```
docker run -it -e DB_USER=pipo -e DB_PASSWORD=molo -e DB_UID=`id -u` -p 27017:27017 -v ~/data/mongo/strasbourg_startups:/var/lib/mongodb:rw,z scalingo/mongo:latest /mongo
```
