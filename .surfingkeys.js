// -*- eval: (reopen-as-yadm); -*-
mapkey('<Space>pl','open hint with mpv',mpv);
mapkey('<Space>dl','open hint with youtube-dl',youtube);

unmap('<Ctrl-i>');
unmap('q');
iunmap('<Ctrl-f>');
iunmap('<Ctrl-a>');


map('J','gT');
map('K','gt');
map('q','x');
map('<Space>`', 'T');
map('<Ctrl-e>','d');
map('<Ctrl-u>','e');
map('<Ctrl-s>','/');
map('<Space>a','gx0');
map('<Space>e','gx$');
map('<Space>fd','oh')
map('H', 'S');
map('L', 'D');
map('K', 'R');
map('J', 'E');
map('u','X');

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
	var link = element.href;
	var xhr = new XMLHttpRequest();
	var data = JSON.stringify({"Url": link });
	xhr.open("POST","http://127.0.0.1:3111/mpv/",true);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(data);
    }
)}

function youtube() {
    Hints.create ('*[href]',function(element) {
	var link = element.href;
	var xhr = new XMLHttpRequest();
	var data = JSON.stringify({"Url": link });
	xhr.open("POST","http://127.0.0.1:3111/youtube-dl/",true);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(data);
    }
)}
