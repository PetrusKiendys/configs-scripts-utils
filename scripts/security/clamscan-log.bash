#!/bin/bash
# Scan a given directory recursively with clamscan and print results to log (output file)

output_file=""
path=""
clamscan -rio --bell --log=$output_file $path
