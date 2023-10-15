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

if [[ ! $currently_playing ]]; then
    currently_playing='very uh.. quiet.'
fi

if [ "$current_status" == "Playing" ]; then
    icon=""
elif [ "$current_status" == "Paused" ]; then
    icon=""
else
    icon=""
fi

echo "$icon $currently_playing"