<%-- $Id: searchBody.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<tr>
	<td height="15">&nbsp;</td>
</tr>
<tr>
	<td><span class="boldText"><fmt:message key='webclient.config.audit.cv.name'/></span><span style="color:ff0000;">*</span></td>
        <td>: &nbsp;<html:text property="cvName" name="searchForm" styleClass="formStyle"/> </td>
</tr>
<tr>
        <td height="15">&nbsp;</td>
</tr>
<TR>
	<TD height=25 class="propertyHeader"><span class="text">&nbsp;<fmt:message key='webclient.config.audit.cv.criteriaProps'/> </span></TD>
        <TD class"propertyHeader"><span class="text"><fmt:message key='webclient.config.audit.cv.criteriadetails'/></span> </TD>
</TR>
