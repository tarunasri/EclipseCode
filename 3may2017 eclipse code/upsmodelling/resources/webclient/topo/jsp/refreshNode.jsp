<%-- $Id: refreshNode.jsp,v 1.4 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<TITLE><fmt:message key='webclient.topo.refreshnode.title'/></TITLE>
<BODY onLoad="init()">
	<SCRIPT>
function versionCheck()
{
	var snmpV = document.refreshNodeForm.version.value;
	if(snmpV == 'v3')
	{
		document.refreshNodeForm.v3username.disabled=false;
		document.refreshNodeForm.v3username.className = "formStyle";
		document.refreshNodeForm.contextName.disabled=false;
		document.refreshNodeForm.contextName.className = "formStyle";
	}
	else
	{
		document.refreshNodeForm.v3username.disabled=true;
		document.refreshNodeForm.v3username.className = "formStyleDisabled";
		document.refreshNodeForm.contextName.disabled=true;
		document.refreshNodeForm.contextName.className = "formStyleDisabled";
		document.refreshNodeForm.v3username.value="";
		document.refreshNodeForm.contextName.value="";
	}
}
function disableFields()
{
document.refreshNodeForm.v3username.disabled=true;
document.refreshNodeForm.v3username.className = "formStyleDisabled";
document.refreshNodeForm.contextName.disabled=true;
document.refreshNodeForm.contextName.className = "formStyleDisabled"
}
function init()
{
	document.refreshNodeForm.version.value='v1';
	versionCheck();
}
</SCRIPT>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.topo.refreshnode.header'/></h1></td>
        </tr>
      </table>


<html:form action="/refreshNodeAction" onsubmit="return validateRefreshNodeForm(this);" > 

<table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

<TABLE cellSpacing=0 cellPadding=0 width=100% border=0 align="left">

<TR>
<td>&nbsp;</td>
<td class="text" height="35"><fmt:message key='webclient.admin.networkadmin.refreshnode.help'/></td>
</TR>

<TR>
<td>&nbsp;</td>
<TD valign=top> 
 
	<TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
	
	<TR align=left> 
	<TD width=201 height=25>
		<SPAN class=text><fmt:message key='webclient.topo.refreshnode.name'/></SPAN>
	</TD>
	
	<TD> 
		<html:text size="30" styleClass= "formStyle" name="refreshNodeForm" property="name" />
	</TD>
	</TR>
	
	<TR vAlign=center align=left>
	<TD height=25>
		<SPAN class=text><fmt:message key='webclient.topo.refreshnode.netmask'/></SPAN>
	</TD>
	
	<TD> 
						<html:select   styleClass= "formStyle" name="refreshNodeForm" property="netmask" > 
						<html:option value='255.192.0.0'>255.192.0.0</html:option> 
						<html:option value='255.224.0.0'>255.224.0.0</html:option> 
						<html:option value='255.240.0.0'>255.240.0.0</html:option> 
						<html:option value='255.248.0.0'>255.248.0.0</html:option> 
						<html:option value='255.252.0.0'>255.252.0.0</html:option> 
						<html:option value='255.254.0.0'>255.254.0.0</html:option> 
						<html:option value='255.255.0.0'>255.255.0.0</html:option> 
						<html:option value='255.255.128.0'>255.255.128.0</html:option> 
						<html:option value='255.255.192.0'>255.255.192.0</html:option> 
						<html:option value='255.255.224.0'>255.255.224.0</html:option> 
						<html:option value='255.255.240.0'>255.255.240.0</html:option> 
						<html:option value='255.255.248.0'>255.255.248.0</html:option> 
						<html:option value='255.255.252.0'>255.255.252.0</html:option> 
						<html:option value='255.255.254.0'>255.255.254.0</html:option> 
						<html:option value='255.255.255.0'>255.255.255.0</html:option> 
						<html:option value='255.255.255.128'>255.255.255.128</html:option> 
						<html:option value='255.255.255.192'>255.255.255.192</html:option> 
						<html:option value='255.255.255.224'>255.255.255.224</html:option> 
						<html:option value='255.255.255.240'>255.255.255.240</html:option> 
						<html:option value='255.255.255.248'>255.255.255.248</html:option> 
						<html:option value='255.255.255.252'>255.255.255.252</html:option> 
						</html:select> 
	</TD>
	</TR>

	<TR>
	<TD height=25 class="text"><fmt:message key='webclient.topo.refreshnode.snmpport'/>
	</TD>
	<TD>
		<html:text size="30" styleClass= "formStyle" name="refreshNodeForm" property="snmpport"/>
	</TD>
	
	</TR>
	<TR vAlign=center align=left>
	<TD height=25>
	<SPAN class=text><fmt:message key='webclient.topo.refreshnode.version'/></SPAN>
	</TD>

	<TD>
	<html:select   styleClass= "formStyle" name="refreshNodeForm" property="version" onchange="javascript:versionCheck()">
	<html:option value='v1'>v1</html:option>
	<html:option value='v2'>v2</html:option>
	<html:option value='v3'>v3</html:option>
	</html:select>
	</TD>
	</TR>

	<TR>
	<TD height=25 class="text"><fmt:message key='webclient.topo.refreshnode.v3username'/>
	</TD>
	<TD>
	<html:text size="30" styleClass= "formStyle" name="refreshNodeForm" property="v3username"/>
	</TD>

	</TR>
	<TR>
	<TD height=25 class="text"><fmt:message key='webclient.topo.refreshnode.contextName'/>
	</TD>
	<TD>
	<html:text size="30" styleClass= "formStyle" name="refreshNodeForm" property="contextName"/>
	</TD>
<INPUT type =hidden value="true" name="portCheck">	
	
	<TR>
	<TD height=25 class="text">&nbsp;</TD>
	<TD >
	<INPUT class=button type=submit value=<fmt:message key='webclient.topo.refreshnode.refreshbtn'/> name=submit>
	<INPUT class=button type=reset value=<fmt:message key='webclient.topo.refreshnode.clearbtn'/>                                                   name=reset onClick="disableFields()">
	</TD>
		
	</TR>
	
	</TABLE>
</TD>
</TR>

<INPUT type=hidden value=v1 name=snmpVersion>

</TABLE>
 </td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>                                             
                                                
                                
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                <TR vAlign=center align=left>
                                <TD><IMG height=38 src="/webclient/topo/images/spacer.gif" width=1></TD>
                                                    </TR>
                                                    <TR vAlign=center align=left> 
                                                      <TD class=messtext width=384 height=30><FONT 
                                color=#ff0000><html:errors property="name"/></FONT></TD>
                                                    </TR>
                                                    <TR vAlign=center align=left> 
                                                      <TD class=messtext width=384 height=30><FONT 
                                color=#ff0000>&nbsp;</FONT></TD>
                                                    </TR>
                                                    <TR vAlign=center align=left> 
                                                      <TD class=messtext width=384 height=30><FONT 
                                color=#ff0000><html:errors property="snmpport"/></FONT></TD>
                                                    </TR>
                                                  
                                                </TABLE>
                                                
                                                
                                                
                                                </TD>
                                            </TR>
                                        
</TABLE>


</html:form> 
<html:javascript formName="refreshNodeForm"/>
</BODY>
