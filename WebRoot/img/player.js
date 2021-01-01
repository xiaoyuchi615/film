// player.js
// flash use standalone player
// copyright by oursky.net, all rights reserved.

if (typeof self.playImmediately == 'undefined')
	self.playImmediately = is.ie5 ? true : false;

function InsertFlash(flash,width,height,title) {
	var p = new Player(true);
	p.force('flash');
	p.setSrc(flash);
	if (width && height) p.setSize(width, height);
	p.place();
}

var InsertDcr = InsertFlash;

function InsertPlayer(params) {
	params = ',' + (params||'').toLowerCase() + ',';
	var player = new Player();
	if (params.indexOf(',media,')      != -1) { player.force('media'); }
	else if (params.indexOf(',flash,') != -1) { player.force('flash'); }
	else if (params.indexOf(',real,')  != -1) { player.force('real');  }
	else if (params.indexOf(',qt,')    != -1) { player.force('qt');    }

	player.place();
}

function InsertMedia(src, title, video) {
	if (!lastplayer||lastplayer.standalone) {
		if (playImmediately) {
			new Player();
			lastplayer.setSrc(src)
			lastplayer.showVideo = video;
			lastplayer.place();
			lastplayer.play();
			if (!__curplayer) __curplayer = lastplayer
			document.write(lastplayer.link(src, title, video));

			__cur_medialink = document.getElementById('medialink_0');
			if (__cur_medialink) {
				__cur_medialink.style.fontWeight = 'bold';
			}
			return;
		}

		new Player();
		if (is.ie5) {
			lastplayer.playerHandler = lastplayer.mediaPlayer();
			lastplayer.playerHandler.parent = lastplayer;
		}
		lastplayer.place();
	}
	// src, caption, showVideo, attr
	document.write(lastplayer.link(src, title, video));
}
function InsertMusic(src,title) { InsertMedia(src, title, false); }
function InsertVoice(src,title) { InsertMedia(src, title, false); }
function InsertMovie(src,title) { InsertMedia(src, title, true ); }

var __playerid = 0;
var __curplayer = null;
var __cur_medialink = null;
var __medialinkcount = 0;

var players = [];
var lastplayer = null;

function Player(standalone) {
	this.h = 0;
	this.w = 0;
	this.showVideo = false;
	this.showStatus = false;
	this.showControls = true;
	this.standalone = standalone;
	this.autostart = false;
	this.src = "";
	this.forcePlayer = null;
	this.playerHandler = null;

	this.uniqid = (++__playerid);
	this.borderid = "playerBorder_" + this.uniqid;
	this.borderdoc = null;
	this.objid = "playerBody_" + this.uniqid;
	this.doc = null;

	this.events = [];

	players[this.uniqid] = this; // register myself to players' list
	if (!this.standalone) lastplayer = this;
}

Player.prototype.detectClsid = function (clsids) {
	for (var objname in clsids) {
		try {
			var obj = new ActiveXObject(objname);
			return clsids[objname];
		} catch(e) {
		}
	}
}

Player.prototype.attachEvent = function(event, callback) {
	this.events[event] = callback;
}
// helper to build hyper link
Player.prototype.link = function(src, caption, showVideo, attr) {
	attr = attr||"";
	caption = caption||src;

	if (is.cht) caption = caption||((!showVideo?"音樂":"電影"));
	else caption = caption||((!showVideo?"音乐":"电影"));

	var id = "medialink_" + __medialinkcount++;

	if (!playImmediately && __medialinkcount == 1) {
		// setTimeout('try{document.getElementById("'+id+'").click()}catch(e){}', 2000);
		var _this = this;
		setTimeout(function() {
			_this.goAndPlay(document.getElementById(id), showVideo)
		} , 2000);
	}
	return '<a href="'+src.htmlencode()+'" src="'+src.htmlencode()+'" id="'+id+'"' +
		' playerid="'+this.uniqid+'" showvideo="'+(showVideo?'1':'0')+'" onclick="players['+this.uniqid+'].goAndPlay(this, '+(showVideo?'true':'false')+');' +
		'return(false);" '+attr+'>'+caption+'</a>';
}
Player.prototype.gotoNextLink = function() {
	if (!__cur_medialink) return;
	var id = __cur_medialink.id; if (!id) return;
	id = parseInt(id.split("_")[1]);
	if (isNaN(id)) id = 0;
	id++;
	var lnk = document.getElementById('medialink_' + id);
	// if (lnk) lnk.click(); // this.goAndPlay(lnk);
	if (lnk) {
		var playerid = lnk.getAttribute('playerid') * 1;
		if (playerid && players[playerid]) {
			players[playerid].goAndPlay(lnk, Number(lnk.getAttribute('showvideo'))?true:false);
		}
		else {
			lnk.click();
		}
	}
}

