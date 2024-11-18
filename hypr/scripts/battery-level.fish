#!/usr/bin/env fish

set bat_info (upower -i (upower -e | grep 'BAT0'))
set percentage (string collect $bat_info | grep 'percentage' | awk '{print $2}' | sed 's/%//')
set state (string collect $bat_info | grep 'state' | awk '{print $2}')

function send_notification -a icon
    notify-send --urgency critical --replace-id 1 --print-id --icon $icon "BATTERY LEVEL" "Battery level is $percentage%"
end

if test $percentage -ge 95 -a $state = charging
    send_notification battery
else if test $percentage -eq 20 -a $state = discharging
    send_notification battery-low
else if test $percentage -le 10 -a $state = discharging
    send_notification battery-empty
end
