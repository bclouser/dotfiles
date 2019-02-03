#!/usr/bin/env bash


WALLPAPER_DIR=${WALLPAPER_DIR:-/home/bclouser/Dropbox/desktops}

echo "WALLPAPER_DIR=$WALLPAPER_DIR"

#WALLPAPERS=($WALLPAPER_DIR/*)
#RANDOM_PIC=`printf "%s\n" "${WALLPAPERS[${RANDOM} % ${#WALLPAPERS[@]}]}"`


#gconftool-2 -t str --set /desktop/gnome/background/picture_filename "$RANDOM_PIC"

# TODO: This doesn't catch changing the background to the same file it currently is :/


PID_ARRAY=($(pgrep gnome-session))
PID=${PID_ARRAY[-1]}
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)


echo "DBUS_SESSION_BUS_ADDRESS is $DBUS_SESSION_BUS_ADDRESS"
# Find all files in wallpaper dir skipping hidden files
PIC=$(find $WALLPAPER_DIR -not -path '*/\.*' -type f | shuf -n1)
echo "($(date +"%T_%D")) Changing to ${PIC}" >> /tmp/desktopChange.log
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"