Player.prototype.play = function() {
	return this.invokePlayerMethod('play');
}
Player.prototype.pause = function() {
	return this.invokePlayerMethod('pause');
}
Player.prototype.stop = function() {
	return this.invokePlayerMethod('stop');
}

Player.prototype.invokePlayerMethod = function(m) {
	if (!this.doc) return;
	if (typeof this.playerHandler[m] == 'string') {
		var method = this.playerHandler[m];
		var doc = this.doc;
		if (!doc) return false;
		try {
			return eval("this.doc." + method + "()");
		} catch(e) {
			return false;
		}
	}
	else if (typeof this.playerHandler[m] != 'undefined') {
		return this.playerHandler[m]();
	}
}

Player.prototype.goAndPlay = function(src, showVideo) {
	try{
		SS.browser.setStatus('');
		if (typeof showVideo != 'undefined') this.showVideo = showVideo;
		this.setSrc(src);
		if (!this.autostart) this.play();
	}catch(e){
		SS.browser.setStatus(e.description||e.message);
	}
}

Player.prototype.setSrc = function(src) {
	var obj = null;
	if (typeof src == "object") { obj = src; src = src.src||src.href; }
	if (!src) return; // alert('setSrc() src error');

	this.src = src;

	// maintain link
	if (__cur_medialink) { __cur_medialink.style.fontWeight = "normal"; }
	if (obj) { obj.style.fontWeight = "bold"; }
	__cur_medialink = obj;

	if (!this.borderdoc) return; // not placed

	var newHandler = this.getPlayer(); // detect player

	// 互斥
	if (__curplayer && __curplayer != this && !__curplayer.standalone) {
		// deattach player
		__curplayer.borderdoc.removeChild(__curplayer.doc);

		// same?
		if (__curplayer.playerHandler.name == newHandler.name) {
			// reuse player object
			this.borderdoc.removeChild(this.doc);
			this.doc = __curplayer.doc;
			this.borderdoc.appendChild(this.doc);
			this.playerHandler = newHandler;
			this.playerHandler.parent = this;
		}

		// overwrite old player
		__curplayer.playerHandler = __curplayer.noPlayer()
		__curplayer.replace();
	}
	__curplayer = this;

	if (this.playerHandler && this.playerHandler.name == newHandler.name) {
		switch (newHandler.name) {
		case 'media':
			if (this.doc.URL) {
				this.doc.URL = this.src;
			}
			else {
				this.doc.FileName = this.src;
			}
			if (!this.autostart) {
				this.play();
			}
			break;

		case 'real':
		case 'realmovie':
			this.stop();
			this.doc.SetAutoStart(true);
			this.doc.SetSource(this.src);
			this.play();
			this.doc.SetAutoStart(this.autostart);
			break;

		default:
			this.playerHandler = newHandler;
			this.playerHandler.parent = this;
			this.replace();
			this.play();
		}
	}
	else {
		this.playerHandler = newHandler;
		this.playerHandler.parent = this;
		this.replace();
		// this.play();
	}
	this.trackClipSize();
	this.trackProgresss();
	if (this.onInitize) this.onInitize();
}
Player.prototype.replace = function() {
	this.borderdoc.innerHTML = this.playerHandler.html; // get html code
	this.attachObject();
}
Player.prototype.attachObject = function() {
	this.doc = document.getElementById(this.objid + '_embed') ||
		document.getElementById(this.objid); // re-attach object
	if (!this.doc) {
		throw Error("您尚未安装 " + this.playerHandler.name + " 播放器, 或者版本不够, 或者您的浏览器禁止了相关 ActiveX/插件");
	}
	else if (this.doc.filename) {
		this.doc.filename = this.doc.filename;
	}
}
Player.prototype.getSrc = function() { return this.src; }
Player.prototype.setSize = function(w, h) {
	this.w = w; this.h = h;
	this.sized = true;
}

