/*$Id: dashboard.js,v 1.2 2010/10/29 13:47:01 swaminathap Exp $*/
var dashboardId;
function getContent(associationID, dashboardID,columnWidth,widgetName)
{
	if(isEditing == associationID)
	{
		isEditing=null;
	}

	document.getElementById("widget"+associationID).innerHTML="<div style='text-align:center;padding:10px;height:180px'><img src='/webclient/common/images/LoadingTC.gif' style='margin-top:74px'/></div>";
dashboardId =dashboardID;
	setTimeout('getContent1(\"'+associationID+'\", \"'+dashboardID+'\",\"'+columnWidth+'\",\"'+widgetName+'\");', 500);
}

function getContent1(associationID, dashboardID,columnWidth,widgetName)
{
	var url = "generateWidgets.do?";
	url= url+"associationID="+associationID+"&dId="+dashboardID+"&columnWidth="+columnWidth;
	passingArg = new Array();
	passingArg[0] = associationID;
	if(widgetName!=null && widgetName !="undefined")
	{
		passingArg[1] = widgetName;
	}
	getHtml(url,"setContent",passingArg);
}

function setContent(response,args)
{
	document.getElementById("widget"+args[0]).innerHTML = response;
	if(args.length==2 )	
	{
		document.getElementById("widget_title"+args[0]).innerHTML = args[1];
	}
	
	tempWidget = widgetArray[args[0]];
	tempWidget.isreloading =false;
	
}


function cancelEdit(associationId,dashboardId,width)
{
	$('.groupItem .itemContent').mouseover(function(){
			$(this).css("overflow-x","auto");
			});

	$('.groupItem .itemContent').mouseout(function(){
			$(this).css("overflow-x","hidden");
			});

	setRefresh(associationId);
	reloadWidget(associationId,dashboardId,width);
}

var isEditing=null;
function saveEdit(associationId,dashId,widgetColWidth)
{
	if(!checkValidWidgetName(document.criteriaForm.widgetName.value))
	{
		document.criteriaForm.widgetName.focus();
		return false;
	}

	var paramVal = new Array();
	paramVal[0]=associationId;
	paramVal[1]=dashId;
	paramVal[2]=widgetColWidth;
	$('.groupItem .itemContent').mouseover(function(){
			$(this).css("overflow-x","auto");
			});

	$('.groupItem .itemContent').mouseout(function(){
			$(this).css("overflow-x","hidden");
			});


	getHtmlForFormOnChange(document.criteriaForm,"editResponse",paramVal);
	return false;
}

function editResponse(response,params)
{
	var refreshVal = document.criteriaForm.refreshInterval.value;
	var widgetName =document.criteriaForm.widgetName.value;
	getContent(params[0],params[1],params[2],widgetName);
if(refreshVal == undefined)
{
	refreshVal=0;
}
new widget(params[0],widgetName,refreshVal);

}

var prevOrder=null;
var url ="/modifyDashboard.do?method=updateColumns";

function getOrder(Order) {
	  var urlstring =url;
	  for(var i=0;i<Order.length;i++)
	  {
		if(prevOrder==null || (Order[i].order.join() != prevOrder[i].order.join())) 
		{
			urlstring=urlstring+"&"+Order[i].id+"="+Order[i].order;
		}
	  }
	  if(urlstring!="")
	  {
		      prevOrder=Order;
		      var xmlhttp = new getXmlObj();//method present in commonIncludes.jspf
		      xmlhttp.open("GET",urlstring, true);
		      xmlhttp.send(null);
	  }
}
function widgetOrder(colname,ordArr) {
	
	this.id=colname;
	this.order=ordArr;
}

function restoreOrder(){
	//console.log('asdasd');
}
function reloadWidget(aID, dashboardID,widgetWidth)
{
	reloadingWidget = widgetArray[aID];
	reloadingWidget.isreloading =true;
	getContent(aID, dashboardID,widgetWidth);
}

