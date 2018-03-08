# -*- eval: (reopen-as-yadm); -*-
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

alias emt='emacsclient -nc'
alias emc='emacsclient -nw'
alias proxy='http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123"'
alias yd='http_proxy="http://127.0.0.1:8123" \
      	  https_proxy="http://127.0.0.1:8123" \
	  youtube-dl --ignore-config \
                     --external-downloader aria2c \
		     --external-downloader-args -x3'
alias nixproxy='NIX_CURL_FLAGS="http://127.0.0.1:8123"'

alias ydm='http_proxy="http://127.0.0.1:8123" \
           https_proxy="http://127.0.0.1:8123" \
	   youtube-dl -x --external-downloader aria2c \
		      	 --external-downloader-args -x16'

alias pbcopy='xclip --selection clipboard'
alias pbpaste='xclip --selection clipboard -o'
alias tm="tmux attach || tmux new"
alias tn="tmux new"
alias r="ranger-cd"

date-folder() {
    local name=`date +%Y-%m-%d`
    if [ -d $name ]; then
	cd $name
    else
	mkdir $name
	cd $name
    fi
}

nix-path() {
    ag --depth 1 -g $1 /nix/store/
}

nix-find() {
    readlink -f ${which $1}
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
