#!/bin/bash

function sendNotification() {
    backlight=$(printf "%.0f\n" $(brillo -G))
    dunstify -a "brightness" -u low -r 9999 -h int:value:"$backlight" -i "backlight-$1" "Backlight: ${backlight}%" -t 2000
}

case $1 in
up)
	brightnessctl set 5%+
	sendNotification $1
	;;
down)
	brightnessctl set 5%-
	sendNotification $1
	;;
esac