var widgetArray = new Array();
function widget(aid, wname, interval,columnWidth)
{
	this.aid = aid;
	this.wname = wname;
	this.interval = interval;
	this.width = columnWidth;
	this.prev=-1;
	this.isreloading = false;
	if(interval > 0)
	{
	this.refreshInterval = setInterval('reloadWidget('+aid+', '+dashboardId+','+columnWidth+')', interval*1000);
	}
	widgetArray[aid] = this;
}

function editDashWidget(aid, wname,columnWidth,message)
{
	widg = widgetArray[aid];
	if(widg.isreloading)
	{
		alert(message);
		return;
	}
	clearInterval(widg.refreshInterval);
	$('.groupItem .itemContent').mouseover(function(){
		$(this).css("overflow-x","hidden");
		});

	$('.groupItem .itemContent').mouseout(function(){
		$(this).css("overflow-x","hidden");
		});

	editWidget(widg.aid, widg.wname,columnWidth);
}

function setRefresh(aid)
{
	widg = widgetArray[aid];
	clearInterval(widg.refreshInterval);
	if(widg.interval != 0)
	{
		widg.refreshInterval = setInterval('reloadWidget('+aid+', '+dashboardId+')', widg.interval*1000);
	}
}






var hideDiv = "";

/* drop down menu related scripts*/
var showmenu = false;
var menuInterval=null;

function enableMenu(menuId,msec)
{
	showmenu=true;
	if(menuInterval!=null)
	{
		clearInterval(menuInterval);
	}
	menuInterval = setInterval("showMenu('"+menuId+"');",msec);
}

function showMenu(id1)
{
	var disp = document.getElementById(id1);
	if(showmenu)
	{
		if (disp.style.display == 'none')
		{
			eval("disp.style.display = ''");
		}
	}
	else
	{
		eval("disp.style.display = 'none'");
	}
}

function closeMenu(menuId)
{
	var disp = document.getElementById(menuId);
	if(disp!=null)
	{
		eval("disp.style.display='none'");
	}
}

function disableMenu(id1)
{
	showmenu=false;
}
/*drop down End script*/

function getCctvList(cctvId,divElement)
{
	var url = "associateWidget.do?method=modifyCctvView&dialog=true";
	url= url+"&cctvId="+cctvId;
	getHtml(url,"setResponse",divElement);
}

function setResponse(response,divElement)
{
	document.getElementById(divElement).innerHTML = response;
	if(document.addCctvForm!=null)
	{
		document.addCctvForm.description.focus();
		checkSelected('dashcheck','dashboards');
	}

}

function editCctv(a,b,popDivWidth,cctvId,divEle)
{
	getCctvList(cctvId,divEle);
	setPosToDiv(a,b,popDivWidth)
}



	function checkIsNumeric(event)
	{
		var key = getkey(event);
		if ( key==null || key==0 || key==8 || key==9 || key==13 || key==27 )
			return true;
		
		var keychar = String.fromCharCode(key);
		if ("0123456789".indexOf(keychar) != -1)
			return true;
		
		return false;
	}
	
	function enableColumnWidthBoxes()
	{
		noOfColumns = document.dashboardForm.numberOfColumns.value;
		document.dashboardForm.columnWidth1.disabled = document.dashboardForm.columnWidth2.disabled = document.dashboardForm.columnWidth3.disabled =true;
		
		if(noOfColumns>0) 
			document.dashboardForm.columnWidth1.disabled = false;
		if(noOfColumns>1) 
			document.dashboardForm.columnWidth1.disabled = document.dashboardForm.columnWidth2.disabled = false; 
		if(noOfColumns>2) 
			document.dashboardForm.columnWidth3.disabled = false;
	}
	
	function fillDefaultColumnWidth()
	{
		enableColumnWidthBoxes();

		noOfColumns = document.dashboardForm.numberOfColumns.value;
		if(noOfColumns==1) 
			document.dashboardForm.columnWidth1.value = 100;
		if(noOfColumns==2) 
			document.dashboardForm.columnWidth1.value = document.dashboardForm.columnWidth2.value = 50;
		if(noOfColumns==3) 
		{
			document.dashboardForm.columnWidth1.value = document.dashboardForm.columnWidth3.value = 30;
			document.dashboardForm.columnWidth2.value = 40; 
		}
		
	}

	function getkey(event)
	{
		if (window.event)
			return window.event.keyCode;
		else if (event)
			return event.which;
		else
			return null;
	}

