<%-- $Id: map.jsp,v 1.3 2008/08/25 10:56:28 sudharshan Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="popup" uri="http://www.adventnet.com/nms/webclient/components" %>

<script language="JavaScript" SRC="/webclient/common/js/DefaultMenuProperties.js"></script>
<script language="JavaScript" SRC="/webclient/common/js/PopupMenuAPI.js"></script>
<c:choose>
<c:when test="${!empty param.groupName}">
<a class="textSmall" href ="<c:out value='/map/MapView.do?selectedNode=${selectedNode}&selectedTab=Maps&viewId=${param.viewId}'/>"><fmt:message key='webclient.common.backlink.text' /></a>
</c:when>
<c:otherwise>
<tiles:insert attribute="Header"/>
</c:otherwise> 
</c:choose>
<table border=0 align=center>
<tr><td nowrap>
<%@include file="/webclient/topo/jsp/inventoryViewStatus.jsp" %>
</td></tr>
</table>

<%-- For the Example Layout Map --%>
<c:if test="${mapType eq 'exampleMap'}">
<form name="layout" action="/map/ExampleLayout.do?viewId=ExampleLayout.netmap&selectedTab=Maps">
<table width="100%">
	<tr>
		<%
			String layout = request.getParameter("layout");
			if (layout != null && !layout.trim().equals("")) {
				char c1 = layout.charAt(0);
				layout = layout.toUpperCase();
				char c2 = layout.charAt(0);
				layout = layout.toLowerCase().replace(c1, c2);				
			}
		%>	
		<td height="1" colspan="3" class="header2Bg">
			<span class="header2"><%=layout%> <fmt:message key='webclient.map.example.layout.view.title'/></span>
		</td>
		<td height="1" width="100" class="text" align="right"><span class="header2">
           <select name="layout" class="formStyle" onchange="document.layout.submit()">
		      <%
				String str[] = {"ring","star","grid", "flow"};
				for(int i = 0; i < str.length; i++) {
				  String s = "";									
				if (layout.equalsIgnoreCase(str[i])) {
				  s = " selected ";
				}
			  %>
		      <option class="header2" <%=s%>><%=str[i]%></option>
			  <% } %>
        </span></td> 
	<tr>	
</table>
</form>
</c:if>
<%-- For the Example Layout Map --%>
<center>
<c:if test="${mapType ne 'exampleMap'}">
<br><br>
</c:if>
<img src="<c:out value='${mapImgFileName}' />" useMap = "#mapName" border=0>
</center>
<map name="mapName">
    <c:forEach var = "symbolProperty" items = "${objectsInView}" varStatus="status">
    <c:set var="menuIndex" value='${status.index}' scope="request"/>
    <c:if test="${!empty parentVsChild[symbolProperty.name]}">
    <c:forEach var = "sProperty" items = "${parentVsChild[symbolProperty.name]}" varStatus="status1">

         <c:set target="${DATA_PROPERTIES}" property="name" value="${sProperty.name}"/>
         <c:set target="${DATA_PROPERTIES}" property="type" value="${sProperty.type}"/>
         <c:set target="${DATA_PROPERTIES}" property="mapName" value="${sProperty.mapName}"/>
         <c:set target="${DATA_PROPERTIES}" property="label" value="${sProperty.label}"/>
         <c:set target="${DATA_PROPERTIES}" property="viewId" value="${sProperty.mapName}"/>
         <c:set target="${DATA_PROPERTIES}" property="x" value="${sProperty.x}"/>
         <c:set target="${DATA_PROPERTIES}" property="y" value="${sProperty.y}"/>
         <c:set target="${DATA_PROPERTIES}" property="height" value="${sProperty.height}"/>
         <c:set target="${DATA_PROPERTIES}" property="width" value="${sProperty.width}"/>
         <c:set target="${DATA_PROPERTIES}" property="snmpport" value="${sProperty.snmpport}"/>
         <c:set target="${DATA_PROPERTIES}" property="objName" value="${sProperty.objName}"/>
       <c:choose>
       <c:when test="${!empty chMenulist[sProperty.name]}">
        <c:set value='${chMenulist[sProperty.name]}' var="rootElementsList1" scope="request"/>
        <c:set value='${DATA_PROPERTIES}' var="dataProperties1" scope="request"/>
        <c:set var="menuIndex1" value='${status1.index}' scope="request"/>
        <c:set var="symbolName1" value='${sProperty.name}' scope="request"/>
        <%--
        <popup:popupmenu model="rootElementsList1"
        type='<%="popupmenu_"+((Integer)request.getAttribute("menuIndex1")).toString() + ((Integer)request.getAttribute("menuIndex")).toString()%>'
        objectData="dataProperties1"
        varAction = "action1" imageRequired = "false" />
        --%>

	<c:if test="${sProperty.type eq 'Port'}">
	<AREA border=1 SHAPE='RECT' 
	COORDS='<c:out value = "${sProperty.sevCoords}" />'
	TITLE='<c:out value = "${sProperty.smartLabel}" />'
	HREF="<c:out value = '/mainLayout.do?selectedNode=Alerts&selectedTab=Fault&displayName=Alarm&action=/fault/AlarmView.do&entity=${sProperty.name}' />">
	</c:if>
    <AREA border=1 SHAPE='RECT' HREF='javascript:void(0)'
       	COORDS='<c:out value = "${sProperty.menuCoords}" />'
        TITLE='<c:out value = "${sProperty.name}" />'
       	onClick = "<c:out value = '${action1}' />"> 
    </c:when>
	<c:otherwise>
    <AREA border=1 SHAPE='RECT' HREF='javascript:void(0)'
        COORDS='<c:out value = "${sProperty.coords}" />'
        TITLE='<c:out value = "${sProperty.name}" />'>
	</c:otherwise>
    </c:choose>
    </c:forEach>
   </c:if>

       <c:choose>
       <c:when test="${!empty menulist[symbolProperty.name]}">
         <c:set target="${DATA_PROPERTIES}" property="name" value="${symbolProperty.name}"/>
         <c:set target="${DATA_PROPERTIES}" property="type" value="${symbolProperty.type}"/>
         <c:set target="${DATA_PROPERTIES}" property="mapName" value="${symbolProperty.mapName}"/>
         <c:set target="${DATA_PROPERTIES}" property="label" value="${symbolProperty.label}"/>
         <c:set target="${DATA_PROPERTIES}" property="viewId" value="${symbolProperty.mapName}"/>
         <c:set target="${DATA_PROPERTIES}" property="x" value="${symbolProperty.x}"/>
         <c:set target="${DATA_PROPERTIES}" property="y" value="${symbolProperty.y}"/>
         <c:set target="${DATA_PROPERTIES}" property="height" value="${symbolProperty.height}"/>
         <c:set target="${DATA_PROPERTIES}" property="width" value="${symbolProperty.width}"/>
         <c:set target="${DATA_PROPERTIES}" property="snmpport" value="${symbolProperty.snmpport}"/>
         <c:set target="${DATA_PROPERTIES}" property="objName" value="${symbolProperty.objName}"/>
         <c:set target="${DATA_PROPERTIES}" property="managed" value="${symbolProperty.managed}"/>
         <c:set target="${DATA_PROPERTIES}" property="discover" value="${symbolProperty.discover}"/>

        <c:set value='${menulist[symbolProperty.name]}' var="rootElementsList" scope="request"/>
        <c:set value='${DATA_PROPERTIES}' var="dataProperties" scope="request"/>
        <%--
        <popup:popupmenu model="rootElementsList"
        type='<%="popupmenu_"+((Integer)request.getAttribute("menuIndex")).toString()%>'
        objectData="dataProperties"
        varAction = "action" imageRequired = "false" />
        --%>
        <AREA border=1 SHAPE='RECT' HREF='javascript:void(0)'
        COORDS='<c:out value = "${symbolProperty.menuCoords}" />'
        TITLE= '<fmt:message key="webclient.map.tooltip.menu"> </fmt:message>'
        onClick = "<c:out value = '${action}' />"> 
	<c:if test="${symbolProperty.mapName eq 'Switches.netmap'}">
	<AREA border=1 SHAPE='RECT' 
	COORDS='<c:out value = "${symbolProperty.sevCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.severity"> </fmt:message>'
	HREF="<c:out value = '/mainLayout.do?selectedNode=Alerts&selectedTab=Fault&displayName=Alarm&action=/fault/AlarmView.do&entity=${symbolProperty.name}' />">
	</c:if>
	<c:if test="${symbolProperty.mapName ne 'Switches.netmap' && symbolProperty.type ne 'Port'}">
	<AREA border=1 SHAPE='RECT' 
        COORDS='<c:out value = "${symbolProperty.nodeCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.object"> </fmt:message>'

	HREF="<c:out value='/topo/objectdetails.do?requestid=SNAPSHOT&managed=${symbolProperty.managed}&discover=${symbolProperty.discover}&name=${symbolProperty.objName}&mapName=${symbolProperty.mapName}&symbol=${symbolProperty.name}'/>">

