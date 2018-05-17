#!/bin/bash

# Output removal log to textfile
dir="logs/"
logfile="remove-`date "+%Y%m%d_%H%M%S"`.txt"
sudo apt autoremove | tee $dir$logfile
