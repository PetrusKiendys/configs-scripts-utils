#!/bin/bash
# Print number of .mp3 and .flac files in the current directory

count=$(find . -name "*" | egrep "^(.*\.mp3|.*\.flac)$" | wc -l)
dirname=$(basename `pwd`)
echo "$dirname has $count .mp3 and .flac files."
