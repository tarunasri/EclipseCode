/* $Id: config.js,v 1.2 2010/10/29 13:47:04 swaminathap Exp $ */
function submitDC(form)
{
    var deviceattr = form.deviceattr.value;
    var protocol = form.protocol.value;
    var attr='';
    var temp = '';
    if((temp = trimAll(form.device.value))!='')
    {
        attr = "host="+temp+",";
    }
    if(deviceattr.indexOf(attr) != -1)
    {
    	var token = deviceattr.split(";");
        var newdevattr = "";
        for(var i=0;i<token.length;i++)
        {
            var devattr = trimAll(token[i]);
            if(devattr != '' && devattr.indexOf(attr)==-1)
            {
            	newdevattr = newdevattr+";"+devattr;
            }
        }
	deviceattr = newdevattr;
    }
    if((temp = trimAll(form.port.value))!='')
    {
        attr = attr+"port="+temp+",";
    }
    if((temp = trimAll(form.retries.value))!='')
    {
        attr = attr+"retries="+temp+",";
    }
    if((temp = trimAll(form.timeout.value))!='')
    {
        attr = attr+"timeout="+temp+",";
    }
    if(protocol == 'ftp')
    {	
        if((temp = trimAll(form.username.value))!='')
        {
            attr = attr+"username="+temp+",";
        }
        if((temp = trimAll(form.password.value))!='')
        {
            attr = attr+"password="+temp+",";
        }
    }
    else if(protocol == 'telnet')
    {
        if((temp = trimAll(form.loginName.value))!='')
        {
            attr = attr+"loginName="+temp+",";
        }
        if((temp = trimAll(form.password.value))!='')
        {
            attr = attr+"password="+temp+",";
        }
        if((temp = trimAll(form.loginprompt.value))!='')
        {
            attr = attr+"loginprompt="+temp+",";
        }
        if((temp = trimAll(form.passwordprompt.value))!='')
        {
            attr = attr+"passwordprompt="+temp+",";
        }
        if((temp = trimAll(form.shellprompt.value))!='')
        {
            attr = attr+"shellprompt="+temp+",";
        }
    }
    else if(protocol == 'snmp')
    {
        if((temp = trimAll(form.community.value))!='')
        {
            attr = attr+"community="+temp+",";
        }
        if((temp = trimAll(form.version.value))!='')
        {
            attr = attr+"version="+temp+",";
        }
        if((temp = trimAll(form.userName.value))!='')
        {
            attr = attr+"userName="+temp+",";
        }
        if((temp = trimAll(form.contextName.value))!='')
        {
            attr = attr+"contextName="+temp+",";
        }
        if((temp = trimAll(form.contextID.value))!='')
        {
            attr = attr+"contextID="+temp+",";
        }
        if((temp = trimAll(form.maxRepetitions.value))!='')
        {
            attr = attr+"maxRepetitions="+temp+",";
        }
        if((temp = trimAll(form.nonRepeaters.value))!='')
        {
            attr = attr+"nonRepeaters="+temp+",";
        }
        if((temp = trimAll(form.authProtocol.value))!='')
        {
            attr = attr+"authProtocol="+temp+",";
        }
        if((temp = trimAll(form.authPassword.value))!='')
        {
            attr = attr+"authPassword="+temp+",";
        }
        if((temp = trimAll(form.privPassword.value))!='')
        {
            attr = attr+"privPassword="+temp+",";
        }
    }
    attr = attr.substring(0,attr.length-1);
    form.deviceattr.value = deviceattr +";"+ attr;
    
    form.device.value='';
    document.getElementById('generaldc').style.display="none";
}

