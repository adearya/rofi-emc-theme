#!/bin/bash

sudo iwctl station wlan0 scan 

sleep 0.1

getSSID="$(nmcli -g SSID d wifi list | rofi -dmenu -theme ~/SourceCode/rofi-emc-theme/themes/wifi.rasi)"

sleep 0.1
 
if [ -z $getSSID ]; then
	exit   
else  
	rofi -dmenu -theme ~/SourceCode/rofi-emc-theme/themes/password.rasi | nmcli d wifi connect "$getSSID" -a
fi
