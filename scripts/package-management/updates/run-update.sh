#!/bin/bash

# Output update log to textfile
dir="logs/"
logfile="update-`date "+%Y%m%d_%H%M%S"`.txt"
sudo apt update | tee $dir$logfile
sudo apt upgrade | tee -a $dir$logfile
