#!/bin/bash

killall polybar
polybar &

source $HOME/.scripts/setup_screens.sh 

feh --bg-scale /home/mwestphal/Pictures/bg
