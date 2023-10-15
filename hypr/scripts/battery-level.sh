#!/bin/bash
# A script used to check the battery percentage using systemd timers

BAT_INFO='upower -i $(upower -e | grep 'BAT1')'

current_percentage=$(eval $BAT_INFO | grep 'percentage' | awk '{print $2}' | sed 's/%//')
current_state=$(eval $BAT_INFO | grep 'state' | awk '{print $2}')

send_notif() {
    echo $(notify-send --urgency="critical" --replace-id="1" --print-id --icon="$1" "BATTERY LEVEL" "$2")
}

if [ "${current_percentage}" -ge 95 ] && [ "$current_state" == "charging" ]; then
    notification=$(send_notif "battery" "Battery is $current_percentage%. Unplug the charger")

    if [ $notification == 1 ]; then
        exit 1
    fi
fi

if [ "${current_percentage}" == 30 ] && [ "$current_state" == "discharging" ]; then
    notification=$(send_notif "battery-low" "Battery is $current_percentage%. Plug in the charger mate")

    if [ $notification == 1 ]; then
        exit 1
    fi
elif [ "${current_percentage}" -le 5 ] && [ "$current_state" == "discharging" ]; then
    notification=$(send_notif "battery-empty" "Battery is $current_percentage%. Seriously, charge this laptop D:")

    if [ $notification == 1 ]; then
        exit 1
    fi
fi
