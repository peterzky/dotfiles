word=`xclip -out`
explain=`sdcv -n -u 朗道英汉字典5.0 ${word} | grep -v '\-\->' | grep -P '[\p{Han}]'`
notify-send "$explain"
