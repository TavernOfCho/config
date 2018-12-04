#!/usr/bin/env bash

remotes=('client' 'mobile' 'api' 'website' 'admin')

for remote in ${remotes[@]}; do
	if [[ ! -d ${remote} ]]; then
		git clone git@github.com:WowCollection/${remote}.git
	fi
done
