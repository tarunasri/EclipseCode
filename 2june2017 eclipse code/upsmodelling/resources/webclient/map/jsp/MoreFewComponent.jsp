<%-- $Id: MoreFewComponent.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html;charset=UTF-8"%>

<input type="hidden" name="viewId" value="<c:out value='${param.viewId}'/>">
<input type="hidden" name="searchAction" value="<c:out value='${searchAction}'/>">
<input type="hidden" name="ComplexSearchView" value="<c:out value='${ComplexSearchView}'/>">

<TABLE border=0 cellPadding=2 cellSpacing=1 class="NobotBorder">
  <TBODY>
  <TR>
    <TD>

     <TABLE cellSpacing=1 cellPadding=2 width="98%" align=center border=0>
     <TBODY>

<%-- The number of rows based on the more and fewer option is maintained as a hidden field --%>
<html-el:hidden name="searchForm" property="rows"/>
<input type="hidden" name="method" value="">

<c:forEach begin="0" end="${searchForm.map.rows-1}" varStatus="status">
       <c:choose>
         <c:when test="${status.count%2==1}">
           <TR class=rowstyle>
         </c:when>
         <c:otherwise>
           <TR class=rowstyle2>
         </c:otherwise>
       </c:choose>

  <TD width="30%">

<html-el:select styleClass= "formStyle" name="searchForm" disabled="${!empty mapType}" property="selectedKeys" value="${searchForm.map.selectedKeys[status.index]}" onchange="selected(this.options.selectedIndex,this.name)" indexed="true"> 
        <html-el:options collection="keys"  name="searchForm" property="key" labelProperty="key"/>
</html-el:select>
</TD>
  <TD width="31%" height=25>
     <html-el:text styleClass="formStyle" name="searchForm" readonly="${!empty mapType}" property="criteriaValues" value="${searchForm.map.criteriaValues[status.index]}" indexed="true"/>
 </TD>
    <TD >
  </TD>
  </TR>                        
 </c:forEach>

      </TBODY></TABLE>
 </TD></TR>
              <TR> 
                <td colspan="2" align="left" valign="top" class="propertyHeader" >
 <tiles:insert attribute="Footer"/>  
</TD></TR>
   
</TBODY></TABLE>
