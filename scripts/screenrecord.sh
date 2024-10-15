#!/bin/bash

options="Monitor built-in audio input\nBuilt-in audio input"
typeSource="$(echo -e $options | rofi -dmenu -theme $HOME/SourceCode/rofi-emc-theme/themes/screenrecord.rasi)"
if [[ -n $screenshot ]]; then
  sh -c "echo $typeSource > $HOME/.cache/screenrecord/typeSource"
fi
