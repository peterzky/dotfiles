interactive(
    "ublock", "Open uBlock dashboard in a new buffer",
    function (I) {
        var ublock_branch;
        load_url_in_new_buffer("chrome://ublock0/content/dashboard.html");
    }
);
