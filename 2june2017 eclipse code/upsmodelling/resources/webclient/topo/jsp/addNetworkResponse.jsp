<%-- $Id: addNetworkResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<HTML><HEAD><TITLE><fmt:message key='webclient.topo.addnetworkresult.title'/></TITLE>
<BODY>

<table cellSpacing=0 cellPadding=0 width=80% align="left" border=0>

<tr>
   <td>&nbsp;</td>
   <td height=30 valign="bottom"><SPAN class=header1><fmt:message key='webclient.topo.addnetworkresult.header'/> </SPAN></td>
</tr>
 
<tr>
   <td height="1" width="10"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
   <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
</tr>
 
<tr>
   <td>&nbsp;</td>
   <td>
   	<TABLE cellSpacing=0 cellPadding=0 width=685 border=0>
	                    <TBODY>
	                      <TR>
	                        <!--TD vAlign=top align=left width=214 class="addleftbg" height=216> 
	                          <TABLE cellSpacing=0 cellPadding=0 width="100%" 
	                              border=0>
	                            <TBODY>
	                              <TR> 
	                                <TD vAlign=top align=right><IMG height=227 
	                                src="/webclient/topo/images/<c:out value = "${selectedskin}"/>/addnetwork.gif" 
	                                  width=214></TD>
	                              </TR>
	                              <TR> 
	                                <TD vAlign=top align=right><IMG height=195 
	                                src="/webclient/topo/images/<c:out value = "${selectedskin}"/>/shadowbottom.gif" 
	                                  width=10><BR></TD>
	                              </TR>
	                            </TBODY>
	                          </TABLE></TD-->
	                        <TD width=571 align=middle vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
	                              border=0>
	                            <TBODY>
	                              <TR> 
	                                <TD align="left" valign="top"> <TABLE cellSpacing=0 cellPadding=0 width="98%" 
	                                border=0>
	                                    <TBODY>
	                                      <TR> 
	                                        <TD align=left vAlign=top> <c:if test="${!empty result}">
	                                          <c:url var="url" value="/topo/objectdetails.do?name=${netProps['name']} "> 
	                                          </c:url> <c:forEach var="res" items="${result}">
                <c:choose>
                <c:when test='${process=="discover"}'>
	        <c:choose> 
                <c:when test='${res.value == "success"}'> 
	        <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                <TBODY>
                <TR> 
                <TD  align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD></TR>
                <TBODY>
                <TR id=high> 
                <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                <TBODY>
                <TR  id=high> 
                <TD width="597" height=50 colspan="3" align=left><table width="432" border="0" cellspacing="0" cellpadding="0">
                <tr> 
	                                                              <!--td width="29"><span class="text"><img src="/webclient/topo/images/successful.gif" width="28" height="30"></span></td-->
                <td width="385"><span class="boldText"><fmt:message key='webclient.topo.addnetworkresult.success'/></span></td>
                </tr>
                </table></TD></TR>
	        <TR id=high > 
	        <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                <TR id=high > 
                <TD  align=left colSpan=3 height=30><SPAN class=text><STRONG><fmt:message key='webclient.topo.addnetworkresult.details'/>     
                </STRONG></SPAN></TD></TR>
	        <TR id=high > 
	        <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                <TR id=high> 
                <TD class=text  align=left colSpan=3 height=30><TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                <TR id=high > 
                <TD width="157" colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD></TR>
	        <TBODY>
	        <TR align="left" valign="top"  id=high> 
	        <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.name'/></TD>
	        <TD height=30 colSpan=2 class="text"> 
 	        <A href='<c:out value="${url}"/>'><c:out value="${netProps['name']}"/></A>               </TD></TR>	                                                                           <TR align="left" valign="top"  id=high> 
               <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
                <TD height=30 colSpan=2 class="text"> 
                <c:out value="${netProps['ipAddress']}"/></TD></TR>
                 
	        <TR align="left" valign="top"  id=high>
                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
                <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD></TR>
                </TBODY></TABLE><br> </TD></TR>
               <TR id=high > 
              <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
              <TR id=high > 
              <TD  align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">                                                          <tr> 
	                                                              <td><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a> 
	                                                                <fmt:message key='webclient.topo.addnetworkresult.more'/></strong></span></td>
	       </tr></table></TD></TR>
	       <TR id=high > 
	       <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60>
               </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
	       </c:when> <c:when test='${res.value == "background"}'> 
	       <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
	       <TBODY><TR><TD  align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD>
               </TR>
               <TBODY>
               <TR id=high> 
               <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
               <TBODY><TR  id=high>
               <TD height=50 align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
               <tr> 
               <td width="29"><span class="text"><img src="/webclient/topo/images/inprogress.gif" width="28" height="30"></span></td>
               <td width="385"><span class="boldText"><fmt:message key='webclient.topo.addnetworkresult.inprogress'/> 
               </span></td></tr></table>
              <SPAN class=text> </SPAN></TD>	                                                        <TD vAlign=center align=left height=50></TD></TR>
              <TR id=high > 
              <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
              <TR id=high > 
              <TD  align=left colSpan=2 height=30><SPAN class=text><fmt:message key='webclient.topo.addnetworkresult.details'/> </SPAN></TD></TR>
              <TR id=high > 
              <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
              <TR id=high> 
              <TD class=text  align=left colSpan=2 height=30><TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
	                                                            <TR id=high > 
	                                                              <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
	                                                            </TR>
	                                                            <TBODY>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD width="146" height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.name'/></TD>
	                                                                <TD width="277" height=30 colSpan=2 class="text"> 
	                                                                  <c:out value="${netProps['name']}"/> 
	                                                                </TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
	                                                                <TD height=30 colSpan=2 class="text"> 
	                                                                  <c:out value="${netProps['ipAddress']}"/></TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
	                                                                <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.message'/></TD>
	                                                                <TD height=30 colSpan=2 class="text"><c:out value="${res.key}"/></TD>
	                                                              </TR>
	                                                            </TBODY>
	                                                          </TABLE>
	                                                          <br> </TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left colSpan=2 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left colSpan=2 
	                                height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
	                                                            <tr> 
	                                                              <td><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a> 
	                                                                <fmt:message key='webclient.topo.addnetworkresult.more'/></strong></span></td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left colSpan=2 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                    </TBODY>
	                                                  </TABLE></TD>
	                                              </TR>
	                                            </TBODY>
	                                          </TABLE>
	                                          </c:when> <c:otherwise> 
	                                          <TABLE  cellSpacing=0 
	                                cellPadding=0 width=432 border=0>
	                                            <TBODY>
	                                              <TR> 
	                                                <TD  align=right width=432 
	                                height=1><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=400></TD>
	                                              </TR>
	                                            <TBODY>
	                                              <TR id=high> 
	                                                <TD align=left vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width=432 
	                                border=0>
	                                                    <TBODY>
	                                                      <TR  id=high> 
	                                                        <TD 
	                                height=50 align=left ><table width="432" border="0" cellspacing="6" cellpadding="0">
	                                                            <tr> 
	                                                              <td width="29"><span class="text"><img src="/webclient/topo/images/unsuccessful.gif" width="28" height="30"></span></td>
	                                                              <td width="385"><span class="boldText"><fmt:message key='webclient.topo.addnetworkresult.failed'/></span></td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD   
	                                align=left height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD 
	                                height=30 align=left  ><SPAN 
	                                class=text><STRONG><fmt:message key='webclient.topo.addnetworkresult.reason'/></STRONG></SPAN></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD   
	                                align=left height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=10></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD height="0" align=left valign="top"> 
	                                                          <table width="100%" border="0" cellspacing="5" cellpadding="0">
	                                                            <tr> 
	                                                              <td height="10" align="left" valign="top" ><SPAN class=text><c:out value="${res.key}"/></SPAN></td>
	                                                            </tr>
	                                                          </table>
	                                                          <br> </TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD   
	                                align=left height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD 
	                                height=30 align=left  ><SPAN 
	                                class=text><fmt:message key='webclient.topo.addnetworkresult.details'/> 
	                                                          </SPAN></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD   
	                                align=left height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD height="0" align=left valign="top"> 
	                                                          <TABLE cellSpacing=0 cellPadding=0 width=432 
	                                border=0>
	                                                            <TR id=high > 
	                                                              <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
	                                                            </TR>
	                                                            <TBODY>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD width="146" height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.name'/></TD>
	                                                                <TD width="277" height=30 colSpan=2 class="text"> 
	                                                                  <A href='<c:out value="${url}"/>'><c:out value="${netProps['name']}"/></A> 
	                                                                </TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
	                                                                <TD height=30 colSpan=2 class="text"> 
	                                                                  <c:out value="${netProps['ipAddress']}"/></TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
	                                                                <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
	                                                              </TR>
	                                                            </TBODY>
	                                                          </TABLE>
	                                                          <br> </TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left 
	                                height=30><table width="100%" border="0" cellspacing="5" cellpadding="0">
	                                                            <tr> 
	                                                              <td align="left" valign="top"><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a> 
	                                                                <fmt:message key='webclient.topo.addnetworkresult.tryagain'/></strong></span></td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD  align=left 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                    </TBODY>
	                                                  </TABLE></TD>
	                                              </TR>
	                                            </TBODY>
	                                          </TABLE>
	                                          </c:otherwise> </c:choose> </c:when>
