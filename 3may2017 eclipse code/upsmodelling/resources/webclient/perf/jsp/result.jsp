<%-- $Id: result.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.perf.pollingobject.result.title'/></title>
</head>


<body class="bgNone">
<table width="400" border="0" align="center" cellpadding="6" cellspacing="0" class="botBorder">
  <tbody><tr> 
    <td width="370"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td><table width="388" border="0" cellpadding="0" cellspacing="0" class="NobotBorder">
        <tbody><tr> 
          <td width="53" align="left" valign="top"><img src="/webclient/common/images/info_icon.gif" width="43" height="43"></td>
          <td width="335" align="left" valign="middle"><span class="boldtext"><fmt:message key='webclient.common.messagepage.description'/></span><br> 


            <span class="text">
    <c:choose>
    <c:when test="${TYPE=='Add'}">
    <fmt:message key='webclient.perf.addpo.result.success'/>
    </span> <br> <br> 
    <span class="text"><a href="javascript:AddPO()"><fmt:message key='webclient.perf.addpo.result.addmore'/></a></span></td>
    </c:when>
    <c:otherwise>
    <fmt:message key='webclient.perf.modifypo.result.success'/>
     </span> <br> <br> 
 
                 <span class="text"><a href="javascript:ModifyPO()"><fmt:message key='webclient.perf.modifypo.result.success'/></a></span></td>
    </c:otherwise>
    </c:choose>
           
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>
</body>
</html>
