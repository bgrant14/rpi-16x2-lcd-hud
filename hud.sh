#!/bin/bash
#Bash script to get date and weather information into single-line variables and send them to the scroll script, runs continuously

while true; do
		line1=$(echo "`date -I'minutes' | sed 's/^.....//g;s/^0/\ /g;s/[A-Z]/\ /g;s/......$//g'`, `netTemp.sh` <> ")
		line2=$(echo `ssh btgrant@192.168.29.160 ifstat -z 1 1 | tail -1 | egrep -o '[0-9]{1,5}\.[0-9]{2}' | sed 's/\n/ KB\/s /g;s/$/ KB\/s/g'`\ \<\>\ \ \ )
		scroll.sh "$line1" "$line2"
done
