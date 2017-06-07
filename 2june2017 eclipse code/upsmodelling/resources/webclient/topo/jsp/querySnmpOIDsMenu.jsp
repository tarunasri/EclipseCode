<%-- $Id: querySnmpOIDsMenu.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<BODY>

<TABLE class=botBorder cellSpacing=0 cellPadding=4 align=left border=0 width="100%">
  <TBODY>
  <TR id=high>
    <TH class=header1Bg vAlign=center align=middle colSpan=2 height=30><SPAN class=header1>Query SNMP Tables for <c:out value='${param.host}'/></SPAN></TH></TR>
  <TR>
       <TD class=text align=middle width=20> 1</TD>
       <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibColumns=ifIndex ifDescr ifType ifSpeed ifPhysAddress ifAdminStatus ifOperStatus ifInOctets ifOutOctets ifOutDiscards&mibTableName=ifTable&mibsToLoad=mibs/RFC1213-MIB&keyFortable=RFC1213-MIB&maxRetry=2"> Interface Table </a></TD></TR>

  <TR>
       <TD class=text align=middle width=20> 2</TD>
       <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibColumns=ipRouteDest%20ipRouteNextHop&mibTableName=ipRouteTable&mibsToLoad=mibs/RFC1213-MIB&keyFortable=RFC1213-MIB&maxRetry=2"> Routing Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 3</TD>
       <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=dot1dBasePortTable&mibsToLoad=mibs/BRIDGE-MIB&keyFortable=BRIDGE-MIB&maxRetry=2"> Port Table </a></TD></TR>
  <TR>

 <TR>
       <TD class=text align=middle width=20> 5</TD>
       <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=dot1dStpPortTable&mibsToLoad=mibs/BRIDGE-MIB&keyFortable=BRIDGE-MIB&maxRetry=2"> Spanning Tree </a></TD></TR>
  <TR>

 <TR>
       <TD class=text align=middle width=20> 6</TD>
 <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=dot1dTpFdbTable&mibsToLoad=mibs/BRIDGE-MIB&keyFortable=BRIDGE-MIB&maxRetry=2"> Forwarding Table </a></TD></TR>
 <TR>

 <TR>
       <TD class=text align=middle width=20> 7</TD>
 <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=dot1dStaticTable&mibsToLoad=mibs/BRIDGE-MIB&keyFortable=BRIDGE-MIB&maxRetry=2"> Filter Table </a></TD></TR>
 <TR>

  <TR>
       <TD class=text align=middle width=20> 8</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=tcpConnTable&mibsToLoad=mibs/RFC1213-MIB&keyFortable=RFC1213-MIB&maxRetry=2"> TCP Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 9</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=udpTable&mibsToLoad=mibs/RFC1213-MIB&keyFortable=udpTable&maxRetry=2"> UDP Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 10</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=ipNetToMediaTable&mibsToLoad=mibs/RFC1213-MIB&keyFortable=RFC1213-MIB&maxRetry=2"> IpNetToMedia Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 11</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=hrDeviceTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2"> Printer Device Table </a></TD></TR>
  <TR>

 <TR>
       <TD class=text align=middle width=20> 12</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=prtCoverTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2"> Printer Cover Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 13</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=prtInputTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2">Printer Input Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 14</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=prtOutputTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2">Printer Output Table </a></TD></TR>
  <TR>

  <TR>
       <TD class=text align=middle width=20> 15</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=prtMarkerSuppliesTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2">Printer Supplies Table </a></TD></TR>
  <TR>

  <TR>
  <TD class=text align=middle width=20> 16</TD>
  <TD class=text align=middle width=350><A href="/topo/querySnmpOIDs.do?HOST=<c:out value='${param.host}'/>&COMMUNITY=public&PORT=161&mibTableName=prtMarkerSuppliesTable&mibsToLoad=mibs/Printer-MIB&keyFortable=Printer-MIB&maxRetry=2">View IP Statistics (Yet to be Implemented)</a></TD></TR>
  <TR>

  <TR>
        <TD class=propertyHeader vAlign=top align=left height=0 colSpan=2 ><INPUT
    class=button type=submit value="<< Back" name=Submit  onClick="history.back();"> </TD>
    </TR></TBODY></TABLE></BODY></HTML>
