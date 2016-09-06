#!/bin/bash
# Compress all contents of current directory with bzip2 compression,
# generated archive name is set by current date and time.

tar cvjf $(date +%Y%m%d_%H%M).tar.bz2 .
