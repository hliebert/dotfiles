#!/bin/bash

# script needs wmctrl, xsel and xdotool 
# to get them run
# in debian/ubuntu linux
# sudo apt-get install wmctrl xsel xdotool
# in arch
# sudo pacman -S wmctrl xsel xdotool
# the default delays should work on most systems 

# save clipboard contents
clip=$(xsel -b)
#copy to clipboard
echo 'do ' '"'$1'"' | xsel -b

# get current window id or name
#winid=$(xdotool getactivewindow getwindowname)
winid=$(xdotool getactivewindow)
# get last active stata window id 
stataid=$(xdotool search --name "Stata" | tail -1)


# check for stata window, if found activate else execute
#if [ "$(pgrep stata)" ] 
if [ "$stataid" ] 
then
    #wmctrl -a 'Stata/MP 13.1'
    xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' 'Control_L+v' 'Return'
    #xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' type 'do ' '"'$1'"'
    #xdotool key 'Return'
else
    xstata-mp &
    stataid=$(xdotool search --sync --name "Stata" | tail -1)
    #sleep .2
    xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' 'Control_L+v' 'Return'
    #xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' type 'do ' '"'$1'"'
    #xdotool key 'Return'
fi

# switch to command window, ctrl-1 in Stata v11+ (ctrl-4 in stata 10) 
# and select any existing text via ctrl-a, then paste over it and execute
#xdotool key 'Control_L+1' 'Control_L+a' 'Control_L+v' 'Return'


# restore clipboard
echo $clip | xsel -b

# go back to editor window
#sleep .3
#wmctrl -a $winid 
xdotool windowactivate --sync $winid

