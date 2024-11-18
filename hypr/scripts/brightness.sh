current_brightness=$(brightnessctl -m | cut -d, -f4)

case $1 in
    up)
        new_brightness=$(brightnessctl set -m 5%+ | cut -d, -f4)
        if [ $new_brightness == $current_brightness ]; then
            exit 1
        fi
        notify-send --replace-id=3 -h int:value:$new_brightness --urgency=normal --icon="display-brightness" "BRIGHTNESS" "Brightness increased to $new_brightness"
        ;;
    down)
        new_brightness=$(brightnessctl set -m 5%- | cut -d, -f4)
        notify-send --replace-id=3 -h int:value:$new_brightness --urgency=normal --icon="display-brightness" "BRIGHTNESS" "Brightness decreased to $new_brightness" 
        ;;
esac
