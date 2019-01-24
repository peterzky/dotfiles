#!/usr/bin/env bash

Xephyr :5 -ac -br -title swd3 +extension glx -glamor -screen 640x480x16 &
# Xephyr :5 -ac -br -title swd3 +extension glx -glamor -screen 1280x960x16 &
XEPHYR_PID=$!
cd ~/.wine/drive_c/Program\ Files/SWD3
DISPLAY=:5 wine Swd3.exe &
WINE_PID=$!

wait ${WINE_PID}
kill ${XEPHYR_PID}
