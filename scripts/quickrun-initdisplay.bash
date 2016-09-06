#!/bin/bash
# Initialize the display mode to only use the built-in display.
# TODO: Make a dynamic script where I don't need to specify which external/optional is to be turned off.

xrandr --output LVDS1 --auto
xrandr --output HDMI1 --off
