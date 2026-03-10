#!/bin/bash

CONFIG_ENABLED="$HOME/.config/environment.d/99-nvidia.conf"
CONFIG_DISABLED="$HOME/.config/environment.d/99-nvidia.conf.disable"

POWER_SUPPLY=$(ls /sys/class/power_supply/AC*/online)
STATUS=$(cat "$POWER_SUPPLY")

if [ "$STATUS" -eq 1 ]; then
    if [ -f "$CONFIG_DISABLED" ]; then
        mv "$CONFIG_DISABLED" "$CONFIG_ENABLED"
    fi
else
    if [ -f "$CONFIG_ENABLED" ]; then
        mv "$CONFIG_ENABLED" "$CONFIG_DISABLED"
    fi
fi
