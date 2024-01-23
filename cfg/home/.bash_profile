# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# run x
# startx

# set temp dir, un/comment if running wayland with/without a session manager.
mkdir -p /tmp/${UID}-runtime-dir

# non systemd: export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# per user environment variables
export LIBSEAT_BACKEND=logind
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME=qt5ct

# auto-start compositor on first tty
dbus-run-session sway