var prevHistory;

function getCancel()
{
if(prevHistory!=null)
{
	window.location=prevHistory;
	prevHistory=null;
}
else
{
	window.location="/mainLayout.do";
}
}

function closeThisDiv(divElement,refreshDiv)
{
	popDivEle = document.getElementById(divElement);
	popDivEle.style.display = 'none';
	resetForms();

}

function selectAll(invoker,element)
{

 var headerX= document.getElementsByName(invoker);
var value = headerX[0].checked;
var widgets = document.getElementsByName(element);

	for(i=0;i<widgets.length;i=i+1)
	{
			widgets[i].checked =value;
	}
}

function checkSelected(element,invoker)
{
	var headerX= document.getElementsByName(element);


	var widgets = document.getElementsByName(invoker);
	var flag= true;
	var check=true;
	for(i=0;i<widgets.length;i=i+1)
	{
		if(widgets[i].checked!=flag)
		{
			check=false;
		}
	}
	

	headerX[0].checked =check;
}


function toggleWidgets(varx)
{
var widgets = document.getElementsByName(varx);
	for(i=0;i<widgets.length;i=i+1)
	{
		if(!widgets[i].checked)
		{
			widgets[i].checked =true;
		}
		else
		{
			widgets[i].checked = false;
		}
	}
}


function showAddDashboard(divElement)
{
	resetForms();
	var oldUrl = window.location;
prevHistory =oldUrl;
	url="/modifyDashboard.do?method=getWidgetList&dialog=true";
	getHtml(url,"addCctv",divElement);
}

function showEditDashboard(divElement,dashboardId)
{
	resetForms();
	url="/modifyDashboard.do?method=showModifyForm&dialog=true&dashboardId="+dashboardId;
	getHtml(url,"addCctv",divElement);
}


function addDashboard(a,b,popDivWidth,replaceDiv)
{
	showAddDashboard(replaceDiv);	
	setPosToDiv(a,b,popDivWidth);
}

function editDashboard(a,b,popDivWidth,dashboardId,replaceDiv)
{
	showEditDashboard(replaceDiv,dashboardId);	
	setPosToDiv(a,b,popDivWidth);
}

function resetForms()
{
	if(document.associateForm!=null)
	{
		document.associateForm.reset();
	}
	if(document.addCctvForm!=null)
	{
		document.addCctvForm.reset();
	}
	if(document.dashboardForm!=null)
	{
		document.dashboardForm.reset();
	}

}

function editDash(divElement)
{
var oldUrl = window.location;
window.location="/modifyDashboard.do?method=modify&dialog=true";
url ='/modifyDashboard.do?method=modify&dialog=true'
getHtml(url,"modifySuccess",divElement,oldUrl);

}

function modifySuccess(response,divElement,oldUrl)
{
	document.getElementById(divElement).style.display='none';
}


function showAddCctv(a,b,popDivWidth,divElement)
{
url ='/associateWidget.do?method=addCctv&dialog=true'
getHtml(url,"addCctv",divElement);
setPosToDiv(a,b,popDivWidth)

}

function addCctv(response,divElement)
{
	document.getElementById(divElement).innerHTML= response;
	if(document.addCctvForm!=null)
	{
		document.addCctvForm.cctvName.focus();
	}
	if(document.dashboardForm!=null)
	{
		document.dashboardForm.dashboardName.focus();
		enableColumnWidthBoxes();
	}
}

function setDashboardFocus()
{
	if(document.dashboardForm!=null)
	{
		document.dashboardForm.dashboardName.focus();
		enableColumnWidthBoxes();
	}
}

function setCctvFocus()
{
if(document.addCctvForm!=null)
{
	document.addCctvForm.cctvName.focus();
}
}
var prevDiv =null;