<c:when test='${process=="dontdiscover"}'>
<c:choose><c:when test='${res.value == "success"}'>
<TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
<TBODY>
       <TR>
       <TD  align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD></TR>
       <TBODY>
       <TR id=high>
       <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
       <TBODY>
       <TR  id=high>
       <TD width="597" height=50 colspan="3" align=left><table width="432" border="0" cellspacing="0" cellpadding="0">

               <tr>
               <td width="385"><span class="boldText"><fmt:message key='webclient.topo.dontaddnetworkresult.success'/></span></td></tr>
               </table></TD></TR>
               <TR id=high >
               <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
               </TR>
               <TR id=high >
               <TD  align=left colSpan=3 height=30><SPAN class=text><STRONG><fmt:message key='webclient.topo.addnetworkresult.details'/>
               </STRONG></SPAN></TD></TR>
               <TR id=high >
               <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
               </TR>
               <TR id=high>
               <TD class=text  align=left colSpan=3 height=30><TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
               <TR id=high >
               <TD width="157" colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD></TR>
               <TBODY>
               <TR align="left" valign="top"  id=high>
               <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
               <TD height=30 colSpan=2 class="text">
               <c:out value="${netProps['ipAddress']}"/></TD></TR>
               <TR align="left" valign="top"  id=high>
               <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
               <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD></TR></TBODY></TABLE><br> </TD></TR>
               <TR id=high >
               <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
               <TR id=high >
               <TD  align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
                <tr>
                <td><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a>
                <fmt:message key='webclient.topo.dontaddnetworkresult.more'/></strong></span></td></tr></table></TD></TR>
                <TR id=high >
                <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                <TR id=high >
                <TD  align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                </c:when> <c:when test='${res.value == "background"}'>
                <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                <TBODY>
                <TR>
                <TD  align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD></TR>
                <TBODY>
                <TR id=high>
                <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                <TBODY>
                <TR  id=high>
                <TD height=50 align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
                <tr>
                <td width="29"><span class="text"><img src="/webclient/topo/images/inprogress.gif" width="28" height="30"></span></td>
                <td width="385"><span class="boldText"><fmt:message key='webclient.topo.dontaddnetworkresult.inprogress'/>
                </span></td></tr></table>
                <SPAN class=text> </SPAN></TD>
                <TD vAlign=center align=left height=50></TD>
                </TR>
                <TR id=high >
                <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                 </TR>
                 <TR id=high >
                 <TD  align=left colSpan=2 height=30><SPAN class=text><fmt:message key='webclient.topo.addnetworkresult.details'/>
                 </SPAN></TD>
                 </TR>
                 <TR id=high >
                 <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                 </TR>
                 <TR id=high>
                 <TD class=text  align=left colSpan=2 height=30>
                 <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                 <TR id=high >
                 <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
                 </TR>
                 <TBODY>
                 <TR align="left" valign="top"  id=high>
                 <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
                 <TD height=30 colSpan=2 class="text">
                 <c:out value="${netProps['ipAddress']}"/></TD>
                 </TR>
                 <TR align="left" valign="top"  id=high>
                 <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
                  <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
                 </TR></TBODY></TABLE><br> </TD></TR>
                 <TR id=high >
                 <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                 <TR id=high >
                 <TD  align=left colSpan=2 height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
                  <tr>
                  <td><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a>
                  <fmt:message key='webclient.topo.dontaddnetworkresult.more'/></strong></span></td></tr></table></TD></TR>
                  <TR id=high >
                  <TD  align=left colSpan=2 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                  </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                  </c:when> <c:otherwise>
                  <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                  <TBODY>
                  <TR>
                  <TD  align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD>
                  </TR>
                  <TBODY>
                  <TR id=high>
                  <TD align=left vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                  <TBODY>
                  <TR  id=high>
                  <TD height=50 align=left ><table width="432" border="0" cellspacing="6" cellpadding="0">
                  <tr>
                  <td width="29"><span class="text"><img src="/webclient/topo/images/unsuccessful.gif" width="28" height="30"></span></td>

                  <td width="385"><span class="boldText"><fmt:message key='webclient.topo.dontaddnetworkresult.failed'/></span></td>
                 </tr></table></TD></TR>
                 <TR id=high>
                 <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                 <TR id=high>
                 <TD height=30 align=left  ><SPAN class=text><STRONG><fmt:message key='webclient.topo.addnetworkresult.reason'/></STRONG></SPAN></TD>
                 </TR>
                 <TR id=high>
                 <TD height="0" align=left valign="top">
                 <table width="100%" border="0" cellspacing="5" cellpadding="0">
                 <TR id=high>
                 <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                 <TR id=high>
                 <TD height=30 align=left  ><SPAN class=text><fmt:message key='webclient.topo.addnetworkresult.details'/>
                  </SPAN></TD></TR>
                  <TR id=high>
                  <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                  </TR>
                  <TR id=high >
                  <TD height="0" align=left valign="top">
                  <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                  <TR id=high >
           <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD></TR>
                  <TBODY>
                  <TR align="left" valign="top"  id=high>
                  <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.networkaddress'/></TD>
                  <TD height=30 colSpan=2 class="text">
                  <c:out value="${netProps['ipAddress']}"/></TD></TR>
                  <TR align="left" valign="top"  id=high>
                  <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.netmask'/></TD>
                  <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD></TR></TBODY></TABLE>      
                  <br> </TD>
                  </TR>
                  <TR id=high >
                  <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                  </TR>
                  <TR id=high >
                  <TD  align=left height=30><table width="100%" border="0" cellspacing="5" cellpadding="0">
                  <tr>
                  <td align="left" valign="top"><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a>
                   <fmt:message key='webclient.topo.addnetworkresult.tryagain'/></strong></span></td>
                  </tr></table></TD></TR>
                  <TR id=high >
                  <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                  </TR>
                  </TBODY></TABLE></TD></TR></TBODY></TABLE>
                  </c:otherwise></c:choose></c:when>
                  <c:otherwise>
                  <c:choose>
                  <c:when test='${res.value == "success"}'>
                  <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                  <TBODY>
                  <TR>
                  <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD></TR>
                  <TBODY>
                  <TR id=high>
                  <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                  <TBODY>
                  <TR id=high>
                  <TD width="157" height=50 colspan="3" align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
                  <tr>
                  <td width="385"><span class="boldText"><fmt:message key='webclient.topo.addnodesresult.success'/></span></td></tr></table></TD></TR>
                  <TR id=high >
                  <TR id=high >
                 <TD align=left colSpan=3 height=0>
                 <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>                 <TR id=high >
                 <TD align=left colSpan=3 height=30>
                 <SPAN class=text><fmt:message key='webclient.topo.addnodesresult.details'/></SPAN></TD></TR>
                 <TR id=high >
                 <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                 <TR id=high>
                 <TD height=30 colSpan=3 align=left  class=text>
                 <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                 <TR id=high >
                 <TR id=high>
                 <TD height=30 colSpan=3 align=left  class=text>
                 <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                 <TR id=high >
                 <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
                 </TR>
                 <TBODY>
                 <TR align="left"  id=high>
                 <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.startipaddress'/></TD>
                 <TD height=30 colSpan=2 class="text">
                 <c:out value="${netProps['startipaddress']}"/></TD></TR>
                 <TR align="left"  id=high>
                 <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.endipaddress'/></TD>
                 <TD height=30 colSpan=2 class="text">
                 <c:out value="${netProps['endipaddress']}"/></TD></TR>
                 <TR align="left" id=high>
                 <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.netmask'/></TD>
                 <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
                 </TR></TBODY></TABLE><br> </TD></TR>
                  <TR id=high >
                  <TD align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a> <fmt:message key='webclient.topo.addnodesresult.more'/></strong></span>
                  </td></tr></table></TD></TR>
                  <TR id=high >
                  <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                  </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                   </c:when> <c:when test='${res.value == "background"}'>
                   <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                   <TBODY>
                   <TR> 
                   <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD></TR>
                   <TBODY>
                   <TR id=high>
                   <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                   <TBODY>
                   <TR id=high>
                   <TD width="704" height=50 colspan="3" align=left><SPAN class=text> </SPAN> <table width="432" border="0" cellspacing="6" cellpadding="0">
                   <tr>
                   <td width="29"><span class="text"><img src="/webclient/topo/images/inprogress.gif" width="28" height="30"></span></td>
                    <td width="385" class="boldText"><fmt:message key='webclient.topo.addnodesresult.inprogress'/></td></tr> 
                    </table></TD></TR>
                    <TR id=high >
                    <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                    <TR id=high >
                    <TD align=left colSpan=3 height=30>
                    <span class="text"><fmt:message key='webclient.topo.addnodesresult.details'/></span></TD></TR>
                    <TR id=high >
                    <TD align=left colSpan=3 height=0>
                    <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                    <TR id=high>
                    <TD colSpan=3 align=left valign="top"  class=text>
                    <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                    <TR id=high >
                    <TD colSpan=3 align=left valign="top"  class=text>
                    <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                    <TR id=high >
                    <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD></TR>
                    <TBODY>
                    <TR align="left"  id=high>
                    <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.startipaddress'/></TD>
                    <TD height=30 colSpan=2 class="text">
                    <c:out value="${netProps['startipaddress']}"/></TD></TR>
                    <TR align="left"  id=high>
                    <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.endipaddress'/></TD>
                    <TD height=30 colSpan=2 class="text">
                    <c:out value="${netProps['endipaddress']}"/></TD></TR>
                    <TR align="left" id=high>
                    <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.netmask'/></TD>
                    <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
                    </TR>
                    <TR align="left" valign="top"  id=high>
                    <TD height=30 class="text"><fmt:message key='webclient.topo.addnetworkresult.message'/></TD>
                    <TD height=30 colSpan=2 class="text"><c:out value="${res.key}"/></TD>
                    </TR></TBODY></TABLE><br> </TD></TR>
                    <TR id=high >
                    <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                    </TR>
                    <TR id=high >
                    <TD align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
                     <tr>
                     <td class="boldText"><a href="addNetwork.do"><fmt:message key='webclient.topo.addnetworkresult.link'/></a>
                     <fmt:message key='webclient.topo.addnodesresult.more'/></td>
                     </tr>
                     </table></TD>
                     </TR>
                     <TR id=high >
                     <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                     </TR>
                     </TBODY>
                     </TABLE></TD>
                     </TR>
                     </TBODY>
                     </TABLE>
                     </c:when> <c:otherwise>
                     <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                     <TBODY>
                     <TR>
                     <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD>
                     </TR>
                     <TBODY>
                     <TR id=high>
                     <TD align=left vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                     <TBODY>
                     <TR id=high>
                     <TD width="157" height=50 align=left ><table width="432" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <td width="385" class="boldText"><fmt:message key='webclient.topo.addnetworkresult.failure'/></td>
                     </tr></table></TD></TR>
                     <TR id=high>
                     <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                     </TR>
                     <TR id=high>
                     <TD class=header2 align=left height=30><fmt:message key='webclient.topo.addnetworkresult.reason'/></TD></TR>
                     <TR id=high>
                     <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                     <TR id=high>
                     <TD class=text  align=left>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <td align="left" valign="top" class="text" nowrap >
                     <c:out value="${res.key}"/><br><br> </td>
                     </tr></table></TD></TR>
                     <TR id=high>
                     <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                     <TR id=high>
                     <TD height=30 align=left ><SPAN class=header2><fmt:message key='webclient.topo.addnodesresult.details'/>
                     </SPAN></TD>
                     </TR>
                     <TR id=high>
                     <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                     </TR>
                     <TR id=high >
                     <TD height="0" align=left valign="top">
                     <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                     <TR id=high >
                     <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD></TR>
                      <TBODY>
                      <TR align="left"  id=high>
                     <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.startipaddress'/></TD>
                     <TD height=30 colSpan=2 class="text">
                     <c:out value="${netProps['startipaddress']}"/></TD></TR>
                     <TR align="left"  id=high>
                     <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.endipaddress'/></TD>
                     <TD height=30 colSpan=2 class="text">
                     <c:out value="${netProps['endipaddress']}"/></TD></TR>
                     <TR align="left" id=high>
                     <TD height=30 class="text"><fmt:message key='webclient.topo.addnodesresult.netmask'/></TD>
                     <TD height=30 colSpan=2 class="text"><c:out value="${netProps['netmask']}"/></TD>
                     </TR></TBODY></TABLE><br> </TD></TR>
                     <TR id=high >
                     <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                     </TR>
                     <TR id=high >
                     <TD align=left height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <td align="left" valign="top"><span class="text"><strong><a href="addNetwork.do"><fmt:message key='webclient.topo.addnodesresult.link'/></a>
                     <fmt:message key='webclient.topo.addnetworkresult.tryagain'/></strong></span></td></tr>
                     </table></TD>
                     </TR>
                     <TR id=high >
                     <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                     </TBODY>
                     </TABLE></TD></TR></TBODY></TABLE>
                     </c:otherwise> </c:choose>
                     </c:otherwise>   
                  </c:choose>
                  </c:forEach> 

	                                          </c:if> </TD>
	                                      </TR>
	                                    </TBODY>
	                                  </TABLE>
	
	                              </TD>
	                              </TR>
	                            </TBODY>
                          </TABLE>
   </td>
</tr>
</table>

</BODY>

</HTML>
