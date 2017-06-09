define_hook("proxy_mode_hook");

interactive("proxy-auto",
	    "set autoproxy to auto mode",
	    function (I) {
		user_pref("extensions.autoproxy.proxyMode", "auto");
		I.window.minibuffer.message("Autoproxy auto mode enabled");
		// run_hooks("proxy_mode_hook");
	    });

interactive("proxy-global",
	    "set autoproxy to auto mode",
	    function (I) {
		user_pref("extensions.autoproxy.proxyMode", "global");
		I.window.minibuffer.message("Autoproxy global mode enabled");
		// run_hooks("proxy_mode_hook");
	    });

define_key(content_buffer_normal_keymap, "C-x g", "proxy-global");
define_key(content_buffer_normal_keymap, "C-x a", "proxy-auto");

// mode line


// function autoproxy_mode_line_widget (window) {
//     this.class_name = "autoproxy_mode_line_widget";
//     this.add_hook("proxy_mode_hook");
//     test_widget.call(this, window);
// }

// autoproxy_mode_line_widget.prototype.__proto__ = text_widget.prototype;
// autoproxy_mode_line_widget.prototype.update = function () {
//     this.view.text = get_pref("extensions.autoproxy.proxyMode");
// };
