<%-- $Id: addNetwork.jsp,v 1.5 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<TITLE><fmt:message key='webclient.topo.actions.addnetwork.title'/></TITLE>
<script type="text/javascript">
/*function setOption()
{

   if(document.getElementById("addnetwork").checked )
   {
     invert(document.getElementById("addnetwork"));
   }else
   {
     invert(document.getElementById("addnodes"));
   }

}*/

function toggleDHCP()
{
   if(document.AddNetworkForm.isDHCP.checked)
   {
      document.AddNetworkForm.writeToSeedFile.checked=true;
      document.AddNetworkForm.writeToSeedFile.disabled=true;
   }
   else
   {
      document.AddNetworkForm.writeToSeedFile.checked=false;
      document.AddNetworkForm.writeToSeedFile.disabled=false;
   }
}

function ToggleOthers()
{
   if(document.AddNetworkForm.discovery.checked)
   {
      document.AddNetworkForm.isDHCP.disabled=true;
      document.AddNetworkForm.managed.disabled=true;
      document.AddNetworkForm.discover.disabled=true;
      document.AddNetworkForm.configFlag.disabled=true;
      document.AddNetworkForm.writeToSeedFile.disabled=true;
      
   }
  
   else
   {
      document.AddNetworkForm.isDHCP.disabled=true;
      document.AddNetworkForm.managed.disabled=false;
      document.AddNetworkForm.discover.disabled=false;
      document.AddNetworkForm.configFlag.disabled=false;
      document.AddNetworkForm.writeToSeedFile.disabled=false;

   }

}
function invert()
{

  if(document.getElementById("addnetwork").checked)
  {
     document.getElementById("entirenetwork").style.display = "block";
     document.getElementById("manynodes").style.display = "none";
     document.AddNetworkForm.single.value=false;
     document.AddNetworkForm.startipAddress.value="";
     document.AddNetworkForm.endipAddress.value="";
     document.AddNetworkForm.discovery.disabled=false;
     document.AddNetworkForm.discover.disabled=false;
     document.AddNetworkForm.managed.disabled=false;
     document.AddNetworkForm.configFlag.disabled=false;
     document.AddNetworkForm.startipAddress.disabled=true;
     document.AddNetworkForm.endipAddress.disabled=true;
     document.AddNetworkForm.ipAddress.disabled=false;
     document.AddNetworkForm.asynFlag.checked=false;
     document.AddNetworkForm.writeToSeedFile.checked=false;
     document.AddNetworkForm.writeToSeedFile.disabled=false;
     document.AddNetworkForm.isDHCP.checked=false;
     document.AddNetworkForm.isDHCP.disabled=true;
     document.AddNetworkForm.discover.checked=true;
     document.AddNetworkForm.managed.checked=true
     document.getElementById("async").className='hide';
     document.getElementById("sync").className='';
  }
  else
  {
    document.getElementById("entirenetwork").style.display = "none";
    document.getElementById("manynodes").style.display = "block";
    document.AddNetworkForm.single.value=true;
    document.AddNetworkForm.ipAddress.value="";
    document.AddNetworkForm.discovery.checked=false;
    document.AddNetworkForm.writeToSeedFile.disabled=false;
    document.AddNetworkForm.discovery.disabled=true;
    document.AddNetworkForm.discover.disabled=true;
    document.AddNetworkForm.isDHCP.disabled=false;
    document.AddNetworkForm.managed.disabled=true;
    document.AddNetworkForm.managed.disabled=true;
    document.AddNetworkForm.configFlag.disabled=true;
    document.AddNetworkForm.ipAddress.disabled=true;
    document.AddNetworkForm.startipAddress.disabled=false;
    document.AddNetworkForm.endipAddress.disabled=false;
    document.AddNetworkForm.asynFlag.checked=true;
     document.AddNetworkForm.discover.checked=false;
     document.AddNetworkForm.managed.checked=false;
    document.getElementById("async").className='';
    document.getElementById("sync").className='hide';
  }
}

function resetFields()
{
	
	document.AddNetworkForm.netmask.selectedIndex=14;

	if(document.getElementById("addnetwork").checked)
	{

		document.AddNetworkForm.ipAddress.value="";
		document.AddNetworkForm.discovery.checked=false;
		document.AddNetworkForm.discover.checked=true;
		document.AddNetworkForm.discover.disabled=false;
		document.AddNetworkForm.managed.checked=true;
		document.AddNetworkForm.managed.disabled=false;
		document.AddNetworkForm.configFlag.checked=false;
		document.AddNetworkForm.configFlag.disabled=false;
		document.AddNetworkForm.writeToSeedFile.checked=false;
		document.AddNetworkForm.writeToSeedFile.disabled=false;
		document.AddNetworkForm.asynFlag.checked=false;

	}
	else
	{
		document.AddNetworkForm.startipAddress.value="";
		document.AddNetworkForm.endipAddress.value="";
		document.AddNetworkForm.writeToSeedFile.disabled=false;
		document.AddNetworkForm.writeToSeedFile.checked=false;
		document.AddNetworkForm.isDHCP.checked=false;
	}

}

