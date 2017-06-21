// require("new-tabs.js");

homepage = "http://en.wikipedia.org/wiki/Special:Random";

require("user-agent-policy");

// only in reverse image search use firefox angent
user_agent_policy.define_policy("default",
    user_agent_firefox(),
    "images.google.com",
    build_url_regexp($domain = /(.*\.)?google/, $path = /images|search\?tbs=sbi/),
				"plus.google.com");

browser_relationship_patterns[RELATIONSHIP_NEXT]
    .push(new RegExp("\s*下一页|下一頁|下一章|下一张|下一篇|下页|后页\s*"));

browser_relationship_patterns[RELATIONSHIP_PREVIOUS]
    .push(new RegExp("\s*下一页|下一頁|下一章|下一张|下一篇|下页|后页\s*"));

view_source_use_external_editor = true;
url_completion_use_history = true;
minibuffer_auto_complete_default = true;
isearch_scroll_center_vertically = true;

// url_remoting_fn = load_url_in_new_buffer;

// user preference
// auto proxy workaround
user_pref("extensions.autoproxy.proxyMode", "auto");
// full screen
// user_pref('full-screen-api.enabled', true);
user_pref('general-smoothScroll', true);
user_pref('webgl.prefer-native-gl', true);
user_pref('layers.offmainthreadcomposition.animate-opacity', true);
user_pref('layers.offmainthreadcomposition.animate-transform', true);
// https://wiki.mozilla.org/Blocklisting/Blocked_Graphics_Drivers#Intel_cards
user_pref('layers.acceleration.force-enabled', true);
user_pref('webgl.force-enabled', true);
user_pref('webgl.msaa-force', true);
user_pref('gfx.filter.nearest.force-enabled', true);
// H264
user_pref('stagefright.force-enabled', true);

// mode line
remove_hook("mode_line_hook", mode_line_adder(clock_widget));
// add_hook("mode_line_hook", mode_line_adder(autoproxy_mode_line_widget));
add_hook("mode_line_hook", mode_line_adder(buffer_count_widget), true);

require("clicks-in-new-buffer.js");
clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND;

// downloads
function update_save_path (info) {
    cwd = info.target_file.parent;
}
add_hook("download_added_hook", update_save_path);

remove_hook("download_added_hook", open_download_buffer_automatically);

// mode_line_mode(false);

// require("new-tabs.js");

// sheet.appendRelativePath(".conkerorrc/style.css");
theme_load_paths.unshift("~/.conkerorrc/themes/");
theme_unload("default");
theme_load("gruvbox-dark-soft");
