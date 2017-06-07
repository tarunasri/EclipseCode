<%--  $Id: rightPanelList.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script language="javascript" SRC="/webclient/devices/js/opmanagerJS.js" type="text/javascript"></script>
<script language="javascript" SRC="/webclient/common/js/navigation.js" type="text/javascript"></script>

<%@include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>



<%--  STARTS HERE:  Added  by asivakumar for Menu as Buttons and Select option --%>
 

<table>
<tr>
  <td> 
    <table border="0" align="left" cellpadding="2" cellspacing="0">
      <tr align="left"> 

<%--
       <c:if test='${!empty privileges["Delete Object"]}'>
         <td>
            <input name="Submit" type="button" class="button" value="<fmt:message key='webclient.topo.inventorylist.operations.deleteobject'/>" onclick="javascript:deleteObject('/topo/deleteObject.do?')">
         </td>
       </c:if>


</c:if>
--%>
<c:set var='obj'>
<fmt:message key='webclient.topo.menu.object'/>
</c:set>
<c:set var='ntk'>
<fmt:message key='webclient.topo.menu.network'/>
</c:set>
<c:set var='mop'>
<fmt:message key='webclient.topo.menu.mop'/>
</c:set>

<c:forEach var="headers" items="${menuVector}" varStatus="loopstatus">
<c:set var="lists" value="${headers.list}"/>
<c:choose>
<c:when test="${headers.displayName == obj}">
 <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
<c:if test="${list1.id ne mop}"><td>
<td>
<input name="Submit" type="button" class="button" value='<c:out value="${list1.id}" />' onclick="javascript:performOperation1('<c:out value="${list1.url}" />')">
 </td>
</c:if>
 </c:forEach>   

</c:when>
<c:when test="${headers.displayName eq ntk}">

 <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
 <td>
 <input name="Submit" type="button" class="button" value='<c:out value="${list1.id}" />' onclick="javascript:performOperation1('<c:out value="${list1.url}" />')">
 </td>
 </c:forEach>   

</c:when>
<c:otherwise>

    <td>
    <select class="comboStyle" name="<c:out value="${headers.displayName}" />" onclick="selected(this.options.selectedIndex,this)"> 
             
            <option value='select' selected><c:out value="${headers.displayName}" /></option> 
            <option value='separator'>-----------------------</option> 
            <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
		    <c:set var="list1" value="${list1}" />
            <option value="javascript:performOperation1('<c:out value="${list1.url}" />')"><c:out value="${list1.id}" /></option> 
            </c:forEach>   
            
    </select> 


    </td>	

</c:otherwise>
</c:choose>
    
</c:forEach>



</tr>
</table>
</td>
</tr>
</table>





<%--  ENDS HERE:  Added  by asivakumar for Menu as Buttons and Select option --%>


<%--

<c:forEach var="headers" items="${rightPanelProps}" varStatus="loopstatus">
	<c:set var="lists" value="${headers.list}" />
	
	  <!-- Total table starts here -->
 	  <table width=175 border="0" cellspacing="0" cellpadding="10" class="treeColor">
		<tr> 
          <td> 

		   <!-- inner table starts in this loop -->		  
			<table width="100%" border="0" cellspacing="0" cellpadding="5" class="dbBorder1">
              <tr> 
                <td class="tableMasterHeaderAlone" > 
                  <c:out value="${headers.displayName}" />
				</td>
               </tr>
<!--              </table>
			  
		</td>
        </tr>
-->
		   <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
		   <c:set var="list1" value="${list1}" />

           	   <tr> 
         	   <td align="center" class="txtGlobal"> 

               	   <table width="100%" border="0" cellspacing="0" cellpadding="2">
                   		  <tr> 
<!--
						  <c:if test="${list1.image != ''}" >
                  		  <td align=center width="24" class="txtGlobal"> <img src="<c:out value="${list1.image}" />" >  </td>
						  </c:if>  -->
      			  		  <td class="txtGlobal" ><a href="<c:out value="${list1.url}" />"><c:out value="${list1.id}" /></a> </td>
						  </tr>
 			 	   </table>	
			 
		 	 </td>
		 	 </tr>

  			</c:forEach>
			
			</table>
			
			</td>
			</tr>
	  </table>
  </c:forEach>

--%>
