#!/bin/sh

INTERFACE=wlp3s0

HEALTH=$(nmcli -f GENERAL.CONNECTION device show "$INTERFACE" | awk '{print substr($0, index($0,$2))}')

echo $HEALTH
