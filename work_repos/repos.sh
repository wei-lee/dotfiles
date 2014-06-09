#!/usr/bin/env bash

function cloneIfNotExist(){
	if [ ! -d "$1" ]; then
		echo "cloning repo $1"
		git clone git@github.com:fheng/$1.git
	else
		echo "$1 exists. Skipping"
	fi
}

WORK_DIR_ENG=~/work/fh/eng
WORK_DIR_OPS=~/work/fh/ops
WORK_DIR_CHEF=~/work/fh/chef

cd $WORK_DIR_ENG
repos="fh-dynofarm fh-ngui fh-automatron fh-ditch fh-core fh-doxy fh-digger-node fh-forms fh-studio fh-messaging fh-stats"
for repo in $repos; do
	cloneIfNotExist $repo
done

cd $WORK_DIR_OPS
cloneIfNotExist "fh-deploy"

cd $WORK_DIR_CHEF
cloneIfNotExist "fhcap"