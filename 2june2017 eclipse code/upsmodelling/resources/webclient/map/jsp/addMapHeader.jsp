<%-- $Id: addMapHeader.jsp,v 1.2 2007/09/14 10:48:15 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle">

<c:choose>
<c:when test ='${searchForm.map.actionToPerform == "addMap"}'>
<fmt:message key='webclient.map.cv.addmap.add'/>
</c:when>
<c:when test ='${searchForm.map.actionToPerform == "modifyMap"}'>
<c:choose>
<c:when test='${!empty mapType}'>
<fmt:message key='webclient.map.cv.addmap.modifyd'/>
</c:when>
<c:otherwise>
<fmt:message key='webclient.map.cv.addmap.modifyc'/>
</c:otherwise>
</c:choose>

</c:when>
</c:choose>

</span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
