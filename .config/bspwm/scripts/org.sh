#!/bin/sh
xdotool search --onlyvisible --classname org-agenda windowunmap \
    || xdotool search --classname org-agenda windowmap \
    || emacsclient -c -F '((name . "org-agenda") (alpha . (85 . 85)))' -e '(progn (org-todo-list 1)(delete-other-windows))'
