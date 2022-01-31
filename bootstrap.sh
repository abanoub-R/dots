clear

echo "THIS SCRIPT IS INTENDED TO BE USED ON FRESH INSTALLS OF ARCH / ARCH BASED DISTROS, DO NOT RUN OTHERWISE."
echo "THIS SCRIPT WILL ONLY WORK IF RAN AS SUDO"

distro=0
echo "Are you running Artix? [y\n] : "
read $distro

# if running artix:
if [ $distro = "y" ]
then
  cd system
  pacman -S systemd
  sudo mv pacman.conf /etc/
  pacman -Syu
elif [ $distro = "n" ]
then
  echo "Proceeding with setup"
elif [ $distro != "y" ] || [ $distro != "n" ]  # unknown option
then
  echo "Unidentified option."
  quit
fi

clear 

echo "Installing apps..."
pacman -S firefox steam discord dunst vim maim rxvt-unicode git alsa-utils lxappearance pamixer terminus-font nitrogen

echo "Setting up dwm..."
cd dwm
sudo make clean install

cd dwmblocks
sudo make clean install

cd ..;cd ..
cd system

echo "Moving configs..."
mv .Xresources ~
mv .bashrc ~
mv .profile ~
mv .vimrc ~
mv dunstrc ~/.config/dunst/

echo "Setting up scripts..."
cd scripts
echo "Marking as executable..."
chmod +x down-vol
chmod +x up-vol
chmod +x mute-vol
chmod +x get-cpu
mv * /bin/

echo "Setup is complete."