function calledonSubmit()
{
   if(document.getElementById("addnetwork").checked)
   {
      if(!checkip(document.AddNetworkForm.ipAddress.value))
      {
         alert('<fmt:message key="webclient.topo.addnetwork.networkip.format"/>');
         return false;
      }
   }
   else
   {
      var start = document.AddNetworkForm.startipAddress.value;
      var end = document.AddNetworkForm.endipAddress.value;
      if(!checkip(start))
      {
         alert('<fmt:message key="webclient.topo.addnetwork.startip.format"/>');         
         return false;
      }
      if(!checkip(end))
      {
         alert('<fmt:message key="webclient.topo.addnetwork.endip.format"/>');
         return false;
      }
      var endip = end.split(".");
      var startip = start.split(".");
      for(i=0;i<endip.length;i++)
      {
        if((i<=2)&&(startip[i]!=endip[i]))
        {
           alert('<fmt:message key="webclient.topo.addnetwork.startendip.samenetwork"/>');
           return false;
        }
        if(i==3&&(startip[i]==0||endip[i]==0))
        {
           alert("<fmt:message key='webclient.topo.addnetwork.ipaddress.nozero'/>");
           return false;
        }
        if(i==3&&(parseInt(startip[i],10)>=parseInt(endip[i],10)))
        {
              alert('<fmt:message key="webclient.topo.addnetwork.startip.greater"/>'+startip[i]+" ... "+endip[i]);
           return false;
        }
      }
   }
   document.AddNetworkForm.writeToSeedFile.disabled=false;
   return true;
}

function checkip(value)
{
   var ip = value.split(".");
   if(ip.length != 4)
   {
      return false;
   }
   for(i=0;i<ip.length;i++)
   {
     if(isPositiveInteger(ip[i]))
     {
       var temp = parseInt(ip[i],10);
       if(temp > 255||temp<0)
       {
         return false;
       }
     }
     else
     {
        return false;
     }
   }
   return true;
}
 
function isPositiveInteger(str)
{
   var temp  = parseInt(str,10);
   if ( isNaN(temp) || temp.toString().length != str.length) 
   {
       return false;
   }
   var objRegExp = /(^\d\d*$)/;
   return objRegExp.test(temp);
}
</script>
<BODY onload="javascript:invert()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.topo.addnetwork.header'/></h1></td>
        </tr>
      </table>

<html:form action="/AddNetworkAction" onsubmit="return calledonSubmit();"> 

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
<td colspan="2" class="text" height="40"><fmt:message key='webclient.topo.addnetwork.helpmessage'/></td>
</TR>
	
<TR id=high>
<td>&nbsp;</td>
<%--<TD class=header2Bg align=left height=25>
	<SPAN class=boldText>&nbsp;<fmt:message key='webclient.topo.addnetwork.general'/></SPAN></TD>--%>
<td class=header2Bg>
<table width=100% cellSpacing=0 cellPadding=0 border=0>
<tr><td align="left"><SPAN class=boldText><fmt:message key="webclient.topo.addnetwork.entirenetwork"/></span>
<html:radio  name="AddNetworkForm" styleId="addnetwork" property="single" value="false" onclick="invert()"/></td>
<td align="right">
<SPAN class=boldText><fmt:message key="webclient.topo.addnetwork.rangeofnodes"/></span>
<html:radio name="AddNetworkForm" styleId="addnodes" property="single" value="true" onclick="invert()"/></td></tr></table>
</td></TR>
<TR>
<td height="10"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
<td colspan="2" height="10"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
</TR>

<TR id=high> 
<td>&nbsp;</td>
<TD colspan="2">
	<TABLE cellSpacing=0 cellPadding=4 width=100% border=0>
		
		<TR height=25 id=high>
		<TD align=left>
                 <div id="entirenetwork" style="DISPLAY:block">
                <table><tr><TD height="20" align=left width="120">
                <SPAN class=text>
                <fmt:message key='webclient.topo.addnetwork.netaddress'/></SPAN></TD>
                <TD height="20" align=left>
                <html:text size="30" styleClass= "formStyle" name="AddNetworkForm"  property="ipAddress"/>
                 </TD></tr>
                 </table></div>

                 <div id="manynodes" style="DISPLAY:none">
                 <table><tr>
                 <td height="20" align=left width=120><SPAN class=text>
                 <fmt:message key="webclient.topo.addnetwork.startIP"/></SPAN></td>

                <td height="20" align=left><html:text size="30" styleClass="formStyle" name="AddNetworkForm" property="startipAddress" /></td>

                </tr>
                <tr>
                <td height="20" align=left width="120"><SPAN class=text><fmt:message key="webclient.topo.addnetwork.endIP"/></SPAN></td>

                <td height="20" align=left><html:text size="30" styleClass="formStyle" name="AddNetworkForm" property="endipAddress"/>
