<%-- $Id: WidgetList.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Properties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>

<html>

<table width="100%" style="clear:both;" cellspacing="0" cellpadding="2" border="0" align="left" >
                        <tbody>
                          <tr class="generalTBHeader">
                            <td width="5" ><input type="checkbox" name="widgetCheck" onclick="javascript:selectAll('widgetCheck','widgetId')"/></td>
                            <td ><fmt:message key="webclient.dashboard.widgetList.title"/></td>
                          </tr>
                        </tbody>
                      </table>
                      <div style="overflow:auto; height:200px;clear:both;">
		    <table  width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
                        <tbody>


<c:forEach var="widgets" items="${widgetList}" varStatus="status">

<c:if test="${status.count % 2 != 0}">

	<tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
</c:if>
<c:if test="${status.count %2 ==0}">
	<tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
</c:if>

<td width="5"><input type='checkbox' name='widgetId' value="<c:out value='${widgets.ID}'/>" onclick="javascript:checkSelected('widgetCheck','widgetId');" ></td>
	<td><fmt:message key="${widgets.NAME}"/></td>
                          </tr>
</c:forEach>
                        </tbody>
                      </table>

                      </div>

</html>

