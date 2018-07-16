#!/bin/sh
win_class="Rambox"
command="appimage-run /home/peterzky/appimg/Rambox.AppImage"
xdotool search --onlyvisible --classname $win_class windowunmap \
    || xdotool search --classname $win_class windowmap \
    || $command
