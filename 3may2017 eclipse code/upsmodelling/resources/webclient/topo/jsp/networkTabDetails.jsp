<%-- $Id: networkTabDetails.jsp,v 1.3 2007/10/18 06:25:06 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript">
 var formBean = '<c:out value="${beanName}"/>';
 var formName = eval('document.'+formBean);

function showNodeList()
{
    if(eval(formName.nodelist.selectedIndex)+1)
    {
        nodeurl="/topo/objectdetails.do?requestid=SNAPSHOT&name="+formName.nodelist.options[formName.nodelist.selectedIndex].value;
        location.href = nodeurl;
    }
}

function showSubNetworks()
{
    if(eval(formName.subnetslist.selectedIndex)+1)
    {
        neturl="/topo/objectdetails.do?requestid=SNAPSHOT&name="+formName.subnetslist.options[formName.subnetslist.selectedIndex].value;
        location.href = neturl;
    }
}
</script>

<c:set var="swaptableid"  value="${swaptableid+2}" scope='request'/>

      <tr id='<c:out value="swipecontent${swaptableid-1}" />' >
       <td class="htableBorder"  height="20">
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
    <table width="100%" border="0" cellpadding="0" valign="top" cellspacing="0" class="table">
    
<tr> 
<td colspan="4" >
<table cellpadding="0" cellspacing="0">
<tr height="20" class="header2bg">
         <td width="720" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.network.header'/> </td>
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' >
    <%-- <a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" >Edit</a> --%> </td>
		<td width="20"  id='<c:out value="editswipe${swaptableid}" />'><%--<img src="/webclient/common/images/edit.gif" height="15" width="15">--%></td>
</tr>
</table>
</td>
 </tr>

      <tr class="even"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.nodelist'/> </td>
        <td width="210" class="blackText" >
         <c:choose> <c:when test="${!empty ObjectDetailsBean.map.NodeList}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr width="220"> 
              <td nowrap>
                 <select  name="nodelist" class="formStyle" >
                  <c:forTokens items="${ObjectDetailsBean.map.NodeList}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
                    <c:if test='${counter.index == 0}'>
                        selected
                    </c:if>
                    ><c:out value="${token}"/></option>
                  </c:forTokens> </select><A href="javascript:showNodeList()" ><fmt:message key='webclient.topo.objectdetails.network.nodelist.details'/> </A> </td>
            </tr>
         </table></c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td> 
    
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.interfacelist'/> </td>
        <td width="210" class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.InterfaceList}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="100%"> <select name="interfacelist" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.InterfaceList}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
                    <c:if test='${counter.index == 0}'>
                        selected
                    </c:if>
                    ><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
            </tr>
          </table></c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.subnets'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.subNets}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="32%"> <select name="subnetslist"  class="formStyle1">
                  <c:forTokens items="${ObjectDetailsBean.map.subNets}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
                    <c:if test='${counter.index == 0}'>
                        selected
                    </c:if>
                    ><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
              <td width="19%" class="text"><a href="javascript:showSubNetworks()"><fmt:message key='webclient.topo.objectdetails.network.subnets.details'/></a></td>
              <td width="49%" class="formStyle1"><fmt:message key='webclient.topo.objectdetails.network.subnets.help'/></td>
            </tr>
          </table></c:when> <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
     
        <td class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.network.subnetmasks'/></td>
        <td class="blackText" ><c:choose>
             <c:when test="${!empty ObjectDetailsBean.map.subNetNetmasks}"> 
             <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
              <tr> <td width="100%"> <select name="subnetmasksslist" class="formStyle1">
                  <c:forTokens items="${ObjectDetailsBean.map.subNetNetmasks}" var="token" delims=" " > 
                  <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
              </tr>
          </table>
        </c:when>
         <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
      </tr>

      <tr  class="even"> 
        <td class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.network.parentnetmask'/> </td>
        <td class="blackText" ><c:choose>
             <c:when test="${!empty ObjectDetailsBean.map.parentNetmask and ObjectDetailsBean.map.parentNetmask !='null'}"> 
             <c:out value='${ObjectDetailsBean.map.parentNetmask}'/>
             </c:when>
             <c:otherwise> <span class="text">--</span> </c:otherwise> </c:choose> </td>

        <td class="blackBoldText" >  <fmt:message key='webclient.topo.objectdetails.network.parentnetwork'/> </td>
        <td class="blackText" >
         <c:choose>
         <c:when test="${!empty ObjectDetailsBean.map.parentNetwork and ObjectDetailsBean.map.parentNetwork != 'null'}"> 
          <c:out value='${ObjectDetailsBean.map.parentNetwork}'/>
         </c:when>
         <c:otherwise>  -- </c:otherwise> </c:choose> </td>
      </tr>
    </table>
	</td>
 <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</td> </tr>





   <tr id='<c:out value="swipecontent${swaptableid}" />' class="hide">
       <td class="htableBorder" height="20">
    <table width="100%" border="0" valign="top" cellpadding="0" cellspacing="0" class="table">

  <tr> 
