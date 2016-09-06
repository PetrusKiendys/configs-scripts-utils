#!/bin/bash
# Scan a given directory recursively with clamscan and quarantine infected files to target directory

quarantine="~/.clamscan/viruses/"
path=""
clamscan -rio --bell --move=$quarantine $path
