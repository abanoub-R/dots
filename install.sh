#!/bin/bash
# this is unfinished

# super user options
echo "!!! DO NOT RUN AS ROOT !!!"
echo "would you like to run with sudo or doas?"

read method # super user utility

# this looks useless but its purpose is to make sure a proper elevation method is used

case $method in
  "sudo") echo "-- continuing with sudo"
  ;;
  
  "doas") echo "-- continuing with doas"
  ;;
  
  *) echo "!- unrecognized option"
  ;;
     exit
esac

# package management options
echo "select your package manager: "
echo "- xbps"
echo "- pacman"
echo "- portage"

read pkg   # system package manager

echo "-- installing dependencies"

case $pkg in
  "xbps") echo "-- continuing with xbps options"
          echo "-- note: this will take a while especially on fresh installs as not only are these packages and their dependencies being installed, but it will also have to sync everything else"
          $method xbps-install -Su alsa-firmware alsa-utils base-system dejavu-fonts-ttf dmenu elogind ffmpeg firefox-esr gcc libX11-devel libXft-devel libavcodec libdrm-32bit-2.4.110_1 libgcc-32bit libglapi-32bit libglvnd-32bit libstdc++-32bit libva-glx-32bit linux-firmwarelxappearance maim make mesa-dri mesa-dri-32bit mesa-vaapi neofetch nitrogen pulseaudio rxvt-unicode steam terminus-font ttf-ubuntu-font-family vim void-repo-multilib void-repo-multilib void-repo-nonfree-9_6 xclip xorg-minimal xrandr xrdb xz mesa-vulkan-radeon amdvlk vkd3d vkd3d-32bit
  ;;
  
  "pacman") echo "-- continuing with pacman options"
            $method pacman -Syu alsa-utils xorg-server
  ;;
  
  "portage") echo "--continuing with portage options"
             syntax="emerge" 
  ;;
  
  *) echo "!- unidentified option"
  ;;
esac

# disclaimer
echo "!!! BEFORE PROCEEDING, PLEASE DOUBLE CHECK THE MAKEFILES AND/OR THE CONFIGS THEMSELVES !!!"
echo "!!! THIS WILL NOT WORK IF YOU HAVE MOVED THIS FILE OUT OF ITS ORIGINAL LOCATION        !!!"
echo "start installation (y/N)"
read answer

case $answer in
  "y") echo "defining directories"
       # define locations
       hostdir=$(pwd)
       dwm=$hostdir/dwm
       bar=$hostdir/dwm/dwmblocks
       sys=$hostdir/system/
       scripts=$hostdir/system/scripts/
       
       # installing stuff
       echo "installing dwm (1/4)"
       cd $dwm
       echo "-- building dwm from source"
       $method make clean install
       echo "-- done!"
       
       
       echo "installing dwmblocks (2/4)"
       cd $bar
       echo "-- building dwmblocks from source"
       
   ;;
   
  *) # doesn't actually scan for 'n', instead checks if you typed y or not.
   echo "-- exiting."
  ;;
esac

echo "done, have a nice day."
