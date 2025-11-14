#!/usr/bin/env bash
# change-wallpaper.sh

BACKGROUNDS_DIR="$HOME/.config/wallpaper"
INTERVAL=1800
DELAY_START=5

set_wallpaper() {
    HOUR=$(date +%H)

    if (( HOUR >= 6 && HOUR < 11 )); then
        WALLPAPER="$BACKGROUNDS_DIR/01_morning.jpg"
    elif (( HOUR >= 11 && HOUR < 17 )); then
        WALLPAPER="$BACKGROUNDS_DIR/02_day.jpg"
    elif (( HOUR >= 17 && HOUR < 20 )); then
        WALLPAPER="$BACKGROUNDS_DIR/03_sunset.jpg"
    else
        WALLPAPER="$BACKGROUNDS_DIR/04_night.jpg"
    fi

    if [[ ! -f "$WALLPAPER" ]]; then
        echo "[wallpaper] Archivo no encontrado: $WALLPAPER" >&2
        pkill -x swaybg
        swaybg --color '#000000' >/dev/null 2>&1 &
        return
    fi

    if [[ "$WALLPAPER" != "$CURRENT_WALLPAPER" ]]; then
        pkill -x swaybg
        swaybg -i "$WALLPAPER" -m fill >/dev/null 2>&1 &
        echo "$(date '+%F %T') -> $WALLPAPER" >> ~/.local/share/wallpaper.log
        CURRENT_WALLPAPER="$WALLPAPER"
    fi
}

# Espera antes del primer wallpaper para evitar conflicto con Omarchy
sleep "$DELAY_START"

CURRENT_WALLPAPER=""

# Bucle principal
if [[ "$1" == "--loop" ]]; then
    while true; do
        set_wallpaper
        sleep "$INTERVAL"
    done
else
    set_wallpaper
fi

