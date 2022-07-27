# dwm
my personalized build of dwm

# setup
before starting, run the auto.sh script to apply the patches and setup the scripts for dwmblocks
(NOTE : THIS WILL NOT CARRY OVER THE SETTINGS FROM THE CONFIG, TO APPLY THEM, SEE CONFIG.TXT)

now install the dependencies

### mandatory
* libX11
* libXft
* make
* gcc

note - you may need the dev variants of the libX11/Xft packages depending on your distro.

note - even though gcc is listed as mandatory, you can edit config.mk to support any compiler you want.

### optional
* rxvt-unicode
* maim
* xclip
* xrandr
* git
* vim

### install
to install dwm and/or dwmblocks, run:

```
$ cd {dwm or dwmblocks}
# make clean install
```
