current_profile=$(powerprofilesctl get)

if [ $current_profile == "$1" ]; then
    exit 1
fi

if [ "$1" == "power-saver" ]; then
    icon="battery-low"
elif [ "$1" == "balanced" ]; then
    icon="battery-good-charging"
elif [ "$1" == "performance" ]; then
    icon="battery-full-charging"
fi

powerprofilesctl set $1 && notify-send --urgency=normal --icon="$icon" "POWER PROFILES" "Power profile set to $1"
