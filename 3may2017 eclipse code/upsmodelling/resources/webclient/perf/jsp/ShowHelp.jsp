<%-- $Id: ShowHelp.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<body class="text">

<b><fmt:message key='webclient.perf.reports.addpo.help.header'/></b><br>
<br>
<fmt:message key='webclient.perf.reports.addpo.help.subtitle'/>
<br>
<table  class="htableBorder" cellpadding="2" cellspacing="2" border="0" width="100%">
  <tbody>
    <tr class="header2Bg">
      <td align="center" style="vertical-align: top;" rowspan="1" colspan="1"><small>
<b><fmt:message key='webclient.perf.reports.addpo.help.examples'/></b>
      </small></td>
    </tr>
    <tr class="reportsEvenRow">
      <td style="vertical-align: top;" rowspan="1" colspan="1"><ul>
        <li><small>
<fmt:message key='webclient.perf.reports.addpo.help.text1'/></small><small><br>
      </small></li>
      </ul></td>
    </tr>
    <tr class="reportsOddRow">
      <td style="vertical-align: top;" rowspan="1" colspan="1"><ul>
        <li><small>
<fmt:message key='webclient.perf.reports.addpo.help.text2'/></small><small><br>
      </small></li>
      </ul></td>
    </tr>
    <tr class="reportsEvenRow">
      <td style="vertical-align: top;" rowspan="1" colspan="1"><ul>
        <li><small>
<fmt:message key='webclient.perf.reports.addpo.help.text3'/>
</small><small><br>
      </small></li>
      </ul></td>
    </tr>
    <tr class="reportsOddRow">
      <td style="vertical-align: top;" rowspan="1" colspan="1"><ul>
        <li><small>
<fmt:message key='webclient.perf.reports.addpo.help.text1'/></small><small><br>
      </small></li>
      </ul></td>
    </tr>
  </tbody>
</table>
</body>
