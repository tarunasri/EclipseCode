<%-- $Id: MibBrowser.jsp,v 1.3 2007/05/10 15:07:51 srajeswari Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html> 
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/windowFunctions.js"></SCRIPT>
<script> 
function Toggle(row)
{
   var form = document.mibForm;
   var len = form.elements.length;
   for (var i = 0; i < len; i++)
   {
      var e = form.elements[i];
      if(e.name=="rowSelection" && e.checked && row!=e)
      {
         e.checked=false;
      }
   }
	 
}

function add()
{
   win_name="V3Setting";
   win_props="width=550,height=250,screenX=300,screenY=200,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";
   window.open('/setV3Parameters.do?actionToPerform=openNew&toPerform=Add',win_name,win_props);
}

function modify()
{
   var form = document.mibForm;	
   var len = form.elements.length;   	
   var sel="false";
   for (var i = 0; i < len; i++) 
   {
      var e = form.elements[i];
      if(e.name=="rowSelection" && e.checked)
      {
         var str  = e.value.split(":");
	 var user = str[0];
	 var host = str[1];
	 var level = str[2];
	 var port = str[3];
	 sel = "true";
      }
   }
   if(sel=='false')
   {
      alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.select.modifyentry")%>");
      return false;
   }
   if(level == 'NoAuth,NoPriv')
   {
	   alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.cannot.modify.level1")%>");
	   return false;
   }
   win_name="V3Setting";
   win_props="width=550,height=250,screenX=300,screenY=200,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";
   window.open('/setV3Parameters.do?actionToPerform=openExisting&toPerform=Modify&user='+user+'&host='+host+'&port='+port,win_name,win_props);
}

function deleteEntry()
{
	var form = document.mibForm;
	var len = form.elements.length;
	var sel="false";
	for (var i = 0; i < len; i++)
	{
		var e = form.elements[i];
		if(e.name=="rowSelection" && e.checked)
		{
			var str  = e.value.split(":");
			var user = str[0];
			var host = str[1];
			var port = str[3];
			sel="true";
		}
	}
	if(sel=='false')
	{
      alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.deleteentry")%>");
      return false;
   }
   win_name="V3 Setting";
   win_props="width=550,height=250,screenX=300,screenY=200,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";
   location.href = '/setV3Parameters.do?actionToPerform=deleteExisting&toPerform=Modify&user='+user+'&host='+host+'&port='+port;
      
}


function Sbtbutton1(name) 
{ 
/*	document.mibForm.pressType.value="Button"; 
	document.mibForm.pressName.value=name; 
	document.forms["mibForm"].selectedMib.value = name;
	document.forms["mibForm"].submit(); */
	var url = 'MibBrowser.do?selectedMib='+name+'&pressType=Button&pressName='+name;
	window.open(url,'_top')
} 

function Sbtbutton(name) 
{ 

	document.mibForm.pressType.value="Button"; 
	document.mibForm.pressName.value=name; 
	if ( (name=="snmpget") || (name=="snmpgetnext")|| (name=="snmpgetbulk")  || (name=="snmptable") || (name=="snmpset")) 
	{ 
 	var toid = document.mibForm.oid.value; 
		if ( (toid != null) && (toid!="null")&&(toid!="")&& (toid.length > 0)) 
			document.forms["mibForm"].submit(); 
		else 
                       alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.oid.notselected.errormessage")%>"); 
	}
        else if(name=="setparameter")	
	{
		var snmpVersion = document.mibForm.SnmpVersion.value; 
		var select = false;
		var form = document.mibForm;
		document.mibForm.selectedversion.value = snmpVersion;
		if(snmpVersion=="Snmp_Version3")
		{
	           var len = form.elements.length;
	           for(var i=0;i<len;i++)
		   {
		     var e = form.elements[i];
		     if(e.name=="rowSelection" && e.checked)
		     {
		       var str  = e.value.split(":");
                       var user = str[0];
                       var host = str[1];		   
		       var port = str[3];
	               form.selecteduser.value=user;
		       form.selectedhost.value=host;
		       form.host.value=host;
		       form.selectedport.value=port;
		       form.port.value=port;
		       form.selectedlevel.value=str[2];
		       select = true;
		     }
		   }
	           if(!select)	   
		   {
		      alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.select.v3entry")%>");
		      return false;
		   }
		}
		document.forms["mibForm"].submit();
	}
	else 
	{ 
		document.forms["mibForm"].submit(); 
	} 
} 
</script>

<%@ page import="org.w3c.dom.*"%> 
<%@page import="java.rmi.RemoteException" %> 
<%@page import="java.io.*" %> 
<%@page import="com.adventnet.nms.util.*" %> 
<%@page import= "java.util.*" %> 
<%@page import= "com.adventnet.snmp.snmp2.usm.USMUtils"%>
<%@page import= "com.adventnet.nms.util.NmsLogMgr" %> 
<%@page import= "com.adventnet.snmp.mibs.MibNode" %> 
<%@page import= "com.adventnet.snmp.mibs.MibModule" %> 
<%@page import= "com.adventnet.snmp.mibs.MibTC" %> 
<%@page import= "com.adventnet.snmp.mibs.MibTrap" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpVarBind" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpOID" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpVar" %> 
<%@page import="com.adventnet.snmp.beans.SnmpTarget" %>
<%@page import="com.adventnet.snmp.snmp2.usm.USMUserEntry" %>
<%@page import="com.adventnet.snmp.snmp2.usm.USMUserTable"%>
<%@page import= "com.adventnet.utils.*" %>
<%@page import= "com.adventnet.snmp.*" %> 
<%@page import= "com.adventnet.nms.webclient.mibbrowser.MibNodeConverter"%> 
<%@page import= "com.adventnet.nms.util.ElementTree"%> 
<%@page import= "com.adventnet.snmp.snmp2.SecurityProvider"%>
<%@page import= "com.adventnet.snmp.snmp2.SnmpEngineEntry"%>
<jsp:useBean id="mibDetail" class="com.adventnet.nms.jsp.MibBrowserMain" scope="session" /> 

<% String treeStyle= null; 
String oidtree=null; 
parameters = new Properties();    
syntax=""; 
access=""; 
status=""; 
index=""; 
desc=""; 
isTable="false";
MibNode mibnode= null;


for(Enumeration parameterNames = request.getParameterNames(); parameterNames.hasMoreElements();) 
{ 
	String param = (String)parameterNames.nextElement(); 
	String value = (String)request.getParameter(param); 
	if (value == null) value=""; 
	parameters.put(param,value);
}
if(parameters.containsKey("selecteduser"))
{
   request.setAttribute("selecteduser",parameters.get("selecteduser"));
}
if(parameters.containsKey("selectedhost"))
{
   request.setAttribute("selectedhost",parameters.get("selectedhost"));
}
if(parameters.containsKey("selectedport"))
{
   request.setAttribute("selectedport",parameters.get("selectedport"));
}

if(parameters.containsKey("selectedlevel"))
{
   request.setAttribute("selectedlevel",parameters.get("selectedlevel"));
}
if(parameters.containsKey("selectedversion"))
{
   request.setAttribute("selectedversion",parameters.get("selectedversion"));
}
if((parameters.get("selectedversion")==null)||(parameters.get("selectedversion")).equals(""))
{
   parameters.put("selectedversion","Snmp_Version1");
}

if((parameters.getProperty("host")!=null) && ((parameters.getProperty("host").length()) > 0)) 
host=parameters.getProperty("host"); 
else 
host="localhost"; 

if((parameters.getProperty("port")!=null) && ((parameters.getProperty("port").length()) > 0)) 
port=parameters.getProperty("port"); 
else 
port="161"; 

if((parameters.getProperty("community")!=null) && ((parameters.getProperty("community").length()) > 0)) 
community= parameters.getProperty("community"); 
else 
community="public"; 

if((parameters.getProperty("wcommunity")!=null) && ((parameters.getProperty("wcommunity").length()) > 0)) 
wcommunity= parameters.getProperty("wcommunity"); 
else 
wcommunity=""; 

