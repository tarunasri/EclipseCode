<%-- $Id: mailer.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Example JSP using mailer taglib</title>
</head>

<%@page contentType="text/html"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<body class="popupBg">
     
  <mt:mail>
    <mt:server><c:out value="${initParam.mailServerName}"/></mt:server>

    <mt:setrecipient type="to"><c:out value="${initParam.instantFeedbackAddress}"/>,<c:out value="${param.from}"/></mt:setrecipient>


<%
    Cookie cookie = new Cookie("feedbackFromAddress",request.getParameter("from"));
    response.addCookie(cookie);
%>

    <mt:from><c:out value="${param.from}"/></mt:from>

    <mt:subject><c:out value="${param.title}"/></mt:subject>

    <mt:message type="html">
    Page URL : <c:out value="${param.pageURI}"/><br><br>
    Browser Details  : <c:out value="${header['User-Agent']}"/><br><br>
    Rating   : <c:out value="${param.rate}"/><br><br>
    Comment  : <br><c:out value="${param.comment}"/><br><br>
    </mt:message>

    <mt:send> 
    <table width="100%" height="90%" border="0" cellpadding="6" cellspacing="0" class="botBorder">

    <tr>
    <td height="1" align="left" valign="bottom" class="header1Bg">
     <span class="header1">The following errors occured</span></td>
    </tr>

    <tr>
    <td align="left" valign="top"><span class="text"> <br><mt:error id="err"> 
    <jsp:getProperty name="err" property="error"/><br></mt:error></span></td>
    </tr>
    
    <tr>
      <td align="right" valign="bottom" height="1">

         <table width="100%" border="0" cellpadding="6" cellspacing="0" class="noBotBorder">
           <tr>
              <td height="1" align="left" valign="middle">
                <span class="text">Please fix the errors and resubmit.</span><br>
              </td>
              <td align="center">
                  <input name="Back" type="button" class="button" id="Back3" value="Back" onClick="javascript:window.history.back()">
                  <input name="Close" type="button" class="button" id="Close4" value="Close" onClick="javascript:window.close()">
              </td>
           </tr>
         </table>

      </td>
    </tr>

    </table>
  </mt:send>

 </mt:mail>

<p><c:redirect url="/feedbackThanks.do"/></p>

</body>
</html>
