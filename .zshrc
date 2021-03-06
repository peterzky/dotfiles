# -*- eval: (reopen-as-yadm); -*-
eval "$(direnv hook zsh)"
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
fi
# export EDITOR='emacsclient -c -nw'
# export VISUAL='emacsclient -c -nw'

setopt histignorealldups

alias e='emacsclient -nw'
alias ec='emacsclient -nc'
alias ee='emacsclient -n'
# alias proxy='http_proxy="http://127.0.0.1:8080" https_proxy="http://127.0.0.1:8080"'
# alias yd='youtube-dl --ignore-config \
# 		     --proxy "socks5://127.0.0.1:1080"'
# alias nixproxy='NIX_CURL_FLAGS="--preproxy socks5://127.0.0.1:1080"'

# alias pc='proxychains4'

alias ydm='youtube-dl --ignore-config \
		      --audio-quality 0 \
                      --extract-audio \
                      --audio-format mp3 \
                      -o "%(title)s.%(ext)s" \
                      --add-metadata \
                      --embed-thumbnail \
                      --metadata-from-title "%(artist)s - %(title)s"'

alias tm="tmux attach || tmux new"
alias tn="tmux new"
alias r="ranger-cd"

alias rime-sync="$HOME/.bin/rime-sync.sh"

# pass
alias pass="EDITOR='emacsclient -c' pass"

alias gfw-update="$HOME/.bin/gfw-update.sh"

function backup() {
    sudo mount -U 22522014-03f8-4e07-87f4-9c9b21bdd7c7 -o rw /home/peterzky/backup
    rsync -av --delete /home/peterzky/Sync /home/peterzky/backup/syncthing_backup
    sync
    sudo umount /home/peterzky/backup
    echo "backup complete! you can unplug the drive now."
}

# function wpm() {
#     local total=`xclip -o | wc -w`
#     echo $(($total / 5))
# }


# clear-cache() {
#     find ~/.cache -type f -atime +1 -print -delete
#     find ~/.cache -type f -size 2M -print -delete
# }

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	    cd -- "$(cat "$tempfile")"
	fi
    rm -f -- "$tempfile"
}
