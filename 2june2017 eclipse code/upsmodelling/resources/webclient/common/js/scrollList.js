//$Id:
if(!window.console){
window.console={};
window.console.log=function(){};
}
var scrollTarget;
var scrollTimer;
var stopflag='T';
// id = which div to be scrolled, 
// dir = direction { 'L' => Left, 'R' => Right, 'U' => up , 'D' => Down}
// interval = time interval
// pixel = no. of pixel to be moved
// target total no. of pixels to be moved on a singel event
	function startScrollTab(id,dir,interval,pixel,target){
		if(id)
			scrollTarget=$(id);
		if( dir == 'L')
			scrollTarget.scrollLeft = scrollTarget.scrollLeft - (pixel||10);
		else if( dir == 'U')
			scrollTarget.scrollTop = scrollTarget.scrollTop - (pixel||10);
		else if( dir == 'R')
			scrollTarget.scrollLeft = scrollTarget.scrollLeft + (pixel||10);
		else if( dir == 'D')
			scrollTarget.scrollTop = scrollTarget.scrollTop + (pixel||10);
		target=target - pixel;
		if(scrollTimer)
			clearTimeout(scrollTimer);
		scrollTimer = setTimeout("startScrollTab('"+id+"','" +dir +"',"+interval+","+pixel+","+target+")",(interval||50));
		if(target &&(target <= 0)){
			stopScroll();
		}
	}
function stopScroll() {
	if(stopflag == 'F'){
		if(scrollTimer) {
			clearTimeout(scrollTimer);
		}
	}
}
function setScrollflag(value){
	stopflag =value;
}


function findPosX(obj) {
	var curleft = 0;
	if ($ || document.all) {
		while (obj.offsetParent) {
			curleft += obj.offsetLeft;
			obj = obj.offsetParent;
		}
	}
	else if (document.layers) {
		curleft += obj.x;
	}
	return curleft;
}

/**
 * Retruns the x position of the given object in the window / screen.
 */
function findPosY(obj) {
	var curtop = 0;
	if ($ || document.all) {
		while (obj.offsetParent) {
			curtop += obj.offsetTop;
			obj = obj.offsetParent;
		}
	} else if (document.layers) {
		curtop += obj.y;
	}
	return curtop;
}

/**
 * Retruns the object for the given element id and document object.
 */
function getObj(n,d) {
	var p,i,x;
	if(!d)
		d=document;

	if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
	}

	if(!(x=d[n])&&d.all){
		x=d.all[n];
	}

	for(i=0;!x&&i<d.forms.length;i++){
		x=d.forms[i][n];
	}

	for(i=0;!x&&d.layers&&i<d.layers.length;i++){
		x=getObj(n,d.layers[i].document);
	}

	if(!x && d.getElementById){
		x=d.getElementById(n);
	}
	return x;
}

function $(obj){
 return document.getElementById(obj);
}

function lave(obj){
	 try{
	return  new Function ('return '+obj+';')();
	}catch(Exception){
		return null;
	}
}

function get_cookie(name) {
  var arg = name + "=";  
  var alen = arg.length;  
  var clen = document.cookie.length;  
  var i = 0;  
  while (i < clen) {    
    var j = i + alen;    
    if (document.cookie.substring(i, j) == arg)      
      return get_cookie_val(j);    
    i = document.cookie.indexOf(" ", i) + 1;    
    if (i == 0) break;   
  }  
  return null;
}

function get_cookie_val(offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1)
    endstr = document.cookie.length;
  return unescape(document.cookie.substring(offset, endstr));
}

function set_cookie(name, value) {  
  var argv = set_cookie.arguments;  
  var argc = set_cookie.arguments.length;  
  var expires = (argc > 2) ? argv[2] : null;  
  var path = (argc > 3) ? argv[3] : null;  
  var domain = (argc > 4) ? argv[4] : null;  
  var secure = (argc > 5) ? argv[5] : false;  
  document.cookie = name + "=" + escape (value) + 
    ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) + 
    ((path == null) ? "" : ("; path=" + path)) +  
    ((domain == null) ? "" : ("; domain=" + domain)) +    
    ((secure == true) ? "; secure" : "");
}

function del_cookie(name) {  
  var exp = new Date();  
  exp.setTime (exp.getTime() - 1);  
  var cval = get_cookie(name);  
  document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}

