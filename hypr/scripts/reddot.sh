#!/bin/bash

# Get active window ID
WIN_ID=$(hyprctl activewindow -j | jq -r '.address')

# Get window position and size
WIN_INFO=$(hyprctl clients -j | jq --arg WIN_ID "$WIN_ID" '.[] | select(.address==$WIN_ID)')

WIN_X=$(echo "$WIN_INFO" | jq '.at[0]')
WIN_Y=$(echo "$WIN_INFO" | jq '.at[1]')
WIN_W=$(echo "$WIN_INFO" | jq '.size[0]')
WIN_H=$(echo "$WIN_INFO" | jq '.size[1]')

# Calculate dot position (top-right corner)
DOT_X=$((WIN_X + WIN_W - 15))
DOT_Y=$((WIN_Y + 15))

# Draw a red circle using `swayosd` (or an alternative method)
swayosd-client --circle $DOT_X $DOT_Y 10 "#ff5555ff"  # 10px red dot


