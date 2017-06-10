// focus
require("block-content-focus-change.js");
function focusblock (buffer) {
    var s = Components.utils.Sandbox(buffer.top_frame);
    s.document = buffer.document.wrappedJSObject;
    Components.utils.evalInSandbox(
        "(function () {\
            function nothing () {}\
            if (! document.forms)\
                return;\
            for (var i = 0, nforms = document.forms.length; i < nforms; i++) {\
              for (var j = 0, nels = document.forms[i].elements.length; j < nels; j++)\
                document.forms[i].elements[j].focus = nothing;\
            }\
          })();",
        s);
}
add_hook('content_buffer_progress_change_hook', focusblock);

// page_mode_deactivate(youtube_mode);
// page_mode_deactivate(youtube_player_mode);

require("key-kill");
key_kill_mode.test.push(build_url_regexp($domain = "github"));
key_kill_mode.test.push(build_url_regexp($domain = "youtube"));

// add favicons
require("favicon");
add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true);
read_buffer_show_icons = true;


interactive("switch-to-other-buffer",
            "Switch to the previously open buffer",
            function (I) {
                var blist = I.window.buffers.buffer_list;
                if (blist.length > 1)
                    switch_to_buffer(I.window, blist[1]);
            });

// mpv
function mpv_player (url,window) {
    var cmd_str = 'go_mpv '+'\"'+ url + '\"';
    if (window != null) {
        window.minibuffer.message('Issuing ' + cmd_str);
    }
   shell_command_blind(cmd_str);
}

interactive("go-mpv",
          "play current url using mpv player",
        function (I) {
      mpv_player(I.buffer.display_uri_string,I.window);
});

interactive("go-mpv-hint",
          "play hint url using mpv player",
        function (I) {
        var link = yield read_browser_object(I);
      mpv_player(link,I.window);
},$browser_object = browser_object_links);

define_key(content_buffer_normal_keymap, "C-c p", "go-mpv-hint");

// google image search
function reverse_image_search (url) {
    var search_str = 'https://www.google.com/searchbyimage?&image_url=' + encodeURIComponent(url);
    return search_str
}

interactive("image-search-hint",
            "search google image with hinted url",
	    function (I) {
		img_url = yield read_browser_object(I)
		load_url_in_new_buffer(reverse_image_search(img_url.src),I.window);
	    },$browser_object = browser_object_images);

define_key(content_buffer_normal_keymap, "g r", "image-search-hint")

//org-protocol

function org_store_link (url, title, window) {
    var cmd_str = 'emacsclient \"org-protocol://store-link?url='+url+'&title='+title+'"';
    if (window != null) {
        window.minibuffer.message('Issuing ' + cmd_str);
    }
    shell_command_blind(cmd_str);
}

function org_capture (url, title, selection, window) {
    var cmd_str = 'emacsclient \"org-protocol://capture?template=x&url='
	+url+'&title='+title+'&body='+selection+'\"';
    if (window != null) {
        window.minibuffer.message('Issuing ' + cmd_str);
    }
    shell_command_blind(cmd_str);
}


function org_capture_word (selection, window) {
    var cmd_str = 'emacsclient \"org-protocol://vocabulary?word=' + selection +'\"';
    if (window != null) {
        window.minibuffer.message('Issuing ' + cmd_str);
    }
    shell_command_blind(cmd_str);
}

interactive("org-store-link",
          "Stores [[url][title]] as org link and copies url to emacs kill ring",
            function (I) {
                org_store_link(encodeURIComponent(I.buffer.display_uri_string),
                encodeURIComponent(I.buffer.document.title),
                I.window);
           });

interactive("org-capture",
         "Clip url, title, and selection to capture via org-protocol",
            function (I) {
                org_capture(encodeURIComponent(I.buffer.display_uri_string),
                encodeURIComponent(I.buffer.document.title),
                encodeURIComponent(I.buffer.top_frame.getSelection()), I.window);
            });


interactive("org-capture-word",
         "Clip url, title, and selection to capture via org-protocol",
            function (I) {
                org_capture_word(encodeURIComponent(I.buffer.top_frame.getSelection()), I.window);
            });

define_key(content_buffer_normal_keymap, "C-c r", "org-capture");
define_key(content_buffer_normal_keymap, "C-c l", "org-store-link");
define_key(content_buffer_normal_keymap, "C-c w", "org-capture-word");

// switch buffers
function define_switch_buffer_key (key, buf_num) {
    define_key(default_global_keymap, key,
               function (I) {
		   let b = I.window.buffers.get_buffer(buf_num);
		   if (b == null) {
		       load_url_in_new_buffer(homepage, I.window);
		   } else {
                   switch_to_buffer(I.window,b);
		   }
               });
}
for (let i = 0; i < 10; ++i) {
    define_switch_buffer_key(String((i+1)%10), i);
}

// history
interactive("browse-buffer-history",
            "Browse the session history for the current buffer",
            function browse_buffer_history (I) {
                var b = check_buffer(I.buffer, content_buffer);
                var history = b.web_navigation.sessionHistory;

                if (history.count > 1) {
                    var entries = [];

                    for(var i = 0 ; i < history.count ; i += 1) {
                        entries[i] = history.getEntryAtIndex(i, false).URI.spec;
                    }

                    var url = yield I.minibuffer.read(
                        $prompt = "Go back or forward to:",
                        $completer = new all_word_completer($completions = entries),
                        $default_completion = history.index > 0 ? entries[history.index - 1] : entries[history.index + 1],
                        $auto_complete = "url",
                        $auto_complete_initial = true,
                        $auto_complete_delay = 0,
                        $require_match = true);

                    b.web_navigation.gotoIndex(entries.indexOf(url));
                } else {
                    I.window.minibuffer.message("No history");
                }
            });

define_key(content_buffer_normal_keymap, "C-c h","browse-buffer-history");

define_key(content_buffer_normal_keymap, "u", "revive-buffer");

var kill_buffer_original = kill_buffer_original || kill_buffer;

var killed_buffer_urls = [];
var killed_buffer_histories = [];

//  remember_killed_buffer
kill_buffer = function (buffer, force) {
    var hist = buffer.web_navigation.sessionHistory;

    if (buffer.display_uri_string && hist) {
        killed_buffer_histories.push(hist);
        killed_buffer_urls.push(buffer.display_uri_string);
    }

    kill_buffer_original(buffer,force);
};

interactive("revive-buffer",
    "Loads url from a previously killed buffer",
    function restore_killed_buffer (I) {
        if (killed_buffer_urls.length !== 0) {
            var url = yield I.minibuffer.read(
                $prompt = "Restore killed url:",
                $completer = new all_word_completer($completions = killed_buffer_urls),
                $default_completion = killed_buffer_urls[killed_buffer_urls.length - 1],
                $auto_complete = "url",
                $auto_complete_initial = true,
                $auto_complete_delay = 0,
                $require_match = true);

            var window = I.window;
            var creator = buffer_creator(content_buffer);
            var idx = killed_buffer_urls.indexOf(url);

            // Create the buffer
            var buf = creator(window, null);

            // Recover the history
            buf.web_navigation.sessionHistory = killed_buffer_histories[idx];

            // This line may seem redundant, but it's necessary.
            var original_index = buf.web_navigation.sessionHistory.index;
            buf.web_navigation.gotoIndex(original_index);

            // Focus the new tab
            window.buffers.current = buf;

            // Remove revived from cemitery
            killed_buffer_urls.splice(idx,1);
            killed_buffer_histories.splice(idx,1);
        } else {
            I.window.minibuffer.message("No killed buffer urls");
        }
    });
