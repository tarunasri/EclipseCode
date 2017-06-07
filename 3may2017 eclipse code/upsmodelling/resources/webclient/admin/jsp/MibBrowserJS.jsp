<!--$Id: MibBrowserJS.jsp,v 1.3 2007/10/19 06:22:01 sumitha Exp $-->
<meta http-equiv="pragma" content="no-cache">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script type="text/javascript">
function Sbtbutton(oidv,oidsyn,oidstatus,oidstr) 
{
    //alert(oidv);
    if(oidv != null && oidv != "" && oidv != "tc" && oidv != "trap")
    {
	document.MibBrowserBean.oid.value=oidv;
    }else
    {
	document.MibBrowserBean.oid.value="--";
    }
    document.MibBrowserBean.syntax.value=oidsyn;
    document.MibBrowserBean.status.value=oidstatus;
    
    if(oidv != null && oidv != "" && oidv != "tc" && oidv != "trap")
    {
	showLoading('descloading');
	var url = "/admin/MibTool.do?method=oidDesc&oid="+oidv;
	queryDescURL(url);
    }
    if(oidv == "trap")
    {
	showLoading('descloading');
	var url = "/admin/MibTool.do?method=trapDesc&oid="+oidstr;
	queryDescURL(url);
    }

    if(oidv == "tc")
    {
	showLoading('descloading');
	var url = "/admin/MibTool.do?method=tcDesc&oid="+oidstr;
	queryDescURL(url);
    }
}
function queryDevice(action)
{
    var oid = document.MibBrowserBean.oid.value;
    var host = document.MibBrowserBean.host.value;
    var res = document.MibBrowserBean.resultstr.value;
    var community = document.MibBrowserBean.community.value;
    var set = document.MibBrowserBean.setvalue.value;
    if(oid == null || oid == "" || oid == "--")
    {
	alert('<fmt:message key='webclient.common.mibbrowser.oid.notselected.errormessage'/>');
	return false;
    }
    if( action == "snmpget")
    {
	showLoading('loading');
	var url = "/admin/MibTool.do?method=snmpGet&host="+host+"&community="+community+"&oid="+oid+"&resultstr="+res;
	queryURL(url);
    }
    if( action == "snmpgetnext")
    {
	showLoading('loading');
	var url = "/admin/MibTool.do?method=snmpGetNext&host="+host+"&community="+community+"&oid="+oid+"&resultstr="+res;
	queryURL(url);
    }
    if( action == "snmpgetbulk")
    {
        showLoading('loading');
        var url = "/admin/MibTool.do?method=snmpGetBulk&host="+host+"&community="+community+"&oid="+oid+"&resultstr="+res;
        queryURL(url);
    }
    if( action == "snmpset")
    {
        showLoading('loading');
        var url = "/admin/MibTool.do?method=snmpSet&host="+host+"&community="+community+"&oid="+oid+"&resultstr="+res+"&setvalue="+set;
        queryURL(url);
    }

    if( action == "snmptable")
    {
	showLoading('loading');
	var url = "/admin/MibTool.do?method=snmpTable&host="+host+"&community="+community+"&oid="+oid+"&resultstr="+res;
	queryTableURL(url);
    }
}
function SubmitOID(frm) 
{
    var oidv = document.MibBrowserBean.oid.value;
    var oidtype = document.MibBrowserBean.oidtype.value;
    //opener.currentData(oidv,oidtype);
    //window.close();
}

//Desc start

function queryDescURL(url) 
{
    if (window.XMLHttpRequest) 
    { // Non-IE browsers
	req = new XMLHttpRequest();
	if(req)
	{
	    try 
	    {
		req.onreadystatechange = queryDescStateChange;
		req.open("GET", url, true);
	    } catch (e) {
		alert(e);
	    }
	    req.send(null);
	}
    } else if (window.ActiveXObject)  // IE
    {
	try
	{
	    req = new ActiveXObject("Msxml2.XMLHTTP");
	}catch(e)
	{
	    alert("ee "+e);
	    req = new ActiveXObject("Microsoft.XMLHTTP");
	}
    
	if (req) {
	    req.onreadystatechange = queryDescStateChange;
	    try
	    {
	        req.open("GET", url, true);
		
	    }catch(e)
	    {
		alert(e);
	    }
	    req.send(null);
	}
    }
}

function queryDescStateChange() 
{
    if (req.readyState == 4) 
    { // Complete
	//alert(req.getAllResponseHeaders())
	if (req.status == 200) 
	{ // OK response
	    //alert(document);
	   document.getElementById('theDescResponse').innerHTML = req.responseText;
	   //alert(req.responseText);
	   showLoading('descloading');

	} else {
	    alert("Problem: " + req.statusText);
	}
    }
}

//Desc end



// table query start


function queryTableURL(url) 
{
    if (window.XMLHttpRequest) 
    { // Non-IE browsers
	req = new XMLHttpRequest();
	if(req)
	{
	    try 
	    {
		req.onreadystatechange = queryTableStateChange;
		req.open("GET", url, true);
	    } catch (e) {
		alert(e);
	    }
	    req.send(null);
	}
    } else if (window.ActiveXObject)  // IE
    {
	try
	{
	    req = new ActiveXObject("Msxml2.XMLHTTP");
	}catch(e)
	{
	    alert("ee "+e);
	    req = new ActiveXObject("Microsoft.XMLHTTP");
	}
    
	if (req) {
	    req.onreadystatechange = queryTableStateChange;
	    try
	    {
	        req.open("GET", url, true);
		
	    }catch(e)
	    {
		alert(e);
	    }
	    req.send(null);
	}
    }
}

