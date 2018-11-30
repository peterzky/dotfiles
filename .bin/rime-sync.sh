#! /usr/bin/env nix-shell
#! nix-shell -i bash -p librime
fcitx-remote -e
sleep 1
cd $HOME/.config/fcitx/rime
rime_dict_manager -s
sleep 1
# suppress error message
fcitx -r 2> /dev/null
