#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    # bad bad workaround for xmodmap vs xkb issue!
    (sleep 10 && xmodmap "$usermodmap") &
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

if [ $(hostname) = "moritz-desktop" ]; then
    xrandr --output DisplayPort-0 --off --output DVI-1 --off --output DVI-0 --mode 1920x1080 --pos 0x392 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate right
elif [ $(hostname) = "BP2016D1WS06-Linux" ]; then
    xrandr --output DisplayPort-1-0 --off --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output HDMI2 --mode 1680x1050 --pos 1920x0 --rotate normal --output HDMI1 --off --output DVI-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA1 --off
fi

export PATH=~/bin:$PATH

i3-conf-update.sh
exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#exec i3

