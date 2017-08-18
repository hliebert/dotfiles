#!/bin/bash

# script needs wmctrl, xte and xsel and xdotool or xprop 
# (xprop has some issues in arch)
# to get them run
# in debian/ubuntu linux
# sudo apt-get install wmctrl xautomation xsel xdotool
# in arch
# sudo pacman -S wmctrl xautomation xsel xorg-xprop xdotool
# more useful info on commands
# https://bbs.archlinux.org/viewtopic.php?id=117031
# winid/xprop somehow not working in arch now, use xdotool to get window name and switch back

# delays depends on window manager, and whether stata is on a different workspace etc 

#copy to clipboard
echo 'do ' '"'$1'"' | xsel -b

# get current window id or name
#winid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
winid=$(xdotool getactivewindow getwindowname)

# check for stata window, if found activate else execute
# pidof or pgrep
if [ "$(pgrep stata)" ] 
then
    #wmctrl -a 'Stata/MP 14.2'
    #wmctrl -a 'Stata/MP 13.1'
    wmctrl -a 'Stata/MP'
else
    #xstata-mp &
    xstata13-mp &
    sleep .1
fi

sleep .1 

# switch to command line, ctrl-4 in stata 10, ctrl-1 in 11/12?
# and select existing text via ctrl-a
xte 'keydown Control_L' 'key 1' 'key A' 'usleep 100' \
    'key V' 'keyup Control_L' 
sleep .1
xte 'key Return'



sleep .3
#sleep .1
#sleep 1

# go back to editor window
#wmctrl -i -a $winid 
wmctrl -a $winid 


