#!/bin/bash

function phone_path {
    mountdir=~/phone-mnt
    mkdir -p $mountdir
    if ! mount | grep simple-mtpfs | grep $mountdir > /dev/null; then
        echo "Mounting phone to $mountdir..."
        if ! simple-mtpfs $mountdir > /dev/null; then
            echo "Unable to mount phone!"
            exit 1
        fi
    else
        echo "Phone is mounted on $mountdir."
    fi
    eval "$1=\"$mountdir\""
}

function local_path {
    if [ $(hostname) = "moritz-laptop" ]; then
        eval "$1=\"/home/moritz/phone\""
    elif [ $(hostname) = "moritz-desktop" ]; then
        eval "$1=\"/media/pictures/phone/5_opo2\""
    else
        echo "No local phone path available!"
        exit 1
    fi
}

function server_path {
    eval "$1=\"yellow-ray.de:/media/storage-private/phone/5_opo2\""
}

function usage() {
    echo "Usage: backup-phone.sh source destination [rsync opts]"
}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

src=""
dest=""

case $1 in
    phone)
        phone_path src
        ;;
    local)
        local_path src
        ;;
    server)
        server_path src
        ;;
    *)
        echo "Invalid source '$1'!"
        usage
        exit 1
esac

case $2 in
    phone)
        phone_path dest
        ;;
    local)
        local_path dest
        ;;
    server)
        server_path dest
        ;;
    *)
        echo "Invalid destination '$2'!"
        usage
        exit 1
esac

echo "$src -> $dest"

# give remaining args to rsync
shift 2
rsync -av --progress $@ "$src/DCIM" "$src/Pictures" "$src/WhatsApp" "$src/Snapchat" "$dest/"

