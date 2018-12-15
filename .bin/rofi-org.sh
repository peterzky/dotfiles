#!/usr/bin/env bash
choices="Agenda\nTodo\nProjects\nInbox\nRSS\nEMail"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p ORG)

run()
{
    emacsclient -nc -e "$@"
}


case "$chosen" in
    Todo) run "(progn (org-todo-list)(delete-other-windows)(org-agenda-redo-all))";;
    RSS) run "(call-interactively 'elfeed)";;
    EMail) run "(call-interactively 'mu4e)";;
    Agenda) run "(call-interactively 'org-agenda-list)";;
    Projects) run "(find-file \"~/Sync/sync/org/agenda/project.org\")";;
    Inbox) run "(find-file \"~/Sync/sync/org/agenda/inbox.org\")";;
esac