if((parameters.getProperty("contextname")!=null) && ((parameters.getProperty("contextname").length()) > 0))
contextname= parameters.getProperty("contextname");
else
contextname="";

if((parameters.getProperty("setvalue")!=null) && ((parameters.getProperty("setvalue").length()) > 0)) 
setvalue=parameters.getProperty("setvalue"); 
else
setvalue=""; 

if((parameters.getProperty("resultstr")!=null) && ((parameters.getProperty("resultstr").length()) > 0)) 
resultstr=parameters.getProperty("resultstr"); 
else
resultstr="";

if((parameters.getProperty("oid")!=null) && ((parameters.getProperty("oid").length()) > 0)) 
oid=parameters.getProperty("oid"); 
else oid=""; 

if((parameters.getProperty("syntax")!=null) && ((parameters.getProperty("syntax").length()) > 0))
syntax=parameters.getProperty("syntax"); 
else
syntax=""; 

if((parameters.getProperty("access")!=null) && ((parameters.getProperty("access").length()) > 0)) 
access=parameters.getProperty("access"); 
else
access=""; 

if((parameters.getProperty("status")!=null) && ((parameters.getProperty("status").length()) > 0))
status=parameters.getProperty("status"); 
else
status=""; 

if((parameters.getProperty("index")!=null) && ((parameters.getProperty("index").length()) > 0)) 
index=parameters.getProperty("index"); 
else
index=""; 

if((parameters.getProperty("desc")!=null) && ((parameters.getProperty("desc").length()) > 0)) 
desc=parameters.getProperty("desc"); 
else
desc=""; 

oidtree=oid; 
userName = (String)session.getAttribute("userName");

%>



 
<BODY MARGINHEIGHT=0 MARGINWIDTH=0 LEFTMARGIN=0 TOPMARGIN=0 >

<img src="../images/space.png" height=4>
<jsp:useBean id="table" class="java.util.Hashtable" scope="request"/>

<%!
    static String HELP_URL_KEY ="HTMLUI_MIBManager_Client";
%>

<% 
    table.put("menuFileName","mibmenu");
    request.setAttribute("HELP_URL_KEY",HELP_URL_KEY);
%>

<form name="mibForm" action="/MibBrowser.do" method="post">
<input type="hidden" name="selecteduser" value='<c:out value="${selecteduser}"/>'> 
<input type="hidden" name="selectedlevel" value='<c:out value="${selectedlevel}"/>'>
<input type="hidden" name="selectedversion" value='<c:out value="${selectedversion}"/>'>
<input type="hidden" name="selectedhost" value='<c:out value="${selectedhost}"/>'>
<input type="hidden" name="selectedport" value='<c:out value="${selectedport}"/>'>
<% 
String compiledFile="false";
String OverWrite="false";
if (parameters.containsKey("CompiledFile") && ((parameters.getProperty("CompiledFile")).equals("true")) )
{
	compiledFile="true";
}
if (parameters.containsKey("OverWrite") &&((parameters.getProperty("OverWrite")).equals("true"))  )
{
	OverWrite="true";
}

if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("unLoad"))) 
{ 
	selectedMib=parameters.getProperty("selectedMib"); 
	parameters.put("unLoadMib",selectedMib); 
	if ( (selectedMib.indexOf("cmi")!= -1) ||(selectedMib.indexOf("cds")!= -1) ||(selectedMib.indexOf("txt")!= -1) ) 
	{
		int t = selectedMib.indexOf(".");
		String st = selectedMib;
		selectedMib= selectedMib.substring(0,t);
		parameters.put("selectedMib",selectedMib);
		parameters.put("unLoadMib",selectedMib);
	} 
	resultstr=mibDetail.unLoad(parameters)+"\n"+resultstr; 
	selectedMib=mibDetail.getModuleName(); 
	parameters.put("selectedMib",selectedMib); 
} 




selectedMib = parameters.getProperty("selectedMib");



if(selectedMib == null)
{
    selectedMib = (String)request.getSession().getAttribute("selectedMib");
}


if ( selectedMib != null && ((selectedMib.length()) > 0)) 
{ 
        
	prevselectedMib=parameters.getProperty("prevselectedMib");

    	if (!selectedMib.equalsIgnoreCase(prevselectedMib)) 
	{
		if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("setaddMib"))) 	     
        { 	     
            parameters.put("nodesToOpen","");
			syntax=""; 
			access=""; 
			status=""; 
			index=""; 
			desc=""; 
			oid=""; 
		}
		if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("selectedMib"))) 	 
		{ 
			parameters.put("nodesToOpen",""); 	     

			syntax=""; 
			access=""; 
			status=""; 
			index=""; 
			desc=""; 
			oid="";
		}
                
                
                resultstr=mibDetail.reloadMib(userName,selectedMib,compiledFile,OverWrite) +"\n" + resultstr;
                parameters.put("selectedMib",selectedMib);
                request.getSession().setAttribute("selectedMib",selectedMib);
                
	}
} 
else
{
    
    
	 resultstr=mibDetail.reloadMib(userName,"RFC1213-MIB",compiledFile,OverWrite)+resultstr;
         selectedMib="RFC1213-MIB"; 

         parameters.put("selectedMib","RFC1213-MIB"); 
}    
if ((parameters.getProperty("pressType")!=null) && ((parameters.getProperty("pressType").length()) > 0) && ((parameters.getProperty("pressType")).equals("Treelink"))) 
{ 

	mibnode= mibDetail.getNodeForString(parameters.getProperty("type")); 

	if (mibnode!=null) 
	{ 
		oid=mibnode.getOIDString();
		oidtree=oid; 	
		status=mibnode.getStatus();
                
		if (status==null)
			status="--"; 
		access= mibnode.printAccess(); 
		if (access==null) 					
			access="--"; 
		Vector index1 = mibnode.getIndexNames();             
		StringBuffer temp = new StringBuffer(); 
		if (index1 !=null) 
		{ 
			for(int i=0;i< index1.size();i++) 
			{ 
				temp.append(String.valueOf(index1.elementAt(i))); 
			} 
		} 
		index=temp.toString(); 
		if (index==null) 
			index="--"; 
		desc=mibnode.getDescription();             
		if (desc==null) 
			desc="--"; 
        else if(desc.trim().startsWith("\""))
            desc=desc.substring(1,(desc.length()-1)); 
		if (mibnode.getSyntax()!=null) 
			syntax=mibnode.getSyntax().getDescription(); 
		else 
                {               
			syntax="--"; 
                }
                                        
                                                                       
                        
	} 
	else 
	{ 
		MibModule mm = mibDetail.getModule();

        MibTC mtc =(MibTC) mm.getMibTC(String.valueOf(parameters.getProperty("type"))); 
		if (mtc!=null) 
		{ 
			oid=mtc.getName(); 
			oidtree=oid; 
			status=mtc.getStatus(); 
			if (status==null) 

				status="--"; 
			if (mtc.getSyntax()!=null) 
				syntax=mtc.getSyntax().getDescription(); 
			else 
				syntax="--"; 
			desc=mtc.getTCDescription();             
			if (desc==null) 
				desc="--"; 
            else if(desc.trim().startsWith("\""))
                desc=desc.substring(1,(desc.length()-1)); 
			index="--"; 
			access="--";    
		} 
		else 
		{ 
			MibTrap mtrap =(MibTrap) mm.getMibTrap(String.valueOf(parameters.getProperty("type"))); 
			if (mtrap!=null) 
			{ 
				oid=mtrap.getName(); 
				oidtree=oid; 
				desc=mtrap.toTagString();             
				if (desc==null) 
					desc="--"; 
                else if(desc.trim().startsWith("\""))
                    desc=desc.substring(1,(desc.length()-1)); 
				status="--"; 
				syntax="--"; 
				index="--"; 
				access="--";    
			} 
			else 
			{ 
				if (parameters.getProperty("type").equals("TRAPS") || parameters.getProperty("type").equals("TEXTUALCONVENTIONS")) 
				{ 
					oid = parameters.getProperty("type"); 
					oidtree=oid; 
					desc="--"; 
					status="--"; 
					syntax="--"; 
					index="--"; 
					access="--";    
				}    
			} 
		} 
	}	     

}