Player.prototype.place = function() {
	if (this.doc) return; // placed
	if (this.playerHandler)  {
	}
	else if (this.standalone || this.uniqid == 1) {
		// standalone or firstplayer
		this.playerHandler = this.getPlayer();
		this.playerHandler.parent = this;
	}
	else {
		this.playerHandler = this.noPlayer();
		this.playerHandler.parent = this;
	}

	document.write('<div id="'+this.borderid+'">' + this.playerHandler.html + '</div>');
	this.borderdoc = document.getElementById(this.borderid);

	this.attachObject();

	this.trackClipSize();
	this.trackProgresss();
	if (this.onInitize) this.onInitize();
}

Player.prototype.force = function(type) {
	switch ((type||'').toLowerCase()) {
	case 'media': this.forcePlayer = this.mediaPlayer; break;
	case 'flash': this.forcePlayer = this.flashPlayer; break;
	case 'real':  this.forcePlayer = this.realPlayer; break;
	case 'qt':    this.forcePlayer = this.qtPlayer; break;
	case 'auto':  this.forcePlayer = null; break;
	default:      throw('undefined type:' + type);
	}
	this.forceType = type;
}
////////////// detect player
Player.prototype.getPlayer = function() {
	// sometimes, we'd like to specify a player, not autodetect
	if (this.forcePlayer !== null) return this.forcePlayer();

	if (!this.src) return this.noPlayer(); // throw("filename of player"+this.uniqid+" not initized");

	var protocol = this.src.split(":/")[0];
	if (!protocol) return this.noPlayer(); // throw("protocol of player"+this.uniqid+" not Unknown");

	var protocols = [
		[ this.realPlayer,	'rtsp,pnm' ],
		[ this.mediaPlayer,	'mms' ],
	];
	for (var i in protocols) {
		if ( (","+protocols[i][1]+",").indexOf(protocol) != -1 ) {
			this.tmpfunc = protocols[i][0];
			var result = this.tmpfunc();
			delete(this.tmpfunc);
			return result;
		}
	}

	var filename = this.getFilename();
	var exts = [
		[ this.flashPlayer,	/\.(swf|flv|dcr|dir|dxr)$/i ],
		[ this.realPlayer,	/\.(rm|rmvb|rv|ra|ram|rpm|rp|smi|smil|sdp)$/i ],
		[ this.qtPlayer,	/\.(mov)$/ ],
		[ this.mediaPlayer,	/\.(mpeg|mpg|asf|wma)$/i ],
	];

	for (var i in exts) {
		if (exts[i][1].test(filename)) {
			this.tmpfunc = exts[i][0];
			var result = this.tmpfunc();
			delete(this.tmpfunc);
			return result;
		}
	}

	return this.mediaPlayer();
}

Player.prototype.getFilename = function() {
	return this.src.replace(/\.(aspx?|php|pl|cgi|py)\?/gi, '').split("?")[0];
}

////////////////////// players
Player.prototype.flashPlayer = function() {
	var fixsize = (this.w&&this.h)?"1":"0";
	var w = this.w?' width="'+this.w+'"':' width="550"';
	var h = this.h?' height="'+this.h+'"':' height="400"';

	var hsrc = this.src.htmlencode();

	var filename = this.getFilename();
	if (/\.(dcr|dir|dxr)$/i.test(filename)) {
		return {
			name: 'dcr',
			html: '<object classid="clsid:166B1BCA-3F9C-11CF-8075-444553540000"' +
			'	codebase="http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab"'+
			'	fixsize="'+fixsize+'" id="'+this.objid+'" '+w+h+' align="middle">' +
			'<param name="src" value="'+hsrc+'" />' +
			'</object>'
		};
	}

	var shareImgUrl = (self.imgurl||'http://img.oursky.net') + '/!/';
	var vars = null;
	if (/\.(flv)$/i.test(filename)) {
		vars = {
			'vcastr_file' : this.src,
			'IsAutoPlay' : 1,
			'BufferTime' : 10,
			'BarColor' : '0x99B8E6',
			'BarTransparent' : 35,
			'LogoText' : self.sitedomain
		};
		hsrc = shareImgUrl + 'flv.swf';
	}

	if (vars) {
		vars = urlencode(vars).htmlencode();
	}
	return {
		name: 'flash',
		html: '<object fixsize="'+fixsize+'" id="'+this.objid+'" '+w+h+' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' +
		' codebase="' + shareImgUrl + 'swflash.cab#version=6,0,40,0">' +
		'<param name="movie" value="'+hsrc+'">' +
		'<param name="quality" value="high">' +
		'<param name="AllowScriptAccess" value="never">' +
		(vars ? '<param name="FlashVars" value="' + vars + '">' : '') +
		'<embed fixsize="'+fixsize+'" id="'+this.objid+'_embed" name="'+this.objid+'" '+w+h+' src="'+hsrc+'" quality="high"' +
		' AllowScriptAccess="never"' +
		(vars ? 'FlashVars="' + vars + '"' : '') +
		' pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"' +
		' type="application/x-shockwave-flash"></embed>' +
		'</object>'
	};
}

