#!/usr/bin/env bash
choices="Shutdown\nReboot\nReload\nHibernate"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p System)

case "$chosen" in
    Shutdown) $HOME/.bin/shutdown.sh poweroff;;
    Reboot) $HOME/.bin/shutdown.sh reboot;;
    Reload) pkill xmobar; xmonad --recompile; xmonad --restart;;
    Hibernate) sudo systemctl hibernate;;
esac
