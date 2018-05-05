# -*- eval: (reopen-as-yadm); -*-
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
fi
export EDITOR='editor'

alias e='emacsclient -n'
alias emc='emacsclient -nc'
alias emt='emacsclient -nw'
alias proxy='http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123"'
alias yd='youtube-dl --ignore-config \
		     --proxy "socks5://127.0.0.1:1080"'
alias nixproxy='NIX_CURL_FLAGS="http://127.0.0.1:8123"'

alias ydm='youtube-dl --ignore-config \
		      -x \
		      --proxy "socks5://127.0.0.1:1080"'

alias tm="tmux attach || tmux new"
alias tn="tmux new"
alias r="ranger-cd"

# transmission
alias tsmd='transmission-daemon'
alias tsm='transmission-remote-cli'
alias tsmk='pkill transmission-daemon'

ws-clear() {
    local id=`uuidgen`
    mkdir -p .archive/$id/
    mv * .archive/$id/
    echo "save as" $id
    echo "all cleared!"
}


clear-cache() {
    find ~/.cache -type f -atime +1 -print -delete
    find ~/.cache -type f -size 2M -print -delete
}

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	    cd -- "$(cat "$tempfile")"
	fi
    rm -f -- "$tempfile"
}
