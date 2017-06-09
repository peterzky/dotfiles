undefine_key(content_buffer_normal_keymap, "t");
undefine_key(content_buffer_normal_keymap, "g");
undefine_key(content_buffer_normal_keymap, "o");
undefine_key(content_buffer_normal_keymap, "C-e");
undefine_key(content_buffer_normal_keymap, "C-y");
undefine_key(content_buffer_normal_keymap, "v");
undefine_key(content_buffer_anchor_keymap, "o");
undefine_key(content_buffer_anchor_keymap, "u");

define_key(content_buffer_normal_keymap, "s-x", "execute-extended-command");
define_key(content_buffer_normal_keymap, "j", "cmd_scrollLineDown");
define_key(content_buffer_normal_keymap, "k", "cmd_scrollLineUp");
define_key(content_buffer_normal_keymap, "h", "cmd_scrollLeft");
define_key(content_buffer_normal_keymap, "l", "cmd_scrollRight");
define_key(content_buffer_normal_keymap, "J", "buffer-previous");
define_key(content_buffer_normal_keymap, "K", "buffer-next");
define_key(content_buffer_normal_keymap, "H", "back");
define_key(content_buffer_normal_keymap, "L", "forward");
define_key(content_buffer_normal_keymap, "F", "follow-new-buffer");
define_key(content_buffer_normal_keymap, "C-x 4 f", "follow-new-window");
define_key(content_buffer_normal_keymap, "C-x 2", "make-window");
define_key(content_buffer_normal_keymap, "`", "switch-to-buffer");
define_key(content_buffer_normal_keymap, "o", "find-url");
define_key(content_buffer_normal_keymap, "g g", "scroll-top-left");
define_key(content_buffer_normal_keymap, "g i", "browser-focus-next-form-field");
define_key(content_buffer_normal_keymap, "G", "cmd_scrollBottom");
define_key(content_buffer_normal_keymap, "g y", "copy");
define_key(content_buffer_normal_keymap, "C-e", "cmd_scrollLineDown");
define_key(content_buffer_normal_keymap, "C-y", "cmd_scrollLineUp");
define_key(content_buffer_normal_keymap, "p", "paste-url");
define_key(content_buffer_normal_keymap, "t", "find-url-new-buffer");
define_key(content_buffer_normal_keymap, "g u", "up");
define_key(content_buffer_normal_keymap, "v", "caret-mode");
define_key(content_buffer_normal_keymap, "O", "find-alternate-url");
define_key(content_buffer_normal_keymap, "C-x C-k", "kill-other-buffers");

//copy and paste
// define_key(default_base_keymap, "s-c", "cmd_copy");
// define_key(default_base_keymap, "s-v", "yank");

define_key(minibuffer_keymap, "`", "minibuffer-abort");
define_key(minibuffer_keymap, "C-l", "cmd_deleteWordBackward");
