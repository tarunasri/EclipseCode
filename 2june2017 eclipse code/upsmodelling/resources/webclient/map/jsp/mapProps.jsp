
<%-- $Id: mapProps.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<form action = "/map/ConfigureMapProps.do" method = "post">
  <input type="hidden" name="name" value = '<c:out value = "${mapProps.name}" />' >
  <input type="hidden" name="viewId" value = '<c:out value = "${selectedNode}" />' >
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="10">&nbsp;</td>
      <td height="30" valign="bottom" class="header1"><c:out value = "${param.mapName}" /> - <fmt:message key = "webclient.map.propsconfig.headertext" /></td>
    </tr>
    <tr> 
      <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td valign="top"><table width="100%" border="0" cellpadding="2" cellspacing="0" class="botBorder">
          <tr> 
            <td width="25%">&nbsp;</td>
            <td width="75%">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" class="text"><fmt:message key = "webclient.map.details.label" /></td>
            <td><input name="label" class = "mapPropFormStyle" type="text" id="label" value = '<c:out value = "${mapProps.label}" />'></td>
          </tr>
          <tr> 
            <td height="25" class="text"><fmt:message key="webclient.map.propsconfig.bgimage" /></td>
            <td><input name="imageName" class = "mapPropFormStyle" type="text" id="imageName" value = '<c:out value = "${mapProps.imageName}" />'></td>
          </tr>
          <tr> 
            <td height="25" class="text"><fmt:message key = "webclient.map.propsconfig.helpdoc" /></td>
            <td><input name="helpDoc" class = "mapPropFormStyle" type="text" id="helpDoc" value = '<c:out value = "${mapProps.helpDoc}" />'>
              <span class="textSmall"><a href='/<c:out value = "${mapProps.helpDoc}" />' target="nmshelp"><fmt:message key = "webclient.common.openhelpdoc" /></a> (<fmt:message key = "webclient.common.newwindow" />)</span></td>
          </tr>
          <tr> 
            <td height="25" class="text"><fmt:message key = "webclient.map.propsconfig.topology" /></td>
            <td>
              <select name="currentTopology">
              <c:forEach items = "${layouts}" var = "layout">
              <c:choose>
              <c:when test="${layout == mapProps.currentTopology}">
              <c:set var = "selected" value = "SELECTED" />
              </c:when>
              <c:otherwise>
              <c:set var = "selected" value = "" />
              </c:otherwise>
              </c:choose>
              <option value = '<c:out value = "${layout}" />' <c:out value = "${selected}" />><c:out value = "${layout}" /></option>
              </c:forEach>
              </select>
            </td>
          </tr>
          <tr class="greyBg"> 
            <td class="header2Bg">&nbsp;</td>
            <td height="30" class="header2Bg"> <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.common.submit.button' />"> 
              <input name="Submit2" type="reset" class="button" value="<fmt:message key='webclient.common.reset.button' />"> 
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
