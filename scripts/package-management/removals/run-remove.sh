#!/bin/bash

# Output removal log to textfile
sudo apt autoremove | tee remove-`date "+%Y%m%d_%H%M%S"`.txt