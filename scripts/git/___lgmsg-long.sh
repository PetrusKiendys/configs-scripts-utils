#!/bin/bash
# Display commit messages that are of a specified minimum size/lines

# FIX: Commit messages are expected to end in a blank newline, the ones that don't will report the wrong amount of lines
if [ -z $1 ]
then
	echo -e "Missing argument: You forgot to set the lower bound\n"
	echo -e "Usage: ___get_long_log_msgs N"
	echo -e "where N is the minimum number of lines"
	echo -e "of the commit messages that you want to display\n"
	exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]
then
	echo -e "Bad argument: $1 is not a number"
	exit 1
fi

commits=$(git rev-list --all)
for i in $commits
do
	lines=$(git show -s --format='%H%n%B' $i | wc -l)
	let lines=lines-2

	if [ $lines -ge $1 ]
	then
		git show -s --format="%C(yellow)commit %H%C(reset) %C(magenta bold)(commit message lines: $lines)%C(reset)%n%B" $i
	fi
done

unset commits i lines