function formDeviceList(text,searchType)
{

	text = trimAll(text);
		newSearchResult(text,searchType);	
		return;
		// We moved to new search implementation. So  the following will never be called. Can be removed.

	if(text.indexOf("webclient.config.audit.executetask.search.nomatching")!=-1)
	{
		formEmptyDeviceTable();
	}
	else
	{
		var formName = searchType=='configSearch'?"TaskForm":"dlForm";
		document.forms[formName].deviceattr.value="";
		var devices = text.split(",");

		var table="<table width='100%' cellspacing='0' cellpadding='2' border='0' align='left'><tbody>";
		for(var i = 0;i<devices.length;i++)
		{
			if(i%2==0)
			{
				table = table+"<tr class='generalEvenRow' onmouseout=\"this.className='generalEvenRow'\" onmouseover=\"this.className='generalHover'\">";
			}
			else
			{
				table = table+"<tr class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\">";
			}
			table = table + "<td style='padding-left:5px;'><input name='rowSelectionDevices'  type='checkbox' style='vertical-align:middle;margin:0px;padding:0px;' value="+devices[i]+" onclick = 'javascript:ToggleDl(this,this.form,event)'><a href=\"javascript:configDevice('"+formName+"','"+devices[i]+"')\"> <label>"+ devices[i]+"</label></a></td> </tr>";
		}
		table = table+"</table>";

		var dlHeader=document.getElementById("dlTableHeader");
		var searchHeader=document.getElementById("searchResultHeader");
		if(dlHeader!=null && searchHeader!=null)
		{
			searchHeader.style.display='';
			document.getElementById('searchResultSize').style.display='';
			document.getElementById('searchResultSize').style.display='';
			if(document.getElementById("dlTableSize").width=='100%')
			{
				if(document.getElementById("dlTableSize").style.display!='none')
				{
					document.getElementById("dlTableSize").width='50%';
					document.getElementById("searchResultSize").width='50%';
				}
				else
				{
					document.getElementById("searchResultSize").width='100%';
				}
				document.getElementById('searchResult').innerHTML=table;
			}
			else
			{
				document.getElementById("dlTable").style.display='none';
				document.getElementById("searchResultSize").width='100%';
				document.getElementById('searchResult').innerHTML=table;

			}

		}

		else
		{
			document.getElementById('searchResult').innerHTML=table;
		}
	}
}


function configDevice(formName,device)
{

    var form = document.forms[formName];
    var deviceattr = form.deviceattr.value;
    
    var token = deviceattr.split(";");
    
    var host = "host="+device+",";
    var elements = document.getElementsByName("rowSelectionDevices");
    
    for(var i=0;i<elements.length;i++)
    {
        var formElement = elements[i];
        if (formElement.value==device)
        {
            if(formElement.checked)
            {
		loadDeviceDetails(form.protocol.value,device);
		for(var j=0;j<token.length;j++)
		{
			if(token[j].indexOf(host)!=-1)
			{
				var attr = token[j].split(",");
				for(k=0;k<attr.length;k++)
				{
					var param = attr[k];
					var key = trimAll(param.substring(0,param.indexOf("=")));
					var value = trimAll(param.substring(param.indexOf("=")+1));
					if(key!='host')
					{
						form.elements[key].value = value;
					}
				}
			}
		}
                form.device.value=device;
            }
            else
            {
		if(form.device.value=='')
		{
			showAlertToSelectDevice();
			return;
		}
            }
        }
    }
}
function configDevicesForTask(formName,device)
{
	
    var form = document.forms[formName];
    form.device.value=device;
    var deviceattr = form.deviceattr.value;
    
    var token = deviceattr.split(";");
    
    var host = "host="+device+",";
    var elements = document.getElementsByName("rowSelectionDevices");
    
    for(var i=0;i<elements.length;i++)
    {
        var formElement = elements[i];
        if (formElement.value==device)
        {
            
		loadDeviceDetails(form.protocol.value,device);
		for(var j=0;j<token.length;j++)
		{
			if(token[j].indexOf(host)!=-1)
			{
				var attr = token[j].split(",");
				for(k=0;k<attr.length;k++)
				{
					var param = attr[k];
					var key = trimAll(param.substring(0,param.indexOf("=")));
					var value = trimAll(param.substring(param.indexOf("=")+1));
					if(key!='host')
					{
						form.elements[key].value = value;
					}
				}
			}
		}
                form.device.value=device;
           
           
        }
    }
}
function unselectDevice(form,device)
{
    var deviceattr = form.deviceattr.value;
    var token = deviceattr.split(";");
    var newdevattr = "";
    var host = "host="+device+",";
    for(var j=0;j<token.length;j++)
    {
        if(token[j]!= '' && token[j].indexOf(host)==-1)
        {
            newdevattr = newdevattr+";"+token[j];
        }
    }
    form.deviceattr.value = newdevattr;
    form.device.value='';	
}