addEvent = function(el, evname, func) {
	if (el.attachEvent) {
		el.attachEvent("on" + evname, func);
	} else {
		el.addEventListener(evname, func, true);
	}
};

addEvents = function(el, evs, func) {
	for (var i in evs) {
		addEvent(el, evs[i], func);
	}
};

removeEvent = function(el, evname, func) {
	if (el.detachEvent) {
		el.detachEvent("on" + evname, func);
	} else {
		el.removeEventListener(evname, func, true);
	}
};

removeEvents = function(el, evs, func) {
	for (var i in evs) {
		removeEvent(el, evs[i], func);
	}
};
stopEvent = function(e) {
    if (e.stopPropagation) {
        e.preventDefault();
        e.stopPropagation();
    } else {
        e.cancelBubble = true;
        e.returnValue = false;
    }

}
setOpacity = function(obj,value) {
	obj.style.opacity = value/10;
	obj.style.filter = 'alpha(opacity=' + value*10 + ')';
};
/**
 * Clears text selection
 */
clearTextSelection = function() {
	if (window.getSelection) {
		window.getSelection().removeAllRanges();
	} else if (document.getSelection) {
		var s = document.getSelection();
		if (s.collapse) s.collapse(true);
		if (s.removeAllRanges) s.removeAllRanges();
	} else if (document.selection && document.selection.empty) {
		document.selection.empty();
		window.setTimeout('document.selection.empty()', 0);
	}
};
function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
			curtop = obj.offsetTop
			while (obj = obj.offsetParent) {
				curleft += obj.offsetLeft
					curtop += obj.offsetTop
			}
	}
	var n = {x:curleft,y:curtop};
	return n;
}

function deg2rad(x) {
	return (x/180)*Math.PI;
}
function rad2deg(x) {
	return (x/Math.PI)*180;
}
Object.prototype.cloneObject = function() {
	var no = {};
	for(p in this) {
		if(typeof this[p] == 'object') {
			no[p] = this[p].cloneObject();
		}
		else {
			no[p] = this[p];
		}
	}
	return no;
}

if(typeof Array.prototype._copy==='undefined'){
	Array.prototype._copy=function(a){
		var a=[],i=this.length;while(i--){
			a[i]=(typeof this[i]._copy!=='undefined')?this[i]._copy():this[i];
		}
		return a;
	};
}


addClass = function(el,cl) {
    var cls = el.className.split(' ');
    var f=false;
    for(var i=0; i < cls.length; i++) {
	if(cls[i] == cl) {
	    f=true;
	    break;
	}
    }
    if(!f)
    el.className=el.className+' '+cl;
};
removeClass = function(el,cl) {
    var cls = el.className.split(' ');
    var f=-1;
    for(var i=0; i < cls.length; i++) {
	if(cls[i] == cl) {
	    f=i;
	    break;
	}
    }
    if(f!= -1) {
	cls.splice(f,1);
	el.className = cls.join(' ');
    }
   
};


String.prototype.trim = function() {
// skip leading and trailing whitespace
// and return everything in between
var x=this;
x=x.replace(/^\s*(.*)/, "$1");
x=x.replace(/(.*?)\s*$/, "$1");
return x;
}
adjustDiv = function(x,y,id){
    var pm = null;
    if(typeof id == 'string'){
        pm = $(id);
    }else{
        pm = id;
    }
    pm.style.display='block';
    var x1=x;
    var y1=y;
    if((y + pm.clientHeight) >= (document.body.clientHeight+document.body.scrollTop)){
        y1 = y -pm.clientHeight;
    }
    if((x + pm.clientWidth) >= (document.body.clientWidth + document.body.scrollLeft)){
        x1 = x - pm.clientWidth;
    }
    pm.style.left=x1;
    pm.style.top=y1;
    return pm;
};
getValue = function(str){	// get value from a stirng function( parsing string to int)
	var RefString="1234567890";
	//check only the characters present in RefString are entered
	var value=0;
	if(str){
	for (Count=0; Count < str.length; Count++)  
		if (RefString.indexOf (str.substring (Count, Count+1)) != -1){
			value = (value *10) + parseInt(str.substring(Count,Count + 1));
		}
	return value;
	}
};
