#!/bin/bash
# List the words contained in the dict files in /usr/share/dict/

# change directory and get the dict filenames
cd /usr/share/dict/
files=$(ls | grep -v "README*")		# filter out READMEs

# filter out non-unique entries
files_rp=$(realpath $files)
files_unique=$(echo ${files_rp} | tr ' ' '\n' | sort -u)

# print out the word count of the dict files
for file in $files_unique
do
	words=$(cat $file | wc -w)
	filename=$(basename $file)
	echo "$filename contains $words words"
done
