<%-- $Id: eventListHeader.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="com.adventnet.nms.util.NmsUtil;"%>
<table>
<tr>
  <td> 
    <table border="0" align="left" cellpadding="0" cellspacing="0" valign="middle">
      <tr> 
         <td>
            <%
               request.setAttribute("encodedAlarms",java.net.URLEncoder.encode(NmsUtil.GetString("Alarms"),"UTF-8"));
            %>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.event.operations.viewalarm'/>" onclick="javascript:showAlarms('/fault/AlarmView.do?selectedNode=Alerts&selectedTab=Fault&displayName=<c:out value="${encodedAlarms}"/>&viewId=Alerts','<fmt:message key="webclient.fault.eventlist.operations.viewalarms.error"/>')">
         </td>
       </tr>
    </table>
  </td>
</tr>
</table>
