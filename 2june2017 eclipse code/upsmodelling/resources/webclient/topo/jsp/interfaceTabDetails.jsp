<%-- $Id: interfaceTabDetails.jsp,v 1.3 2007/10/18 06:26:18 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

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
        <td width="720" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.interface.header'/></td>
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' ><%--<a class="propFormLink" href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><fmt:message key='webclient.topo.objectdetails.edit'/></a>--%></td>
		<td width="20"  id='<c:out value="editswipe${swaptableid}" />'><%--<a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><img border=0 src="/webclient/common/images/edit.gif" height="15" width="15"></a>--%></td>
    </tr>
    </table>
    </td>


      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.parentnet'/> </td>
        <td width="210" class="blackText" ><A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNet}'/>" > <c:out value='${ObjectDetailsBean.map.parentNet}'/>  </A>   </td>
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.parentnode'/></td>
        <td width="210" class="blackText" ><A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNodeKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentNodeKey}'/>    </A> </td>
      </tr>
<%--    
      <tr> 
         <td colspan="4" class="header2bg" ><span >
         <fmt:message key='webclient.topo.objectdetails.tab.relationship.header'/></span></td>
     </tr>
--%>
      <tr class="odd"> 
        <td class="blackBoldText" >  <fmt:message key='webclient.topo.objectdetails.parentkey'/>  </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}"> 
          <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/> 
          </A> </c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td>
    
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.groupnames'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td  rowspan="2" align="left"> 
                <select name="groupnames"  class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select></td>
              <td width="99" align="left" ><a href="javascript:showGroup()"> 
                <fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a></td>
              <td  align="left" class="formStyle"><fmt:message key='webclient.topo.objectdetails.groupnames.help'/></td>
            </tr>
          </table></c:when> <c:otherwise> <span >--</span> </c:otherwise> 
          </c:choose> </td>
      </tr>


 <tr  class="even"> 
          <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.iscontainer'/> </td>
          <td class="blackText" > <c:out value='${ObjectDetailsBean.map.isContainer}'/> </td>
       
         <c:choose>
         <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
     
          <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.childrenkeys'/> </td>
          <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="46" align="left"> 
                <select name="childerenkeyslist" size="1" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left" ><a href="javascript:showChild()"><fmt:message key='webclient.topo.objectdetails.childrenkeys.details'/></a></td> --%>
         <%--     <td  align="left" class="formStyle"><fmt:message key='webclient.topo.objectdetails.childrenkeys.help'/> </td> --%>
            </tr>
          </table></c:when> <c:otherwise> <span >--</span> </c:otherwise> 
          </c:choose> </td>
        
      </c:when> 
      <c:otherwise>
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.isgroup'/> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.isGroup}'/> </td>
      </c:otherwise>
      </c:choose>
      </tr>
   

      <tr  class="odd"> 
      <c:choose>
      <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
          <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.isgroup'/> </td>
          <td class="blackText" ><c:out value='${ObjectDetailsBean.map.isGroup}'/> </td>
        <c:choose>
        <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'> 
    
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.groupmembers'/></td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}"> 
          <table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td rowspan="2" align="left"> 
                <select name="groupmembers"  class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left" class="text"><a href="javascript:showMember()"><fmt:message key='webclient.topo.objectdetails.groupmembers.details'/></a></td> --%>
         <%--     <td width="297" align="left" class="formStyle"><fmt:message key='webclient.topo.objectdetails.groupmembers.help'/></td>  --%>
            </tr>
          </table></c:when> <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
     
      </c:when>
      <c:otherwise>
              <td colspan=2 align="right" valign="middle">  &nbsp;  </td> 
      </c:otherwise> 
      </c:choose>      
      </c:when> 
      <c:otherwise>
          <c:choose> 
            <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>  
          <%--    <c:if test='${ObjectDetailsBean.map.isGroup == "true"}'>  --%>

     <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.groupmembers'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}"> 
          <table width="100%" height="54" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="38" height="54" rowspan="2" align="left"> 
                <select name="groupmembers" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left"><a href="javascript:showMember()"><fmt:message key='webclient.topo.objectdetails.groupmembers.details'/></a></td> --%>
  
            </tr>
          </table></c:when> <c:otherwise> <span >--</span> </c:otherwise> 
          </c:choose> </td>
          <td colspan=2 align="right" valign="middle">  &nbsp;  </td> 
          </c:when> 
          <c:otherwise>
          
          </c:otherwise>
          </c:choose>
      </c:otherwise>
      </c:choose>
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

    <td width="710" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.interface.header'/></td>
    <td width="40" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a class="propFormLink" href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
    <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

    </tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.parentnet'/> </td>
        <td width="210" class="blackText" ><A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNet}'/>" > <c:out value='${ObjectDetailsBean.map.parentNet}'/>  </A> </td>
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.parentnode'/> </td>
        <td width="210" class="blackText" ><A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNodeKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentNodeKey}'/> </A> </td>
      </tr>
