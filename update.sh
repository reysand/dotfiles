#!/bin/sh
if [[ $1 == "" || $2 == "" ]]; then
	echo "usage: ./update.sh source_file target_file"
	exit 0
fi
touch $2
diff $2 $1 >> update.diff
patch $2 update.diff
rm update.diff
