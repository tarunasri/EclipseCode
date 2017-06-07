<%--$Id: AddGMapForm.jsp,v 1.2 2010/10/29 13:47:10 swaminathap Exp $--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
</body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
		<td><h1><fmt:message key="webclient.gmap.addform.header"/></h1></td>
        </tr>
      </table>
</br>
</br>

<form name="addMapForm" method="post" action="/map/GMapAction.do?parameter=addGMap&selectedTab=Maps&viewId=<c:out value='${param.viewId}'/>&firstChild=<c:out value='${param.firstChild}'/>&swipe=<c:out value='${param.swipe}'/>&nodeClicked=<c:out value='${param.nodeClicked}'/>&selectedNode=<c:out value='${selectedNode}'/>&displayName=<c:out value='${param.displayName}'/>" onSubmit="return validateInputs()">
<table cellspacing="0" cellpadding="0" border="0" width="60%" style="margin-bottom: 10px">
  <tr>
    <td class="generalCurveLeftTop"> <img height="1" width="1" src="images/spacer.gif" /> </td>
    <td align="left" valign="top" style="padding-right: 10px" class="generalCurveTop"  nowrap="nowrap"><span class="generalTitle"><fmt:message key='webclient.gmap.addform.title'/> </td>
    <td class="generalCurveRightTop"> <img height="1" width="1" src="images/spacer.gif" /> </td>
  </tr>
  <tr>
    <td class="generalCurveLeft"> </td>
    <td valign="top" class="generalTBPadding"> <table cellspacing="0" cellpadding="5" border="0" align="left" width="80%">
        <tr align="left" valign="top">
		<td width="200" class="text"> <fmt:message key="webclient.gmap.addform.name"/> </td>
          <td> <input type="text" class="formStyle" maxlength="50" name="name" />
	    <span class="mandatory"> </span> </td>
	  <td> <font color="red" size="2">*</font> </td>
        </tr>
        <tr align="left" valign="top">
          <td class="text"> <fmt:message key="webclient.gmap.addform.label"/> </td>
          <td> <input type="text" class="formStyle" maxlength="50" name="label" />
            <span class="mandatory"> </span> </td>
        </tr>
        <tr align="left" valign="top">
		<td class="text"> <fmt:message key="webclient.gmap.addform.location"/> </td>
		<c:choose>
		<c:when test="${!empty glocations}" >
		<td> <select name="location" class="licenseSelect">
		<c:forEach var="val" items="${glocations}"  >
              <option value='<c:out value="${val}"/>'>
<c:out value="${val}"/> 
</option>
</c:forEach>
	    </select>
	    </c:when>
	    </c:choose>
            <span class="mandatory"> </span> </td>
	</tr>	
	<tr align="left" valign="top">
		<td class="text"> <fmt:message key="webclient.gmap.addform.zoom"/> </td>
		<td> <select name="zoom" class="licenseSelect">
	
				<option value='1'>1</option>
				<option value='2'>2</option>
				<option value='3'>3</option>
				<option value='4' selected>4</option>
				<option value='5'>5</option>
				<option value='6'>6</option>
				<option value='7'>7</option>
				<option value='8'>8</option>
				<option value='9'>9</option>
				<option value='10'>10</option>
				<option value='11'>11</option>
				<option value='12'>12</option>
				<option value='13'>13</option>
				<option value='14'>14</option>
				<option value='15'>15</option>
				<option value='16'>16</option>


            <span class="mandatory"> </span> </td>
	</tr>
	<tr align="left" valign="top">
		<td class="text"><fmt:message key="webclient.gmap.addform.type"/> </td>
		<td> <select name="mapType" class="licenseSelect">
	
				<option value='Normal'><fmt:message key="webclient.gmap.addform.type.normal"/></option>
				<option value='Satellite'><fmt:message key="webclient.gmap.addform.type.satellite"/></option>
				<option value='Hybrid'><fmt:message key="webclient.gmap.addform.type.hybrid"/></option>		

            <span class="mandatory"> </span> </td>
        </tr>	
	<tr align="center" valign="top">	
		<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="<fmt:message key='webclient.gmap.addform.addbutton'/>" class="button"/>
	  </td>         
        </tr>
      </table></td>
    <td class="generalCurveRight"> </td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"> <img height="1" width="1" src="images/spacer.gif" /> </td>
    <td class="generalCurveBottom"> <img height="1" width="1" src="images/spacer.gif" /> </td>
    <td class="generalCurveRightBot"> <img height="1" width="1" src="images/spacer.gif" /> </td>
  </tr>
</table>
</form>
</body>
</html>

<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript">

function validateInputs()
{
	var value = document.addMapForm.name.value;
	if(trimAll(value) == "")
	{
		alert("<fmt:message key='webclient.map.cv.addmap.js.error'/>");
		document.addMapForm.name.value="";
		document.addMapForm.name.focus();
		return false;
	}
	if(isSpecialSymbol(value))
	{
		alert("<fmt:message key='webclient.map.alert.specialsymbols'/>");
		document.addMapForm.name.focus();
		return false;
	}

	return true;
}

</script>
