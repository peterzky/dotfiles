#!/usr/bin/env bash
choices="Agenda\nTodo\nProjects\nInbox\nRSS\nEMail\nwiki"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p ORG)

wiki=$(echo $chosen | sed 's/wiki\ //')

run()
{
    emacsclient -nc -F "(list (name . \"ORG\"))" -e "$@"
}


case "$chosen" in
    Todo) run "(progn (org-todo-list)(delete-other-windows)(org-agenda-redo-all))";;
    RSS) run "(call-interactively 'elfeed)";;
    EMail) run "(call-interactively 'mu4e)";;
    Agenda) run "(call-interactively 'org-agenda-list)";;
    Projects) emacsclient -nc -e "(find-file \"~/Sync/sync/org/agenda/project.org\")";;
    Inbox) emacsclient -nc -e "(find-file \"~/Sync/sync/org/agenda/inbox.org\")";;
    wiki*) run "(org-search-view nil \"$wiki\" nil)"
esac
