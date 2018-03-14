# -*- eval: (reopen-as-yadm); -*-
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi
export EDITOR='editor'

alias emt='emacsclient -nc'
alias emc='emacsclient -nw'
alias proxy='http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123"'
alias yd='youtube-dl --ignore-config \
                     --proxy "socks5://127.0.0.1:1080"'
alias nixproxy='NIX_CURL_FLAGS="http://127.0.0.1:8123"'

alias ydm='youtube-dl --ignore-config \
                      -x \
		      --proxy "socks5://127.0.0.1:8123"'

alias pbcopy='xclip --selection clipboard'
alias pbpaste='xclip --selection clipboard -o'
alias tm="tmux attach || tmux new"
alias tn="tmux new"
alias r="ranger-cd"

adblock-update() {
    http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123" \
    sudo adblock2privoxy -p /etc/privoxy -w /var/www/css -d 127.0.0.1:8119 -t /tmp/ab2p.task \
	 https://easylist.to/easylist/easyprivacy.txt  \
	 https://easylist.to/easylist/easylist.txt  \
	 https://easylist.to/easylist/fanboy-annoyance.txt  \
	 https://easylist.to/easylist/fanboy-social.txt  \
	 https://easylist-downloads.adblockplus.org/easylistchina.txt \
	 https://raw.githubusercontent.com/easylist/easylist/master/easylist_adult/adult_adservers.txt
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
