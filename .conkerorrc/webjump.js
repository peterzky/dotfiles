//define webjump
define_webjump("youtube","https://www.youtube.com/results?search_query=%s");
define_webjump("archwiki","https://wiki.archlinux.org/index.php?search=%s");
define_webjump("emacswiki",
    "https://startpage.com/do/search?cat=web&cmd=process_search&" +
    "language=english&engine0=v1all&query=%s%20site%3Aemacswiki.org&abp=-1",
	       $alternative="http://www.emacswiki.org/");
define_webjump("orgmode-worg",
    "https://www.google.com/cse?cx=002987994228320350715%3Az4glpcrritm&q=%s" +
    "&sa=Search&siteurl=orgmode.org%2Fworg",
    $alternative="http://orgmode.org/worg/");
define_webjump("youdao", "http://www.youdao.com/w/eng/%s");
define_webjump("collins", "http://collinsdictionary.com/dictionary/english/%s");



//webjump alias
webjumps.g = webjumps.google;

// selection searches
function create_selection_search(webjump, key) {
    interactive(webjump+"-selection-search",
                "Search " + webjump + " with selection contents",
                "find-url-new-buffer",
                $browser_object = function (I) {
                    return webjump + " " + I.buffer.top_frame.getSelection();});
    define_key(content_buffer_normal_keymap, key, webjump + "-selection-search");
}

create_selection_search("youdao", "w");
create_selection_search("collins", "W");
create_selection_search("g", "C-c g");
