notif_worthy_brightness_levels=("5%" "20%" "40%" "60%" "80%" "100%")
icon_dir="/usr/share/icons/Papirus-Dark/128x128/apps"
current_brightness=$(brightnessctl -m | cut -d, -f4)

change_brightness() {
    if [ "$1" == "up" ]; then
        current=$(brightnessctl set -m 5%+ | cut -d, -f4)
        send_notif $current
    elif [ "$1" == "down" ]; then
        current=$(brightnessctl set -m 5%- | cut -d, -f4)
        send_notif $current
    fi
}

send_notif() {
    for brightness in "${notif_worthy_brightness_levels[@]}"; do
        if [ "$brightness" == "$current_brightness" ]; then
            # This condition is so that there isn't a duplicate notification
            # when it's at 100% and I accidentally increase it.
            # Similar to what I did in power-profiles.sh
            exit 1
        fi

        if [ "$1" == "$brightness" ]; then
            dunstify -h int:value:$brightness --urgency=normal --icon="display-brightness" "BRIGHTNESS" "Brightness updated to $brightness"
        fi
    done
}

change_brightness "$1"
