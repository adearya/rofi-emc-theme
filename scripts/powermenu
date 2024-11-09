#!/bin/bash
options="⏻||󰒲|󰤄|󰗼"

powermenu="$(echo $options | rofi -sep '|' -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/powermenu.rasi)"

case $powermenu in	
	"⏻")
		sudo shutdown now
		;;

	"")
		sudo reboot
		;;

	"󰒲")
		bash ~/.config/i3lock-color/lockscreen
		sudo systemctl suspend
		;;

	"󰤄")
		sudo systemctl hibernate
		;;

	"󰗼")
		killall i3
		;;

esac
