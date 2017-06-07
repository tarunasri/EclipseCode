
//$Id: topoActions.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}

function openWindow(theURL,winName,width,height,parms) 
{ 
   var left = Math.floor( (screen.width - width) / 2);
   var top = Math.floor( (screen.height - height) / 2);
   var winParms = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
   if (parms) { winParms += "," + parms; }
   window.open(theURL, winName, winParms);
}


function closeWindow()
{
	top.window.opener.location.reload();
	window.close();
} 


function reloadParent(url)
{
	top.window.opener.location.href = url;
	window.close(); 
}


function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_changeProp(objName,x,theProp,theValue) { //v6.0
  var obj = MM_findObj(objName);
  if (obj && (theProp.indexOf("style.")==-1 || obj.style)){
	if (theValue == true || theValue == false)
	  eval("obj."+theProp+"="+theValue);
	else eval("obj."+theProp+"='"+theValue+"'");
  }
}

function showDetails(url)
{
	var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	var selectedValue = '';
	for (var i = 0; i < len; i++)
	{
		formElement = listViewForm.elements[i];
		if (formElement.type == "checkbox" && formElement.name == "rowSelection" && formElement.checked == true )
		{
			selectedValue = formElement.value;
			break;
		}	
	}
	var str = selectedValue.split(",");
	var name = str[0];
	if(name == '')
	{
		alert("Select an Object to View the Details");
		return;
	}
	url = url + '?name=' + str[0];	
	MM_openBrWindow(url,'','status=yes,scrollbars=yes,resizable=yes,width=800,height=500');
//	  location.href = url;
}


function showSnmpQueryMenu(url)
{
	var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	var selectedValue = '';
	for (var i = 0; i < len; i++)
	{
		formElement = listViewForm.elements[i];
		if (formElement.type == "checkbox" && formElement.name == "rowSelection" && formElement.checked == true )
		{
			selectedValue = formElement.value;
			break;
		}	
	}
	var str = selectedValue.split(",");
	var name = str[0];
	if(name == '')
	{
		alert("Select an Object to query the SNMP OIDs");
		return;
	}
	url = url + '?host=' + str[0];	
//alert(url);
	//MM_openBrWindow(url,'','status=yes,scrollbars=yes,resizable=yes,width=800,height=500');
	  location.href = url;
}





function showAlarms(url)
{
	var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	var selectedObjects = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
				{
					if(selectedObjects == '')
						{
							selectedObjects = formElement.value;
						}
					else
						{
							selectedObjects += ',' + formElement.value;
						}
				}
		}
	if(selectedObjects == '')
	{
		alert("Select an Object to view the Alarms.");
		return;
	}
	url = url + "&entity=" + selectedObjects;
	location.href = url;
}

function clearAlarm(url)
{
	var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	
	var selectedEntity = '';
	for ( var i=0; i < len; i++)
	{
		formElement = listViewForm.elements[i];
		if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
		{
			if(selectedEntity == '')
			{
				selectedEntity = formElement.value;
			}
			else
			{
				selectedEntity += ',' + formElement.value;
			}
		}
	}
	
	if(selectedEntity == '')
	{
		alert("Atleast one Alarm should be selected.");
		return;
	}
	url = url + "&selectedEntity=" + selectedEntity;
	location.href = url;
}
   
function deleteAlarm(url)
{
		var listViewForm = document.forms[1];
		var len = listViewForm.elements.length;
		var selectedEntity = '';
		for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
			{
				if(selectedEntity == '')
				{
					selectedEntity = formElement.value;
				}
				else
				{
					selectedEntity += ',' + formElement.value;
				}
			}
		}
		if(selectedEntity == '')
		{
			alert("Atleast one Alarm should be selected.");
			return;
		}

		var con = confirm("Are you sure want to delete the selected Alarms?");
		if ( con != true)
		{
			return;
		}
		else
		{
			url = url + "&selectedEntity=" + selectedEntity;
			location.href = url;
		}
}	 


function showEvents(url)
{
	var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	var selectedEntity = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
				{
					if(selectedEntity == '')
						{
							selectedEntity = formElement.value;
						}
					else
						{
							selectedEntity += ',' + formElement.value;
						}
				}
		}
	
	if(selectedEntity == '')
		{
			alert("Select a Object to view the Events.");
			return;
		}

	url = url + "&entity=" + selectedEntity;
	location.href = url;
}


function performOperation(url)
{
  var listViewForm = document.forms[1];
	var len = listViewForm.elements.length;
	var selectedEntity = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
				{
					if(selectedEntity == '')
						{
							selectedEntity = formElement.value;
						}
					else
						{
							selectedEntity += ',' + formElement.value;
						}
				}
		}
	
	if(selectedEntity == '')
		{
			alert("Select an Object to perform this operation.");
			return;
		}

 url = url + "&keys=" + selectedEntity;
 var viewId=document.pagexform.viewId.value;
 var displayName= document.pagexform.displayName.value;
 var isAscending= document.pagexform.isAscending.value;
 var from= document.pagexform.FROM_INDEX.value; 
 var page= document.pagexform.PAGE_NUMBER.value;

 url=url+"&viewId="+viewId+"&displayName="+ displayName+"&isAscending="+isAscending+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page;

if(document.pagexform.orderByColumn.value!="")
{
 var orderByColumn= document.pagexform.orderByColumn.value;
	url = url + "&orderByColumn=" + orderByColumn;
// alert(orderByColumn);
} 
//alert(url);	 
	location.href = url;
//	  MM_openBrWindow(url,'','status=yes,scrollbars=yes,resizable=yes,width=800,height=500');
}


function deleteObject(url)
{
	var con = confirm("Are you sure you want to delete the selected Object(s) ?");
	if ( con != true)
		{
			return;
		}
	else
		{
          performOperation(url);
		}
}

function MM_setTextOfTextfield(objName,x,newText) { //v3.0
  var obj = MM_findObj(objName); if (obj) obj.value = newText;
}


function reloadInventoryList(wndHndl)
{
	document.pagexform.submit();
	//	wndHndl.close();
}

function removeTopoCV(viewId)
{
  if (viewId == 'Network Database')
  {
      alert("<fmt:message key='webclient.topo.customview.delete.message'/>");
  }
  else
  {
      var con = confirm('<fmt:message key="webclient.topo.customview.delete.confirmation"/>');
      if ( con != true)
      {
          return;
      }
      else
      {
          url = "/topo/removeTopoCV.do?viewId=" +viewId;
          location.href = url;
      }
  }
}

function showReport(url)
{
       var listViewForm = document.forms[1];
       var len = listViewForm.elements.length;
       var selectedValue = '';
       for (var i = 0; i < len; i++)
       {
               formElement = listViewForm.elements[i];
               if (formElement.type == "checkbox" && formElement.name == "rowSelection" && formElement.checked == true )
               {
                       selectedValue = formElement.value;
                       break;
               }
       }
       var str = selectedValue.split(",");
       var name = str[0];
       if(name == '')
       {
               alert("Select an Object to View the Report");
               return;
       }
   url = url + '?name=' + str[0];
   location.href = url;
} 