if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && ((parameters.getProperty("pressName").equals("Parameters")) || (parameters.getProperty("pressName").equals("setversion"))) ) 
{     
	data = new Properties(); 
    data= mibDetail.getTargetDetail(userName); 
    if((parameters.getProperty("pressName").equals("setversion")))
    {
        //   out.println(".....data"+data+"..."); 
        data.put("SnmpVersion",parameters.get("SnmpVersion")); 
    }
    String sel=" ";
    if (data!=null) {

%>







<p align="center">
    <TABLE BORDER=0 width="500" align="center" CELLPADDING=2 CELLSPACING=1 class="htableBorder"> 
	<tr>
	<td colspan="2" class="header1Bg" height="30"><span class="header1"><%=NmsUtil.GetString("weblient.common.mibbrowser.setparameters")%></span></td>
	</tr>
      <TR class="propertyLeftBg" ID=high> <TD height="25" width="200"> <span class="text"> <%=NmsUtil.GetString("weblient.common.mibbrowser.parameters.snmpversion")%></span></TD> 
	<TD class="propertyBg"><SELECT NAME="SnmpVersion" class="formStyle" onChange="Sbtbutton('setversion')">

<%
if ((data.getProperty("SnmpVersion")==null) || (data.getProperty("SnmpVersion")=="") || (data.getProperty("SnmpVersion").equals("Snmp_Version1"))){ 			
%>

       <OPTION value="Snmp_Version1" SELECTED ><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion1")%></OPTION>
       <OPTION value="Snmp_Version2c"><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion2c")%></OPTION>
       <OPTION value="Snmp_Version3" ><%=NmsUtil.GetString("webclient.common.mibbrowser.snmpversion3")%></OPTION>
<%
}
else if(data.getProperty("SnmpVersion").equals("Snmp_Version2c"))
{
%>

      <OPTION value="Snmp_Version2c" SELECTED ><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion2c")%></OPTION>
      <OPTION value="Snmp_Version1"><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion1")%></OPTION> 
      <OPTION value="Snmp_Version3" ><%=NmsUtil.GetString("webclient.common.mibbrowser.snmpversion3")%></OPTION>

<%
}
else if(data.getProperty("SnmpVersion").equals("Snmp_Version3"))
{
%>
       <OPTION value="Snmp_Version1" ><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion1")%></OPTION>
       <OPTION value="Snmp_Version2c"><%=NmsUtil.GetString("weblient.common.mibbrowser.snmpversion2c")%></OPTION>
       <OPTION value="Snmp_Version3" SELECTED><%=NmsUtil.GetString("webclient.common.mibbrowser.snmpversion3")%></OPTION>
<%
}
%>
	
     </SELECT></TD>
    </TR>

    <TR ID=high>
        <TD height="25" class="propertyLeftBg"> <span class="text"> <%=NmsUtil.GetString("weblient.common.mibbrowser.snmpPort")%></span></TD> 

	<TD class="propertyBg"><SELECT NAME=port class="formstyle">

<%

String listOfPorts = data.getProperty("otherPorts");
if(listOfPorts.indexOf("|") != -1)
{
	StringTokenizer st = new StringTokenizer(listOfPorts,"|");
	while(st.hasMoreTokens())
	{
	  String val = st.nextToken();
%> 

	<OPTION value=<%=val%>><%=val%></OPTION> 
<%
	}
}
else
{
	String val = listOfPorts;
%> 
	<OPTION value=<%=val%>><%=val%></OPTION>
<%
}
%>
</SELECT></TD>




    </TR>


    <TR ID=high>
        <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.timeoutsecs")%></span></TD> 
	<TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=timeout VALUE="<%=data.getProperty("timeout")%>" class="formstyle"></TD>
    </TR> 
    <TR ID=high>
         <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.retries")%></span></TD> 
	 <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=retries VALUE="<%=data.getProperty("retries")%>" class="formstyle"></TD>
    </TR> 

<%	
if ((data.getProperty("SnmpVersion")==null) || (data.getProperty("SnmpVersion")=="") || (data.getProperty("SnmpVersion").equals("Snmp_Version1"))){ 
%>	
    <TR ID=high>
         <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.parameters.maxrepetitions")%></span></TD>
	 <TD class="propertyBg"><span class="text"><%=data.getProperty("maxrep")%></text></TD>
    </TR> 			
    <TR ID=high>
         <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.nonrepeaters")%></span></TD>
 	 <TD class="propertyBg"><span class="text"><%=data.getProperty("nonrep")%></text></TD>
    </TR> 
 

<%
}
else if(data.getProperty("SnmpVersion").equals("Snmp_Version2c"))
{
%>

    <TR ID=high>
         <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.parameters.maxrepetitions")%></span></TD> 			
         <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=maxrep VALUE="<%=data.getProperty("maxrep")%>" class="formstyle"></TD>
    </TR> 
    <TR ID=high>
         <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.nonrepeaters")%></span></TD>
         <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=nonrep VALUE="<%=data.getProperty("nonrep")%>" class="formstyle"></TD>
    </TR>
<%
}
else if(data.getProperty("SnmpVersion").equals("Snmp_Version3"))
{
%>
	<TR ID=high>
          <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.parameters.maxrepetitions")%></span></TD>
          <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=maxrep VALUE="<%=data.getProperty("maxrep")%>" class="formstyle"></TD>
	</TR>
        <TR ID=high>
          <TD height="25" class="propertyLeftBg"> <span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.nonrepeaters")%></span></TD>
	  <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=nonrep VALUE="<%=data.getProperty("nonrep")%>" class="formstyle"></TD>
	</TR>
<%--	<TR ID =high>
	   <TD height="25" class="propertyLeftBg"><input type="checkbox" name="broadcastaddr"><span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.validatebroadcastaddress")%></span></TD>
	   <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=nonrep VALUE="<%=data.getProperty("broadcastaddress")%>" class="formstyle"></TD>
	</TR>
	<TR ID =high>
           <TD height="25" class="propertyLeftBg"><span class="header1"><%=NmsUtil.GetString("weblient.common.mibbrowser.v3options")%></span></TD>
            <TD class="propertyBg"></TD>
         </TR>
	 <TR ID =high>
	   <TD height="25" class="propertyLeftBg"><span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.contextname")%></span></TD>
	   <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=nonrep VALUE="<%=data.getProperty("contextName")%>" class="formstyle"></TD>
	 </TR>
	 <TR ID =high>
            <TD height="25" class="propertyLeftBg"><span class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.contextid")%></span></TD>
            <TD class="propertyBg"><INPUT TYPE=TEXT SIZE=30 NAME=nonrep VALUE="<%=data.getProperty("contextId")%>" class="formstyle"></TD>
         </TR>--%>
<%
}
%>
<tr>
<td class="propertyLeftBg">&nbsp;
</td>
<td class="propertyBg"><INPUT TYPE=button NAME="setparameters" VALUE="<%=NmsUtil.GetString("weblient.common.mibbrowser.ok")%>" onClick="Sbtbutton('setparameter')"  class="button">
</td>
</tr>
</TABLE>
</p>
<%
if(data.containsKey("SnmpVersion")&&(data.getProperty("SnmpVersion")).equals("Snmp_Version3"))
{
%>
	<p align="center">
	<tr id=high>
           <TD height="25" class="header1" colspan="2"><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting")%></TD>
        </tr>
<%--	<tr id=high>
	       <TD><input type="checkbox" name="saveToFile"><span class="text"><%=NmsUtil.GetString("Save To File")%>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="saveToDB"><span><%=NmsUtil.GetString("Save To Database")%></span></td>
	</tr>--%>
	<tr>
	<td colspan="2">
           <TABLE BORDER="0" width="100%" align="center" CELLPADDING="2" CELLSPACING="1" class="htableBorder">
	   <tr class="header1Bg" nowrap>
	   <td></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.username")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.securitylevel")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.authprotocol")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.authpassword")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.privprotocol")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.privpassword")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.targethost")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.port")%></td><td class="text" nowrap><%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.engineid")%></td>
	   </tr>
	   <%
	   SnmpTarget target = new SnmpTarget();
           SecurityProvider sp = target.getSecurityProvider();
	   USMUserTable tab = (USMUserTable)sp.getTable(3);
	   Enumeration ent = tab.getEnumeration();
	   int length=12;
	   while(ent.hasMoreElements())
	   {
	      USMUserEntry entry = (USMUserEntry)ent.nextElement();
	      String user = new String(entry.getUserName());
              String level = new String(entry.getSecurityName());
	      if(level.equals("noAuthUser"))
	      {
	         level = "NoAuth,NoPriv";
	      }
	      else if(level.equals("authUser"))
	      {
	         level = "Auth,NoPriv";
	      }
	      else if(level.equals("privUser"))
	      {
	         level = "Auth,Priv";
	      }

	      int authProtocol = entry.getAuthProtocol();
	      String authpro = "";
	      if(authProtocol == target.MD5_AUTH)
	      {
	         authpro = "MD5";	 
	      }
	      else if(authProtocol == target.SHA_AUTH)
	      {
	         authpro = "SHA";
	      }
	      
	      String authPwd = new String(entry.getAuthPassword());
	      
	      int privProtocol = entry.getPrivProtocol();
              String privpro = "";
	      if(privProtocol == USMUserEntry.CBC_DES)
	      {
	         privpro = "CBC_DES";
	      }

	      String privPwd = new String(entry.getPrivPassword());
              SnmpEngineEntry eentry = entry.getEngineEntry();
	      String host = eentry.getRemoteHost();
	      int port = eentry.getRemotePort();
	      byte[] eng = entry.getEngineID();
	       
	      StringTokenizer a= new StringTokenizer(USMUtils.printOctets(eng,length)," ");
              String engineId = "";
              while(a.hasMoreTokens())
              {
                 engineId = engineId+(String)a.nextElement();
              }
              
	      request.setAttribute("user",user);
	      request.setAttribute("host",host);
	      request.setAttribute("port",String.valueOf(port));
	      request.setAttribute("level",level);
	      request.setAttribute("authprotocol",authpro);
	      request.setAttribute("authpwd",authPwd);
	      request.setAttribute("privprotocol",privpro);
	      request.setAttribute("privpwd",privPwd);
	      request.setAttribute("engId",eng);
	      request.setAttribute("engineId",engineId);
   %>
	   <tr>
	   <td><input type="checkbox" name="rowSelection" nowrap value="<c:out value='${user}:${host}:${level}:${port}'/>" onclick="javascript:Toggle(this)"></td>
	   <td class="text"><c:out value="${user}"/></td>
	   <td class="text"><c:out value="${level}"/></td>
	   <td class="text"><c:out value="${authprotocol}"/></td>
	   <td class="text"><c:out value="${authpwd}"/></td>
	   <td class="text"><c:out value="${privprotocol}"/></td>
	   <td class="text"><c:out value="${privpwd}"/></td>
	   <td class="text"><c:out value="${host}"/></td>
	   <td class="text"><c:out value="${port}"/></td>
	   <td class="text" nowrap><c:out value="${engineId}"/></td>
	   </tr>
	   <%
	   }
	   %>
	   
	   </TABLE>
	</td>
	</tr>
	<tr>
		<TD height="15" align="center"><input type="button" name="Add V3 Entry" class="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.add")%>" onclick="javascript:add()">&nbsp;&nbsp;&nbsp;<input type="button" name="Modify V3 Entry" class="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.modify")%>" onclick="javascript:modify()">&nbsp;&nbsp;&nbsp;<input type="button" name="Delete V3 Entry" class="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.v3setting.delete")%>" onclick="javascript:deleteEntry()"></td>
	</tr>
	</p>
