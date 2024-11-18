#!/usr/bin/env fish

function send_notification -a icon message
    notify-send --replace-id 3 -h int:value:$volume --icon $icon "VOLUME LEVEL" $message
end

switch $argv[1]
    case up
        set volume (pamixer --increase 5 --get-volume)
        send_notification notification-audio-volume-high "Increased volume to $volume%"
    case down
        set volume (pamixer --decrease 5 --get-volume)
        send_notification notification-audio-volume-low "Decreased volume to $volume%"
    case toggle-mute
        set muted (pamixer --toggle-mute --get-mute)

        if $muted
            set volume 0
            send_notification notification-audio-volume-muted "Speaker muted"
        else
            set volume (pamixer --get-volume)
            send_notification notification-audio-volume-high "Speaker un-muted"
        end
    case '*'
        exit 1
end
