alias emt='emacsclient -nc'
alias proxy='http_proxy="http://127.0.0.1:8123" https_proxy="http://127.0.0.1:8123"'
alias yd='http_proxy="http://127.0.0.1:8123" \
      	  https_proxy="http://127.0.0.1:8123" \
	  youtube-dl --external-downloader aria2c \
		     --external-downloader-args -x16'

alias ydm='http_proxy="http://127.0.0.1:8123" \
           https_proxy="http://127.0.0.1:8123" \
	   youtube-dl -x --external-downloader aria2c \
		      	 --external-downloader-args -x16'

alias pbcopy='xclip --selection clipboard'
alias pbpaste='xclip --selection clipboard -o'