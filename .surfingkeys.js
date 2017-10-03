mapkey('<Ctrl-f>','open hint with mpv-server',mpv);

unmap('<Ctrl-i>');
unmap('q');


map('J','gT');
map('K','gt');
map('q','x');
map('<Space>`', 'T');
map('<Ctrl-e>','d');
map('<Ctrl-u>','e');
map('<Ctrl-s>','/');
map('<Space>a','gx0');
map('<Space>e','gx$');
map('H', 'S');
map('L', 'D');
map('K', 'R');
map('J', 'E');

settings.hintAlign = "left";
settings.tabsThreshold = 0;
settings.richHintsForKeystroke = 0;
settings.focusFirstCandidate = true;
settings.modeAfterYank = "Normal";

settings.theme = `
    #sk_status, #sk_find , #sk_omnibar {
	font-size: 11pt;
    }
`;


function mpv() {
    Hints.create ('*[href]',function(element) {
	var link = encodeURIComponent (element.href);
	httpRequest({url: 'http://127.0.0.1:3111'+ '/play/' + link, json: false},
		    function(res) { console.log(res.text); });

    })
}
