#!/bin/bash

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
syntax=""  # uses ^ to return the right syntax
           
           # generally this will give options
           # to sync / update the package
           # managers because why not

case $pkg in
  "xbps") echo "-- continuing with xbps options"
          syntax="xbps-install -Su "
  ;;
  
  "pacman") echo "-- continuing with pacman options"
            syntax="pacman -Syu "
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
