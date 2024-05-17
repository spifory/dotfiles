artist=$(playerctl metadata --format "{{ artist }}")
album=$(playerctl metadata --format "{{ album }}")
title=$(playerctl metadata --format "{{ title }}")

current_status=$(playerctl status)
currently_playing=""

if [[ ! -z $artist ]]; then
    currently_playing+="$artist - "
fi
if [[ ! -z $album ]]; then
    currently_playing+="$album - "
fi

currently_playing+="$title"


if [ "$current_status" == "Playing" ]; then
    icon=""
elif [ "$current_status" == "Paused" ]; then
    icon=""
elif [ "$current_status" == "Stopped" ]; then
    icon=""
fi

if [[ -z $currently_playing ]]; then
    echo ""
else
    echo "$icon $currently_playing" | recode utf8..html
fi
