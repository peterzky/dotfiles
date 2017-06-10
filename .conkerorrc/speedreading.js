
interactive("speed-reading",
	    "speed reading using squirt",
	    function(I){
		let bm = "javascript:(function(){sq=window.sq=window.sq||{};if(sq.script){sq.again();}else{sq.bookmarkletVersion='0.3.0';sq.iframeQueryParams={host:'//squirt.io',userId:'5a927f5e-4366-4843-a2a6-b57defa0c14d',};sq.script=document.createElement('script');sq.script.src=sq.iframeQueryParams.host+'/bookmarklet/frame.outer.js';document.body.appendChild(sq.script);}})();";
		load_url_in_current_buffer(bm,I.window);
	    });

define_key(content_buffer_normal_keymap, "C-x r", "speed-reading");
