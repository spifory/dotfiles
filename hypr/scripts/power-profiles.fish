#!/usr/bin/env fish

set new_profile $argv[1]

set profile (powerprofilesctl get)

switch $new_profile
    case power-saver
        set icon battery-low
    case balanced
        set icon battery-good-charging
    case performance
        set icon battery-full-charging
    case '*'
        set icon battery
end

powerprofilesctl set $new_profile
notify-send --urgency normal --icon $icon "POWER PROFILES" "Power profile set to $new_profile"
