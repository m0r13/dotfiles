#!/bin/bash

function usage() {
    echo "Usage: backup-phone.sh --from-phone|--from-local --to-local|--to-server"
}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

src=""
dest=""

if [ "$1" = "--from-phone" ]; then
    path="/run/user/1000/gvfs/mtp:host=%5Busb%3A00*"
    if [ $(ls -d $path* 2> /dev/null | wc -l) -ne "1" ]; then
        echo "Can't find phone!"
        exit 1
    fi

    src=$(ls -d $path*)"/Internal storage"
elif [ "$1" = "--from-local" ]; then
    src="/home/moritz/phone"
else
    usage
    exit 1
fi

if [ "$2" = "--to-local" ]; then
    dest="/home/moritz/phone"
elif [ "$2" = "--to-server" ]; then
    dest="yellow-ray.de:/media/storage-private/phone/5_opo2"
else
    usage
    exit 1
fi

echo "$src -> $dest"

rsync -av --progress "$src/DCIM" "$src/Pictures" "$src/WhatsApp" "$src/Snapchat" "$dest/"