<%
}
%>
  <INPUT TYPE="hidden" NAME="nodeToOpen"  value="<%=parameters.getProperty("prevnodeToOpen")%>"> 
  <INPUT TYPE="hidden" NAME="nodesToOpen"  value="<%=parameters.getProperty("nodesToOpen")%>"> 
  <INPUT TYPE="hidden" NAME="prevnodeToOpen"  value="<%=nodeToOpen%>" > 
  <INPUT TYPE="hidden" NAME="pressType"  > 
  <INPUT TYPE="hidden" NAME="pressName"  > 
  <INPUT TYPE="hidden" NAME="host"  value="<%=parameters.getProperty("host")%>"> 
  <INPUT TYPE="hidden" NAME="port"  value="<%=parameters.getProperty("port")%>"> 
  <INPUT TYPE="hidden" NAME="community"  value="<%=parameters.getProperty("community")%>"> 
  <INPUT TYPE="hidden" NAME="resultstr"  value="<%=parameters.getProperty("resultstr")%>"> 
  <INPUT TYPE="hidden" NAME="wcommunity"  value="<%=parameters.getProperty("wcommunity")%>"> 
  <INPUT TYPE="hidden" NAME="contextname"  value="<%=parameters.getProperty("contextname")%>">
  <INPUT TYPE="hidden" NAME="setvalue"  value="<%=parameters.getProperty("setvalue")%>"> 
  <INPUT TYPE="hidden" NAME="oid"  value="<%=parameters.getProperty("oid")%>">
  <INPUT TYPE="hidden" NAME="prevselectedMib" value="<%=parameters.getProperty("selectedMib")%>"> 
  <INPUT TYPE="hidden" NAME="syntax"  value="<%=parameters.getProperty("syntax")%>"> 
  <INPUT TYPE="hidden" NAME="access"  value="<%=parameters.getProperty("access")%>"> 
  <INPUT TYPE="hidden" NAME="status"  value="<%=parameters.getProperty("status")%>"> 
  <INPUT TYPE="hidden" NAME="index"  value="<%=parameters.getProperty("index")%>"> 
  <INPUT TYPE="hidden" NAME="desc"  value="<%=parameters.getProperty("desc")%>"> 
</CENTER> 
</FORM> 
</BODY> 

