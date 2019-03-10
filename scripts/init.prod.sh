#!/usr/bin/env bash

remotes=('api' 'website')

if [[ $(basename $PWD) != "WowCollection" ]]; then
	echo "ERROR ! You need to run this script from the WowCollection folder."
	exit
fi

for remote in ${remotes[@]}; do
	if [[ ! -d ${remote} ]]; then
		git clone git@github.com:WowCollection/${remote}.git
	fi
done

git checkout -f
git pull
mv docker-compose.prod.yml docker-compose.yml
