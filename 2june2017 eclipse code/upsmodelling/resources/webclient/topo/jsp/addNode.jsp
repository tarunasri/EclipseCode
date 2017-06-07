<%-- $Id: addNode.jsp,v 1.5 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<TITLE><fmt:message key='webclient.topo.addnode.title'/></TITLE>
<script type="text/javascript">
function ToggleStates()
{
  if (document.AddNodeForm.version.checked)
      {
    	document.AddNodeForm.userName.disabled= false;
    	document.AddNodeForm.userName.className="formStyle";
    	document.AddNodeForm.contextName.disabled=false;
    	document.AddNodeForm.contextName.className="formStyle";
      }
     else
      {
        document.AddNodeForm.userName.disabled=true;
    	document.AddNodeForm.userName.className="formStyleDisabled";
    	document.AddNodeForm.contextName.disabled=true;
    	document.AddNodeForm.contextName.className="formStyleDisabled";
      }
}
function disableFields()
{
	document.AddNodeForm.userName.disabled=true;
	document.AddNodeForm.userName.className="formStyleDisabled";
	document.AddNodeForm.contextName.disabled=true;
	document.AddNodeForm.contextName.className="formStyleDisabled";
}
function ToggleOthers()
{
   if(document.AddNodeForm.discovery.checked)
   {
      document.AddNodeForm.configFlag.disabled=true;
      document.AddNodeForm.discoverParentNet.disabled=true;
      document.AddNodeForm.reachFlag.disabled=true;
      document.AddNodeForm.writeToSeedFile.disabled=true;
   }

   else
   {
      document.AddNodeForm.configFlag.disabled=false;
      document.AddNodeForm.discoverParentNet.disabled=false;
      document.AddNodeForm.reachFlag.disabled=false;
      document.AddNodeForm.writeToSeedFile.disabled=false;
   } 
}
function validateAddNode()
{
   var node = document.AddNodeForm.ipAddress.value;
   if(node=="")
   {
      alert('<fmt:message key="webclient.topo.addnodepage.noinput.error"/>');
      document.AddNodeForm.ipAddress.focus();
      return false;
   } 
   return true;
}

function checkDiscoverParentNet()
{
	document.AddNodeForm.discoverParentNet.checked=true;
}
</script>
<body onLoad="javascript:checkDiscoverParentNet()">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.topo.addnode.header'/></h1></td>
        </tr>
      </table>

<html:form action="/AddNodeAction" onsubmit="return validateAddNode();">

<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >


<table cellSpacing=0 cellPadding=0 width=100% align="left" border=0>

 <tr>
   <td>&nbsp;</td>
   <td class="text" height="35"><fmt:message key='webclient.topo.addnode.helpmessage'/>
   </td>
 </tr>
 <tr>
    <td>&nbsp;</td>
    <td class=header2Bg align=left height="25" >
	<SPAN class=boldText>&nbsp;<fmt:message key='webclient.topo.addnode.general'/></SPAN>
	</td>
        
</tr>

<tr>
   <td>&nbsp;</td>
   <td align=left valign="top">
	<TABLE cellSpacing=0 cellPadding=4 width=100% border=0>
			
		<TR>
		<TD height="25" align=left>
			<SPAN class=text><fmt:message key='webclient.topo.addnode.ipaddress'/></SPAN>
		</TD>
		<TD>
			<html:text size="30" styleClass= "formStyle" name="AddNodeForm" property="ipAddress" /> 
                </TD>
                </TR>
                                                
                <TR id=high> 
                <TD height="25"  align=left>
                 	<SPAN class=text><fmt:message key='webclient.topo.addnode.netmask'/></SPAN>
                </TD>
                        
                <TD> 
                        	    <html:select   styleClass= "formStyle" name="AddNodeForm" property="netmask" > 
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
		<TD colspan="2">&nbsp;
		</TD>
                </TR>
              
	</TABLE>
</td>
</tr>

<tr id=high>
<td>&nbsp;</td>

<td class=header2Bg align=left height="25" >
	<SPAN class=boldText>&nbsp;<fmt:message key='webclient.topo.addnode.snmp'/></SPAN>
</td>
</tr>

<tr id=high>
<td>&nbsp;</td>

<td vAlign=top align=left> 

	<TABLE cellSpacing=0 cellPadding=4 width=100% border=0>

	<TR id=high> 
	<TD height="25"  align=left><SPAN class=text><fmt:message key='webclient.topo.addnode.snmpport'/></SPAN>
	</TD>
	
	<TD> <html:text size="30" styleClass= "formStyle" name="AddNodeForm" property="snmpport"/> 
        </TD>
        </TR>
	<TR>
	
	<TR id=high> 
	<TD height="25"  align=left>
		<SPAN class=text><fmt:message key='webclient.topo.addnode.community'/></SPAN>
	</TD>
	<TD>
		<html:text size="30" styleClass= "formStyle" name="AddNodeForm" property="community"/> 
	</TD>
	</TR>
        
        <TR id=high>
        <TD align=left colSpan=2>
        <IMG src="/webclient/topo/images/spacer.gif" height=10 width=10>
        </TD>
        </TR>
        </TABLE>
</td>
</tr>

<TR id=high>
<td>&nbsp;</td>

