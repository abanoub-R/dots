clear
# disclaimer
echo "> THIS SCRIPT IS INTENDED TO BE USED ON FRESH INSTALLS OF ARCH / ARCH BASED DISTROS, DO NOT RUN OTHERWISE."
echo "> THIS SCRIPT WILL ONLY WORK IF RAN AS SUDO"
echo "> if you are running artix, this'll install support pkgs and pacman (this may cause errors on arch, if running arch; please update your pacman.conf to the appropriate settings)"
echo "waiting for 5 seconds.."

sleep 5

echo "Initializing..."
# correcting home address
home=/home/$(whoami)
# updating ps1
echo 'export PS1="\[\033[38;5;27m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;27m\][\[$(tput sgr0)\]\[\033[38;5;33m\]\u\[$(tput s    gr0)\]\[\033[38;5;27m\]]\[$(tput sgr0)\] : \[$(tput sgr0)\]\[\033[38;5;241m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;27m    \]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"'


echo "Installing apps..."

pacman -S xclip xorg-server xorg-xrandr xorg-xinit pulseaudio firefox steam discord dunst vim maim rxvt-unicode git alsa-utils lxappearance pamixer terminus-font nitrogen

echo "Setting up dwm..."
cd dwm
sudo make clean install

cd dwmblocks
sudo make clean install

cd ..;cd ..
cd system

echo "Moving configs..."
mv .Xresources $(home)
mv .bashrc $(home)
mv .profile $(home)
mv .vimrc $(home)
mv dunstrc $(home)/.config/dunst/

echo "Setting up scripts..."
cd scripts
echo "Marking as executable..."
chmod +x *
mv * /bin/

echo "Setup is complete, you may remove all installation files BUT the dwm directory as it contains source code you may wish to edit"
