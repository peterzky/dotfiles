# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# [Global modemap] Change modifier keys as in xmodmap
# define_modmap({
#     Key.RIGHT_ALT: Key.RIGHT_META,
#     Key.LEFT_CTRL: Key.CAPSLOCK
# })

# [Conditional modmap] Change modifier keys in certain applications
# define_conditional_modmap(re.compile(r'Emacs'), {
#     Key.RIGHT_CTRL: Key.ESC,
# })

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap({
    Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
    # Key.BACKSLASH: [Key.BACKSLASH, Key.RIGHT_META],
    # Key.TAB: [Key.TAB, Key.LEFT_META]
})

# Keybindings for Firefox/Chrome
define_keymap(
    re.compile("Firefox|Google-chrome"),
    {
        # Type C-j to focus to the content
        K("C-j"): K("C-f6")
        # K("C-c"): {
        # }
    },
    "Firefox and Chrome")

# Keybindings for Zeal https://github.com/zealdocs/zeal/
define_keymap(
    re.compile("Zeal"),
    {
        # Ctrl+s to focus search area
        K("C-s"): K("C-k"),
    },
    "Zeal")
# Keybindings for st terminal
define_keymap(
    re.compile("st-256color"), {
        K("M-w"): K("C-Shift-c"),
        K("C-y"): K("C-Shift-v"),
        K("M-v"): K("Shift-page_up"),
        K("C-v"): K("Shift-page_down")
    })

# Emacs-like keybindings in non-Emacs applications
define_keymap(
    lambda wm_class: wm_class not in ("Emacs", "Alacritty", "URxvt", "st-256color", "VirtualBox Machine", "fcitx", "Rofi"),
    {
        # Cursor
        K("C-b"): with_mark(K("left")),
        K("C-f"): with_mark(K("right")),
        K("C-p"): with_mark(K("up")),
        K("C-n"): with_mark(K("down")),
        K("C-h"): with_mark(K("backspace")),
        # Forward/Backward word
        K("M-b"): with_mark(K("C-left")),
        K("M-f"): with_mark(K("C-right")),
        # Beginning/End of line
        K("C-a"): with_mark(K("home")),
        K("C-e"): with_mark(K("end")),
        # Page up/down
        K("M-v"): with_mark(K("page_up")),
        K("C-v"): with_mark(K("page_down")),
        # Beginning/End of file
        K("M-Shift-comma"): with_mark(K("C-home")),
        K("M-Shift-dot"): with_mark(K("C-end")),
        # Newline
        K("C-m"): K("enter"),
        K("C-j"): K("enter"),
        K("C-o"): [K("enter"), K("left")],
        # Copy
        K("C-w"): [K("C-x"), set_mark(False)],
        K("M-w"): [K("C-c"), set_mark(False)],
        K("C-y"): [K("C-v"), set_mark(False)],
        # Delete
        K("C-d"): [K("delete"), set_mark(False)],
        K("M-d"): [K("C-delete"), set_mark(False)],
        # Kill line
        K("C-k"): [K("Shift-end"), K("C-x"),
                   set_mark(False)],
        # Undo
        K("C-slash"): [K("C-z"), set_mark(False)],
        K("C-Shift-ro"): K("C-z"),
        # Mark
        K("C-space"): set_mark(True),
        K("C-M-space"): with_or_set_mark(K("C-right")),
        # Search
        K("C-s"): K("F3"),
        K("C-r"): K("Shift-F3"),
        K("M-Shift-key_5"): K("C-h"),
        # Cancel
        K("C-g"): [K("esc"), set_mark(False)],
        # Escape
        K("C-q"): escape_next_key,
        # C-x YYY
        K("C-x"): {
            # C-x h (select all)
            K("h"): [K("C-home"), K("C-a"),
                     set_mark(True)],
            # C-x C-f (open)
            K("C-f"): K("C-o"),
            # C-x C-s (save)
            K("C-s"): K("C-s"),
            # C-x k (kill tab)
            K("k"): K("C-f4"),
            # C-x C-c (exit)
            K("C-c"): K("C-q"),
            # cancel
            K("C-g"): pass_through_key,
            # C-x u (undo)
            K("u"): [K("C-z"), set_mark(False)],
        },
        K("C-c"): {
            K("c"):
            K("Super-c"),
            K("a"):
            K("Super-z"),
            # org store link only works in firefox
            K("l"): [K("SEMICOLON"), K("o")],
            K("c"): [K("SEMICOLON"), K("l")],
            K("C-c"): [K("SEMICOLON"), K("L")]
        }
    },
    "Emacs-like keys")
