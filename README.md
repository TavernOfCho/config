WowCollection
=============

Install
---------

```bash
docker-compose up -d

# Website
docker-compose exec php-fpm composer install
docker-compose exec php-fpm yarn install
docker-compose exec php-fpm yarn run dev

# API
docker-compose exec php composer install
docker-compose exec php php bin/console doctrine:schema:update --force

```
