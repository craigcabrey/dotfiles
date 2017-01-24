#!/usr/bin/env bash

# Find where we are for later use
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Set host specific environment variables
source "$DIR/`hostname`"

if [[ ! -v WLAN_INTERFACE ]]; then
    # Fallback to wlp3s0 since it's so far the most common
    export WLAN_INTERFACE="wlp3s0"
fi

polybar top &

echo "Bars launched..."