</td></tr>
                 </table>
                 </div></td>

<%--	<SPAN class=text><fmt:message key='webclient.topo.addnetwork.netaddress'/></SPAN>
	</TD>
	<TD>
	<html:text size="30" styleClass= "formStyle" name="AddNetworkForm" property="ipAddress" />
	</TD>--%>
		</TR>
			

		<TR height=20 id=high>
			
		<TD >
<table><tr><td width="120">
			<SPAN class=text><fmt:message key='webclient.topo.addnetwork.netmask'/></SPAN>
		</TD>
	
		<TD height="20" align=left> 
			<html:select   styleClass= "formStyle" name="AddNetworkForm" property="netmask" > 
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
		</TR></td></tr></table></td></tr>
</TABLE>
</TD>
</TR>
<tr><td colspan=2>&nbsp;</td></tr>
<TR id=high> 
 <td>&nbsp;</td>
                                                  
<TD colspan="2" class=header2Bg height=25>
	<SPAN class=boldText>&nbsp;<fmt:message key='webclient.topo.addnetwork.discoveryconfig'/></SPAN></TD>
                                                  </TR>
                                                  <TR id=high>
                                                  <td>&nbsp;</td>

                                                    <TD vAlign=top align=left> 
    <TABLE cellSpacing=4 cellPadding=0  width="100%" border=0>
                  <TR vAlign=center align=left>
                      <TD width=20 height=25><html:checkbox name="AddNetworkForm" property="discovery" onclick="ToggleOthers()"/></TD>
                      <TD width=384 height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.dontdiscovery'/></SPAN></TD>
                  </TR>
                  <TR vAlign=center align=left> 
                       <TD width=20 height=25><html:checkbox name="AddNetworkForm" property="discover"/></TD>
                       <TD width=384 height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.startdiscovery'/></SPAN></TD>
                   </TR>
 
                  <TR vAlign=center align=left> 
                        <TD height=25><html:checkbox name="AddNetworkForm" property="managed"/></TD>
                        <TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.manage'/></SPAN></TD>
                  </TR>
                  <TR vAlign=center align=left> 
                       <TD height=25><html:checkbox name="AddNetworkForm" property="configFlag"/></TD>
                        <TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.confflag'/></SPAN></TD>
                  </TR>
                  <TR vAlign=center align=left> 
                         <TD height=25><html:checkbox name="AddNetworkForm" property="writeToSeedFile"/></TD>
                          <TD height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.wtitetoseedfile'/></SPAN></TD>
                  </TR>

                  <TR vAlign=center align=left>
                        <TD width=20 height=25><html:checkbox name="AddNetworkForm" property="isDHCP" onclick="toggleDHCP()" /></TD>
                  <TD width=384 height=25><SPAN class=text><fmt:message key='webclient.topo.addnetwork.startisDHCP'/></SPAN></TD>
                  </TR>

                        
                   </TABLE></TD>
                   </TR>
         <INPUT type=hidden value=v1 name=snmpVersion22>

                                                <TR id=high>
                                                <td>&nbsp;</td>
                                                   <TD height=50> 
                                                    <TABLE cellSpacing=0 cellPadding=4 width="100%" border=0 id='sync' class=''>
                                                      
                                                        <TR> 
                                                          <TD width=1><html:checkbox name="AddNetworkForm" property="asynFlag"/></TD>
                                                          <TD width="228" align=left><SPAN class=text><fmt:message key='webclient.topo.addnetwork.background'/> 
                                                            </SPAN></TD>
                                                          <TD nowrap> 
                                                            <INPUT type=submit class=button value=<fmt:message key='webclient.topo.addnetwork.addnetworkbtn'/>
                                                            name=submit>
                                                            <INPUT class=button type=button onclick="resetFields()" value=<fmt:message key='webclient.topo.addnetwork.clearbtn'/>
                                                            name=reset></TD>
                                                        </TR>
                                                      
                                                    </TABLE>
<TABLE cellSpacing=0 cellPadding=4 width="100%" border=0 id='async' class=''>
<TR>
    <TD nowrap align=center><INPUT type=submit class=button value=<fmt:message key='webclient.topo.addnetwork.addnetworkbtn'/> name=submit>
               <INPUT class=button type=button onclick="resetFields()" value=<fmt:message key='webclient.topo.addnetwork.clearbtn'/> name=reset></TD>
</TR>
</TABLE>
</TD>
                                                </TR>
                                                   </TABLE>
<!--/TD>
                                            <TD vAlign=top align=left width="24%">  </td-->
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</html:form>
</BODY>
