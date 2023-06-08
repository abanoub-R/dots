#!/bin/bash
# Partial configuration installer, wayland only (subject to change)

# Resolution
# Not gonna lie, way too bad at shell script to add this, if I get better at it
# I'll rewrite this whole script anyway.
echo "add this to your linux command line: video=HDMI-A-1:1920x1080@75 (read source)"

# Set GTK theme to Adwaita-dark
echo "Setting GTK theme via GSettings"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Change color scheme to prefer dark mode
echo "Telling GTK to prefer dark mode"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
