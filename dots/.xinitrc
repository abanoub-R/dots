# fill background
feh --bg-fill ~/Pictures/trees.jpg 

# apply urxvt settings
xrdb ~/.Xresources

# start dunst
dunst &

# start dwm
while xsetroot -name " CPU : `get-cpu` | RAM : `get-ram` | `get-date`"
          do
            sleep 1
          done &

dbus-launch --exit-with-session dwm
