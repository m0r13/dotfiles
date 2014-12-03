#!/bin/bash

wifiname=$(nmcli dev | grep connected | grep wifi | awk '{ for(i=4;i<=NF;++i) print $i }')
lanname=$(nmcli dev | grep connected | grep ethernet | awk '{ for(i=4;i<=NF;++i) print $i }')

for dir in /media/hpi/{home,lehrveranstaltungen}; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
done

if [ "$wifiname" = "hpi" -o "$lanname" = "hpi_lan" ]; then
    mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
    mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
else
    pkill "ssh*-L445:fs23:445"
    ssh -f -N moritz.hilscher@ssh-stud.hpi.uni-potsdam.de -L7445:fs23:445
    
    mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o username=moritz.hilscher,workgroup=hpi,ip=127.0.0.1,port=7445,uid=moritz,gid=moritz
    mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o username=moritz.hilscher,workgroup=hpi,ip=127.0.0.1,port=7445,uid=moritz,gid=moritz
fi

