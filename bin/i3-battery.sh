#!/bin/bash
 
while true
do
    if [ -f /sys/class/power_supply/BAT1/uevent ]; then
        paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | /home/moritz/bin/i3-battery.py > ~/.i3/battery
        #paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | /home/moritz/bin/i3-battery.py
    else
        cp /sys/class/power_supply/BAT0/uevent ~/.i3/battery
        #cat /sys/class/power_supply/BAT0/uevent
    fi
    sleep 5
done
