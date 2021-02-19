#!/bin/bash
GREEN='\033[32m'
WHITE='\033[37m'
if [[ $1 == "" ]]; then
	username="$(whoami)"
else
	username="$1"
fi
terminal="$(who -T | awk '{print $3}' | grep pts)"
clear

TEXT="Wake up, $username..."
while IFS= read -n1 c; do
	printf "$GREEN%s" "$c"
	sleep 0.21
done <<EOF
$TEXT
EOF
sleep 0.42
clear

TEXT="The Matrix has you..."
while IFS= read -n1 c; do
	printf "$GREEN%s" "$c"
	sleep 0.21
done <<EOF
$TEXT
EOF
sleep 0.42
clear

TEXT="Follow the white rabbit."
while IFS= read -n1 c; do
	printf "$GREEN%s" "$c"
	sleep 0.21
done <<EOF
$TEXT
EOF
sleep 0.42
clear

printf "$WHITE
        .--,_
       / ,/ /
      / // /
     / // /
   .'  ' (
  /       \.-\"\"\"-._
 / a   ' .    '    \`-.
(       .  \'      \"   \`.
 \`-.-\'       \"       \'  ;
     \`.\'  \" .   .-\'    \" ;
      : .     .\'          ;
      \`.   \' :     \'   \'  ;
        )  _.\". \"     .  \";
      .\'_.\'   .\'   \'  __.,\`.
     \'\"      \"\"\'\'---\'\`    \"\'"

sleep 2.1
clear
echo "Knock, Knock, $username." | write $username $terminal
if [[ $(uname -s) == "Darwin" ]]; then
	brew install cmatrix
	cmatrix
elif [[ $(uname -s) == "Linux" ]]; then
	apt-get install cmatrix
	cmatrix
fi
clear
