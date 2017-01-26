#!/usr/bin/env bash

# Find where we are for later use
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Set host specific environment variables
if [[ -f "$DIR/`hostname`" ]]; then
    source "$DIR/`hostname`"
fi

if [[ ! -v WLAN_INTERFACE ]]; then
    # Fallback to wlp3s0 since it's so far the most common
    export WLAN_INTERFACE="wlp3s0"
fi

for monitor in $(polybar -m | awk '{print $1}' | sed 's/:$//g'); do
    MONITOR=$monitor polybar top &
done


echo "Bars launched..."
