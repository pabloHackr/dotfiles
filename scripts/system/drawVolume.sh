#!/bin/bash

function sendNotification() {
    volume=$(pamixer --get-volume)
    dunstify -a "pamixer" -u low -r 9999 -h int:value:"$volume" -i "volume-$1" "Volume: ${volume}%" -t 2000
}

case $1 in
up)
	pamixer -u
	pamixer -i 5 # --allow-boost # to go after 100%
	sendNotification $1
	;;
down)
	pamixer -u
	pamixer -d 5
	sendNotification $1
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -i volume-mute -a "pamixer" -t 2000 -r 9999 -u low "Volume is muted"
	else
		sendNotification up
	fi
	;;
esac
