# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# run x
# startx

# set temp dir, uncomment if running wayland.
# mkdir -p /tmp/${UID}-runtime-dir
# export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir

# start pipewire
# dbus-run-session pipewire &

# auto-start compositor
# dbus-run-session sway
