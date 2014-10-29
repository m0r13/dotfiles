#!/bin/bash

mount -t cifs //FS23/moritz.hilscher$ /media/hpi/home -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
mount -t cifs //FS23/lehrveranstaltungen /media/hpi/lehrveranstaltungen -o credentials=/home/moritz/.local/etc/hpi_sambacreds,workgroup=hpi,uid=moritz,gid=moritz