<%--
        HREF="<c:out value='/map/mapSymbolDetails.do?&x=${symbolProperty.x}&height=${symbolProperty.height}&name=${symbolProperty.name}&mapName=${symbolProperty.mapName}&width=${symbolProperty.width}&y=${symbolProperty.y}'/>">
--%>
        <AREA border=1 SHAPE='CIRCLE' 
        COORDS='<c:out value = "${symbolProperty.sevCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.severity"> </fmt:message>'
	HREF="<c:out value = '/mainLayout.do?selectedNode=Alerts&selectedTab=Fault&displayName=Alarm&action=/fault/AlarmView.do&entity=${symbolProperty.name}' />">
	</c:if>
      </c:when>
	<c:otherwise>
	<c:if test="${ !empty symbolProperty.gCoords}">
      <AREA border=1 SHAPE='RECT' 
        COORDS='<c:out value = "${symbolProperty.gCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.group"> </fmt:message>'
	HREF="<c:out value='${symbolProperty.link}&groupName=${symbolProperty.name}'/>">
	<AREA border=1 SHAPE='RECT' 
        COORDS='<c:out value = "${symbolProperty.nodeCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.object"> </fmt:message>'

	HREF="<c:out value='/topo/objectdetails.do?requestid=SNAPSHOT&name=${symbolProperty.symbol}&managed=${symbolProperty.managed}&discover=${symbolProperty.discover}&mapName=${symbolProperty.mapName}&symbol=${symbolProperty.name}'/>">

<%--
        HREF="<c:out value='/map/mapSymbolDetails.do?&x=${symbolProperty.x}&height=${symbolProperty.height}&name=${symbolProperty.name}&mapName=${symbolProperty.mapName}&width=${symbolProperty.width}&y=${symbolProperty.y}'/>">
--%>

      <AREA border=1 SHAPE='CIRCLE' 
        COORDS='<c:out value = "${symbolProperty.sevCoords}" />'
        TITLE='<fmt:message key="webclient.map.tooltip.severity"> </fmt:message>'
        HREF="<c:out value = '/mainLayout.do?selectedNode=Alerts&selectedTab=Fault&displayName=Alarm&action=/fault/AlarmView.do&entity=${symbolProperty.name}' />">
	</c:if>
        </c:otherwise>
	</c:choose>

    </c:forEach>

</map>
