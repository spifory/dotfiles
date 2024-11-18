#!/usr/bin/env fish

set brightness (brightnessctl -m | cut -d, -f4)

switch $argv[1]
    case up
        set new_brightness (brightnessctl set -m 5%+ | cut -d, -f4)
    case down
        set new_brightness (brightnessctl set -m 5%- | cut -d, -f4)
    case '*'
        exit 0
end

notify-send --replace-id 2 -h int:value:$new_brightness --icon display-brightness "BRIGHTNESS UPDATE" "Brightness updated to $new_brightness"
