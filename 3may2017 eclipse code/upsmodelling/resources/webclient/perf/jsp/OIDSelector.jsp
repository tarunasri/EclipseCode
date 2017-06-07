<%-- $Id: OIDSelector.jsp,v 1.5 2010/10/29 13:47:12 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<html> 
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/windowFunctions.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/validation.js"></SCRIPT>
<script> 

function Sbtbutton1(name) 
{ 
   
	document.mibForm.pressType.value="Button"; 
	document.mibForm.pressName.value='setaddMib'; 
    var selMib = document.mibForm.selectedMib.value;
    var prevMib = document.mibForm.prevselectedMib.value;
    
    if(selMib != name ) {
        document.mibForm.prevselectedMib.value=selMib;
    }
	document.forms["mibForm"].selectedMib.value = name;
	document.forms["mibForm"].submit(); 
} 

function Sbtbutton(name) 
{ 
	document.mibForm.pressType.value="Button"; 
	document.mibForm.pressName.value=name; 
	if ( (name=="snmpget") || (name=="snmpgetnext")|| (name=="snmpgetbulk")  || (name=="snmptable") || (name=="snmpset")) 
	{ 

 		var toid = document.mibForm.oid.value; 

        var oidname = toid.substring(toid.lastIndexOf(".")+1,toid.length);
	 	var oidv = document.mibForm.oidv.value; 
	 	var oidsyntax = document.mibForm.syntax.value; 
		var oidtype = document.mibForm.oidtype.value; 
		var dataType = document.mibForm.datatype.value;
		var isTable = document.mibForm.isTable.value;
		var isTableRequired = document.mibForm.isTableRequired.value;
                if(isTableRequired == 'true')
                {
                        if(isTable == 'false')
                        {
			alert('<fmt:message key="webclient.perf.oid.alert.selecttable"/>');
                                return false;
                        }
                        else
			{
                                window.opener.afterTableOIDSelection(oidv);
                        }

                }
		else
		{
                        if(isEmpty(oidtype) || oidtype!='node')
                        {
				alert('<fmt:message key="webclient.perf.oid.alert.selectscalar"/>');
                                return false;
                        }
 
		}

	    //if((oidsyntax.substring(0,13)) !="DisplayString")
	  
			if ( (toid != null) && (toid!="null")&&(toid!="")&& (toid.length > 0))
			{
                var formname = document.mibForm.formName.value;

		var forname = eval("window.opener.document."+formname);
		forname.oid.value=oidv;
                forname.isMultiplePolledData.value=oidtype;
		forname.type.value = dataType;
                var tableName = window.opener.document.getElementById('storageTableName');
                if(tableName != null && ((oidsyntax.substring(0,13)) =="DisplayString"))
                {
                    tableName.value="STRINGDATA%";
                }

                    forname.name.value=oidname;

                /*
                if(formname=="AddPollingObject")
                {
                    if(oidsyntax=='Counter')
                    {
                        forname.displaySaveOption.value="true";
                        window.opener.document.getElementById('saveRow').style.visibility="visible";
                    }
                    else
                    {
                        forname.displaySaveOption.value="false";
                        window.opener.document.getElementById('saveRow').style.visibility="hidden";
                    }
                }
                */
		if(formname=="AddPollingObject" || formname=="ModifyPollingObject")
		{
			if(!(oidsyntax=='Counter'))
			{
				forname.saveAbsolutes.disabled=true;
			}
			else
				forname.saveAbsolutes.disabled=false;
		}


		//window.opener.currentData(oidv,oidtype);
			}
			else 
			{
			    alert("<%=NmsUtil.GetString("webclient.common.mibbrowser.oid.notselected.errormessage")%>");
			    return false;
			}
			window.close();
	   
	}
	else
	{
	    document.mibForm.pressType.value="Button"; 
	    document.mibForm.pressName.value=name; 
	    document.forms["mibForm"].submit(); 
	}
}
</script>


