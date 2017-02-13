#!/bin/bash
# Show when a file was added (custom format)

git log --diff-filter=A --follow --format=%aD -- $0 | tail -1 | date +"%Y-%m-%d %H:%M" -f -
