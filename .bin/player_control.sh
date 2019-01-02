#!/usr/bin/env bash

function iease_music_control () {
    case $1 in
        toggle)
            printf '{"command":"toggle"}' | socat - unix-connect:/var/tmp/ieasemusic.sock > /dev/null ;;
        next)
            printf '{"command":"next"}' | socat - unix-connect:/var/tmp/ieasemusic.sock > /dev/null ;;
        prev)
            printf '{"command":"prev"}' | socat - unix-connect:/var/tmp/ieasemusic.sock > /dev/null ;;
        *)
    esac
}

function mpris_control () {
    case $1 in
        next)
            playerctl next ;;
        prev)
            playerctl previous ;;
        toggle)
            playerctl play-pause ;;
        *)
    esac
}

player_status=`playerctl -l`

if [ -z "$player_status" ]; then
    iease_music_control $1
else
    mpris_control $1
fi
