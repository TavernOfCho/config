#!/usr/bin/env bash

remotes=('client' 'api' 'website' 'admin')

if [[ $(basename $PWD) != "TavernOfCho" ]]; then
	echo "ERROR ! You need to run this script from the TavernOfCho folder."
	exit
fi

for remote in ${remotes[@]}; do
	if [[ ! -d ${remote} ]]; then
		git clone git@github.com:TavernOfCho/${remote}.git
	fi
done