Player.prototype.noPlayer = function() {
	var t = '播放器位置';
	return { name: 'no', html: '<span id='+this.objid+'>['+t+']</span>' };
}

Player.prototype.mediaPlayer = function() {
	var size = this.showVideo ? "" : "width=286 height=43";
	var astart = this.autostart?'1':'0';
	var scontr = this.showControls?'1':'0';
	var clsids = {
		'WMPlayer.OCX.7' : '6BF52A52-394A-11d3-B153-00C04F79FAA6',
		'MediaPlayer.MediaPlayer' : '22D6F312-B0F6-11D0-94AB-0080C74C7E95',
		'ActiveMovie' : '05589FA1-C356-11CE-BF01-00AA0055595A'
	};
	var clsid = this.detectClsid(clsids) || clsids['WMPlayer.OCX.7'];

	return {
		name: 'media',
		play: 'controls.play',
		pause: 'controls.pause',
		stop: 'controls.stop',
		html: ' \
		<object classid="clsid:'+ clsid +'" id='+this.objid+' \
		codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" \
		standby="正在载入 Windows Media Player..." \
		TYPE="application/x-oleobject" '+size+' \
		> \
		<param name="URL" value="' + this.src.htmlencode() + '"> \
		<param name="invokeURLs" value="0"> \
		<param name="FileName" value="' + this.src.htmlencode() + '"> \
		<param name="AnimationatStart" value="true"> \
		<param name="TransparentatStart" value="false"> \
		<param name="AutoStart" value="'+astart+'"> \
		<param name="ShowControls" value="'+scontr+'"> \
		<param name="stretchToFit" value="0"> \
		<embed '+ size +' type="application/x-mplayer2" \
			pluginspage="http://www.microsoft.com/windows95/downloads/contents/wurecommended/s_wufeatured/mediaplayer/default.asp" \
			src="' + this.src.htmlencode() + '" \
			id="'+this.objid+'_embed" \
			showcontrols="'+scontr+'" \
			invokeURLs="0" \
			autostart="'+astart+'"> \
		</embed> \
		</object> \
	'};
}

Player.prototype.getClipSize = function() {
	if (!this.doc || !this.playerHandler) return 0;
	switch (this.playerHandler.name) {
	case 'media':
		try{
			var src = this.doc.currentMedia.sourceURL;
			if (this.src != src) {
				this.src = this.doc.URL = src;
			}
		}catch(e){}
		try {
			return {w:this.doc.currentMedia.imageSourceWidth,
					h:this.doc.currentMedia.imageSourceHeight + 65};
		}catch (e){}
		break;

	case 'flash':
		if (parseInt(this.doc.getAttribute('fixsize'))) {
			try {
				var w = parseInt(this.doc.getAttribute("width"));
				var h = parseInt(this.doc.getAttribute("height"));

				return { w: w, h: h };
			}
			catch(e) {
				return null;
			}
		}

		try {
			var w = parseInt(this.doc.GetVariable("Stage.width"));
			var h = parseInt(this.doc.GetVariable("Stage.height"));

			if (w < 5 || h < 5 || w == 72 || h == 72) return null;

			return { w: w, h: h };
		}
		catch(e) {
			return null;
		}
		break;

	case 'realmovie':
		try {
			return {
				w: this.doc.GetClipWidth(),
				h: this.doc.GetClipHeight()
			};
		}
		catch(e) {
			return null;
		}
	}
}

Player.prototype.trackClipSize = function(done) {
	if (!this.showVideo&&this.playerHandler.name != 'flash') return;
	if (!done) done = 0;
	var clipsize = this.getClipSize();
	if (typeof clipsize == 'undefined') return;
	if (clipsize !== null && clipsize.w) {
		if (this.doc.width != clipsize.w || this.doc.height != clipsize.h) {
			this.doc.width = clipsize.w;
			this.doc.height = clipsize.h;

			// for realvideo control pannel
			var doc2 = document.getElementById(this.objid + '_2');
			if (doc2) doc2.width = clipsize.w;
		}
		done ++;
	}
	if (this.tmrTracker) {
		clearTimeout(this.tmrTracker);
	}
	var _this = this;
	this.tmrTracker = setTimeout(function(){_this.trackClipSize(done)}, done ? 1000 : 100);
}