function queryTableStateChange() 
{
    if (req.readyState == 4) 
    { // Complete
	//alert(req.getAllResponseHeaders())
	if (req.status == 200) 
	{ // OK response
	    //alert(document);
	   showLoading('theTableResponse');
	   document.getElementById('theTableResponse').innerHTML = req.responseText;
	   //alert(req.responseText);
	   showLoading('loading');

	} else {
	    alert("Problem: " + req.statusText);
	}
    }
}


// table query end

function queryURL(url) 
{
    if (window.XMLHttpRequest) 
    { // Non-IE browsers
	req = new XMLHttpRequest();
	if(req)
	{
	    try 
	    {
		req.onreadystatechange = processStateChange;
		req.open("GET", url, true);
	    } catch (e) {
		alert("Problem in accessing url "+e);
	    }
	    req.send(null);
	}
    } else if (window.ActiveXObject)  // IE
    {
	try
	{
	    req = new ActiveXObject("Msxml2.XMLHTTP");
	}catch(e)
	{
	    alert("ee "+e);
	    req = new ActiveXObject("Microsoft.XMLHTTP");
	}
    
	if (req) 
	{
	    req.onreadystatechange = processStateChange;
	    try
	    {
	        req.open("GET", url, false);
		
	    }catch(e)
	    {
		alert("Problem iii "+e);
	    }
	    req.send(null);
	}
    }
}

function processStateChange() 
{
    if (req.readyState == 4) 
    { // Complete
	//alert(req.getAllResponseHeaders())
	if (req.status == 200) 
	{ // OK response
	    document.MibBrowserBean.resultstr.value=req.responseText;
	    //alert(document);
	   document.getElementById('theResponse').innerHTML = req.responseText;
	   //alert(req.responseText);
	   showLoading('loading');

	} else {
	    alert("Problem: " + req.statusText);
	}
    }
}

function showLoading(sShowElement)
{
    var id = document.getElementById(sShowElement);
    if (id.style.display == "none")
    {
    eval("id.style.display = 'block';");
    }
    else
    {
        eval("id.style.display = 'none';");
    }
}

function selectMib(url) 
{
    if (window.XMLHttpRequest) 
    { // Non-IE browsers
	req = new XMLHttpRequest();
	if(req)
	{
	    try 
	    {
		req.onreadystatechange = loadMibStateChange;
		req.open("GET", url, true);
	    } catch (e) {
		alert(e);
	    }
	    req.send(null);
	}
    } else if (window.ActiveXObject)  // IE
    {
	try
	{
	    req = new ActiveXObject("Msxml2.XMLHTTP");
	}catch(e)
	{
	    alert("ee "+e);
	    req = new ActiveXObject("Microsoft.XMLHTTP");
	}
    
	if (req) {
	    //req.onreadystatechange = processStateChange;
	    req.onreadystatechange = loadMibStateChange;
	    try
	    {
	        req.open("GET", url, true);
		
	    }catch(e)
	    {
		alert(e);
	    }
	    req.send(null);
	}
    }
}

function loadMibStateChange() 
{
    if (req.readyState == 4) 
    { // Complete
	//alert(req.getAllResponseHeaders())
	if (req.status == 200) 
	{ // OK response
	    //document.MIB.resultstr.value=req.responseText;
	    alert(req.responseText);
	   document.getElementById('LoadMIB').innerHTML = req.responseText;
	   //alert(req.responseText);
	   //showLoading('loading');

	} else {
	    alert("Problem: " + req.statusText);
	}
    }
}
function clearResult()
{
	showLoading('loading');
	var url = "/admin/MibTool.do?method=clearResult";
	queryURL(url);
}

function submitMib()
{
    document.MibBrowserBean.method.value="saveParameter";
    document.MibBrowserBean.submit();
}
function showV2()
{
    var id = document.getElementById("snmpV2");
    if( document.MibBrowserBean.SnmpVersion.value == "Snmp_Version2c")
    {

	eval("id.style.display = 'block';");
    }else
    {
	eval("id.style.display = 'none';");
    }
}
function editParams()
{
    showLoading("SNMPParameter");
    showV2();
}
function cancelParams()
{
    showLoading("SNMPParameter");
    var oid = document.MibBrowserBean.oid.value;
    var host = document.MibBrowserBean.host.value;
    var community = document.MibBrowserBean.community.value;
    var res = document.MibBrowserBean.resultstr.value;
    document.MibBrowserBean.reset();
    document.MibBrowserBean.oid.value = oid;
    document.MibBrowserBean.host.value = host;
    document.MibBrowserBean.community.value = community;
    document.MibBrowserBean.resultstr.value = res;

}
function submitSetParams()
{
	document.getElementById("setparameters").name="setparameters";
	document.MibBrowserBean.setparameters.value="<fmt:message key='OK'/>";
	document.MibBrowserBean.submit();
}
</script>
