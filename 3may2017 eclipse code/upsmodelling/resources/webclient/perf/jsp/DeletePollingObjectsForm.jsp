<%-- $Id: DeletePollingObjectsForm.jsp,v 1.3 2007/10/18 06:32:57 gnanasekar Exp $ --%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2">
function removePollingObject()
{    
    var index = document.DeleteForm.DeletePO.options[document.DeleteForm.DeletePO.options.selectedIndex].value;
    var userInput = confirm("<fmt:message key='webclient.perf.deletepo.confirm1'/>"+index+"<fmt:message key='webclient.perf.deletepo.confirm2'/>");
    if(userInput == true)
    {
        location.href="/report/DeletePollingObjects.do?reqType=delete&poName="+index;
    }
}
</script>

<form name="DeleteForm"/>
<table cellpadding="2" cellspacing="2" border="0" style="text-align: left; width: 100%;">
<tbody>


<tr>
<td rowspan="1" colspan="1" class="boldText">
<div style="text-align: center;"><fmt:message key='webclient.perf.deletepo.header'/></div><br>
</td>
</tr>

<tr> 

<c:if test="${!empty success}">
  <td height="20" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
      <td width="20%"></td>
      <td height="25" nowrap class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${success}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty failure}">
  <td height="20" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
      <td width="20%"></td>
      <td width="80%" class="errorText"><img src="/webclient/common/images/negativeRes.gif" width="17" height="13" hspace="5" border="0"><c:out value="${failure}"/></td>
    </tr>
   </table>
  </td>
</c:if>
</tr> 

  <c:if test="${!empty poVector}">

<tr> 
<td rowspan="1" colspan="1">

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

    <table class="htableBorder" border="0" align="center" cellspacing="1" cellpadding="5">

    <tr height="22" class="header2Bg">
    <td width="25%" colspan="2" class="boldText"><fmt:message key='webclient.perf.deletepo.header'/></td>
    </tr>

    <tr> 
    <td height="50%" class="text" nowrap><fmt:message key='webclient.perf.addpo.name'/></td>
    <td width="50%" class="text">
    <select property="POName" class="formStyle" name="DeletePO"> 
    <c:forEach var="poNames" items="${poVector}" varStatus="status">
    <option value="<c:out value='${poNames}'/>"><c:out value="${poNames}"/></option>
    </c:forEach>
    </select>
    </td>
    </tr>

    <tr> 
    <td width="50%" class="text" align="center" colspan="2">
<input type="button" value="<fmt:message key='webclient.perf.deletepo.delete'/>" class="button" name="Submit2" onClick="javascript:removePollingObject()"/>
        
    <input type="button" class="button" value=" <fmt:message key='webclient.perf.deletepo.cancel'/>" onClick='window.close()'></td>
    </tr>     
  </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</td>
</tr>
</c:if>   

</tbody>
</table>
</form>
<br>
</body>
</html>

