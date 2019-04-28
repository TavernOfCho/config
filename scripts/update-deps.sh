#!/usr/bin/env bash

if [[ $(basename $PWD) != "TavernOfCho" ]]; then
	echo "ERROR ! You need to run this script from the TavernOfCho folder."
	exit
fi

docker-compose pull
docker-compose build
docker-compose run php composer update
docker-compose run admin yarn upgrade
docker-compose run client yarn upgrade
docker-compose run website yarn upgrade

echo 'Run `docker-compose up --build --force-recreate` now and check that everything is fine!'
