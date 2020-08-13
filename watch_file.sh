#!/bin/bash

#Define file path here
file01="/home/toms/robots.txt"

#For hostname
hona=$(hostname)

while true ; do
  inotifywait -e delete_self,delete,move_self,move,modify,attrib,close_write --timefmt '%T' --format 'File %w modified at %T | Event: %e' $file01  |
    while read data; do
	curl -X POST \
          --data-urlencode "payload={'text': 'Server: $hona \n $data'}" \
          https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX
    done
done
