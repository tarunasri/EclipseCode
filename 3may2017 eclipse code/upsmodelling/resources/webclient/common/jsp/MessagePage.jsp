<%-- $Id: MessagePage.jsp,v 1.4 2010/10/29 13:47:02 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<html>
<head>
   <title><fmt:message key='webclient.common.messagepage.header'/></title>
</head>

<table border=0 align=center>
<tr><td nowrap>
<tr></tr>
<%@include file="/webclient/topo/jsp/inventoryViewStatus.jsp" %>
</td></tr>
</table>

<body>
<table width="400" border="0" align="center" cellpadding="6" cellspacing="0" class="messageStyle">
  <tbody><tr> 
    <td width="370"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td><table width="388" border="0" cellpadding="0" cellspacing="0" class="NobotBorder">
        <tbody><tr> 
          <td width="53" align="left" valign="top"><img src="/webclient/common/images/info_icon.gif" width="43" height="43"></td>
          <td width="335" align="left" valign="middle"><span class="boldtext"><fmt:message key='webclient.common.messagepage.description'/></span><br> 
            <span class="text">
                <html:messages id="message" message="true">
                        <bean:write name="message"/><br>
                </html:messages>
            </span> <br> <br> 
	    <logic:present name="change_password_failure" scope="request"> 
		    <fmt:message key='webclient.common.changepasswordfailure'/>
	    </logic:present>
          <c:choose>
            <c:when test="${!empty actionURL}">
             <c:choose>
               <c:when test="${!empty target}">
                  <span class="text">
                      <a href="<c:out value='${actionURL}'/>" target="<c:out value='${target}'/>"><c:out value="${msgForUrl}"/></a>
                  </span></td>
               </c:when> 
               <c:otherwise>
                  <span class="text">
                     <a href="<c:out value='${actionURL}'/>"><c:out value="${msgForUrl}"/></a>
                 </span></td>
               </c:otherwise>
            </c:choose>   
           </c:when>
           <c:otherwise> 
                 <span class="text"><a href="javascript:history.go(-1)"><fmt:message key='webclient.common.messagepage.back'/></a></span></td>
           </c:otherwise>
         </c:choose>
        </tr>
     </table></td>
  </tr>
</tbody></table>
</body>
</html>
