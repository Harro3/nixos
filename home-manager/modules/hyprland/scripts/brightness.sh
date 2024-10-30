#!/bin/sh

get_brightness() {
	brightnessctl i | grep -o '[0-9]*%' | sed 's/.$//'
}


show_brightness() {
	brightness=$(get_brightness)
	notify-send -h string:x-canonical-private-synchronous:sys-notify -t 1000 -u normal " $brightness%" -h int:value:$brightness
}

brightness_down() {
	brightnessctl s 5%-
	show_brightness
}

brightness_up() {
	brightnessctl s 5%+
	show_brightness
}

case "$1" in
	up)
		brightness_up
		;;
	down)
		brightness_down
		;;
esac
