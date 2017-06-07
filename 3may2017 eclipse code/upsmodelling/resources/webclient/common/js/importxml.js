/*$Id: importxml.js,v 1.2 2010/10/29 13:47:01 swaminathap Exp $*/
var rq = new Array();
var paramsArr = new Array();

function importxml(url,f, paramsObj, status, lock) {
	return handleRequest(url,f, paramsObj, status, null, lock);
}
function importxmlForForm(formElem,f, paramsObj, status, lock) {
	if(!paramsObj) {
		paramsObj = '';
	}
	return handleRequest(formElem.action,f, paramsObj, status, formElem, lock);

}

var lockstate = false;
var errorUrl = '/';

function handleRequest( u, f, paramsObj, status, formElem, lock) {

	if(lockstate == true)
	{
		return;
	}	

	if(lock)
	{
		lockstate = true;
	}

	if(status != false && status != 'false') {
		loadon(status);
	} 

	if( window.XMLHttpRequest ) {
		var xmlObject = getXmlObj();
		if (xmlObject.overrideMimeType)
		{
			xmlObject.overrideMimeType('text/xml');
		}
		rt = rq.length;
		rq[rt] = xmlObject;
		var paramsLen = paramsArr.length;
		paramsArr[paramsLen] = paramsObj;
		rq[rt].onreadystatechange = new Function( 'if( rq['+rt+'].readyState == 4) { if(rq['+rt+'].status < 300 ) { loadoff();lockstate=false;'+f+'(rq['+rt+'].responseXML, paramsArr['+ paramsLen +']); } else {showRedirect(rq['+rt+'].status,rq['+rt+'].statusText,errorUrl);}}' );


		if(formElem && formElem != null) {
			handleForm(rq[rt], u, formElem);
		} else {
			rq[rt].open("GET", u, true);
			rq[rt].send(null);
		}
		return rq[rt];
	}
	if( !navigator.__ice_version && window.ActiveXObject ) {
		try {	
			var xmlObject = getXmlObj(formElem);
			rt = rq.length
				rq[rt] = xmlObject;
			var paramsLen = paramsArr.length;
			paramsArr[paramsLen] = paramsObj;
			rq[rt].onreadystatechange = new Function( 'if( rq['+rt+'].readyState == 4) { var toSend = rq['+rt+']; if(rq['+rt+'].responseXML) {toSend = rq['+rt+'].responseXML} if(rq['+rt+'].status >= 300){showRedirect(rq['+rt+'].status, rq['+rt+'].statusText,errorUrl);} else { loadoff();lockstate=false;'+f+'(toSend, paramsArr['+ paramsLen +']); }}' );
			if(formElem && formElem != null) {
				handleForm(rq[rt], u, formElem);
			} else {
				rq[rt].load(u);
			}    
			return true;
		} catch(e) {alert(e)}
	}
	return false;
}


function handleForm(req, u, formElem, isClientAction) {
	var nvp = getFormQS(formElem);
	if(isClientAction){
		//req.open('POST', u, false);
		req.open('POST', u, true);
	}
	else{
		req.open('POST', u, true);
	}
	req.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	req.setRequestHeader("Content-length", nvp.length);
	req.send(nvp);
}


function getFormQS(frm) {
	var qs="";
	for(var c = 0 ; c < frm.elements.length ; c++) {
		if(document.all) {
			var el = frm.elements[c];  // [];
		} else {
			var el = frm.elements.item(c);  // [];
		}
		switch(el.type) {
			case "textarea":
				case "hidden":
				case "text":
				//alert(el.type);
				qs+=el.name+"="+encodeURIComponent(el.value)+"&";
			break;
			case "select-one":
				if(el.selectedIndex != -1) {
					sv = el.options[el.selectedIndex].value;
					qs+=el.name+"="+encodeURIComponent(sv)+"&";
				}
			break;
			case "select-multiple":
				ss = ""
				for(var so = 0 ; so < el.options.length ; so++) {
					if(el.options[so].selected == true) {
						ss+=(ss=="")?"":"&"
							sv = el.options[so].value;
						ss+=el.name+"="+encodeURIComponent(sv);
					}
				}
			ss+=(ss=="")?"":"&"
				qs+=ss;
			break;
			case "radio":
				case "checkbox":
				if(el.checked == true) {
					qs+=el.name+"="+encodeURIComponent(el.value)+"&";
				}
			break;
			default:
			qs+=el.name+"="+encodeURIComponent(el.value)+"&";
		}
	}
	//alert(qs);
	qs = qs.substr(0,(qs.length - 1));
	return qs;
}

function loadoff() {
	var loading = document.getElementById('loading');
	if(loading) {
		loading.style.display = 'none';
	}
}

function loadon(status) {

	var loading = document.getElementById('loading');
	var loadingmsg=document.getElementById('loadingmsg');
	if(loading && loadingmsg) {
		if(status) {
			loadingmsg.innerHTML = status;
		} else {
			loadingmsg.innerHTML = 'Please wait...';
		}
		var dim = findDocDim();
		loading.style.display = 'block';
		loading.style.left=dim.width/2 - loading.offsetWidth/2;
		loading.style.top= dim.height/2 - loading.offsetHeight/2;
	}

}

