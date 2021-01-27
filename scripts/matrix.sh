#!/bin/bash
GREEN='\033[32m'
WHITE='\033[37m'
clear
read -p "$(echo "$GREEN# Write your name: ")" name
clear

TEXT="Wake up, $name..."
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
username="$(whoami)"
terminal="$(who -T | awk '{print $3}' | grep pts)"
echo "Knock, Knock, $name." | write $username $terminal
brew install cmatrix
cmatrix
clear