<td colspan="4" >
<table  class="htableBorder" cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg"   >

  <td width="710" class="boldText"> <fmt:message key='webclient.topo.objectdetails.tab.network.header'/> </td>
  <td width="40" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

</tr>
</table>
</td>
</tr>

      <tr  class="even"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.nodelist'/>  </td>
        <td width="210" class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.NodeList}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td > <select name="nodelist1"  class="formStyle" >
                  <c:forTokens items="${ObjectDetailsBean.map.NodeList}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>
><c:out value="${token}"/></option>
                  </c:forTokens> </select> 
               <A href="javascript:showNodeList()" ><fmt:message key='webclient.topo.objectdetails.network.nodelist.details'/> </A> </td>
            </tr>
          </table></c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td>
     
        <td width="175" class="blackBoldText" >  <fmt:message key='webclient.topo.objectdetails.network.interfacelist'/> </td>
        <td width="210" class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.InterfaceList}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="100%"> <select name="interfacelist" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.InterfaceList}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
                    <c:if test='${counter.index == 0}'>
                        selected
                    </c:if>
                    ><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
            </tr>
          </table></c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td>
      </tr>

      <tr  class="odd" > 
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.subnets'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.subNets}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="32%"> <select name="subnetslist"  class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.subNets}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
              <td width="19%" class="text"><a href="javascript:showSubNetworks()"><fmt:message key='webclient.topo.objectdetails.network.subnets.details'/></a></td>
              <td width="49%" class="formStyle"><fmt:message key='webclient.topo.objectdetails.network.subnets.help'/></td>
            </tr>
          </table></c:when> <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
     
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.network.subnetmasks'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.subNetNetmasks}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="100%"> <select name="subnetmasksslist" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.subNetNetmasks}" var="token" delims=" " > 
                  <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td>
            </tr>
          </table></c:when> <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
      </tr>

      <tr class="even"> 
        <td width="175" class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.network.parentnetmask'/></td>
        <td width="210" class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentNetmask and ObjectDetailsBean.map.parentNetmask !='null'}"> 
          <c:out value='${ObjectDetailsBean.map.parentNetmask}'/> </c:when> <c:otherwise> 
          <span class="text">--</span> </c:otherwise> </c:choose> </td>
    
        <td width="175" class="blackBoldText" >  <fmt:message key='webclient.topo.objectdetails.network.parentnetwork'/> </td>
        <td width="210" class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentNetwork and ObjectDetailsBean.map.parentNetwork != 'null'}"> 
          <c:out value='${ObjectDetailsBean.map.parentNetwork}'/> </c:when> <c:otherwise> 
          -- </c:otherwise> </c:choose> </td>
      </tr>

    <tr> 
        <td colspan="4"><img src="/webclient/topo/images/spacer.gif" width="1" height="5"></td>
      </tr> 
      <tr class="odd"> 
      <td colspan=4 align="right" valign="middle"> 
          <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
    </tr>
    </table>
</td> </tr>


