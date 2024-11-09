#!/bin/bash

# Start nmcli and dmenu
device="$((echo umount && ls /dev | grep sd) | rofi -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/mount.rasi)"

# Condition exit(if not selected) and show password(if selected)
if [ -z $device ]; then
	exit

elif [ $device == "umount" ]; then
	sudo umount /mnt/
	if [ $? -eq 0 ]; then
		dunstify "$device" "Unmounted"
	else
		dunstify "$device" "Failed"
	fi

else
	sudo mount /dev/$device /mnt/
	if [ $? -eq 0 ]; then
		dunstify "$device" "Mounted" && alacritty -e ranger --choosedir= ~/Public/
	else
		dunstify "$device" "Failed"
	fi
fi


