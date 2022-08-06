# dwm
my personalized build of dwm

# setup
to apply the patches, run `patch --merge -i` on both of the patches (after you've moved them into master)

now install the dependencies

### mandatory
* libX11
* libXft
* make
* gcc

note - you may need the dev variants of the libX11/Xft packages depending on your distro.

note - even though gcc is listed as mandatory, you can edit config.mk to support any compiler you want.

note - xinerama is disabled by default, if you want it, enable it in config.mk and install the xinerama libs
### optional
* rxvt-unicode
* maim
* xclip
* xrandr
* git
* vim

### install
to build dwm and/or dwmblocks, run:

```
$ cd {dwm or dwmblocks}
# make clean install
```

i posted earlier about the inefficiencies of having the users manually apply the patches, so i decided "fuck it" and uploaded the already patched files. apologies to those who like the stock DWM look.
