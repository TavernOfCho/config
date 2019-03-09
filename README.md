WowCollection
=============

Install
---------

```bash
docker-compose up -d

# Website
docker-compose exec website yarn install

# API
docker-compose exec php composer install
docker-compose exec php php bin/console doctrine:schema:update --force

```

Deploying to Production (TODO)
------------------------------

A server is available on DigitalOcean
The project is enabled on the server and runs with docker-compose.

A Nginx is used as a reverse-proxy to render the project on the web.

TODO : 
- Recreate the Droplet from the POC Snapshot
- Add a SSH Key to use the SSH Git Remote instead of the HTTPS one
- Create a script to run all the necessary actions on change
  - docker-compose down  
  - git reset HEAD --hard #To remove the docker-compose copy
  - composer install #Api
  - yarn install #Website
  - ...
  
- Some tests to remplace Postgres with MySQL (available on an other server) are planned. 
- ELK still needs to be configured for a proper usage.
