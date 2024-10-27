#!/bin/sh

volume_step=1
max_volume=100

get_volume() {
	pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

get_mute() {
	pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

display_volume() {
	volume=$(get_volume)
	mute=$(get_mute)

	if [ "$volume" -eq 0 ] || [ "$mute" = "yes" ] ; then
		volume_icon=""
	elif [ "$volume" -lt 50 ]; then
		volume_icon=""
	else
		volume_icon=""
	fi

	notify-send -h string:x-canonical-private-synchronous:sys-notify -t 1000 -u normal "$volume_icon $volume%" -h int:value:$volume
}

case $1 in
    up)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    display_volume
    ;;

     down)
    # Raises volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    display_volume
    ;;

    mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    display_volume
    ;;
esac
