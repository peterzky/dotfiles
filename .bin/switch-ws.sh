#!/usr/bin/env bash
nth=$(wmctrl -d | grep $@ | awk '{print $1}')
wmctrl -s $nth
