#!/bin/sh
if [[ $2 == "" && $1 ]]; then
    git stash
    git pull
    git stash apply --index
    git add .
    git commit -a -m "$1"
    git push
    git status
	git ls-files
else
	echo "usage: ./git.sh \"Commit\""
fi
