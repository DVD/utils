#!/usr/bin/env bash

function rotate() {
    local touch_position=$1
    local screen_position=$2

    for id in `xsetwacom list | perl -ane 'print "$1 " if /id: (\d+)/'`; do
        xsetwacom set $id rotate $touch_position
    done
    xrandr -o $screen_position
}

id1=`xsetwacom list | perl -ane 'print "$1 " and last if /id: (\d+)/'`

case `xsetwacom get $id1 rotate` in
    none) rotate ccw 1;;
    ccw) rotate half 2;;
    half) rotate cw 3;;
    cw) rotate none 0;;
esac
