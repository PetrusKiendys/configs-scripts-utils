#!/bin/bash
# Refresh the desktop (simulates clicking F5) via xdotool.

windowid=$(xdotool search --classname desktop)
xdotool windowactivate --sync $windowid
xdotool key --clearmodifiers F5
