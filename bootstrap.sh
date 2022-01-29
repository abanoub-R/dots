# THIS SCRIPT IS I
pacman -S systemd firefox steam discord dunst vim maim rxvt-unicode git alsa-utils lxappearance pamixer terminus-font

# setup
cd dwm
sudo make clean install

cd dwmblocks
sudo make clean install

cd ..
cd system

# move configs
mv .Xresources ~
mv .bashrc ~
mv .profile ~
mv .vimrc ~

