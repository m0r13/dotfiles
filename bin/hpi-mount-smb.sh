#!/bin/bash

hostname=$(hostname)
wifiname=$(iwgetid 2>&1 | grep -Po "(?<=ESSID:\")[^\"]*")

if [ "$hostname" = "moritz-desktop" ]; then
    pkill "ssh*-L445:fs23:445"
    ssh -f -N moritz.hilscher@ssh-stud.hpi.uni-potsdam.de -L7445:fs23:445
    
    mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o username=moritz.hilscher,workgroup=hpi,ip=127.0.0.1,port=7445,uid=moritz,gid=moritz
    mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o username=moritz.hilscher,workgroup=hpi,ip=127.0.0.1,port=7445,uid=moritz,gid=moritz
elif [ "$hostname" = "moritz-laptop" ]; then
    mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
    mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
fi

#mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
#mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
