
<%-- $Id: InventoryViewHeader.jsp,v 1.3 2007/10/05 07:33:42 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="com.adventnet.nms.util.NmsUtil;"%>
<table border="0" cellspacing="0" cellpadding="0" align="left">

<tr>
  <td>
    <%
       request.setAttribute("encodedNetworkEvents",java.net.URLEncoder.encode(NmsUtil.GetString("Network Events"),"UTF-8"));
       request.setAttribute("encodedAlarms",java.net.URLEncoder.encode(NmsUtil.GetString("Alarms"),"UTF-8"));
    %> 
    <table border="0" align="left" cellpadding="2" cellspacing="0">
      <tr align="left"> 
         <td>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.viewevents'/>" onclick="javascript:showEvents('/fault/NetworkEvent.do?selectedNode=Events&selectedTab=Fault&displayName=<c:out value="${encodedNetworkEvents}"/>')">
         </td>
         <td>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.viewalarms'/>" onclick="javascript:showAlarms('/fault/AlarmView.do?selectedNode=Alerts&selectedTab=Fault&displayName=<c:out value="${encodedAlarms}"/>')">
         </td>
<c:if test='${!(empty privileges["Delete Object"] && empty privileges["Modify Object"])}'>
       <c:if test='${!empty privileges["Manage And Unmanage Objects"]}'>
         <td>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.manage'/>" onclick="javascript:performOperation('/topo/manageUnmanage.do?managed=true')">
         </td>
         <td>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.unmanage'/>" onclick="javascript:performOperation('/topo/manageUnmanage.do?managed=false')">
         </td>
       </c:if>
       <c:if test='${!empty privileges["Delete Object"]}'>
         <td>
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.deleteobject'/>" onclick="javascript:deleteObject('/topo/deleteObject.do?')">
         </td>
       </c:if>
</c:if>
</tr>
</table>
</td>
</tr>

</table>
