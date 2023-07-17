#!/bin/bash

# I should have done this ages ago, yet here we are.

echo "Disclaimer: This installation script does NOT install system packages, just moves configuration files."
echo "Disclaimer: This only installs the wayfire config and no other graphical environment"
echo "Disclaimer: Do not run as root"

# Check dirname and see if it is 'dots', this is a bad way to do this but who cares
TARGET_DIRECTORY="../dots"

# Check for root
if [[ $EUID -eq 0 ]]; then
    echo "User is root. Exiting."
    exit 1
else
    echo "User is not root. Proceeding."
    if [[ "$TARGET_DIRECTORY" == "$PWD" ]]; then
      echo "User is in the 'dots' directory."
      echo "Checking for ~/.config..."

      if [ -d "~/.config" ]; then
        echo "~/.config found, continuing."
      else
        echo "~/.config was not found, making it now"
        mkdir ~/.config
      fi
      
      # cfg/config
      echo "Copying cfg/config/gtk-3.0 over to ~/.config (1/3)"
      cp -r cfg/config/gtk-3.0 ~/.config

      echo "Making config directory for alacritty (2/3)"
      mkdir ~/.config/alacritty
      
      echo "Copying cfg/config/alacritty.yml over to ~/.config/alacritty (2/3)"
      cp cfg/config/alacritty.yml ~/.config/alacritty

      echo "Copying xdg files to ~/.config (3/3)"
      cp cfg/config/user-dirs* ~/.config

      # cfg/etc
      echo "Copying etc/environment to /etc/environment"

      # This requires root privledges, but for one time use
      su -c "sudo cp etc/environment /etc/environment"

      # cfg/gnome
      echo "Skipping cfg/gnome."

      # cfg/home
      echo "Copying bash files (1/2)"
      cp cfg/home/.bash* ~/

      echo "Copying vimrc (2/2)"
      cp cfg/home/.vimrc ~/

      # tools/scripts
      echo "Installing tools"

      # Move to /usr/local/bin
      echo "Copying all scripts to /usr/local/bin (needs authentication) (1/2)"
      su -c "cp tools/scripts/* /usr/local/bin/"
      
      # Chmod +x
      echo "Marking all scripts as executable (needs authentication) (1/2)"
      su -c "chmod +x /usr/local/bin/*"

      # tools/wofi
      echo "Making wofi directory"
      mkdir ~/.config/wofi/

      echo "Copying wofi configuration files to ~/.config/wofi"
      cp tools/wofi/* ~/.config/wofi

      # wms/wayland
      echo "Copying wayfire.ini to ~/.config"
      cp wms/wayland/wayfire.ini ~/.config

      echo "Skipping install.sh in wms/wayfire/wayfire.ini"

      # Finish
      echo "Setup is complete, note that some files have been skipped. Fortunanetly, all skipped files have been pointed out."
    else
      echo "User is not in the 'dots' directory."
      exit 1
    fi
fi


