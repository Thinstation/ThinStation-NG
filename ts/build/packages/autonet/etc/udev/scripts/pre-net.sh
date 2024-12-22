#!/bin/sh
#set -x
#exec </dev/null >>/var/log/pre-net.log  2>&1

mkdir -p /run/log/net
env |grep -v "^ID" > /run/log/net/$INTERFACE
if [ "$(systemctl is-system-running)" == "initializing" ]; then
    echo "Systemd is in the boot phase."
else
	export INTERFACE
	/etc/udev/scripts/net.sh
fi
