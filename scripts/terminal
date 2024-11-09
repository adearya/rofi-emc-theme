#!/bin/bash

# Load directory from directory.txt
directory="$HOME/SourceCode/rofi-emc-theme/scripts/directory.txt"

# Read sessions and commands into arrays
mapfile -t sessions < <(awk -F';' '{print $1}' "$directory")
mapfile -t commands < <(awk -F';' '{print $2}' "$directory")

# Convert arrays to strings for dmenu
session_list=$(printf "%s\n" "${sessions[@]}")

# Start Session
session="$(echo -e "$session_list" | rofi -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/terminal.rasi)"

# Find the index of the selected session
index=$(echo "${sessions[@]}" | tr ' ' '\n' | grep -n "^$session$" | cut -d: -f1)

# Execute the corresponding command if a valid session was selected
if [ -n "$index" ]; then
  eval "${commands[$((index - 1))]}"
else
  dunstify "Terminal" "Invalid session selected"
fi
