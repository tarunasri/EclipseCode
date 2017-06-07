<%-- $Id: assignAuthScope.jsp,v 1.2 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<script language="javascript" src="/webclient/admin/js/ModifyProfileFunctions.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/ModifyProfileFunctions.jspf" %>
</head>
<script>

</script>
<body ><form name="ModifyProfileForm" action="/admin/AssignAuthScope.do" method="POST" onSubmit="return validateAssignGroup()"> 
<input type="hidden" name="groupName" value="<c:out value='${selectedGroup}'/>">
<input type="hidden" name="customView" value="<c:out value='${customView}'/>">
<input type="hidden" name="availableItems">
<input type="hidden" name="existingItems">
<input type="hidden" name="toPerform" value="<c:out value='${toPerform}'/>" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="10">&nbsp;</td>
    <td height="25" align="left" valign="bottom"><span class="header1"> <fmt:message key="webclient.admin.modifyuserprofile.modify"> <fmt:param><c:out value='${selectedGroup}'/></fmt:param> </fmt:message> 
      </span></td>
  </tr>
  <tr> 
    <td width="10" height="0"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    <td height="2" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td colspan="2" height="10"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr align="center" > 
  <td width="10">&nbsp;</td>
  <td align="left" align="center" valign="top" > 
    <table width="100%" border="0" cellpadding="1" cellspacing="1" >
     <tr align="center"> 
      <td height="25" colspan="3" align="left" class="text"><fmt:message key="webclient.admin.modifyuserprofile.groupoptions.message"/></td>
     </tr>
      <tr><td colspan="3" >&nbsp; </td>
     <tr valign="top"> 
       <td class="text"><fmt:message key="webclient.admin.modifyuserprofile.availablescope"/></td>
       <td align="middle"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       <td   ><span class="text"><fmt:message key="webclient.admin.modifyuserprofile.enrolledscope"/></span></td>
     </tr>
     <tr valign="top"> 
      <td> <select class="formStyle" multiple style="height:auto" 
      <c:choose> <c:when test="${assignScope=='false'}"> disabled </c:when> </c:choose> 
        name="availableGroups" size="5" > <c:forEach items="${AvailableScope}" var="pls" varStatus="index"> 
        <option value='<c:out value="${pls}"/>'> <c:out value="${pls}"/> 
       </option>
      </c:forEach> </select> </td>

      <td align="center" width="0"> <table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr > 
       <td><a href="javascript:add()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_add.gif" 
        width="35" height="25" alt='<fmt:message key="webclient.admin.modifyuserprofile.img.add.alt"/>' 
        border="0"></a></td>
     </tr>
     <tr> 
      <td> <img src="/webclient/common/images/trans.gif" width="1" height="3"></td>
     </tr>
     <tr> 
     <td><a href="javascript:removeScope()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_remove.gif" 
        width="35" height="25" alt='<fmt:message key="webclient.admin.modifyuserprofile.img.remove.alt"/>' 
        border="0"></a></td>
     </tr>
    </table></td>
    <td> <select class="formStyle" multiple style="height:auto" 

    <c:choose> <c:when test="${assignScope=='false'}"> disabled </c:when> </c:choose> 
                  name="existingGroups" size="5" > <c:forEach items="${ExistingScope}" var="pls" varStatus="index"> 
                  <option value='<c:out value="${pls}"/>'> <c:out value="${pls}"/> 
                  </option>
                  </c:forEach> </select> </td>
              </tr>
            </table></td>
        </tr>
        <tr><td colspan="2" >&nbsp; </td>
        </tr>
        <tr class="header2bg" height="25" > 
          <td align="center" colspan="2"> 
		  	<input name="Submit" type="submit" id="Submit" value="<fmt:message key='webclient.admin.modifyuserprofile.submit'/>" class="button"> <%--
			<input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.admin.modifyuserprofile.clear'/>" onclick="resetFields()"> --%>
            <input name="Cancel" type="button" class="button" onclick="javascript:window.close()" value='<fmt:message key="webclient.common.window.close"/>'>
          </td>
        </tr>
       <tr><td colspan="2" >&nbsp; </td>
        </tr>
</table>
</body>
</html>
