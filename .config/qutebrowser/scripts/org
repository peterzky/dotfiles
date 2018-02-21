#!/usr/bin/env bash
while getopts ":lcs" opt; do
    case ${opt} in
	l) emacsclient "org-protocol://store-link?url=$QUTE_URL&title=$QUTE_TITLE"
	   echo "message-info 'stored link :$QUTE_TITLE'" >> "$QUTE_FIFO";;
	c) org-capture "org-protocol://capture?template=L&url=$QUTE_URL&title=$QUTE_TITLE" ;;
	s) org-capture "org-protocol://capture?template=p&url=$QUTE_URL&title=$QUTE_TITLE&body=$QUTE_SELECTED_TEXT";;
	\?) echo "Usage: cmd [-c] capture url [-l] org save link [-C] capture context" ;;
    esac
done
