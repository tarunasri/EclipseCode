<%-- $Id: ConfigSearchFooter.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
             <table width="596" border="0" cellspacing="0" cellpadding="6">
              <tr> 
                <td width="48" height="0"> <input name="morebutton" type="button" class="button" onClick="more()" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>"> 
                </td>
                <td width="371" height="0" align="left"><input name="fewerbutton" type="button" class="button" onClick="fewer()" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>"> 
                </td>

			<td width="141" align="left"><input name="Submit" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.searchbutton.text'/>" onClick="search()"></td> 
              </tr>
            </table>