<% 
} 
  else 
  { 
%> 
   <%=NmsUtil.GetString("weblient.common.mibbrowser.datanotloaded")%></form></body> 
<% 
  }  		 
} 
else if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("addmib")))
{
    selectedMib=(String)parameters.getProperty("selectedMib"); 
    if ((selectedMib==null) || (selectedMib.equals("null")) || (selectedMib.equals("")))
	selectedMib="RFC1213-MIB";
    File mibdir = new File(NmsUtil.MIBDIR);

%>
<p align="center">

   <TABLE BORDER="0" width="500" align="center" CELLPADDING="2" CELLSPACING="1" class="htableBorder">
<tr>
<td class="header1Bg" height="30" colspan="2">
	<span class="header1"><%= NmsUtil.GetString("weblient.common.mibbrowser.loadmib") %></span>
</td>

</tr>
     <TR><TD class="propertyLeftBg"" ALIGN="center" height="180" width="200">
	<SELECT NAME="selectedMib" SIZE=10 class="formStyle">

<%
   if(!mibdir.isDirectory())
   {
	out.println(java.text.MessageFormat.format(NmsUtil.GetString("weblient.common.mibbrowser.notadir"),new String[]{""+NmsUtil.MIBDIR}));
   }        
	String str[] = mibdir.list();
	for(int i = 0;i < str.length;i++)
	{
		if (selectedMib!=null)
		{ 					
			if (str[i].equalsIgnoreCase(selectedMib))
			{ 
%> 

	<OPTION SELECTED><%=str[i]%></OPTION> 

<%
   } 
   else 
   { 
%> 

	<OPTION><%=str[i]%></OPTION> 

<% 
   }   
 } 
 else 
 { 

%> 

       <OPTION SELECTED><%=str[i]%></OPTION> 

<% 
  } 
} 
%> 

      </SELECT></TD>
      
	<td class="propertyBg"><span class="text">
      		<INPUT TYPE="CHECKBOX" NAME ="CompiledFile" value="true" ><%=NmsUtil.GetString("weblient.common.mibbrowser.loadmibs.compiledfiles")%> <br>			                   
      
		<INPUT TYPE="CHECKBOX" NAME ="OverWrite" value="true"><%=NmsUtil.GetString("weblient.common.mibbrowser.overwrite.compiledfiles")%></span>
		<br>
		<br>
		
		<INPUT TYPE=button NAME=setaddMib VALUE="<%=NmsUtil.GetString("weblient.common.mibbrowser.load")%>" onClick="Sbtbutton('setaddMib')"  class="button"> 				

	<INPUT TYPE=button NAME=backaddMib VALUE="<%=NmsUtil.GetString("weblient.common.mibbrowser.cancel")%>" onClick="history.back()" class="button">
	</td>
      </tr>

 </TABLE>
</p>	
 <BR> 		
 <INPUT TYPE="hidden" NAME="nodeToOpen"  value="<%=parameters.getProperty("prevnodeToOpen")%>"> 
 <BR>
 <INPUT TYPE="hidden" NAME="nodesToOpen"  value="<%=parameters.getProperty("nodesToOpen")%>"> 
 <INPUT TYPE="hidden" NAME="prevnodeToOpen"  value="<%=nodeToOpen%>" > 
 <INPUT TYPE="hidden" NAME="pressType"  > 
 <INPUT TYPE="hidden" NAME="pressName"  > 
 <INPUT TYPE="hidden" NAME="resultstr"  value="<%=parameters.getProperty("resultstr")%>"> 
 <INPUT TYPE="hidden" NAME="host"  value="<%=parameters.getProperty("host")%>"> 
 <INPUT TYPE="hidden" NAME="port"  value="<%=parameters.getProperty("port")%>">
 <INPUT TYPE="hidden" NAME="community"  value="<%=parameters.getProperty("community")%>"> 
 <INPUT TYPE="hidden" NAME="wcommunity"  value="<%=parameters.getProperty("wcommunity")%>"> 
 <INPUT TYPE="hidden" NAME="contextname" value="<%=parameters.getProperty("contextname")%>">
 <INPUT TYPE="hidden" NAME="setvalue"  value="<%=parameters.getProperty("setvalue")%>"> 
 <INPUT TYPE="hidden" NAME="oid"  value="<%=parameters.getProperty("oid")%>"> 
 <INPUT TYPE="hidden" NAME="prevselectedMib" value="<%=parameters.getProperty("selectedMib")%>"> 
 <INPUT TYPE="hidden" NAME="syntax"  value="<%=parameters.getProperty("syntax")%>"> 
 <INPUT TYPE="hidden" NAME="access"  value="<%=parameters.getProperty("access")%>"> 
 <INPUT TYPE="hidden" NAME="status"  value="<%=parameters.getProperty("status")%>"> 
 <INPUT TYPE="hidden" NAME="index"  value="<%=parameters.getProperty("index")%>"> 
 <INPUT TYPE="hidden" NAME="desc"  value="<%=parameters.getProperty("desc")%>"> 
 </CENTER>
 </FORM>
 </BODY>

<%
            
} 
else if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("snmptable"))) 
{ 
	String res=null; 
	data = new Properties();
	data= mibDetail.snmpTable(parameters,userName); 
	if (data!=null) 
	{ 						 
		if (data.getProperty("tablestr")!=null) 
			res=data.getProperty("tablestr"); 
	} 
	data=null;
	if (res==null) 
		res="Selected Node is not a Table Node";
%> 


  <TABLE align="center" border="0" cellspacing="1" cellpadding="1">
	
	<tr>
		<td height="30" class="header2">     <%=NmsUtil.GetString("weblient.common.mibbrowser.tablefor")%> <%=parameters.getProperty("oid")%>

		</td>
	</tr>
    <TR>
        <TD class="text"> 
      

<% 
	out.println(res); 
%>    

      
      </TD>
    </TR>
  </TABLE>

  
  <INPUT TYPE="hidden" NAME="nodeToOpen"  value="<%=parameters.getProperty("prevnodeToOpen")%>"> 
  <INPUT TYPE="hidden" NAME="nodesToOpen"  value="<%=parameters.getProperty("nodesToOpen")%>"> 
  <INPUT TYPE="hidden" NAME="prevnodeToOpen"  value="<%=nodeToOpen%>" > 
  <INPUT TYPE="hidden" NAME="pressType"  > 
  <INPUT TYPE="hidden" NAME="pressName"  > 
  <INPUT TYPE="hidden" NAME="resultstr"  value="<%=parameters.getProperty("resultstr")%>"> 
  <INPUT TYPE="hidden" NAME="host"  value="<%=parameters.getProperty("host")%>"> 
  <INPUT TYPE="hidden" NAME="port"  value="<%=parameters.getProperty("port")%>">
  <INPUT TYPE="hidden" NAME="community"  value="<%=parameters.getProperty("community")%>"> 
  <INPUT TYPE="hidden" NAME="wcommunity"  value="<%=parameters.getProperty("wcommunity")%>"> 
  <INPUT TYPE="hidden" NAME="contextname"  value="<%=parameters.getProperty("contextname")%>">
  <INPUT TYPE="hidden" NAME="setvalue"  value="<%=parameters.getProperty("setvalue")%>"> 
  <INPUT TYPE="hidden" NAME="oid"  value="<%=parameters.getProperty("oid")%>"> 
  <INPUT TYPE="hidden" NAME="selectedMib" value="<%=parameters.getProperty("selectedMib")%>"> 
  <INPUT TYPE="hidden" NAME="syntax"  value="<%=parameters.getProperty("syntax")%>"> 
  <INPUT TYPE="hidden" NAME="access"  value="<%=parameters.getProperty("access")%>"> 
  <INPUT TYPE="hidden" NAME="status"  value="<%=parameters.getProperty("status")%>"> 
  <INPUT TYPE="hidden" NAME="index"  value="<%=parameters.getProperty("index")%>"> 
  <INPUT TYPE="hidden" NAME="desc"  value="<%=parameters.getProperty("desc")%>"> 
</CENTER> 
</FORM> 
</BODY> 

<% 

}	    
else 
{ 
 StringBuffer sbtemp=null; 
 if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) ) 		     
	{ data = new Properties(); 	

		if (parameters.containsKey("pressName")) 
		{ 
			if (parameters.getProperty("pressName").equalsIgnoreCase("clear")) 
			{ 
				resultstr=" "; 					     
				parameters.put("resultstr",resultstr);

			} 
            else if (parameters.getProperty("pressName").equalsIgnoreCase("setparameter")) 
             {
	       				resultstr= mibDetail.setTargetDetail(userName,parameters); 
			   
             }

            else if (parameters.getProperty("pressName").equalsIgnoreCase("snmpget")) 
            {
	       				data= mibDetail.snmpGet(parameters,userName); 

            }
            else if (parameters.getProperty("pressName").equalsIgnoreCase("snmpgetnext")) 
            {
	       				data= mibDetail.snmpGetNext(parameters,userName); 
					if ((data.getProperty("oid")!=null) && ((data.getProperty("oid").length()) > 0)) 
						oid=data.getProperty("oid"); 
					oidtree=oid; 

				

mibnode= mibDetail.getNodeForString(String.valueOf(data.getProperty("oid"))); 
                 	if (mibnode!=null) 
					{ 
						String temp11=mibnode.getNumberedOIDString(); 
		//out.println(temp11+"z......z");
						Vector childList = new Vector();
						Vector nodestoopen=new Vector();
						StringTokenizer st = new StringTokenizer(temp11,".",false);
						StringBuffer sb = new StringBuffer(); 
						sbtemp = new StringBuffer(parameters.getProperty("nodesToOpen"));
						StringTokenizer nsTO = new StringTokenizer(sbtemp.toString());
						while (nsTO.hasMoreElements())
						{
							nodestoopen.addElement(nsTO.nextElement());
						}

						String sbcheck =new String(parameters.getProperty("nodesToOpen")); 
						int counter =0;
						while (st.hasMoreElements())
						{
							sb.append(".");

							sb.append(st.nextElement());

							childList.addElement(sb.toString());
							counter++;
						}
						int len = childList.size();
						len=len-1;
						childList.removeElement(childList.lastElement());
						for (int i=1;i < len;i++) 
						{
							if (!nodestoopen.contains(String.valueOf(childList.elementAt(i)))) 
							{

								sbtemp.append(" "); 
								sbtemp.append(String.valueOf(childList.elementAt(i)));

							}
						}
						parameters.put("nodesToOpen",sbtemp.toString());

						status=mibnode.getStatus(); 
						if (status==null) 													   
							status="--"; 
						access= mibnode.printAccess(); 
						if (access==null) 													
							access="--";
						Vector index1 = mibnode.getIndexNames();             
						StringBuffer temp = new StringBuffer(); 
						if (index1 !=null) 
						{ 
							for(int i=0;i< index1.size();i++) 
							{ 
								temp.append(String.valueOf(index1.elementAt(i))); 
							} 
						} 
						index=temp.toString(); 
						if (index==null) 
							index="--"; 
						desc=mibnode.getDescription();             

						if (desc==null) 
							desc="--"; 
                        else if(desc.trim().startsWith("\""))
                            desc=desc.substring(1,(desc.length()-1));
						if (mibnode.getSyntax()!=null) 
							syntax=mibnode.getSyntax().getDescription(); 
						else 
							syntax="--"; 
					} 
					else 
					{ 
						//out.println("oid "+oid); 
						//  resultstr="Invalid OID returned by GETNEXT.."+oid+"00000000.." +"\n" +resultstr; 
					}

            }

            else if (parameters.getProperty("pressName").equalsIgnoreCase("snmpgetbulk")) 
            {
	       				data= mibDetail.snmpGetBulk(parameters,userName); 

            }

            else if (parameters.getProperty("pressName").equalsIgnoreCase("snmpset")) 
            {
	       				data= mibDetail.snmpSet(parameters,userName); 

            }

					if ((data!=null) && (data.getProperty("resultstr")!=null)) 
						resultstr=data.getProperty("resultstr") ; 

					if ((data!=null) && (data.getProperty("oid")!=null) && ((data.getProperty("oid").length()) > 0)) 
                     {
						oid=data.getProperty("oid"); 
					oidtree=oid; 
                   }


        data=null;
		}


	}  
	treeState = new Vector();
	if (parameters.containsKey("treeStyle")) 
		treeStyle=parameters.getProperty("treeStyle"); 
	if(treeStyle==null)

	{ 
		treeStyle="win"; 
	} 	
	nodeToOpen=parameters.getProperty("nodeToOpen");
	nodesToOpen=parameters.getProperty("nodesToOpen");
	if ( nodesToOpen==null || nodesToOpen.equals("null")) 
		nodesToOpen="";
	if ( nodeToOpen==null || nodeToOpen.equals("null")) 
		nodeToOpen=""; 	
	treeState=treeInialize(); 
	MibNodeConverter mibNodeConverter = new MibNodeConverter(); 

        Properties treeImages = new Properties();

        treeImages.put(MibNodeConverter.DOT_IMAGE, "/webclient/common/images/mib_directory.gif");
        treeImages.put(MibNodeConverter.BACK_IMAGE, "/webclient/common/images/goback.png");

        treeImages.put(MibNodeConverter.FILE_IMAGE, "/webclient/common/images/mib_tree.gif");
        treeImages.put(MibNodeConverter.FOLDER_OPENED_IMAGE, "/webclient/common/images/mib_folder.gif");
        treeImages.put(MibNodeConverter.FOLDER_CLOSED_IMAGE, "/webclient/common/images/mib_cfolder.gif");
        treeImages.put(MibNodeConverter.EXT_INDEX_IMAGE, "/webclient/common/images/mib_extkey.gif");
        treeImages.put(MibNodeConverter.INDEX_IMAGE, "/webclient/common/images/mib_key.gif");
        treeImages.put(MibNodeConverter.LEAF_IMAGE, "/webclient/common/images/mib_node.gif");
        treeImages.put(MibNodeConverter.RESTRICTED_IMAGE, "/webclient/common/images/mib_Nonode.gif");
        treeImages.put(MibNodeConverter.TABLE_IMAGE, "/webclient/common/images/mib_table.gif");
        treeImages.put(MibNodeConverter.ENTRY_IMAGE, "/webclient/common/images/mib_entry.gif");
        treeImages.put(MibNodeConverter.TRAP_LIST_IMAGE, "/webclient/common/images/mib_trap.gif");
        treeImages.put(MibNodeConverter.TC_LIST_IMAGE, "/webclient/common/images/mib_textcon.gif");

        mibNodeConverter.setTreeImages(treeImages);

	Document xmldocument = null; // Replacing crimson related API into DOM API for JDK1.5 compilation  
	MibNode mn;
	MibModule Module;
	String root1=null;
	try 
	{
            
		Module =mibDetail.getModule(); 
		//out.println("Module.ssass."+Module.getName());

		mn = mibDetail.getNode(); 
	} 
	catch(Exception e)
	{
        out.println("<CENTER><B>");
		out.println(NmsUtil.GetString("weblient.common.mibbrowser.viewcannot.constructed"));
		out.println("</B><HR>");
		out.println(NmsUtil.GetString("weblient.common.mibbrowser.exception.mibbean"));
        out.println("</CENTER>");
		NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception caught in MibTreeDetail "),e);
		return;
	} 

        data = new Properties(); 
        targetVersion="false";
	data= mibDetail.getTargetDetail(userName); 
       if  ((data.getProperty("SnmpVersion")!=null) && (data.getProperty("SnmpVersion") !="") && (data.getProperty("SnmpVersion").equals("Snmp_Version2c"))) 
                targetVersion="true";

              isTable=mibDetail.isTableString(String.valueOf(oid));
              
              port=data.getProperty("port");