<%@ page import="org.w3c.dom.*"%> 
<%@page import="java.io.*" %> 
<%@page import="com.adventnet.nms.util.*" %> 
<%@page import= "java.util.*" %> 
<%@page import= "com.adventnet.nms.util.NmsLogMgr" %> 
<%@page import= "com.adventnet.snmp.mibs.MibNode" %> 
<%@page import= "com.adventnet.snmp.mibs.MibModule" %> 
<%@page import= "com.adventnet.snmp.mibs.MibTC" %> 
<%@page import= "com.adventnet.snmp.mibs.MibTrap" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpVarBind" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpOID" %> 
<%@page import="com.adventnet.snmp.snmp2.SnmpVar" %> 
<%@page import= "com.adventnet.snmp.*" %> 
<%@page import= "com.adventnet.nms.webclient.mibbrowser.MibNodeConverter"%> 
<%@page import= "com.adventnet.nms.util.ElementTree"%> 

<jsp:useBean id="mibDetail" class="com.adventnet.nms.jsp.MibBrowserMain" scope="request" /> 

<% String treeStyle= null; 
String oidtree=null; 
parameters = new Properties();    
syntax=""; 
access=""; 
status=""; 
index=""; 
desc=""; 
MibNode mibnode= null;

for(Enumeration parameterNames = request.getParameterNames(); parameterNames.hasMoreElements();) 
{ 
	String param = (String)parameterNames.nextElement(); 
	String value = (String)request.getParameter(param); 
	if (value == null) value=""; 
	parameters.put(param,value); 
} 


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

<form name="mibForm" action="GetSnmpOid.do" method="post"> 

	<input type="hidden" name="formName" value="<c:out value="${param.formName}"/>">
	<input type="hidden" name="isTableRequired" value="<c:out value="${param.isTableRequired}"/>">
	<input type="hidden" name="columnOIDs" value=""/>

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

selectedMib = parameters.getProperty("selectedMib");


