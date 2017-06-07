<%-- $Id: addCVBody.jsp,v 1.3 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

<!--tr>
 <td  colspan="2" align="center" width="100%"><span class="mandatory">*</span>&nbsp;<span  class="textSmall"><fmt:message key='webclient.fault.customview.mandatory.message'/></span>
        </td>
</tr-->

        <TR > 
          <TD width="186" height=40 ><span class="text">&nbsp;<fmt:message key='webclient.topo.addmodifycv.customviewname'/></span></TD>


          <TD width="432" height="40" align=left> <html-el:text name="searchForm"  maxlength="100" property="cvName"  styleClass="formStyle"/>

            <span class="mandatory">*</span>&nbsp;<span  class="textSmall"><fmt:message key='webclient.fault.customview.mandatory.message'/></span></TD>
        </TR>
        <TR> 
          <TD height=25 class="propertyHeader"><span class="text">&nbsp;<fmt:message key='webclient.topo.addmodifycv.criteriaProps'/> </span></TD>
              <TD class"propertyHeader"><span class="text"><fmt:message key='webclient.topo.addmodifycv.criteriadetails'/></span> </TD>
        </TR>

        <html-el:hidden  name="searchForm" property="actionToPerform" />
        <html-el:hidden  property="viewId" value='${param.viewId}'/>
        <html-el:hidden  property="searchType" value=''/>

