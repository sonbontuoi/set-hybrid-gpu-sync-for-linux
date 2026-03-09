#!/bin/bash

CONFIG_ENABLED="$HOME/.config/environment.d/99-nvidia.conf"
CONFIG_DISABLED="$HOME/.config/environment.d/99-nvidia.conf.disable"

# power_supply your device
STATUS=$(cat /sys/class/power_supply/ACAD/online)

if [ "$STATUS" -eq 1 ]; then
    if [ -f "$CONFIG_DISABLED" ]; then
        mv "$CONFIG_DISABLED" "$CONFIG_ENABLED"
    fi
else
    if [ -f "$CONFIG_ENABLED" ]; then
        mv "$CONFIG_ENABLED" "$CONFIG_DISABLED"
    fi
fi
