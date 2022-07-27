#!/bin/sh

# THIS SCRIPT WON'T WORK IF RAN IN OTHER DIRECTORY #

echo "deleting misc directory of images"
rm -rf misc

TARGET=/usr/local/bin

echo "patching with fullgaps..."
mv patches/dwm-fullgaps-6.2.diff .
patch --merge -i dwm-fullgaps-6.2.diff

echo "done"

echo "patching with barpadding..."
mv patches/dwm-barpadding-6.2.diff .
patch --merge -i dwm-barpadding-6.2.diff .

echo "done"

echo "removing patch directory"
rm -rf patches

echo "setting up scripts"
chmod +x scripts/*

echo "moving scripts to $TARGET"

# moving scripts like this to avoid move errors from . and ..
mv patches/down-vol $TARGET
mv patches/up-vol $TARGET
mv patches/get-vol $TARGET
mv patches/get-cpu $TARGET
mv patches/get-date $TARGET
mv patches/get-ram $TARGET 
mv patches/get-vol $TARGET  
mv patches/maim-cp $TARGET  
mv patches/maim-sv $TARGET  
mv patches/up-vol $TARGET 


echo "cleaning up.."
rm -rf patches

echo "done applying patches, to check if the patches were applied or not, run `less dwm.c` and `less config.def.h`"
echo "to build this copy of dwm, run `make clean install` as root"

echo "!! note that the config in this repo won't be applied automatically because it breaks compatability with patch.           !!"
echo "!! to use it, copy the text from config.txt into the newly generated config.h (is only made if you ran the above command) !!"
echo "!! without overriding the changes that the patches applied (look at the diff files for more insight)                      !!"
