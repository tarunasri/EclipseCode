<%-- $Id: searchFooter.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

             <table width="596" border="0" cellspacing="0" cellpadding="6">
              <tr> 
                <td width="48" height="0"> <input name="morebutton" type="button" class="button" onClick="more()" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>"> 
                </td>
                <td width="371" height="0" align="left"><input name="fewerbutton" type="button" class="button" onClick="fewer()" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>"> 
                </td>

			<td width="141" align="left"><input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.common.searchcomponent.searchbutton.text'/>"></td> 
              </tr>
            </table>

