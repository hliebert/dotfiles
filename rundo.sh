#!/bin/bash

# script needs xsel and xdotool 
# to get them run
# in debian/ubuntu linux
# sudo apt-get install xsel xdotool
# in arch
# sudo pacman -S xsel xdotool

# save clipboard contents
clip=$(xsel -b)
#copy to clipboard
echo 'do ' '"'$1'"' | xsel -b

# get current window id or name
winid=$(xdotool getactivewindow)
# get last active stata window id 
stataid=$(xdotool search --name "Stata/MP" | tail -1)


# check for stata window, if found activate else execute
# switch to command window, ctrl-1 in Stata v11+ (ctrl-4 in stata 10) 
# and select any existing text via ctrl-a, then paste over it and execute
if [ "$stataid" ] 
then
    xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' 'Control_L+v' 'Return'
else
    xstata-mp &
    stataid=$(xdotool search --sync --name "Stata" | tail -1)
    xdotool windowactivate --sync $stataid key 'Control_L+1' 'Control_L+a' 'Control_L+v' 'Return'
fi

# restore clipboard
echo $clip | xsel -b

# go back to editor window
xdotool windowactivate --sync $winid