function getXmlObj(formElem) {
	var xmlObject = null;
	if(document.all) {

		var xmlObject = null;
		if (window.XMLHttpRequest){ // check for IE7
			xmlObject = new XMLHttpRequest();
		}

		else 
		{
			if(!formElem) {
				try { 
					xmlObject = new ActiveXObject('Microsoft.XMLDOM');
				} catch(e) {}
			}
			if(xmlObject == null) {
				try { 
					xmlObject = new ActiveXObject('Msxml2.XMLHTTP');
				} catch(e) {}
			}
			if(xmlObject == null) {
				try { 
					xmlObject = new ActiveXObject('Microsoft.XMLHTTP'); 
				} catch(e) {
					throw new Exception('Browser not supported');
				}
			}
		}


	} else {
		xmlObject = new XMLHttpRequest();
	}
	return xmlObject;
}
function getHtmlForFormOnChange(formElem,f, paramsObj,lock) {
	if(!paramsObj) {
		paramsObj = '';
	}
	return getHtml(formElem.action,f, paramsObj, status, formElem, lock,true);
}

function getHtmlForForm(formElem,f, paramsObj, status, lock) {
	if(!paramsObj) {
		paramsObj = '';
	}
	return getHtml(formElem.action,f, paramsObj, status, formElem, lock);
}


function getHtml(url, fn, paramsObj, status, formElem, lock,isClientAction) {

	if(lockstate == true)
	{
		return;
	}	

	if(lock)
	{
		lockstate = true;
	}

	if(status != false && status != 'false') {
		loadon(status);
	} 

	if(status != false && status != 'false') {
		loadon(status);
	} 
	var xmlObject = null;
	if( window.XMLHttpRequest ) {
		xmlObject = getXmlObj(true);
	} else if( !navigator.__ice_version && window.ActiveXObject ) {
		xmlObject = getXmlObj(true);
	} else {
		return false;
	}
	try { 	 
		url += ( ( url.indexOf('?') + 1 ) ? '&' : '?' ) + ( new Date() ).getTime(); 	 
	} catch(e) {}

	rt = rq.length
	rq[rt] = xmlObject;
	var paramsLen = paramsArr.length;
	paramsArr[paramsLen] = paramsObj;
	if (xmlObject) {
		rq[rt].onreadystatechange = new Function( ' if (rq[' + rt +'].readyState==4) { if(rq['+rt+'].status < 300) {loadoff();lockstate=false;' + fn + '(rq[' + rt +'].responseText, paramsArr[' + paramsLen + ']);  } else {showRedirect(rq['+rt+'].status,rq['+rt+'].statusText,errorUrl);}}');
		if(formElem && formElem != null) {
			handleForm(rq[rt], url, formElem,isClientAction);
		} else {
			rq[rt].open('GET', url, true);
			rq[rt].setRequestHeader("Content-type","text/html");
			rq[rt].setRequestHeader("Content-length", 0);
			rq[rt].send(null);
		}
	}
	return true;

}

function showRedirect(errCode, errMsg,errUrl) {
	if(errCode == 500) {
		alert('Error Occured. We are sorry for the inconvenience. \n\nPlease try after some time or refresh the page and try again.');
		loadoff();
		return;
	}
	//alert(errCode + " : " + errMsg);
	//location.href = errUrl;
	window.location="/mainLayout.do";
}

//Not used methods
function lazyloadjs(f) {
	if(f && f.length >0) {
		getHtml(f[0], 'evalLazyload', f, false);
	}
}

function evalLazyload(txt, f) {
	if (window.execScript) {
		window.execScript(txt);
	} else {
		window.eval(txt);
	}
	f.splice(0,1);
	if(f.length > 0) {
		getHtml(f[0], 'evalLazyload', f, false);
	}
}

function lazyloadcss(f) {
	for(var i=0; i<f.length; i++) {
		if(document.createStyleSheet) {
			document.createStyleSheet(f[i]);
		} else {
			var c = document.createElement('link');
			c.rel='stylesheet';
			c.href=f[i];
			c.type = 'text/css';
			document.getElementsByTagName("head")[0].appendChild(c);
		}
	}
}

function executescript(elem, execute, executeAll) 
{
	if(!elem || !execute) return;
	var ss = elem.getElementsByTagName('script');
	for(var i=0; i<ss.length; i++) 
	{
		var scTag = ss.item(i);
		if(scTag)
		{
			var id = scTag.id;
			if((id && ((id.indexOf("scriptcalid") != -1) || (id.indexOf("SHEETSCRIPT") != -1) || (id.indexOf("VIEWARRSCRIPT") != -1) || (id.indexOf("SHEETCOG") != -1) || (id.indexOf("CAPTCHASCRIPT") != -1))) || executeAll)
			{	
				var txt = scTag.innerHTML;
				if (window.execScript)
				{
					window.execScript(txt);
				}
				else
				{
					window.eval(txt);
				}
			}
		}
	}
}
// End Not used methods
