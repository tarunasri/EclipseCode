<%-- $Id: loggingConfig.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>
</head>

<body>

<form action="/admin/logAction.do" method="POST">


<table width="80%" cellspace="0" border="0"  cellpadding="0">
<tr>
<td width=10>
&nbsp;
</td>
<td height=30 valign="bottom">
 <span class="header1"><fmt:message key='webclient.admin.logging.loggingfrom.linktext'/>&nbsp;<c:out value='${param.fileName}'/></span>
&nbsp;
</td>
</tr>
<tr>
<td width=10 height=1></td>
<td class=hline>
</td>
</tr>


<tr>
<td width=10 height=10 colspan=2>
<img src=/webclient/common/images/trans.gif width=1 height=1>
</td>
</tr>


<c:if test="${!empty successMsg}">

<tr align="center">
<td>&nbsp;</td>
<td height=25  class="responseText">
<img src="/webclient/common/images/tick.gif" hspace="4"><c:out value="${successMsg}"/>
</td>
</tr>

</c:if>


    <c:choose>
      <c:when test='${param.fileName == "nmserr.txt"}'>
        <input type="hidden" name="method" value="nmserrAction">
        <input type="hidden" name="fileName" value="<c:out value='${param.fileName}'/>">

		
    <tr>
	<td>&nbsp;</td>
      <td>
        <table width="100%" border="0" align="left" cellpadding="5" class="botborder" cellspacing="0">
          <tr class="header2Bg">
            <td width ="50"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.enabled"/></span></td>
            <td width="300"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.filename"/></span></td>
            <td width="330"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.loglevel"/></span></td>
          </tr>

          <tr>
            <c:forEach var="userlevel" items="${LoggingBean.nmserrName}" varStatus="status">

             <tr>
              <td>
                <c:choose>
                 <c:when test='${LoggingBean.nmserrEnabled[status.index] == "true"}'>
                    <input type="checkbox" checked name="<c:out value='${LoggingBean.nmserrName[status.index]}'/>" value= "<c:out value='${LoggingBean.nmserrEnabled[status.index]}'/>">
                </c:when>
                <c:otherwise>
                    <input type="checkbox" name="<c:out value='${LoggingBean.nmserrName[status.index]}'/>" value="<c:out value='${LoggingBean.nmserrEnabled[status.index]}'/>">
                </c:otherwise>
              </c:choose>

             </td>

            <td class="text">

             <c:out value="${userlevel}"/>
             <input type=hidden name="nmserrName" value="<c:out value="${userlevel}"/>">
           </td>
           <td>
            <select style="width:110" class="logFormStyle" name="nmserrLogLevel" value="<c:out value='${LoggingBean.nmserrLogLevel[status.index]}'/>">
                <option value='1' <c:if test="${LoggingBean.nmserrLogLevel[status.index] == '1'}">selected</c:if>>Summary</option>
                <option value='2' <c:if test="${LoggingBean.nmserrLogLevel[status.index] == '2'}">selected</c:if>>Intermediate</option>
                <option value='3' <c:if test="${LoggingBean.nmserrLogLevel[status.index] == '3'}">selected</c:if>>Verbose</option>
                <option value='4' <c:if test="${LoggingBean.nmserrLogLevel[status.index] == '4'}">selected</c:if>>Debug</option>
            </select>
           </td>

        </c:forEach>
        </td>
        </tr>
    </table>
   </td>
</tr>
</c:when>
<c:otherwise>
    <input type="hidden" name="method" value="nmsoutAction">
	
	<input type="hidden" name="fileName" value="<c:out value="${param.fileName}"/>">

   <tr>
	<td>&nbsp;</td>
      <td>
       <table width="100%" border="0" align="left" cellpadding="5" class="botborder" cellspacing="0">
        <tr class="header2Bg">
          <td width ="50"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.enabled"/></span></td>
          <td width ="300"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.filename"/></span></td>
          <td width ="330"><span class="boldText"><fmt:message key="webclient.admin.logging.loggingconfig.loglevel"/></span></td>
        </tr>
        <tr>
          <c:forEach var="noutuser" items="${LoggingBean.nmsoutName}" varStatus="status">
        <tr>

        <td>

        <c:choose>
          <c:when test='${LoggingBean.nmsoutEnabled[status.index] == "true"}'>
            <input type="checkbox" checked  name="<c:out value='${LoggingBean.nmsoutName[status.index]}'/>" value= "<c:out value='${LoggingBean.nmserrEnabled[status.index]}'/>">
        </c:when>
        <c:otherwise>
            <input type="checkbox" name="<c:out value='${LoggingBean.nmsoutName[status.index]}'/>" value= "<c:out value='${LoggingBean.nmserrEnabled[status.index]}'/>">
        </c:otherwise>
        </c:choose>
        </td>

<td class="text">
<c:out value="${noutuser}"/>
<input type=hidden name="nmsoutName" value="<c:out value="${noutuser}"/>">
</td>
<td>
<select style="width:110" class="logFormStyle" name="nmsoutLogLevel" value="<c:out value='${LoggingBean.nmsoutLogLevel[status.index]}'/>">
<option value='1' <c:if test="${LoggingBean.nmsoutLogLevel[status.index] == '1'}">selected</c:if>>Summary</option>
<option value='2' <c:if test="${LoggingBean.nmsoutLogLevel[status.index] == '2'}">selected</c:if>>Intermediate</option>
<option value='3' <c:if test="${LoggingBean.nmsoutLogLevel[status.index] == '3'}">selected</c:if>>Verbose</option>
<option value='4' <c:if test="${LoggingBean.nmsoutLogLevel[status.index] == '4'}">selected</c:if>>Debug</option>
</select>
</td>
</c:forEach>
</td>
</tr>
</table>
</c:otherwise>
</c:choose>
</td>
</tr>

<tr>
<td>&nbsp;</td>
<td>
<table width="100%" border="0" align="left" cellpadding="5" class="botborder" cellspacing="0">
<tr>
<td width ="50">&nbsp;</td>
<td width ="300">&nbsp;</td>
<td width ="330">
<input type="submit" name="Submit" class="button" value="<fmt:message key='webclient.admin.logging.button.submit'/>">
<input type="button" name="Cancel" class="button" value="<fmt:message key='webclient.admin.logging.button.cancel'/>" onclick="history.back();">
<input type="reset" name="Reset" class="button" value="<fmt:message key='webclient.admin.logging.button.reset'/>">
</td>
</tr>
</table>

</td>
</tr>
</table>
</form>
</body>
</html>
