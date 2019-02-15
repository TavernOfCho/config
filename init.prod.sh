#!/usr/bin/env bash

remotes=('api' 'website')

for remote in ${remotes[@]}; do
	if [[ ! -d ${remote} ]]; then
		git clone git@github.com:WowCollection/${remote}.git
	fi
done
