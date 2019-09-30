#!/bin/bash

# List manually installed Ubuntu/Debian packages
# Source: http://askubuntu.com/questions/2389/generating-list-of-manually-installed-packages-and-querying-individual-packages/492343#492343
comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
