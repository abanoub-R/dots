# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# optionally run dwm
# startx

# set temp dir
# mkdir -p /tmp/${UID}-runtime-dir
# xport XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir

# auto-start hikari
# dbus-run-session hikari
