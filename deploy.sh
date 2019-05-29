#!/bin/bash
#
# tool to attempt to automate the deployment of
# a static website

repos="/srv/git"
www="/srv/www"

cd $www || exit 1

stagit-index "$repos"/* > index.html

for i in "$repos"/*; do
	j=$(basename "$i" .git)

	[ -d $j ] || mkdir $j
	cd $j || exit 1

	stagit $i

	cd ..
done
