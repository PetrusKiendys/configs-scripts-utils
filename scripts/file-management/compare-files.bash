#!/bin/bash
# Compare two files, print "files differ" if files are not identical

cmp -s file1 file2 || echo "files differ"