%> 

  <INPUT TYPE="hidden" NAME="treeStyle" value="<%= treeStyle %>" > 
  <INPUT TYPE="hidden" NAME="pressType"  > 
  <INPUT TYPE="hidden" NAME="pressName"  > 
  <INPUT TYPE="hidden" NAME="nodeToOpen"  > 
  <INPUT TYPE="hidden" NAME="prevnodeToOpen"  value="<%=nodeToOpen%>" > 
  <INPUT TYPE="hidden" NAME="prevselectedMib" value="<%=selectedMib%>"> 
  <INPUT TYPE="HIDDEN" NAME="unLoadMib" value="<%=selectedMib%>"> 
  <INPUT TYPE="HIDDEN" NAME="desc" value="<%=desc%>"> 
  <INPUT TYPE="hidden" NAME="type" > 
  <INPUT TYPE="hidden" NAME="displayName" > 
<CENTER> 

<%-- **********************   Main Mib Browser UI    ************************** --%>


<TABLE BORDER="0" align="center" WIDTH="98%" class="htableBorder">
<tr>
<td colspan=2 class="header1Bg" height="30"><span class="header1"><%=NmsUtil.GetString("weblient.common.mibbrowser.mibmanager")%></span></td>
</tr>

  <TR>
    <TD colspan=2> 

      <TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0  WIDTH=100%> 
	<TR height="25"> 

 	    <TD ALIGN=left>
		
		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.loadmib")%>" class="button" onClick="javascript:Sbtbutton('addmib')">

		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.unloadmib")%>" class="button" onClick="javascript:Sbtbutton('unLoad')">
		
		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.parameters")%>" class="button" onClick="javascript:Sbtbutton('Parameters')">		
		
		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.get")%>" class="button" onClick="javascript:Sbtbutton('snmpget')">
		
		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.getnext")%>" class="button" onClick="javascript:Sbtbutton('snmpgetnext')">	

<% if(targetVersion.equals("true")){ %>
		
		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.getbulk")%>" class="button" onClick="javascript:Sbtbutton('snmpgetbulk')">		
<% }else{ %>
		
		<input type="button" disabled="true" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.getbulk")%>" class="buttonDisabled">		
<% } %>

		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.set")%>" class="button" onClick="javascript:Sbtbutton('snmpset')">	

