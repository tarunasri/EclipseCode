<%-- $Id: InterfaceTable.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>


<c:choose>
<c:when test="${ForInterfaceTable eq 'false'}">
<html>
   
   <body>
    <table style="margin-top:20px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="MODisplayNameClassCol1"><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
          
        </tr>
		<tr><td>&nbsp; </td></tr>
        <tr>
         
          <td valign="top" >
            <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">
             
              <tr class="homeHeader"><td>&nbsp; </td></tr>
              <tr><td>&nbsp; </td></tr>
              <tr> 
                 <td height="170" align="center" > 
                   <div style='text-align:center;padding:10px;height:180px'><img src='/webclient/common/images/LoadingTC.gif' style='margin-top:74px' onClick="javascript:interfaceTableRequest('<c:out value="${MOName}"/>','<c:out value="${TypeForMO}"/>','<c:out value="${SnmpCheckForMO}"/>');"/></div>
                 </td>
	          </tr>
	          <tr><td>&nbsp; </td></tr>
              <tr><td>&nbsp; </td></tr>
             </table>
           </td>
         </tr>
       </table>
</body>
</html>
</c:when>
<c:otherwise>
<html>
<body>
<c:choose>
<c:when test="${classname eq 'SwitchObject'}">
<table width="100%" border="0" style="margin-top:15px;margin-bottom:5px;" cellpadding="0" cellspacing="0">
        <tr>
          <td class="MODisplayNameClassCol1"><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
          
        </tr>
		</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
         
          <td valign="top" >

<table border="0" cellspacing="0" cellpadding="5" class="tablebdr1" style="padding:0px;" width="100%" >
  <!--tr class="homeHeader"><td  colspan="5"><fmt:message key='webclient.topo.interfaces.table.header'/></td></tr-->
  
  <tr height="23" class="homeHeader" >
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.index'/></td>
  <td width="40%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.description'/></td>
  <td width="20%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.speed'/></td>
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.status'/></td>
  <td width="30%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.mac'/></td>
  </tr>

<c:set var="colIndex" value="0"/>
<c:set var="rowIndex" value="0"/>
<c:forEach var="intf" items="${IF_DATA}" varStatus="status">
<c:forEach var="intf2" items="${intf}" >
         <c:choose>
           <c:when test='${colIndex <=5}'>
		<c:if test='${colIndex ==0}'>
			<c:choose>		
			    <c:when test="${status.count % 2 ==0}" > 		
				<TR class="reportsOddRow" >
			    </c:when>
			    <c:otherwise>
				<TR class="reportsEvenRow" >
			    </c:otherwise>
			</c:choose>  	
        	</c:if>
		<td class="text">

		<c:choose>
		<c:when test='${details.IF_DATA[rowIndex][colIndex] == null || details.IF_DATA[rowIndex][colIndex] == "" }'>
		<fmt:message key='webclient.devices.details.na'/>
		</c:when>
		<c:otherwise>
            <c:choose>		
			<c:when test="${colIndex ==1}" > 	
        <a href="/topo/objectdetails.do?requestid=GET_IF_DETAILS&Instance=<c:out value='${details.IF_DATA[rowIndex][0]}'/>&name=<c:out value='${name}'/>" >
<c:out value='${details.IF_DATA[rowIndex][colIndex]}'/> </a>
            </c:when>
		    <c:otherwise>
		<c:out value='${details.IF_DATA[rowIndex][colIndex]}'/>
            </c:otherwise>
		    </c:choose>
		</c:otherwise>
		</c:choose>
	</a>
	</td>
           <c:set var="colIndex" value='${colIndex+1}'/>
           <c:if test='${colIndex ==5}'>
             <c:set var="colIndex" value="0"/>
             <c:set var="rowIndex" value='${rowIndex+1}'/>
             </TR>

           </c:if>
           </c:when>
         </c:choose>
        </c:forEach>
        </c:forEach>

</table>
</td>
</tr>
</table>

</c:when>

<c:otherwise>


  <table style="margin-top:15px;margin-bottom:5px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="MODisplayNameClassCol1"><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
          
        </tr>
		</table>

 <table  width="100%" border="0" cellpadding="0" cellspacing="0">

        <tr>
         
          <td valign="top" >

<table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">
  <tbody>
  
   <tr height="23" class="homeHeader" >
  <td width="10%"  class="boldText" > &nbsp;<fmt:message key='webclient.topo.interfaces.table.index'/></td>
  <td width="40%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.description'/></td>
  <td width="20%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.speedinbps'/></td>
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.status'/></td>
  <td width="30%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.mac'/></td>
  </tr>

 <c:forEach var="prop" items="${IF_DATA}" varStatus="status" >
        
        <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=22>
           </c:otherwise>
        </c:choose>
        
<td class="text"  >&nbsp;<c:out value="${prop.ifIndex}"/></td>
<td class="text" >
<a href="/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${prop.name}'/>" title="<c:out value='${prop.name}' />" >     <c:out value="${prop.ifDescr}"/></a> </td> 
     <%--   <td class="text" ><c:out value="${prop.ifDescr}"/></td> --%>
        <td class="text" ><c:out value="${prop.ifSpeed}"/></td>    
        <td class="text" ><c:out value="${prop.status}"/></td>
        <td class="text" ><c:out value="${prop.physAddr}"/></td>    

</c:forEach>
</table>
</td>    </tr>
        
      </table>

</c:otherwise>
</c:choose>
</body>
</html>
</c:otherwise>
</c:choose>