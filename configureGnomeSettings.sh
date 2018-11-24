#!/usr/bin/env bash

# This will have to be run manually unless you want to do the dbus stuff like in the cron job

# Set the time for the screen to blackout to be 45 minutes
gsettings set org.gnome.desktop.session idle-delay 2700

# Set the time for the lock screen to pop up to be 45 minutes
gsettings set org.gnome.desktop.screensaver lock-delay 2700