<% if(isTable.equals("true")){ %>

		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.table")%>" class="button" onClick="javascript:Sbtbutton('snmptable')">
		
<% }else{ %>

		<input type="button" disabled="true" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.table")%>" class="buttonDisabled">

<% } %>		

		<input type="button" value="<%=NmsUtil.GetString("weblient.common.mibbrowser.clear")%>" class="button" onClick="javascript:Sbtbutton('clear')">

          </TR>
        </TABLE>
      </TD> 
   </TR>
 
   <TR>
      <TD COLSPAN=2> 
	<TABLE BORDER="0" WIDTH="100%" align="center" cellpadding="0" cellspacing="1" bgcolor="#EEECEC"> 
          <TR> 
	     <TD width="30%" ALIGN="LEFT" VALIGN="TOP" bgcolor="#FFFFFF"> 


<% 	

/* Added by asivakumar for loading of multi mibmodule support::: STARTS HERE */

loadedModulesTable = mibDetail.getLoadedMib();
//fileandmodulenames  = mibDetail.fileandmodulenames;
String currentLoadedMib = Module.getName();

for(Enumeration en = loadedModulesTable.keys(); en.hasMoreElements();)
{
    String mibModuleName = (String)en.nextElement();
    MibModule loadedModule = (MibModule)loadedModulesTable.get(mibModuleName);
    // String moduleKey = fileandmodulenames.get(mibModuleName);

    out.println("<table  border=0 cellpadding=0 cellspacing=0  >");
    out.println("<tr>");
   
    out.println("<td  nowrap><IMG BORDER=0 WIDTH=17 HEIGHT=17 align=TEXTTOP SRC=\"../images/origin.jpg\" >&nbsp; <a ");
    if(currentLoadedMib.equals(loadedModule.getName()))
    {
        out.println("class=\"boldText\" ");
    }
    else {
        out.println("class=\"text\" ");
    }

   out.println("  href=\"javascript:Sbtbutton1(\'"+loadedModule.getName()+"\') \" >  "+loadedModule.getName()+"  </a></td></tr>");
   
   String vline="<IMG BORDER=0 WIDTH=20 HEIGHT=20 align=TEXTTOP SRC=\"../images/vline.png\" >"; 
   out.println("</table>"); 

    if(currentLoadedMib.equals(loadedModule.getName()))
    {

        xmldocument=mibNodeConverter.formElement(Module,nodeToOpen,treeState); 

        Element rootnode = xmldocument.getDocumentElement();
        NodeList children = rootnode.getChildNodes(); 
        //ElementNodeTree elementNodeTree = new ElementNodeTree(); 

        ElementTree elementTree = new ElementTree(treeStyle); 
        getLoadedMib= new Hashtable(); 
        String sessionId = session.getId(); 
        treeState= new Vector(); 
        treeState=treeInialize(); 

        out.println("<TABLE  border=0 cellpadding=0 cellspacing=0  cols=1 class=\"text\">"); 

        if((oidtree==null)||(oidtree.equals("null"))||(oidtree.equals(""))||(oidtree.length() < 0 )) 
        { 
	        elementTree.exploreNode(rootnode,"",out,nodeToOpen,treeState,root1); 
        } 
        else 
        { 
            mibnode= mibDetail.getNodeForString(oidtree); 
            if (mibnode!=null) 
            { 
                root=mibnode.getNumberedOIDString(); 
            } 
            else 
            { 
                root = oidtree; 
            } 
            elementTree.exploreNode(rootnode,space,out,nodeToOpen,treeState,root); 
        }
         out.println("</table>");   
    }
}
   nodesToOpen=constNodesToOpen(); 
   treeState=null; 
   nodeList=null; 

/* Added by asivakumar for loading of multi mibmodule support::: ENDS HERE */
%> 


<%-- 	
   out.println("<table  border=0 cellpadding=0 cellspacing=0 class=\"text\" >");
      out.println("<tr> <td nowrap><IMG BORDER=0 HEIGHT=20 align=TEXTTOP SRC=\"../images/origin.jpg\" >&nbsp; "+Module.getName()+"</td></tr>");
   
   String vline="<IMG BORDER=0 WIDTH=20 HEIGHT=20 align=TEXTTOP SRC=\"../images/vline.png\" >"; 
   out.println("</table>"); 
   xmldocument=mibNodeConverter.formElement(Module,nodeToOpen,treeState); 

   Element rootnode = xmldocument.getDocumentElement();
   NodeList children = rootnode.getChildNodes(); 
   //ElementNodeTree elementNodeTree = new ElementNodeTree(); 

   ElementTree elementTree = new ElementTree(treeStyle); 
   getLoadedMib= new Hashtable(); 
   String sessionId = session.getId(); 
   treeState= new Vector(); 
   treeState=treeInialize(); 

%> 

   <TABLE  border="0" cellpadding="0" cellspacing="0"  cols="1" class="text"> 
		
<% 

  if((oidtree==null)||(oidtree.equals("null"))||(oidtree.equals(""))||(oidtree.length() < 0 )) 
  { 
	elementTree.exploreNode(rootnode,"",out,nodeToOpen,treeState,root1); 
  } 
  else 
  { 
      mibnode= mibDetail.getNodeForString(oidtree); 
      if (mibnode!=null) 
      { 
          root=mibnode.getNumberedOIDString(); 
      } 
      else 
      { 
          root = oidtree; 
      } 
      elementTree.exploreNode(rootnode,space,out,nodeToOpen,treeState,root); 
  }
   out.println("</table>");
   nodesToOpen=constNodesToOpen(); 
   
   treeState=null; 
   nodeList=null; 

--%> 

  <INPUT TYPE="hidden" NAME="nodesToOpen" value="<%=nodesToOpen%>" > 
  </TD> 
  <TD ALIGN="center" VALIGN="TOP" class="propertyBg"> 
    <TABLE BORDER="0" WIDTH="98%" align="right"> 
        <TR> 
 	 <TD> 
	   <TABLE BORDER="0" WIDTH="100%" CELLPADDING="1"> 
	      <TR> 

		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                   <%=NmsUtil.GetString("weblient.common.mibbrowser.host")%>
                </TD> 

		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="20" NAME="host" VALUE="<%=host%>" class="formstyle">
                </TD> 

		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                    <%=NmsUtil.GetString("weblient.common.mibbrowser.community")%>
                </TD> 

		<TD ALIGN="RIGHT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="PASSWORD" SIZE="20" NAME="community" VALUE="<%=community%>" class="formstyle">
                </TD> 
 	     </TR> 

       <TR> 
		
       <TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">SNMP Port

                </TD> 

	<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP><INPUT TYPE="TEXT" SIZE="20" NAME="port" VALUE="<%=port%>" class="formstyle"> </TD> 

<%--
     	<TD class="propertyBg"><SELECT class="formStyle"  NAME="port">

<%

String listOfPorts = data.getProperty("otherPorts");
System.out.println("List of ports........ "+listOfPorts);
if(listOfPorts.indexOf("|") != -1)
{
	System.out.println("Inside IF part.............");
	StringTokenizer st1 = new StringTokenizer(listOfPorts,"|");
	while(st1.hasMoreTokens())
	{
	    String val = st1.nextToken();
%> 

	<OPTION name="port" value=<%=val%>><%=val%></OPTION> 
<%
	}
}
else
{
	System.out.println("Inside Else part............");
	String val = listOfPorts;
	System.out.println("Port value is ......... "+val);
%> 
<OPTION name="port" value=<%=val%>><%=val%></OPTION>
<%
}
%>
</SELECT></TD>      
     
--%>


		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                   <%=NmsUtil.GetString("weblient.common.mibbrowser.writecommunity")%>
                </TD> 
		<TD ALIGN="RIGHT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="20" NAME="wcommunity" VALUE="<%=wcommunity%>" class="formstyle">
                </TD> 

	     </TR> 


    	     <TR> 
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                   <%=NmsUtil.GetString("weblient.common.mibbrowser.setvalue")%>
                </TD> 
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="20" NAME="setvalue" VALUE="<%=setvalue%>" class="formstyle">
                </TD>
	       <TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                       <%=NmsUtil.GetString("weblient.common.mibbrowser.contextname")%>
	       </TD>
	       <TD ALIGN="LEFT" VALIGN="TOP" NOWRAP>
                      <INPUT TYPE="TEXT" SIZE="20" NAME="contextname" VALUE="<%=contextname%>" class="formstyle">
               </TD>
