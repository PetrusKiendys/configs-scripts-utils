#!/bin/bash
# These scipt snippets automate reloading of backends into maintenance state for HAProxy.
# Note: Place in /etc/init.d/haproxy, either as shell functions or references to shell scripts.

# pre-reload/restart
DISABLED_SERVERS=( $(echo "show stat 4" | socat /tmp/haproxy.sock stdio | grep MAINT | grep -v FRONTEND | grep -v BACKEND | awk -F',' '{print $1 "/" $2}' ) )
for server in ${DISABLED_SERVERS[@]}; do echo "Will put $server into maintenance"; done

# post-reload/restart
for server in ${DISABLED_SERVERS[@]}; do echo "disable server $server" | socat /tmp/haproxy.sock stdio; done