<TD vAlign=top align=left>

	<TABLE cellSpacing=0 cellPadding=4 width=100% border=0>
	
	<TR> 
	<TD height="25" ><html:checkbox property="version" onclick="ToggleStates()" value="v3"/>
	</TD>
	
	<TD height=25 align = "left">
		<SPAN class=text><fmt:message key='webclient.topo.addnode.snmpv3'/></SPAN>
	</TD>
	
	<TD height=25 align="right"><div align="left"><SPAN class=text><fmt:message key='webclient.topo.addnode.username'/></SPAN></div></TD>
                      <TD height=30> <c:choose> <c:when test='${AddNodeForm.map.version == "v3"}'> 
                      <html:text styleClass= "formStyle" disabled ="true" name="AddNodeForm" property="userName"/></TD></c:when><c:otherwise>
                      <html:text styleClass= "formStyleDisabled" disabled ="true" name="AddNodeForm" property="userName"/></TD> </c:otherwise></c:choose></TR>
                  <TR> 
                    <TD height=30>&nbsp;</TD>
                    <TD height=30>&nbsp;</TD>
                    <TD height=30><div align="left"><SPAN class=text><fmt:message key='webclient.topo.addnode.contextname'/></SPAN></div></TD>
                    <TD height=30 > <c:choose> <c:when test='${AddNodeForm.map.version == "v3"}'> 
                      <html:text  size="30" styleClass= "formStyle" disabled ="true" name="AddNodeForm" property="contextName"/></TD></c:when><c:otherwise>
                    <html:text  size="30" styleClass= "formStyleDisabled" disabled ="true" name="AddNodeForm" property="contextName"/></TD> </c:otherwise></c:choose></TR>

                </TABLE></TD></TR>

<TR id=high> 
   <td>&nbsp;</td>
                  <TD height="25"  class=header2Bg align=left><SPAN class=boldText>&nbsp;<fmt:message key='webclient.topo.addnode.discoveryconfig'/></SPAN></TD>
                </TR>
<TR id=high> 
   <td>&nbsp;</td>

                  
                <TD vAlign=top align=left>
                <TABLE width="100%" border=0  cellPadding=4 cellSpacing=0>
                <TR>
                <TD width=20 height=25><html:checkbox property="discovery" onclick="ToggleOthers()"/></TD>
                <TD  height=25><SPAN class=text><fmt:message key='webclient.topo.addnode.discovery'/></SPAN></TD>
                </TR>
  
                <TR>
                <TD width=20 height=25><html:checkbox property="reachFlag"/></TD>
                <TD  height=25><SPAN class=text><fmt:message key='webclient.topo.addnode.reachflag'/></SPAN></TD>
                </TR>
                
                <TR vAlign=center align=left> 
                <TD height=25><html:checkbox property="discoverParentNet"/></TD>
                <TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnode.discflag'/></SPAN></TD>
                </TR>
                
                <TR vAlign=center align=left> 
		<TD height=25><html:checkbox property="configFlag"/></TD>
		<TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnode.configflag'/></SPAN></TD>
		</TR>
                        <TR vAlign=center align=left> 
                          <TD height=25><html:checkbox property="writeToSeedFile"/></TD>
                          <TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnode.writetoseedfile'/></SPAN></TD>
                        </TR>

                    </TABLE>
                    </TD>
                </TR>

<TR id=high>
   <td>&nbsp;</td>
                
                  <TD height=50>
                  	
                  	<TABLE cellSpacing=0 cellPadding=4 width="100%" border=0>
                        <TR> 
                        <TD width=1><html:checkbox property="asynFlag" /></TD>
                        <TD width="228"> <SPAN class=text><fmt:message key='webclient.topo.addnode.background'/></td>
                        <TD valign="middle"> <INPUT class=button type=submit value="<fmt:message key='webclient.topo.addnode.addnodebutton'/>" name=submit>
                           <INPUT class=button type=reset value="<fmt:message key='webclient.topo.addnode.clearbutton'/>" name=reset onClick="disableFields()"></TD>
                        </TR>
                    </TABLE></TD>
                </TR>
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
              <!--/TD>
              <TD align="left" valign="top"-->

                <table width="151" height="293" border="0" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td width="1" height="36" align="left" valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="36"></td>
                    <td width="131" align="left" valign="top">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="1" height="30" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="30"></td>
                    <td align="left" valign="top" class="messtext"><html:errors property="ipAddress"/></td>
                  </tr>
                  <tr> 
                    <td width="1" height="21" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="20"></td>
                    <td align="left" valign="top" class="messtext">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="1" height="65" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="65"></td>
                    <td align="left" valign="top" class="messtext"></td>
                  </tr>
                  <tr> 
                    <td width="1" height="28" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="20"></td>
                    <td align="left" valign="top" class="messtext"><html:errors property="snmpport"/></td>
                  </tr>
                  <tr> 
                    <td width="1" height="33" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="20"></td>
                    <td align="left" valign="top" class="messtext"><html:errors property="community"/></td>
                  </tr>
                  <tr> 
                    <td colspan="2" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="28"></td>
                  </tr>
                  <tr> 
                    <td width="1" height="20" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="20"></td>
                    <td align="left" valign="top" nowrap class="messtext"><html:errors property="userName"/></td>
                  </tr>
                  <tr> 
                    <td colspan="2" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="10"></td>
                  </tr>
                  <tr> 
                    <td width="1" height="30" align="left" valign="top" class="messtext"><img src="/webclient/topo/images/spacer.gif" width="1" height="20"></td>
                    <td align="left" valign="top" class="messtext"><html:errors property="contextName"/></td>
                  </tr>
</table>


<BR>
</html:form> <html:javascript formName="AddNodeForm"/> 

</body>