Player.prototype.trackProgresss = function() {
	if (this.doc) {
		var percent = "";
		if (this.playerHandler.name == 'flash') {
			try {
				percent = this.doc.PercentLoaded();
			} catch (e) { }
		}
		// else if (this.playerHandler.name == 'meida' && this.doc.player.network) percent = this.doc.player.network.downloadProgress;

		try {
			if (percent == 100) {
				SS.browser.setStatus("正在播放" + " " + this.playerHandler.name||"");
				return;
			} else if (percent)
				SS.browser.setStatus(percent.toString()+"%");
		} catch(e) {
			e.send();
		}
	}
	if (this.tmrTrackProgress) clearTimeout(this.tmrTrackProgress);
	var _this = this;
	this.tmrTrackProgress = setTimeout(function(){_this.trackProgresss()}, 200);
}

Player.prototype.realPlayer = function() {
	var astart = this.autostart?'True':'false';

	if (!this.showVideo) {
		var controls = 'ControlPanel,StatusBar';
		var size = 'width="340" height="60"';

		return {
			name: 'real',
			play: 'DoPlay',
			pause: 'DoPause',
			stop: 'DoStop',
			html: ' \
			<object '+size+' id="'+this.objid+'" \
					classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA"> \
				<param name="SRC" value="'+this.src.htmlencode()+'"> \
				<param name="AUTOSTART" value="'+astart+'"> \
				<param name="AUTOGOTOURL" value="false"> \
				<param name="BACKGROUNDCOLOR" value=#000000> \
				<param name="controls" value="'+controls+'"> \
				<embed SRC="'+ this.src.htmlencode() +'" '+size+' id="'+this.objid+'_embed" \
					autogotourl="false" \
					controls="'+controls+'" \
					autostart="'+astart+'" \
					> \
				</embed> \
			</object> \
		'};

	}

	var w = this.w||427;
	var h = this.h||330;
	var controls1 = 'imagewindow';
	var size1 = 'width="'+w+'" height="'+(h-30)+'"';
	var controls2 = 'ControlPanel';
	var size2 = 'width="'+w+'" height="30"';

	var html =' \
		<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" '+size1+' id='+this.objid+'> \
		<param name="SRC" value="'+this.src.htmlencode()+'"> \
		<param name="AUTOSTART" value="'+astart+'"> \
		<param name="AUTOGOTOURL" value="false"> \
		<param name="BACKGROUNDCOLOR" value=#000000> \
		<param name="controls" value="'+controls1+'"> \
		<param name="CONSOLE" value="clip1"> \
		<embed id="'+this.objid+'_embed" SRC="'+ this.src.htmlencode() +'" '+size1+' controls="'+controls1+'" console="clip1" autostart="'+astart+'" \
			autogotourl="false" \
			> \
		</embed> \
		</object>';
	if (this.showControls)
	html += '<br> \
		<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" '+size2+' id='+this.objid+'_2> \
		<param name="SRC" value="'+this.src.htmlencode()+'"> \
		<param name="AUTOSTART" value="'+astart+'"> \
		<param name="AUTOGOTOURL" value="false"> \
		<param name="BACKGROUNDCOLOR" value=#000000> \
		<param name="controls" value="'+controls2+'"> \
		<param name="CONSOLE" value="clip1"> \
		<embed id='+this.objid+'_2_embed SRC="'+ this.src.htmlencode() +'" '+size2+' controls="'+controls2+'" console="clip1" autostart="'+astart+'" \
			autogotourl="false" \
			> \
		</embed> \
		</object> \
	';

	return {
		name: 'realmovie',
		play: 'DoPlay',
		pause: 'DoPause',
		stop: 'DoStop',
		html: html
	};
}
Player.prototype.qtPlayer = function(movie,id,audioOnly) {
	var w = this.w||480;
	var h = this.h||296;

	return {
		name: 'qt',
		html: ' \
		<embed id='+this.objid+' controller="false" href="'+this.src.htmlencode()+'" \
			target="myself" src="'+this.src.htmlencode()+'" bgcolor="000000" \
			width="'+w+'_embed" height="'+h+'" border="0" \
			pluginspage="http://www.apple.com/quicktime/download/indext.html"> \
		</embed> \
	'};
}

scriptscomplete['player'] = true;
