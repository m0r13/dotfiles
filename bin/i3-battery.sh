#!/bin/bash
 
while true
do
#    paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | awk '{split($0,a,"="); split(a[2],b," "); (a[3] == "Charging" || b[1] == "Charging") ? $5 = "Charging" : (a[1] == "POWER_SUPPLY_POWER_NOW" ? $5 = a[3] + b[1] : $5 = (a[3] + b[1])/2); print a[1] "=" $5}' > ~/.uevent
    paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | /home/moritz/bin/i3-battery.py > ~/.i3/battery
    sleep 5
done
