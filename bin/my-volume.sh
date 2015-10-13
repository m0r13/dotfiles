#!/bin/bash

case $1 in
    up)
        pulseaudio-ctl up 5
        ;;
    down)
        pulseaudio-ctl down 5
        ;;
    toggle)
        pulseaudio-ctl mute
        ;;
    *)
        echo "Wtf u want?!"
        exit 1
esac

volume=$(pulseaudio-ctl full-status | awk '{ print $1 }')
muted=$(pulseaudio-ctl full-status | awk '{ print $2 }')
bar=$(python -c 'print("#" * int('${volume}' / 100.0 * 20), end="")')

summary="Beat: ${volume}%"
if [ "$muted" = "yes" ]; then
    summary=$summary" nicht mies :("
else
    summary=$summary" mies!"
fi
body="$bar"

if [ -s "/tmp/dunst_volume.id" ]; then
    dunst_id=$(cat /tmp/dunst_volume.id)
    dunstify -r "$dunst_id" -p "$summary" "$body" > /tmp/dunst_volume.id
else
    dunstify -p "$summary" "$body" > /tmp/dunst_volume.id
fi

