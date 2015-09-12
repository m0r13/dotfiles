#!/bin/bash

REMOTE_HOST="i.yellow-ray.de"
REMOTE_PATH="~/public_html/images"
BASE_URL="https://i.yellow-ray.de"

for file in $@;
do
    filename=$(basename "$file")
    timestamp=$(date +%s)
    random=$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 6 | head -n 1)
    extension="${filename##*.}"
    remote_name="${timestamp}_$random.$extension"
    
    scp -q "$file" "$REMOTE_HOST:$REMOTE_PATH/$remote_name"
    echo "$BASE_URL/$remote_name"
done

