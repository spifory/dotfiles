case $1 in
    up)
        new_volume=$(pamixer --increase 5 --get-volume)
        dunstify --replace=3 --icon=notification-audio-volume-high -h int:value:$new_volume "VOLUME" "Volume increased to $new_volume%"
        ;;
    down)
        new_volume=$(pamixer --decrease 5 --get-volume)
        dunstify --replace=3 --icon=notification-audio-volume-low -h int:value:$new_volume "VOLUME" "Volume decreased to $new_volume%"
        ;;
    mute)
        if [ $(pamixer --get-mute) == false ]; then
            pamixer --mute
            dunstify --replace=3 --icon=notification-audio-volume-muted "VOLUME" "Speaker muted"
        else
            pamixer --unmute
            dunstify --replace=3 --icon=notification-audio-volume-high "VOLUME" "Speaker unmuted"
        fi
        ;;
esac