if(selectedMib == null)
{
    selectedMib = (String)request.getSession().getAttribute("selectedMib1");
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
        request.getSession().setAttribute("selectedMib1",selectedMib);
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
 
if ((parameters.containsKey("pressType")) && ((parameters.getProperty("pressType")).equals("Button")) && (parameters.getProperty("pressName").equals("addmib")))
{
    selectedMib=(String)parameters.getProperty("selectedMib"); 
    if ((selectedMib==null) || (selectedMib.equals("null")) || (selectedMib.equals("")))
	selectedMib="RFC1213-MIB";
    File mibdir = new File(NmsUtil.MIBDIR);

%>
<p align="center">

   <TABLE BORDER="0" width="500" align="center" CELLPADDING="2" CELLSPACING="1" class="tableBorder">
<tr>
<td class="header1Bg" height="30" colspan="2">
	<span class="header1"><%= NmsUtil.GetString("Load Mib") %></span>
</td>

</tr>
     <TR><TD class="propertyLeftBg"" ALIGN="center" height="180" width="200">
	<SELECT style="height:auto" NAME="selectedMib" SIZE=10 style="formStyle" >

<%
   if(!mibdir.isDirectory())
   {
	out.println(java.text.MessageFormat.format(NmsUtil.GetString("{0} is not a directory"),new String[]{""+NmsUtil.MIBDIR}));
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
      
	<td class="propertyBg"><span class="txtGlobal">
<!--      		<INPUT TYPE="CHECKBOX" NAME ="CompiledFile" value="true" ><%=NmsUtil.GetString("Load Mibs From Compiled Files")%> <br>			                   
      
		<INPUT TYPE="CHECKBOX" NAME ="OverWrite" value="true"><%=NmsUtil.GetString("OverWrite Existing Compiled Files")%></span>-->
		<br>
		<br>
		
		<INPUT TYPE=button NAME=setaddMib VALUE="<%=NmsUtil.GetString(" Load ")%>" onClick="Sbtbutton('setaddMib')"  class="button"> 				

	<INPUT TYPE=button NAME=backaddMib VALUE="<%=NmsUtil.GetString("Cancel")%>" onClick="history.back()" class="button">
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
 <INPUT TYPE="hidden" NAME="oid"  value="<%=parameters.getProperty("oid")%>"> 
 <INPUT TYPE="hidden" NAME="prevselectedMib" value="<%=parameters.getProperty("selectedMib")%>"> 


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
	{ 
		data = new Properties(); 	
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
					if (mibnode.getSyntax()!=null) 
						syntax=mibnode.getSyntax().getDescription(); 
					else 
						syntax="--"; 
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

	Document xmldocument = null; //Crimson APIs changed into Xerces APIs to avoid compilation error with JDK1.5
	MibNode mn;
	MibModule Module;
	String root1=null;
	try 
	{
            
		Module =mibDetail.getModule(); 
		//out.println("Module.ssass.     "+Module.getName());
		mn = mibDetail.getNode(); 
	} 
	catch(Exception e)
	{
        
		out.println(NmsUtil.GetString("<CENTER><B>Tree view cannot be constructed</B>"));
		out.println("<HR>");
		out.println(NmsUtil.GetString("Exception occured while getting MibNode from MibBean. </CENTER>"));
		NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception caught in MibTreeDetail "),e);
		return;
	} 

        data = new Properties(); 
	data= mibDetail.getTargetDetail(userName); 
         
%> 

  <INPUT TYPE="hidden" NAME="treeStyle" value="<%= treeStyle %>" > 
  <INPUT TYPE="hidden" NAME="pressType"  > 
  <INPUT TYPE="hidden" NAME="pressName"  > 
  <INPUT TYPE="hidden" NAME="nodeToOpen"  > 
  <INPUT TYPE="hidden" NAME="prevnodeToOpen"  value="<%=nodeToOpen%>" > 
  <INPUT TYPE="hidden" NAME="prevselectedMib" value="<%=prevselectedMib%>"> 
  <INPUT TYPE="hidden" NAME="selectedMib" value="<%=selectedMib%>">
  <INPUT TYPE="HIDDEN" NAME="unLoadMib" value="<%=selectedMib%>"> 
<!--
  <INPUT TYPE="HIDDEN" NAME="desc" value="<%=desc%>"> 
-->
  <INPUT TYPE="hidden" NAME="type" > 
  <INPUT TYPE="hidden" NAME="displayName" > 
<CENTER> 

<TABLE BORDER="0" cellpadding=10 cellspacing=0 align="center" WIDTH="98%" class="dbborder1">
<%
String buttonName = parameters.getProperty("pressName");
if(buttonName!=null && buttonName.equals("setaddMib") && resultstr.indexOf("Error parsing MIB")!=-1)
{
msg = resultstr.substring(0,resultstr.indexOf(":")+1)+selectedMib;
%>
<tr>
<td colspan=2 align="center"><span class="errorText"><%=msg%></span>
</td>
</tr>
<%
}
%>
<tr>
<td colspan=2 class="tableMasterHeaderAlone"><span class="header1"><%=NmsUtil.GetString("Mib Manager")%></span></td>
</tr>
   <TR>
      <TD COLSPAN=2> 
	<TABLE BORDER="0" WIDTH="100%" align="center" cellpadding="5" cellspacing="1" bgcolor="#EEECEC"> 
          <TR> 
	     <TD width="30%" ALIGN="LEFT" VALIGN="TOP" bgcolor="#FFFFFF"> 


<% 	
 String strType = ""; 
 String dataType="";
 String isTable="false";
 String isTableRequired="false";
/* Added by asivakumar for loading of multi mibmodule support::: STARTS HERE */

loadedModulesTable = mibDetail.getLoadedMib();
//fileandmodulenames  = mibDetail.fileandmodulenames;
String currentLoadedMib = Module.getName();

for(Enumeration en = loadedModulesTable.keys(); en.hasMoreElements();)
{
    String mibModuleName = (String)en.nextElement();
    MibModule loadedModule = (MibModule)loadedModulesTable.get(mibModuleName);
    // String moduleKey = fileandmodulenames.get(mibModuleName);

    out.println("<table  border=0 cellpadding=0 cellspacing=0 class=\"txtGlobal\" >");
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
		if(mibnode.getSyntax()!=null)
		{
			dataType = mibnode.getSyntax().toString();
		}
		if(mibnode.isTable())
		{
			isTable = "true";
		}
                if( mibnode.isScalar())
	            {
		            strType = "node";
	            }else
	            {
		            strType = "multiple";
	            }
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
   String textRoot = ""; 
  
     if(request.getParameter("firstTime") != null && root != null && !root.equalsIgnoreCase("null")) textRoot = root;   
/* Added by asivakumar for loading of multi mibmodule support::: ENDS HERE */
/* Added by radhai to append .0 to node type OID */
    if(strType.equalsIgnoreCase("node"))
    {
	root=root+".0";
    }
/* Added by radhai to append .0 to node type OID ::: ENDS HERE */
%> 



<%--	
   out.println("<table  border=0 cellpadding=0 cellspacing=0 class=\"txtGlobal\" >");
      out.println("<tr> <td nowrap><IMG BORDER=0 HEIGHT=20 align=TEXTTOP SRC=\"../images/origin.jpg\" >&nbsp;"+Module.getName()+"</td></tr>");
   
   String vline="<IMG BORDER=0 WIDTH=20 HEIGHT=20 align=TEXTTOP SRC=\"../images/vline.png\" >"; 
   out.println("</table>"); 
   xmldocument=mibNodeConverter.formElement(Module,nodeToOpen,treeState); 

   Element rootnode = xmldocument.getDocumentElement();
   NodeList children = rootnode.getChildNodes(); 

   ElementTree elementTree = new ElementTree(treeStyle); 
   treeState= new Vector(); 
   treeState=treeInialize(); 

%> 

   <TABLE  border="0" cellpadding="0" cellspacing="0"  cols="1" class="txtGlobal"> 
		
<% 

    String strType = "";
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
	    if( mibnode.isScalar())
	    {
		strType = "node";
	    }else
	    {
		strType = "multiple";
	    }

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
   String textRoot = "";
   if(request.getParameter("firstTime") != null && root != null && !root.equalsIgnoreCase("null")) textRoot = root;
--%> 
 
  <INPUT TYPE="hidden" NAME="nodesToOpen" value="<%=nodesToOpen%>" > 
  </TD> 
  <INPUT TYPE="hidden" NAME="oidtype" value="<%=strType%>" > 
  <INPUT TYPE="hidden" NAME="datatype" value="<%=dataType%>" >
  <INPUT TYPE="hidden" NAME="isTable" value="<%=isTable%>" >
  <INPUT TYPE="hidden" NAME="oidv" value="<%=root%>" > 
  <INPUT TYPE="hidden" NAME="syntax" value="<%=syntax%>" > 
  <TD ALIGN="center" VALIGN="TOP" class="propertyBg"> 
        <INPUT TYPE="Hidden" SIZE="50" NAME="oid" VALUE="<%=oid%>" class="formstyle" style=width:450>
		<input type="text" styleClass="formStyle" value="<%= textRoot %>">
		<BR>
		<input type="button" value="<%=NmsUtil.GetString("OK")%>" class="button" onClick="javascript:Sbtbutton('snmpget')">
		<input type="button" value="<%=NmsUtil.GetString("Load MIB")%>" class="button" onClick="javascript:Sbtbutton('addmib')">
</TD> 
</TR> 
</TABLE> 
</TD> 
</TR> 
<tr><td>
</td></tr>
</TABLE> 
	<input type="hidden" name="firstTime" value="true" >
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
String url = "/GetSnmpOid.do"; 
Properties data=null; 
Properties parameters=null;  
String child=null; 
String root = null; 
String childname=null; 
Vector childList = null; 
String oid=null; 
String resultstr=null; 
String msg="";
String Open; 
String syntax; 
String status; 
String access; 
String index; 
String desc; 
String selectedMib;  
String prevselectedMib; 
String userName;
%>
</html> 

