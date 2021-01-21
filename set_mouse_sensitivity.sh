#!/usr/bin/env bash

#
# Adjusts the coordinate transmforation matrix to set
# sensitivity.
#

# Options
SENS=0.5
DEVICE="Razer Razer Abyssus"

# Set sensitivity
xinput --set-prop "$DEVICE" \
    "Coordinate Transformation Matrix" "$SENS" 0 0 0 "$SENS" 0 0 0 1

# List devices
# xinput

# List props
# xinput list-props "$DEVICE"

