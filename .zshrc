# -*- eval: (reopen-as-yadm); -*-
eval "$(direnv hook zsh)"
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
fi
export EDITOR='editor'

setopt histignorealldups

alias e='emacsclient -nw'
alias ec='emacsclient -nc'
alias ee='emacsclient -n'
alias proxy='http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123"'
alias yd='youtube-dl --ignore-config \
		     --proxy "socks5://127.0.0.1:1080"'
alias nixproxy='NIX_CURL_FLAGS="-x socks5://127.0.0.1:1080"'

alias pc='proxychains4'

alias ydm='youtube-dl --ignore-config \
		      -x \
		      --proxy "socks5://127.0.0.1:1080"'

alias tm="tmux attach || tmux new"
alias tn="tmux new"
alias r="ranger-cd"

# pass
alias pass="EDITOR='emacsclient -c' pass"

ws-clear() {
    local id=`uuidgen`
    mkdir -p .archive/$id/
    mv * .archive/$id/
    echo "save as" $id
    echo "all cleared!"
}


backup() {
    sudo mount -U 452eef84-ba13-4e5f-82e9-0027a4b40b4f -o rw /home/peterzky/backup
    rsync -av --delete /home/peterzky/Sync /home/peterzky/backup/syncthing_backup
    sync
    sudo umount /home/peterzky/backup
    echo "backup complete! you can unplug the drive now."
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

function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

nixify() {
  if [ ! -e ./.envrc ]; then
    echo "use nix" > .envrc
    direnv allow
  fi
  if [ ! -e default.nix ]; then
    cat > default.nix <<'EOF'
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    bashInteractive
  ];
}
EOF
    emacsclient -nc default.nix
  fi
}
