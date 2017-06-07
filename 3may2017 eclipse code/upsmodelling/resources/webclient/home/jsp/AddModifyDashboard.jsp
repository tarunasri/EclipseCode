<%-- $Id: AddModifyDashboard.jsp,v 1.2 2010/10/29 13:47:08 swaminathap Exp $ --%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Properties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head></head>
<body>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
<script>

function validateTime()
{
var num =document.addCctvForm.timeInterval.value;
return !isNaN(num);
}




function windowCenter()
{
var w,h;
     w= window.innerWidth;
     h= window.innerHeight;
     window.innerWidth =w/2;
     window.innerHeight=h/2;
}


</script>
<%
String methodCall="";
long associationId =-1;
long dashboardId = -1;
methodCall = request.getParameter("method");
if(methodCall.equals("getWidgetList") || methodCall.equals("showModifyForm"))
{
String title ="Add";
if(methodCall.equals("showModifyForm"))
{
	title ="Modify";
if(request.getParameter("dialog") == null)
{
%>
<form name="dashboardForm" method="post" action="/modifyDashboard.do?method=modify">
<%
}
else
{
%>
<form name="dashboardForm" method="post" action="/modifyDashboard.do?method=modify&dialog=true">
<%
}
}
else
{
%>
<form name="dashboardForm" method="post" action="/modifyDashboard.do?method=addDashboard&dialog=true">
<%
}
%>


<table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <td style="padding: 3px;"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="hRule1">
        <tbody><tr>
          <td height="27" class="boldTxt">
<%
if(title.equals("Add"))
{
%>
<fmt:message key="webclient.home.addModifyDashboard.title.add"/>
<%
}
else
{
%>
<fmt:message key="webclient.home.addModifyDashboard.title.modify"/>
<%
}
%>
</td>
          <td align="right" valign="top"><img align="absmiddle" title="<fmt:message key='webclient.home.managedashboard.close'/>" onclick="javascript:closeThisDiv('addDashboard')" src="/webclient/common/images/spacer.gif" class="popClose1"/></td>
        </tr>
      </tbody></table>
      <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tbody><tr>
          <td style="padding: 10px;">



	<table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg">
<%
if(request.getParameter("dialog")!=null)
{
%>
	      <input type="hidden" name="redirect" value="/modifyDashboard.do?method=modifyDashboard">
<%
}
else
{
%>
	      <input type="hidden" name="redirect" value="/LoginPage.do">
<%
}
%>

              <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody>
                  <tr>
                    <td width="60%" class="tableBdr2" style="padding:2px;" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="generalTBHeader">
                          <td class="boldTxt"><fmt:message key="webclient.home.addModifyDashboard.header"/></td>
                        </tr>
                      </table>
                      <table style="clear:both;margin-top:5px;" width="100%" cellspacing="0" cellpadding="3" border="0">
                        <tr>
                          <td width="100" valign="middle" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.name"/><font color="red">&nbsp;*</font></td>
                          <td valign="middle" align="left">
<c:if test="${isModifyForm == null}">
<input style="width:100%;" class='' type="text" name="dashboardName"  maxlength="25" value="<c:out value='${dashProps.NAME}'/>" maxlength="25" onblur="checkDashboardExist()">
</c:if>
<c:if test="${isModifyForm != null}">
<input style="width:100%;" class="disabledBg" readonly type="text" name="dashboardName"  maxlength="25" value="<c:out value='${dashProps.NAME}'/>">
</c:if>

</td>
</tr>
<tr>
<td></td>

<td>
<div style='display:none;' id='errormsg'>&nbsp;</div></td>
                        </tr>
                        <tr>
                          <td valign="top" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.description"/></td>
                          <td valign="top" align="left">
<textarea name="dashboardDescription" rows="4" style="width:100%;" onFocus="this.className='inputFocusText'" onBlur="this.className='dateBox';"><c:out value='${dashProps.DESCRIPTION}'/></textarea></td>
                        </tr>
                      </table>
                      <table style="clear:both" width="100%" cellspacing="0" cellpadding="3" border="0">
                        <tr>
                          <td width="100" valign="middle" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.noofcols"/><font color="red">&nbsp;*</font></td>
                          <td valign="middle" align="left"><select style="width: 51px;" onfocus="this.className='inputFocus'" onblur="this.className='bInputBox'" onchange="fillDefaultColumnWidth();"  onkeyup="fillDefaultColumnWidth();" name="numberOfColumns">
				<c:forEach var="i" begin="1" end="3" step="1">
				<c:choose>
				<c:when test="${i != columns}">
				<option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
				</c:when>
				<c:otherwise>
				<option value="<c:out value='${columns}'/>" selected><c:out value='${columns}'/></option>
				</c:otherwise>
				</c:choose>
				</c:forEach>
                            </select></td>
                        </tr>
                      </table>
<c:choose>
<c:when test='${!empty columnDetails}'>
	      <c:forEach var="dashColumn" items="${columnDetails}" varStatus="stepCount">
	      <table style="clear:both" width="100%" cellspacing="0" cellpadding="3" border="0">
		<tr>
		  <td width="100" valign="middle" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.col${dashColumn.COLUMNID}"/></td>
		  <td valign="middle" align="left"><input type="text" style="width: 50px; text-align: right;" onfocus="this.className='inputFocusText'" onblur="this.className='dateBox';" onkeypress="return checkIsNumeric(event)" value="<c:out value='${dashColumn.COLUMNWIDTH}'/>" name="columnWidth<c:out value='${dashColumn.COLUMNID}'/>" maxlength="<c:choose><c:when test='${dashColumn.COLUMNID==1}'>3</c:when><c:otherwise>2</c:otherwise></c:choose>"/>%</td>
		</tr>
	      </table>
	      <c:if test='${stepCount.last && stepCount.count < 3}'>
		      <c:forEach var='j' begin="${stepCount.count+1}" end="3">
			      <table style="clear:both" width="100%" cellspacing="0" cellpadding="3" border="0">
			      <tr>
			      <td width="100" valign="middle" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.col${j}"/></td>
			      <td valign="middle" align="left"><input type="text" style="width: 50px; text-align: right;" onkeypress="return checkIsNumeric(event)" value="" name="columnWidth<c:out value='${j}'/>" maxlength="2"/>
			      %</td>
			      </tr>
			      </table>
		      </c:forEach>
	      </c:if>
	      </c:forEach>
</c:when>
<c:otherwise>
		      <c:forEach var='n' begin="1" end="3">
			      <table style="clear:both" width="100%" cellspacing="0" cellpadding="3" border="0">
			      <tr>
			      <td width="100" valign="middle" align="left"><fmt:message key="webclient.home.addModifyDashboard.form.label.col${n}"/></td>
			      <td valign="middle" align="left"><input type="text" style="width: 50px; text-align: right;" onkeypress="return checkIsNumeric(event)" value="" name="columnWidth<c:out value='${n}'/>" maxlength="<c:choose><c:when test='${n==1}'>3</c:when><c:otherwise>2</c:otherwise></c:choose>"/>
			      %</td>
			      </tr>
			      </table>
		      </c:forEach>
</c:otherwise>
</c:choose>


</td>

<c:if test="${isModifyForm == null}">
                    <td style="padding-left: 15px;"></td>
                    <td width="50%" class="tableBdr2" style="padding:2px;" valign="top">

<jsp:include page="/webclient/home/jsp/WidgetList.jsp"/>
</td>
</c:if>
                  </tr>

                </tbody>
		</table>
</td>
            <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>

          <tr>
            <td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
            <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table>



<table style="clear:both;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
<td align="center">
<c:if test="${isModifyForm == null}">
 <input class="button" type="submit" name="modify" value='<fmt:message key="webclient.home.addModifyDashboard.form.button.update"/>' onClick="javascript:return validateWidgets()">
     <input class="button" type="button" name="cancel" value='<fmt:message key="webclient.home.addModifyDashboard.form.button.cancel"/>' onclick="javascript:closeThisDiv('addDashboard'); return false;">
</c:if>
<c:if test="${isModifyForm!=null}">
    <input class="button" type="submit" name="modify" value='<fmt:message key="webclient.home.addModifyDashboard.form.button.update"/>' onClick="javascript:return validateColumns()">

     <input class="button" type="button" name="cancel" value="Cancel" onClick="javascript:closeThisDiv('addDashboard'); return false;">
</c:if>
</td>
  </tr>
</table>
</td>
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>
</form>
<%

}

%>
</body>
</html>
