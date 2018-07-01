musicbox_control()
{
    echo "$1" > /tmp/musicbox.fifo
}

cmus_control()
{
    if [ "$1" = "next" ]; then
        cmus-remote -n
    elif [ "$1" = "prev" ]; then
        cmus-remote -r
    else
        echo "invalid input"
    fi
}

cmus_notify()
{
    song=`cmus-remote -Q | grep file | sed -r "s/.+\/(.+)\..+/\1/"`
    notify-send "$song"
}


if  pgrep "musicbox" > /dev/null ; then
    musicbox_control $1
elif  pgrep -x "cmus" > /dev/null ; then
    cmus_control $1
    cmus_notify
else
    echo "nothing is running"
fi
