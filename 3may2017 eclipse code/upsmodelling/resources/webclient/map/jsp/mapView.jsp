<%-- $Id: mapView.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<script language="JavaScript" SRC="/webclient/common/js/DefaultMenuProperties.js"></script>
<script language="JavaScript" SRC="/webclient/common/js/PopupMenuAPI.js"></script>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<BODY >
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<c:choose>
<c:when test='${empty param.renderer}'>
<c:set var='renderer' value="styled"/>
</c:when>
<c:otherwise>
<c:set var='renderer' value='${param.renderer}'/>
</c:otherwise>
</c:choose>

<tiles:insert attribute="Header"/>

<TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0 valign="top" class = "mapbg">
  <TBODY>

    <TR> 
      <TD align=center> <TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0 class="gradHeaderBg">
                     
      </TABLE>
    </TD>
    </TR> 
 <tr> 
	<td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
         <tr class="opBg" > 	
           <%@include file="/webclient/topo/jsp/inventoryViewStatus.jsp"%>
         </tr>
   	  </table></td>
  </tr>    


    <TR height="600"><TD align=center> 
        <TABLE BORDER="0" CELLSPACING="20" CELLPADDING="1"  >
          <%@include file="/webclient/map/jspf/mapLayout.jspf"%>
       </TABLE>
        <INPUT TYPE="hidden" NAME="mapname" VALUE='<c:out value='${viewId}'/>'>
 </TD></TR>
  
</TABLE>
  </TBODY>
      
</body>



