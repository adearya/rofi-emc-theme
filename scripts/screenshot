#!/bin/bash

onClickSet() {
  options="Fullscreen and save\nCrop and clip\nFullscreen and clip\nCrop and save\nFullscreen Timer"
  screenshot="$(echo -e $options | rofi -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/screenshot.rasi)"
  if [[ -n $screenshot ]]; then
    sh -c "echo $screenshot > $HOME/.cache/screenshot/selection"
  fi
}
  
onClickToggle() {
  option=$(cat $HOME/.cache/screenshot/selection)
  
  generate_filename() {
    local DIR=~/Pictures/Screenshots
    local counter=1
    while [ -e "$DIR/$(date "+%Y-%m-%d")-at-$(date "+%k")-o'clocks-screenshot-$(printf $counter).png" ]; do
      counter=$((counter + 1))
    done 
    echo "$DIR/$(date "+%Y-%m-%d")-at-$(date "+%k")-o'clocks-screenshot-$(printf $counter).png"
  }  
  
  eww -c ~/SourceCode/eww-emc-theme close shortcuts
  
  case $option in
    "Fullscreen and save")
      maim -d 1 "$(generate_filename)"
      dunstify "Image saved to Pictures"
      ;; 
    "Crop and clip")
      maim -s | xclip -selection clipboard -t image/png
      dunstify "Image saved to Clipboard"
      ;; 
    "Fullscreen and clip")
      maim -d 1 | xclip -selection clipboard -t image/png
      dunstify "Image saved to Clipboard"
      ;; 
    "Crop and save")
      maim -s "$(generate_filename)"
      dunstify "Image saved to Pictures"
      ;; 
    "Fullscreen Timer Clip")
      maim -d 10 "$(generate_filename)"
      ;; 
  esac  
}  
  
if [[ $1 == "toggle" ]]; then
  onClickToggle 
fi  
  
if [[ $1 == "setting" ]]; then
  onClickSet   
fi