function removeAuditCV(userName,viewId,msg)
{
    var con = confirm(msg);
    if ( con != true)
    {
        return;
    }
    else
    {
        url = "/config/AuditViewOperation.do?userName=" + userName + "&viewId=" +viewId+"&action=remove";
        location.href = url;
    }
}

function deleteTask(task,viewId,confirmmsg)
{
	if(confirm(confirmmsg) == true)
	{
		location.href="/config/TaskOperations.do?viewId="+viewId+"&method=remove&taskName="+task;
	}
}

function openNewWindow(url,title,winprops)
{
	
	custwindow = window.open(url,'',winprops);
        custwindow.opener = window;

}

function ToggleDl(e,form,event)
{
	
    if (e.checked) 
    {
        HighlightDl(e);
	if(e.name == 'rowSelectionDevices')
	{
		form.toggleAllDevices.checked = AllCheckedDl(e,form);
	}
	else 
	{
        	form.toggleAllDl.checked = AllCheckedDl(e,form);
	}
	if(e.name=="rowSelectionDevices")
	{
	    form.device.value=e.value;
	    configDevice(form.name,e.value);
	    submitDC(form);
	}
    }
    else {
        UnhighlightDl(e);
        if(e.name == 'rowSelectionDevices')
        {
                form.toggleAllDevices.checked = false;
        }
        else
        {
                form.toggleAllDl.checked = false;
        }
        if(e.name=="rowSelectionDevices")
        {
            unselectDevice(form,e.value);
        }
    }
}

function ToggleAllDl(e,form)
{
    if (e.checked) 
    {
        CheckAllDl(e,form);
    }
    else 
    {
        ClearAllDl(e,form);
    }
}

function CheckDl(e)
{
    e.checked = true;
    HighlightDl(e);
}

function ClearDl(e)
{
    e.checked = false;
    UnhighlightDl(e);
}

function CheckAllDl(element,form)
{
    var len = form.elements.length;
    for (var i = 0; i < len; i++) 
    {
        var e = form.elements[i];
        if (element.name=='toggleAllDevices' && e.name=='rowSelectionDevices' || element.name == 'toggleAllDl' && e.name=='rowSelectionDl')
        {
            CheckDl(e);
        }
    }
    element.checked = true;
}

function ClearAllDl(element,form)
{
    var len = form.elements.length;
    for (var i = 0; i < len; i++) {
        var e = form.elements[i];
	if (element.name=='toggleAllDevices' && e.name=='rowSelectionDevices' || element.name == 'toggleAllDl' && e.name=='rowSelectionDl')
        {
            ClearDl(e);
        }
    }
    element.checked = false;
}

function HighlightDl(e)
{
    var r = null;
    if (e.parentNode && e.parentNode.parentNode) {
        r = e.parentNode.parentNode;
    }
    else if (e.parentElement && e.parentElement.parentElement) {
        r = e.parentElement.parentElement;
    }
    if (r) {

        if (r.className == "rowOdd") {
            r.className = "rowOddSelected";
        }
        else if (r.className == "rowEven") {
            r.className = "rowEvenSelected";
        }
    }
} 

function UnhighlightDl(e)
{
    var r = null;
    if (e.parentNode && e.parentNode.parentNode) {
        r = e.parentNode.parentNode;
    }
    else if (e.parentElement && e.parentElement.parentElement) {
        r = e.parentElement.parentElement;
    }
    if (r) {
        if (r.className == "rowOddSelected") {
            r.className = "rowOdd";
        }
        else if (r.className == "rowEvenSelected") {
            r.className = "rowEven";
        }
    }
}

function AllCheckedDl(element,form)
{
    ml = form;
    len = ml.elements.length;
    for(var i = 0 ; i < len ; i++) 
    {
        if (ml.elements[i].name == element.name && !ml.elements[i].checked) 
	{
            return false;
        }
    }
    return true;
}

function clearOtherDiv(currentDiv)
{
    var divList = new Array("configureDataSource", "ExecutionResult", "generaldc","attrFormTable");
    for(var i=0;i<divList.length;i++)
    {
 	if(currentDiv != divList[i])
	{
    	    var div = document.getElementById(divList[i]);
	    if(div != null)
	    {
		div.style.display='none';
	    }
	}
    }
}

