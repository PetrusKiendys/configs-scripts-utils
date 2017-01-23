#!/bin/bash

# Output update log to textfile
sudo apt upgrade | tee update-`date "+%Y%m%d_%H%M%S"`.txt