<%--
      <tr> 
         <td colspan="4" class="header2bg" >
         <fmt:message key='webclient.topo.objectdetails.tab.relationship.header'/></td>
     </tr>
--%>
      <tr class="odd" > 
        <td class="blackBoldText" >  <fmt:message key='webclient.topo.objectdetails.parentkey'/>  </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}"> 
          <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/> 
          </A> </c:when> <c:otherwise> -- </c:otherwise> </c:choose> </td>
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.groupnames'/> </td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="46" rowspan="2" align="left"> 
                <select name="groupnames" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select></td> <%--
              <td width="99" align="left"><a href="javascript:showGroup()"> 
                <fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a></td>
              <td width="278" align="left" class="formStyle"><fmt:message key='webclient.topo.objectdetails.groupnames.help'/></td> --%>
            </tr>
          </table></c:when> <c:otherwise> <span >--</span> </c:otherwise> 
          </c:choose> </td>
      </tr>


       <tr class="even"> 
         <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.iscontainer'/> </td>
         <td class="blackText" > <html-el:radio name="ObjectDetailsBean" property="isContainer" value="true"/> 
          <fmt:message key='webclient.topo.objectdetails.iscontainer.yes'/> <html-el:radio name="ObjectDetailsBean" property="isContainer" value="false"/><fmt:message key='webclient.topo.objectdetails.iscontainer.no'/> 
        </td>
        
         <c:choose>
         <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
            <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.childrenkeys'/></td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}"> 
          <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="46" align="left"> 
                <select name="childerenkeyslist" size="1" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" > 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left" ><a href="javascript:showChild()"><fmt:message key='webclient.topo.objectdetails.childrenkeys.details'/></a></td> --%>
              <td width="285" align="left" class="formStyle">
<%-- <fmt:message key='webclient.topo.objectdetails.childrenkeys.help'/>  --%> </td>
            </tr>
          </table></c:when> <c:otherwise> <span>--</span> </c:otherwise> 
          </c:choose> </td>
         </c:when> 
         <c:otherwise>
         <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.isgroup'/> </td>
         <td class="blackText" > <html-el:radio name="ObjectDetailsBean" property="isGroup" value="true"/> 
           <fmt:message key='webclient.topo.objectdetails.isgroup.yes'/> <html-el:radio  name="ObjectDetailsBean" property="isGroup" value="false"/><fmt:message key='webclient.topo.objectdetails.isgroup.no'/>  </td>
         </c:otherwise>
         </c:choose>
      </tr>
  
 <tr  class="odd"> 
      <c:choose>
      <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
           <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.isgroup'/> </td>
           <td class="blackText" > <html-el:radio name="ObjectDetailsBean" property="isGroup" value="true"/> 
           <fmt:message key='webclient.topo.objectdetails.isgroup.yes'/> <html-el:radio  name="ObjectDetailsBean" property="isGroup" value="false"/><fmt:message key='webclient.topo.objectdetails.isgroup.no'/>  </td>
        <c:choose>
        <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'> 
    
        <td class="blackBoldText" > <span class="text"><fmt:message key='webclient.topo.objectdetails.groupmembers'/></span></td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}"> 
          <table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td rowspan="2" align="left"> 
                <select name="groupmembers" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left" class="text"><a href="javascript:showMember()"><fmt:message key='webclient.topo.objectdetails.groupmembers.details'/></a></td> --%>
         <%--     <td width="297" align="left" class="formStyle"><fmt:message key='webclient.topo.objectdetails.groupmembers.help'/></td>  --%>
            </tr>
          </table></c:when> <c:otherwise> <span class="text">--</span> </c:otherwise> 
          </c:choose> </td>
     
      </c:when>
      <c:otherwise>
              <td colspan=2 align="right" valign="middle"> 
         <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
      </c:otherwise> 
      </c:choose>      
      </c:when> 
      <c:otherwise>
          <c:choose> 
            <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>  
          <%--    <c:if test='${ObjectDetailsBean.map.isGroup == "true"}'>  --%>

     <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.groupmembers'/></td>
        <td class="blackText" > <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}"> 
          <table width="100%" height="54" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="38" height="54" rowspan="2" align="left"> 
                <select name="groupmembers" class="formStyle">
                  <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter"> 
                  <option value ='<c:out value="${token}"/>'
<c:if test='${counter.index == 0}'>
selected
</c:if>

><c:out value="${token}"/></option>
                  </c:forTokens> </select> </td> <%--
              <td width="100" align="left"><a href="javascript:showMember()"><fmt:message key='webclient.topo.objectdetails.groupmembers.details'/></a></td> --%>
  
            </tr>
          </table></c:when> <c:otherwise> <span >--</span> </c:otherwise> 
          </c:choose> </td>

          <td colspan=2 align="right" valign="middle"> 
         <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 

          </c:when> 
          <c:otherwise>
          
          <td colspan=4 align="right" valign="middle"> 
          <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
 
          </c:otherwise>
          </c:choose>
      </c:otherwise>
      </c:choose>
     
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
