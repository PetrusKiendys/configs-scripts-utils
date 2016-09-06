#!/bin/bash
# Perform a scan with clamav using "commonly used" flags and paths.

path_USB_DATARESCUE=/media/petrus/DATA\&RESCUE/
clamscan -ri $path_USB_DATARESCUE
