
<%-- $Id: inventoryList.jsp,v 1.5 2010/10/29 13:47:16 swaminathap Exp $ --%>


<%@ page  import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="popup" uri="http://www.adventnet.com/nms/webclient/components" %>

<form name="listView">	
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
	  
<table width = "100%" border="0" cellspacing="0" cellpadding="3" align="left" class="homeTableBorder">
<tr class="tableHeaders"> 
<c:if test="${empty ComplexSearchView}">	
	<td width="1%" nowrap> <input name = "toggleAll"  class="checkBox" type = "checkbox" onclick = "javascript:ToggleAll(this,this.form)"></td>
</c:if>	
<c:set target="${DATA_PROPERTIES}" property="orderByColumn" value="${DATA_PROPERTIES.orderByColumn}"/>
<c:set target="${DATA_PROPERTIES}" property="isAscending" value="${DATA_PROPERTIES.isAscending}"/>

<c:forEach var="value" items="${headerList}">
<TD  nowrap 
<c:if test="${value.columnName == 'name'}">
colspan="2"
</c:if>
<c:if test="${value.columnName == 'status'}">
   align="center"
</c:if>
>
<c:choose>
<c:when test="${!empty ComplexSearchView}">     
   <span class="boldWhiteText"><fmt:message key='webclient.topo.${value.columnName}'/></span>
</c:when>
<c:otherwise>
<a class="boldWhiteText" href="javascript:doSorting('<c:out value="${isAscending}"/>','<c:out value="${value.columnName}"/>')">
<fmt:message key='webclient.topo.${value.columnName}'/>
<c:if test='${value.columnName == orderByColumn}'>
<c:choose>
<c:when test="${isAscending == 'true'}">
<img src=/webclient/common/images/sortup.gif border=0 width="11" height="7" hspace="2" vspace="1">
</c:when>
<c:otherwise>
<img src=/webclient/common/images/sortdown.gif border=0 width="11" height="7" hspace="2" vspace="1" >
</c:otherwise>
</c:choose>
</c:if>
</a>
</c:otherwise>
</c:choose>
</TD>
</c:forEach>
</TR>



    <% int count = 0; %>

<c:forEach var="prop" items="${viewData}" varStatus="status" >
<c:choose>
       <c:when test="${status.count%2==0}">
       <TR class="reportsOddRow" height=22>
      </c:when>
      <c:otherwise>
      <TR class="reportsEvenRow" height=22>
    </c:otherwise>
</c:choose>

<c:if test="${empty ComplexSearchView}">
<td nowrap><input name="rowSelection"  type="checkbox" value="<c:out value='${prop.name}'/>" onclick = "javascript:Toggle(this,this.form,event)"></td> 
</c:if>
<c:forEach var="value1" items="${headerList}">
<c:set var="val" value="${value1.columnName}"/>
<c:choose>
  <c:when test="${val == 'name'}" > 
     <td width="1%" class="text" nowrap><img src="<c:out value="${prop.typeImage}" />" border=0 width="16" height="16" hspace="1"></td>
     <c:url var="url" value="/topo/objectdetails.do?name=${prop.name}&type=${prop.type}&menu=listmenus&requestid=SNAPSHOT"> </c:url>
         <td class="text" nowrap>
       <A class="linkNoUnderline" href='<c:out value="${url}"/>'><c:out value="${prop.name}"/> </A>


</TD>

<c:if test='${!empty menulist[status.index]}'>

 <c:set target="${DATA_PROPERTIES}" property="name" value="${prop.name}"/> 
 <c:set target="${DATA_PROPERTIES}" property="type" value="${prop.type}"/> 
 <c:set target="${DATA_PROPERTIES}" property="snmpport" value="${prop.snmpport}"/>

<c:set value='${menulist[status.index]}' var="rootElementsList" scope="request"/>
<c:set value='${DATA_PROPERTIES}' var="dataProperties" scope="request"/>
<c:set var="typeFlag" value='${prop.type}' scope="request"/>
<c:set var="managedFlag" value='${prop.managed}' scope="request"/>
<%-- 
<c:choose>
<c:when test='${! empty prop.discover}'>
<c:set var="discoverFlag" value='${prop.discover}' scope="request"/>
<popup:popupmenu model="rootElementsList" type='<%=(String)request.getAttribute("typeFlag")+"_"+(String)request.getAttribute("managedFlag")+"_"+(String)request.getAttribute("discoverFlag")%>' objectData="dataProperties" />
</c:when>
<c:otherwise>
<popup:popupmenu model="rootElementsList" type='<%=(String)request.getAttribute("typeFlag")+"_"+(String)request.getAttribute("managedFlag")%>' objectData="dataProperties" />
</c:otherwise>
</c:choose>
--%>

</c:if>

    </c:when>
     <c:when test="${val == 'status'}" > 
     <td align="center"><img src="<c:out value="${prop.statusImage}" />" border=0 width="16" height="16" hspace="1"></td>
    </c:when>

   

 <c:when test="${val == 'sysDescr'}" > 
     <td class=text nowrap>
<%
Vector viewVec = (Vector)request.getAttribute("viewData");
Properties props1 = (Properties)viewVec.elementAt(0);
String sysDescVal = (String)props1.get("sysDescr");

if(sysDescVal != null) 
{  
    if(sysDescVal.length() > 25)
    {
        request.setAttribute("description",(sysDescVal.substring(0,25)+".."));
    } 
    else
    {
        request.setAttribute("description",sysDescVal);
    }
}
%>
<c:out value="${description}"/></td>    
 </c:when>
   	<c:when test="${prop[val] != null}"> 
         <TD class=text nowrap>
            <c:choose>
               <c:when test='${prop[val] != ""}'>
                  <c:out value="${prop[val]}"/>
               </c:when>
               <c:otherwise>
                  &nbsp;
               </c:otherwise>
            </c:choose>
         </TD> 
   	</c:when> 



   	<c:otherwise> 
   	<TD  class=text nowrap>--</TD>
    </c:otherwise> 
</c:choose>

</c:forEach>




</TR>




</c:forEach>

</table>
</td>
 <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</form>