function setPosToDiv(a, b, popDivWidth){
	if(prevDiv!=null && document.getElementById(prevDiv)!=null)
	{
		document.getElementById(prevDiv).style.display='none'
	}
	prevDiv=b;
	var element1 = document.getElementById(a);
	popDivEle = document.getElementById(b);
	var element1Width = getElementWidthHeight(element1);
	var element2Width = getElementWidthHeight(popDivEle);	
	posi = getDivLocation(element1);
	popDivEle.style.position='absolute';
	popDivEle.style.left=parseInt((posi[0]+(element1Width[0]/2))-(popDivWidth/2))+'px';
	popDivEle.style.top=parseInt(posi[1])+'px';
	popDivEle.style.display = '';
}


var xmlObject = null;
var param=null;
function ajaxPost(url,fn,param,async)
{
		if( window.XMLHttpRequest ) {
		xmlObject = getXmlObj(true);
	} else if( !navigator.__ice_version && window.ActiveXObject ) {
		xmlObject = getXmlObj(true);
	} else {
		return false;
	}
	xmlObject.onreadystatechange = new Function('if(xmlObject.readyState==4){'+fn+'(xmlObject.responseText,param);}');
	xmlObject.open("POST",url,async);
	xmlObject.send(null);

}

function mouseSelect(objectEle){

	objectEle.className="menuHoverBg";
}
function removeSelect(objectEle){
	objectEle.className="menuDivider";
}



function callCctv(value,refresh)
{
	if(value == null || value == '')
	{
		showCctvError();
	}
	else
	{
		dashIDS = value;
		setTimeout('showCctv();',500);
		setInterval('showCctv();',refresh*1000);
	}
}

function showCctv()
{
	url="/home/Homepage.do?selectedTab=Home&viewId=Home&displayName=Home&&isRecite=true&dashboardId="+dashIDS[currentIndex];
	setTimeout('getHtml("'+url+'","setContentDash");',500);
}

function setContentDash(response)
{
	document.getElementById("innerDiv").innerHTML = response;
	var innercontent = document.getElementById("innerDiv");
	var scriptTags = innercontent.getElementsByTagName("SCRIPT");
	for (var i = 0; i < scriptTags.length; i++)
	{
		var scriptTag = document.createElement("SCRIPT");
		scriptTag.type = "text/javascript";
		scriptTag.language = "javascript";
		if (scriptTags[i].src != "") { scriptTag.src = scriptTags[i].src;}
		scriptTag.text = scriptTags[i].text;
		document.getElementById("scriptDiv").appendChild(scriptTag);
	} // Ends loading script.


	currentIndex = currentIndex+1;
	if(currentIndex == dashIDS.length)
		currentIndex = 0;
}

function callEdit(id)
{
	var x=document.getElementById("criteriaFormId");
	for (var i=0;i<x.length;i++)
	{
		alert(x.elements[i].value);
		
	}
}


function checkDashboardExist()
{
	var dashboardName= document.dashboardForm.dashboardName.value;
	var checkUrl ="/modifyDashboard.do?method=checkDashboardExists&dashboardName="+document.dashboardForm.dashboardName.value
	var passArgs = new Array();
	passArgs[0] = dashboardName;
	getHtml(checkUrl,"isExistDashboard",passArgs);
}

function checkCctvExist(message)
{
	var cctvName= document.addCctvForm.cctvName.value;
	var cctvurl ="/associateWidget.do?method=checkCctvExists&cctvName="+cctvName
	var passArgs = new Array();
	passArgs[0] = cctvName;
	passArgs[1] = message;
	getHtml(cctvurl,"isExistCctvName",passArgs);
}


function isExistCctvName(response,args)
{
	if(!isEmpty(response))
	{
		document.addCctvForm.cctvName.className ='inputFocusText';
		document.addCctvForm.cctvName.focus();
document.getElementById('duplicateEntry').innerHTML = args[1];
		document.getElementById('duplicateEntry').style.display = '';
		return;
	}
	document.addCctvForm.cctvName.className ='';
	document.getElementById('duplicateEntry').innerHTML = '';
	document.getElementById('duplicateEntry').style.display = 'none';
	
}




