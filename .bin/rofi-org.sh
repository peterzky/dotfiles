#!/usr/bin/env bash
choices="Agenda\nTodo\nProjects\nInbox\nRSS\nEMail\nArea\ns"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p ORG)

search=$(echo $chosen | sed 's/s //')

run()
{
    emacsclient -nc -F "(list (name . \"ORG\"))" -e "$@"
}


case "$chosen" in
    Todo) run "(progn (org-todo-list)(delete-other-windows)(org-agenda-redo-all))";;
    RSS) run "(call-interactively 'elfeed)";;
    EMail) run "(call-interactively 'mu4e)";;
    Agenda) run "(call-interactively 'org-agenda-list)";;
    Area) emacsclient -nc -e "(find-file \"~/Sync/sync/org/agenda/area.org\")";;
    Projects) emacsclient -nc -e "(find-file \"~/Sync/sync/org/agenda/project.org\")";;
    Inbox) emacsclient -nc -e "(find-file \"~/Sync/sync/org/agenda/inbox.org\")";;
    s*) emacsclient -nc -e "(org-search-view nil \"$search\" nil)"
esac