<%--
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                   <%=NmsUtil.GetString("weblient.common.mibbrowser.writecommunity")%>
                </TD> 
		<TD ALIGN="RIGHT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="20" NAME="wcommunity" VALUE="<%=wcommunity%>" class="formstyle">
                </TD> 
--%>
	     </TR> 

	     <TR> 
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                   <%=NmsUtil.GetString("weblient.common.mibbrowser.objectid")%>
                </TD> 
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="50" NAME="oid" VALUE="<%=oid%>" class="formstyle" width:450>
                </TD>

<%--	        <TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
                  <%=NmsUtil.GetString("weblient.common.mibbrowser.contextname")%>
                </TD>
                <TD ALIGN="LEFT" VALIGN="TOP" NOWRAP>
                   <INPUT TYPE="TEXT" SIZE="20" NAME="oid" VALUE="<%=contextname%>" class="formstyle">
                </TD>--%>
						
	     </TR> 
	     
	     <TR> 
		<TD ALIGN="LEFT" VALIGN="TOP" NOWRAP class="text">
		<%=NmsUtil.GetString("weblient.common.mibbrowser.loadedmib")%>                </TD> 
		<TD ALIGN="LEFT" VALIGN="TOP" COLSPAN="3" NOWRAP>
                   <SELECT NAME="selectedMib" class="formStyle"> 
<% 

   getLoadedMib = new Hashtable(); 
   getLoadedMib = mibDetail.getLoadedMib(); 
   selectedMib  = (String)parameters.getProperty("selectedMib");
   
   if ((selectedMib==null) || (selectedMib.equals("null")) || (selectedMib.equals("")))
   {
	selectedMib="RFC1213-MIB"; 
   }
   String value=" "; 

   if((selectedMib.indexOf("cmi")!= -1) ||(selectedMib.indexOf("cds")!= -1) ||(selectedMib.indexOf("txt")!= -1))
   {
	int t = selectedMib.indexOf(".");
	String st = selectedMib;

	selectedMib= selectedMib.substring(0,t);
	value= "VALUE=\""+st+"\"";
   }

   out.println("<br>");
   out.println(NmsUtil.GetString("weblient.common.mibbrowser.selectedmib")+selectedMib);
   out.println(NmsUtil.GetString("weblient.common.mibbrowser.loadedmib")+getLoadedMib);

   if(getLoadedMib!=null) 
   {
	for(Enumeration loadedMib = getLoadedMib.elements(); loadedMib.hasMoreElements();)
	{
	    String element = String.valueOf(loadedMib.nextElement());
            if(selectedMib!=null) 								 
            {
		if (element.equalsIgnoreCase(selectedMib))
		{

                %> 
		   <OPTION <%=value%> SELECTED><%=element%></OPTION> 
                <%				        
                 }
                 else 
                 { 
                 %> 
		   <OPTION ><%=element%></OPTION> 
                 <% 
                 }
            } 	
            else 
            { 
            %>
		<OPTION SELECTED><%=element%></OPTION> 
            <% 
            }
        }	
   }
   else
   {
   %>
	<OPTION> <%=NmsUtil.GetString("weblient.common.mibbrowser.nomibselected")%></OPTION>
   <%
   }
%> 

		</SELECT>
		              <INPUT TYPE="BUTTON" NAME="browse" VALUE="<%=NmsUtil.GetString("weblient.common.mibbrowser.select")%>" onClick=Sbtbutton('selectedMib') class="button">
                </TD> 
	     </TR>

	     <tr>
	     <td>
	     </td>
	     <td colspan="3">
	     <% 
	     	if ((resultstr==null) || (resultstr.equals("null")) || resultstr.equals("")) 
	     		resultstr=""; 
	     %> 

	             <TEXTAREA NAME="resultstr" ROWS="12" COLS="60" class="formstyleMib"><%=resultstr%> </TEXTAREA>

	     </td>
	     </tr>
	     <tr>
	     		<TD ALIGN="LEFT" NOWRAP class="text">
	                        <%=NmsUtil.GetString("weblient.common.mibbrowser.syntax")%>
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP>
	                        <INPUT TYPE="TEXT" SIZE="15" NAME="syntax" VALUE="<%=syntax%>" class="formstyle">
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP class="text">
	                        <%=NmsUtil.GetString("weblient.common.mibbrowser.status")%>
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP >
	                        <INPUT TYPE="TEXT" SIZE="15" NAME="status" VALUE="<%=status%>" class="formstyle">
                </TD>
	     </tr>
	     <tr>
	     <TD ALIGN="LEFT" NOWRAP WIDTH="10%" class="text">
	                        <%=NmsUtil.GetString("weblient.common.mibbrowser.access")%>
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP WIDTH="30%">
	                        <INPUT TYPE="TEXT" SIZE="15" NAME="access" VALUE="<%=access%>" class="formstyle">
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP WIDTH="10%" class="text">
	                        <%=NmsUtil.GetString("weblient.common.mibbrowser.index")%>
	                     </TD> 
	     
	     		<TD ALIGN="LEFT" NOWRAP WIDTH="20%">
	                        <INPUT TYPE="TEXT" SIZE="15" NAME="index" VALUE="<%=index%>" class="formstyle">
                </TD>
	     
	     </tr>
	     <tr>
	     <td colspan="4" class="text"><%=NmsUtil.GetString("weblient.common.mibbrowser.mibnodediscription")%>
	     </td>
	     </tr>
	     <tr>
	     <td colspan="4" class="text"><%=desc%>
	     </td>
	     </tr>
	     
	     
	 </TABLE> 


</TD> 
</TR> 
</TABLE> 
</TD> 
</TR> 
</TABLE> 
</TD> 
</TR> 
</TABLE> 
</FORM> 
</body> 

<% 
}
	%> 
<%! public String constNodesToOpen() 
{ 
	StringBuffer temp = new StringBuffer(); 
	if (treeState!=null) 	{ 
		for(Enumeration vectorElement = treeState.elements();vectorElement.hasMoreElements();) 
		{ 
			temp.append((String)vectorElement.nextElement()); 
			temp.append(" "); 
		} 
		return temp.toString(); 
	}       
	return new String(); 
}
	%> 
<%! 	public Vector treeInialize() 
{
	if (nodesToOpen!= null)
	{ 			
		StringTokenizer lt = new StringTokenizer(nodesToOpen); 
		while(lt.hasMoreElements()) 
		{ 
			treeState.addElement(lt.nextToken()); 
		}
		return treeState;         		} 
		return new Vector(); 
} 
%> 
<%! 
Hashtable loadedModulesTable = new Hashtable();
Hashtable fileandmodulenames  = new Hashtable();
Hashtable treeStatesOfUsers = new Hashtable(); 
Vector treeState;
Vector nodeList; 
String  nodesToOpen; 
String nodeToOpen; 
String space="<IMG ALIGN=\"top\" BORDER=0 WIDTH=20 HEIGHT=20 SRC=\"../images/space.png\" >"; 
//MapNode menuNodeMap = new MapNode(); 
String ell; 
String ee;
String hline; 
String vline; 
String plus; 
String minus; 
String url = "/MibBrowser.do"; 
Properties data=null; 
Properties parameters=null;  
String child=null; 
String root = null; 
String childname=null; 
Vector childList = null; 
String host=null; 
String port=null;
String community=null; 
String wcommunity=null; 
String contextname=null;
String setvalue=null; 
String oid=null; 
String resultstr=null; 
String Open; 
String syntax; 
String status; 
String access; 
String index; 
String desc; 
String isTable;
String selectedMib;  
String prevselectedMib; 
String userName;
String targetVersion;
Hashtable getLoadedMib =null; 
//removed url 
//sysadmin.setattribute  
%>
</html> 
