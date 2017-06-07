<%-- $Id: snmpNodeTabDetails.jsp,v 1.3 2007/10/18 06:25:06 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<script language="JavaScript" type="text/JavaScript">

</script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>


<c:set var="swaptableid"  value="${swaptableid+2}" scope='request'/>


      <tr id='<c:out value="swipecontent${swaptableid-1}" />' >
       <td class="htableBorder" height="20">

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

  <table border="0" cellpadding="0" cellspacing="0" class="table">
    
      <tr> 


<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg" >
         <td width=720" class="propFormBlackText"> <span ><fmt:message key='webclient.topo.objectdetails.tab.protocol.header'/></span></td>
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' ><%--<a class="propFormLink" href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><fmt:message key='webclient.topo.objectdetails.edit'/></a>--%></td>
		<td width="20"  id='<c:out value="editswipe${swaptableid}" />'  ><%--<a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><img border=0 src="/webclient/common/images/edit.gif" height="15" width="15"></a>--%></td>
</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.snmpport'/></span> </td>
        <td width="210" class="blackText" > <span ><c:out value='${ObjectDetailsBean.map.snmpport}'/></span> </td>
        <td width="175" class="blackBoldText" > <span><fmt:message key='webclient.topo.objectdetails.basemibs'/></span></td>
        <td width="210" class="blackText" > <span ><c:out value='${ObjectDetailsBean.map.baseMibs}'/></span> </td>

      </tr>
      <tr class="odd"> 
          <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.readcommunity'/></span></td>
          <td class="blackText" ><span ><c:out value='${ObjectDetailsBean.map.community}'/></span> </td>
          <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.writecommunity'/></span></td>
          <td class="blackText" ><span ><c:out value='${ObjectDetailsBean.map.writeCommunity}'/></span> </td>
      </tr>

      <tr class="even"> 
        <td  class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.version'/></span></td>
        <td  class="blackText" > <c:out value='${ObjectDetailsBean.map.version}'/>&nbsp;</td>
        <td  class="blackText" colspan="2">&nbsp;</td>
      </tr>

      <c:choose>      
      <c:when test='${ObjectDetailsBean.map.version == "v3"}'> 
      <tr class="odd"> 
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.contextname'/></span></td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.contextName}'/></td>
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.username'/></span> </td>
        <td class="blackText" > <c:out value='${ObjectDetailsBean.map.userName}'/></td>
      </tr>
      <tr class="even">
      </c:when>
      <c:otherwise>
      <tr class="odd">
      </c:otherwise>
      </c:choose>
 

     
<%--
<tr>
<td colspan="4" height="20" class="header2bg">
<span ><fmt:message key='webclient.topo.objectdetails.tab.snmpnode.header'/></span></td>
 </tr>
--%>
        <td width="175" class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.sysoid'/> </span></td>
        <td width="210" class="blackText" > <c:out value='${ObjectDetailsBean.map.sysOID}'/>   </td>
        <td width="175" class="blackBoldText" > <span> <fmt:message key='webclient.topo.objectdetails.sysdescr'/></span></td>
        <td width="210" class="blackText"> <c:out value='${ObjectDetailsBean.map.sysDescr}'/></td>
      </tr>
        
      <tr class="even"> 
          <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.hostnetmask'/></span></td>
          <td class="blackText" > <c:out value='${ObjectDetailsBean.map.hostNetmask}'/></td>
          <td colspan="2">&nbsp;</td>
      </tr>


     </table></td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>



 <tr id='<c:out value="swipecontent${swaptableid}" />' class="hide">
       <td class="htableBorder" height="20">
 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
  <table border="0" cellpadding="0" cellspacing="0" class="table">

    <tr> 
<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg"   >

  <td width="710" class="propFormBlackText"> <span ><fmt:message key='webclient.topo.objectdetails.tab.protocol.header'/></span></td>
  <td width="40" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a class="propFormLink" href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

</tr>
</table>
</td>

      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.snmpport'/></span> 
        </td>
        <td class="blackText" > 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="32%"> <html-el:text styleClass= "formstyle" name="ObjectDetailsBean"  property="snmpport"/></td>
              <c:set target="${ObjectDetailsBean.map}" property="snmpport" value="${null}"/> 
              <td width="49%" class="errorText"> <html-el:errors property="snmpport"/></td>
            </tr>
          </table></td>
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.basemibs'/></span></td>
        <td class="blackText" ><html-el:text styleClass= "formStyle"  name="ObjectDetailsBean" property="baseMibs"/></td>
        <c:set target="${ObjectDetailsBean.map}" property="baseMibs" value="${null}"/> 
      </tr>

      <tr class="odd"> 
           <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.readcommunity'/></span></td>
           <td class="blackText" > <select name="communitylist" style=width:100 class="formStyle">
           <c:forTokens items="${ObjectDetailsBean.map.community}" var="token" delims=" " > 
           <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
           </c:forTokens> </select>
           <td width="150" > <span ><fmt:message key='webclient.topo.objectdetails.writecommunity'/></span></td>
           <td > <select name="writecommunitylist" style=width:100 class="formStyle">
           <c:forTokens items="${ObjectDetailsBean.map.writeCommunity}" var="token" delims=" " > 
           <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
           </c:forTokens> </select> </td>

      </tr>

       <tr class="even"> 
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.version'/></span></td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.version}'/>&nbsp;</td>
        <td colspan="2">&nbsp;</td>
      </tr>

      <c:if test='${ObjectDetailsBean.map.version == "v3"}'> 
      <tr class="odd"> 
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.contextname'/></span> </td>
        <td class="blackText" > <c:out value='${ObjectDetailsBean.map.contextName}'/></td>
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.username'/></span> </td>
        <td class="blackText" > <c:out value='${ObjectDetailsBean.map.userName}'/></td>
      </tr>
      </c:if> 
<%--
      <tr>
        <td colspan="4" height="20" class="header2bg" > 
        <span ><fmt:message key='webclient.topo.objectdetails.tab.snmpnode.header'/></span></td>
      </tr>
--%>
      <tr class="odd"> 
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.sysoid'/> </span></td>
        <td class="blackText" > <c:out value='${ObjectDetailsBean.map.sysOID}'/> </td>
        <td class="blackBoldText" > <span > <fmt:message key='webclient.topo.objectdetails.sysdescr'/></span></td>
        <td class="blackText"> <c:out value='${ObjectDetailsBean.map.sysDescr}'/></td>
      </tr>

      <tr class="even"> 
         <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.hostnetmask'/></span></td>
         <td class="blackText" > <c:out value='${ObjectDetailsBean.map.hostNetmask}'/></td>
         <td colspan=2 align="right" valign="middle"> 
         <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
      </tr>

 
    </table></td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>
