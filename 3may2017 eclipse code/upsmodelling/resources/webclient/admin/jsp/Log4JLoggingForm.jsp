<!-- $Id: Log4JLoggingForm.jsp,v 1.8 2007/10/25 04:47:08 sumitha Exp $-->
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/Log4JLogging.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/calendar" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/calendar-en" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/calendar-setup" type="text/javascript"></script>
<script type="text/javaScript" >

function reload()
{
    window.location.reload();
}

function completeview()
{
    window.location.reload();
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onLoad="Dialog.init()">
<!--popup graph start--->
<div id="popup1" style="width:360px; position:absolute; display:none; z-index:991">
<html:form action="/saveNmsAppenderProperties.do" method="POST">
<html:hidden name="name" property="name" value=""/>
<html:hidden name="logger" property="logger" value=""/>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="popuptl"><img src="/webclient/common/images/spacer.gif" height="13px" width="13px"></td>
      <td  class="popuptmain"></td>
      <td class="popuptr"></td>
    </tr>
    <tr>
      <td class="popuplmain"></td>
      <td align="right" valign="top" bgcolor="#FFFFFF" ><table width="100%" border="0" cellspacing="0" cellpadding="5">
          <tr>
            <td class="blueBand2" align="left"><fmt:message key='webclient.admin.logging.appenderdetails'/></td>
            <td class="blueBand2" width="10" ><img style="cursor:pointer;" onClick="Dialog.hide('popup1')" src="/webclient/common/images/close-popup.gif" ></td>
          </tr>
        </table>
        <table style="margin-top:7px;" width='100%' cellspacing='0' cellpadding='3' border='0' >
          <tr>
            <td align='right' valign='middle' nowrap="nowrap" class='text' style='padding-top: 9px;'><fmt:message key='webclient.admin.logging.filename'/> : </td>
            <td valign='bottom' align='left' class='text' colspan='2' style="padding-left:10px;"><html:text name="NmsAppenderForm" styleClass="formStyle" property="fileName" /></td>
	  </tr>
          <tr>
            <td align='right' valign='middle' nowrap class='text' style='padding-top: 9px;'><fmt:message key='webclient.admin.logging.maxbackup'/>  : </td>
            <td valign='bottom' align='left' style="padding-left:10px;" colspan='2'><html:text name="NmsAppenderForm" styleClass="formStyle" property='fileCount' /></td>
          </tr>
          <tr>
            <td valign='middle' align='right' style='padding-top: 9px;' class='text'><fmt:message key='webclient.admin.logging.filesize'/> : </td>
            <td valign='bottom' align='left' colspan='2' style="padding-left:10px;"><html:text name="NmsAppenderForm" styleClass="formStyle" property='fileSize' /></td>
          </tr>
        </table>
        <table style="margin-top:5px;margin-bottom:5px;" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><input type='submit' value='<fmt:message key='webclient.admin.logging.save'/>' class='button' name='Submit2' /></td>
          </tr>
        </table></td>
      <td class="popuprmain"></td>
    </tr>
    <tr>
      <td class="popupbl"></td>
      <td align="right" class="popupbmain"></td>
      <td class="popupbr"><img src="/webclient/common/images/spacer.gif" height="13px" width="13px"></td>
    </tr>
  </table>
</html:form>
</div>
<div id="popup2" style="width:360px; position:absolute; display:none; z-index:991">
<html:form action="/saveMailAppenderProperties.do" method="POST">
<html:hidden name="name" property="name" value=""/>
<html:hidden name="logger" property="logger" value=""/>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="popuptl"><img src="/webclient/common/images/spacer.gif" height="13px" width="13px"></td>
      <td  class="popuptmain"></td>
      <td class="popuptr"></td>
    </tr>
    <tr>
      <td class="popuplmain"></td>
      <td align="right" valign="top" bgcolor="#FFFFFF" ><table width="100%" border="0" cellspacing="0" cellpadding="5">
          <tr>
            <td class="blueBand2" align="left"><fmt:message key='webclient.admin.logging.appenderdetails'/></td>
            <td class="blueBand2" width="10" ><img style="cursor:pointer;" onClick="Dialog.hide('popup2')" src="/webclient/common/images/close-popup.gif" ></td>
          </tr>
        </table>
        <table style="margin-top:7px;" width='100%' cellspacing='0' cellpadding='3' border='0' >
	  <tr>
            <td align='right' valign='middle' nowrap="nowrap" class='text' style='padding-top: 9px;'><fmt:message key='webclient.admin.logging.smtphost'/> : </td>
            <td valign='bottom' align='left' class='text' colspan='2' style="padding-left:10px;"><html:text name="MailAppenderForm" styleClass="formStyle" property='smtpHost' /></td>
	  </tr>
          <tr>
            <td align='right' valign='middle' nowrap="nowrap" class='text' style='padding-top: 9px;'><fmt:message key='webclient.admin.logging.toaddress'/> : </td>
            <td valign='bottom' align='left' class='text' colspan='2' style="padding-left:10px;"><html:text name="MailAppenderForm" styleClass="formStyle" property='toAddress' /></td>
	  </tr>
          <tr>
            <td align='right' valign='middle' nowrap class='text' style='padding-top: 9px;'><fmt:message key='webclient.admin.logging.fromaddress'/> : </td>
            <td valign='bottom' align='left' style="padding-left:10px;" colspan='2'><html:text name="MailAppenderForm" styleClass="formStyle" property='fromAddress' /></td>
          </tr>
          <tr>
            <td valign='middle' align='right' style='padding-top: 9px;' class='text'><fmt:message key='webclient.admin.logging.subject'/> : </td>
            <td valign='bottom' align='left' colspan='2' style="padding-left:10px;"><html:text name="MailAppenderForm" styleClass="formStyle" property='subject' /></td>
          </tr>
        </table>
        <table style="margin-top:5px;margin-bottom:5px;" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><input type='submit' value='<fmt:message key='webclient.admin.logging.save'/>' class='button' name='Submit2' /></td>
          </tr>
        </table></td>
      <td class="popuprmain"></td>
    </tr>
    <tr>
      <td class="popupbl"></td>
      <td align="right" class="popupbmain"></td>
      <td class="popupbr"><img src="/webclient/common/images/spacer.gif" height="13px" width="13px"></td>
    </tr>
  </table>
</html:form>
</div>
<!--popup graph end--->
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.admin.logging.log4jtitle'/></h1></td>
        </tr>
      </table>
<html:form action="/saveLog4jProperties.do" method="POST">
<table border=0 cellspacing=0 cellpadding=0 width=99%  align = "center" >
<tr>
<td width="55%" align="right" nowrap style="padding-right:10px;">
<a href="/admin/FillSpyForm.do" class="fontBlueBoldLink"><fmt:message key='webclient.admin.logging.spylog'/></a> 
</td>
</tr>
</table>
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.logging.loggerstitle'/></span></td>
          <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" ><table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr class="generalTBHeader">
              <td width="25%" ><fmt:message key='webclient.admin.logging.loggers'/></td>
              <td width="20%"><fmt:message key='webclient.admin.logging.level'/></td>
              <td ><fmt:message key='webclient.admin.logging.appender'/></td>
            </tr>
            
	    <c:forEach var="list" items="${LogUserDetails}" varStatus="status" >
	 	<c:choose>
           	    <c:when test="${status.count%2==0}">
              		<tr class="generalOddRow" >
                    </c:when>
                    <c:otherwise>
              		<tr class="generalEvenRow" >
                    </c:otherwise>
        	</c:choose>
	   
		<td> 
	  	   <c:out value="${list}"/>
		</td>
		<td>
		   <c:forEach var="list1" items="${LogLevelDetails}">
			<c:if test='${list == list1.key}'>
			<p>
			    <select style="width: 110px;" styleclass="logFormStyle" name="logLevel" value="${Log4jBean.logLevel[status.index]}">
				<option value="INFO" <c:if test="${Log4jBean.logLevel[status.index] eq 'INFO'}">selected</c:if>>INFO</option>
				<option value="DEBUG" <c:if test="${Log4jBean.logLevel[status.index] eq 'DEBUG'}">selected</c:if>>DEBUG</option>
				<option value="	ERROR" <c:if test="${Log4jBean.logLevel[status.index] eq 'ERROR'}">selected</c:if>>ERROR</option>
				<option value="FATAL" <c:if test="${Log4jBean.logLevel[status.index] eq 'FATAL'}">selected</c:if>>FATAL</option>
				<option value="TRACE" <c:if test="${Log4jBean.logLevel[status.index] eq 'TRACE'}">selected</c:if>>TRACE</option>
				<option value="WARN" <c:if test="${Log4jBean.logLevel[status.index] eq 'WARN'}">selected</c:if>>WARN</option>
				<option value="ALL" <c:if test="${Log4jBean.logLevel[status.index] eq 'ALL'}">selected</c:if>>ALL</option>
				<option value="OFF" <c:if test="${Log4jBean.logLevel[status.index] eq 'OFF'}">selected</c:if>>OFF</option>
			    </select>
			</p>
		        </c:if>
		    </c:forEach>
		</td>
 		<td ><table class="headerInclude"  border="0" cellspacing="0" cellpadding="3">
                    <tr>
			<c:forEach var="list2" items="${AppenderList}">
			    <c:if test='${list == list2.key}'>
				<c:forEach var="list3" items="${list2.value}">	
				   <c:if test ="${list3 != 'mail'}">
                                     <c:forEach var="list4" items="${AppenderParam}">
					<c:if test='${list3 == list4.key}'>
					<td nowrap><small> |&nbsp;&nbsp; 
						<a href="javascript:Dialog.show('popup1','<c:out value='${list2.key}'/>','<c:out value='${list4.key}'/>','<c:out value='${list4.value[0]}'/>','<c:out value='${list4.value[1]}'/>','<c:out value='${list4.value[2]}'/>','')" ><c:out value="${list3}"/></a></small>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					</c:if>
				     </c:forEach>
				   </c:if>
				   <c:if test ="${list3 == 'mail'}">
					<c:forEach var="list4" items="${AppenderParam}">
					<c:if test='${list3 == list4.key}'>
					<td nowrap><small> |&nbsp;&nbsp;
						<a href="javascript:Dialog.show('popup2','<c:out value='${list2.key}'/>','<c:out value='${list4.key}'/>','<c:out value='${list4.value[0]}'/>','<c:out value='${list4.value[1]}'/>','<c:out value='${list4.value[2]}'/>','<c:out value='${list4.value[3]}'/>')"><c:out value="${list3}"/></a></small>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					</c:if>
				     </c:forEach>
				   </c:if>
				</c:forEach>
			    </c:if>
			</c:forEach> 
		      </tr>
  
                   </table></td>
	    </c:forEach>
          </table></td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
</table>
<table style="margin-top:5px;margin-bottom:5px;" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td style="padding-left:6px;padding-right:7px;"><input type='submit' value='<fmt:message key='webclient.admin.logging.save'/>' class='button' name='Submit2' /></td>
            <td style="padding-left:6px;padding-right:7px;"><input type='reset' value='<fmt:message key='webclient.admin.logging.reset'/>' onclick='javascript:reload()' class='button' name='Cancel2' /></td>
	    <td style="padding-left:6px;padding-right:7px;"><input type='button' value='<fmt:message key='webclient.admin.logging.cancel'/>' onclick='javascript:history.back()' class='button' name='Cancel2' /></td>
          </tr>
        </table>
</html:form>
</body>

</html>

