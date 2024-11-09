#!/bin/bash

# Move focus workspace
moveFocus() {
    output=$(xprop -root _NET_CLIENT_LIST)
    window_list=$(echo "$output" | awk -F'# ' '{print $2}')
    IFS=', ' read -r -a window_array <<< "$window_list"
    
    for window_id in "${window_array[@]}"
    do
        window_title=$(xprop -id $window_id WM_NAME | grep -oP '(?<=")([^"]+)(?=")')
        
        if [[ $window_title == *"Thorium"* ]]; then
            i3-msg "[id=\"$window_id\"] focus"
        fi
    done
}

# Load bookmarks from bookmarks.txt
bookmarks_file="$HOME/SourceCode/rofi-emc-theme/scripts/bookmarks.txt"

# Read bookmarks and commands into arrays
mapfile -t bookmarks < <(awk -F';' '{print $1}' "$bookmarks_file")
mapfile -t bookmark_commands < <(awk -F';' '{print $2}' "$bookmarks_file")

# Convert arrays to strings for dmenu
bookmark_list=$(printf "%s\n" "${bookmarks[@]}")

# Start Bookmark
bookmark="$(echo -e "$bookmark_list" | rofi -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/browser.rasi)"

# Find the index of the selected bookmark
index=$(echo "${bookmarks[@]}" | tr ' ' '\n' | grep -n "^$bookmark$" | cut -d: -f1)

# Execute the corresponding command if a valid bookmark was selected
if [ -n "$index" ]; then
  eval "${bookmark_commands[$((index - 1))]}"
else
  dunstify "Browser" "Invalid bookmark selected"
fi
