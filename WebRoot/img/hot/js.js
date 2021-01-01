function Maxz_LoadImg(w,h){
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="object_flash_player" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0"  width="'+w+'" height="'+h+'"><param name="movie" value="img/hot/pic.swf"><param name="quality" value="high"><param name="allowScriptAccess" value="always"><param name="allowFullScreen" value="true"><param name="FlashVars" value="bcastr_xml_url=img/hot/pic.xml"><embed src="img/hot/pic.swf" flashvars="bcastr_xml_url=img/hot/pic.xml" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" allowfullscreen="true" width="'+w+'" height="'+h+'"></object>');
}
function selectTag(showContent,selfObj){
var tag = document.getElementById("tags").getElementsByTagName("li");
var taglength = tag.length;
for(i=0; i<taglength; i++){
tag[i].className = "";
}
selfObj.parentNode.className = "selectTag";
for(i=0; j=document.getElementById("tagContent"+i); i++){
j.style.display = "none";
}
document.getElementById(showContent).style.display = "block";
}