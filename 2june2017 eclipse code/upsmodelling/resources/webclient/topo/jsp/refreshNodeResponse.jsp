<%-- $Id: refreshNodeResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<TITLE><fmt:message key='webclient.topo.actions.refreshnoderesult.title'/></TITLE>
<BODY>

<table cellSpacing=0 cellPadding=0 width=80% align="left" border=0>

<tr>
   <td>&nbsp;</td>
   <td height=30 valign="bottom"><SPAN class=header1><fmt:message key='webclient.admin.networkadmin.refreshnode'/></SPAN></td>
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
	                     
	                        <TD vAlign=top align=middle width=571> <TABLE cellSpacing=5 cellPadding=0 width="100%" 
	                              border=0>
	                            <TBODY>
	                              <TR> 
	                                <TD> <TABLE cellSpacing=0 cellPadding=0 width="98%" 
	                                border=0>
	                                    <TBODY>
	                                      <TR> 
	                                        <TD vAlign=top align=left> <c:if test="${!empty result}"> 
	                                          <c:url var="url" value="/topo/objectdetails.do?name=${nodeProps['name']} "> 
	                                          </c:url> <c:forEach var="res" items="${result}"> 
	                                          <c:choose> <c:when test='${res.value == "success"}'> 
	                                          <TABLE  cellSpacing=0 
	                                cellPadding=0 width=432 border=0>
	                                            <TBODY>
	                                              <TR> 
	                                                <TD align=right width=432 
	                                height=1><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=400></TD>
	                                              </TR>
	                                            <TBODY>
	                                              <TR id=high> 
	                                                <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 
	                                border=0>
	                                                    <TBODY>
	                                                      <TR id=high 
	                                > 
	                                                        <TD width="2539" height=50 colSpan=3 align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
	                                                            <tr> 
	                                                              <td width="29"><span class="text"></span></td>
	                                                              <td width="385"><span class="text"><fmt:message key='webclient.topo.refreshnoderesult.success'/> 
	                                                                </span></td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD class=propertyLeftBg align=left colSpan=3 height=30> 
	                                                          <SPAN class=text><STRONG><fmt:message key='webclient.topo.refreshnoderesult.details'/> 
	                                                          </STRONG> </SPAN></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD 
	                                colSpan=3 align=left valign="top"  class=text> 
	                                                          <TABLE cellSpacing=3 cellPadding=0 width=432 border=0>
	                                                            <TR id=high > 
	                                                              <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
	                                                            </TR>
	                                                            <TBODY>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD width="157" height=30 class="text"><fmt:message key='webclient.topo.refreshnoderesult.name'/></TD>
	                                                                <TD colSpan=2 height=30 class=text> 
	                                                                  <A href='<c:out value="${url}"/>'><c:out value="${nodeProps['name']}"/> 
	                                                                  </A> </TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.refreshnoderesult.netmask'/></TD>
	                                                                <TD colSpan=2 height=30> 
	                                                                  <SPAN class=text><c:out value="${nodeProps['netmask']}"/></SPAN></TD>
	                                                              </TR>
	                                                              <TR align="left" valign="top"  id=high> 
	                                                                <TD height=30 class="text"><fmt:message key='webclient.topo.refreshnoderesult.snmpport'/> </SPAN>
	                                                                </TD>
	                                                                <TD colSpan=2 height=30><SPAN class=text><c:out value="${nodeProps['snmpport']}"/> 
	                                                                  </SPAN></TD>
	                                                              </TR>
	                                                            </TBODY>
	                                                          </TABLE>
	                                                          <br> </TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD class=propertyLeftBg align=left colSpan=3 
	                                height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
	                                                            <tr> 
	                                                              <td><span class="boldText"> 
	                                                                <a href="refreshNode.do"><fmt:message key='webclient.topo.refreshnoderesult.link'/></a> 
	                                                                <fmt:message key='webclient.topo.refreshnoderesult.more'/></span> 
	                                                              </td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
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
	                                                <TD align=right width=432 
	                                height=1><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=400></TD>
	                                              </TR>
	                                            <TBODY>
	                                              <TR id=high> 
	                                                <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 
	                                border=0>
	                                                    <TBODY>
	                                                      <TR id=high> 
	                                                        <TD width="134" height=50  colSpan=0 align=left ><table width="432" border="0" cellspacing="0" cellpadding="0">
	                                                            <tr> 

	                                                              <td width="385"><span class="boldText"><fmt:message key='webclient.topo.refreshnoderesult.failure'/> 
	                                                                </span></td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high> 
	                                                        <TD  
	                                align=left colSpan=0 height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=0 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=0 height=30><SPAN class=header2><fmt:message key='webclient.topo.refreshnoderesult.reason'/> 
	                                                          </SPAN></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=0 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD height=30 colspan="0" align=left><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                                            <tr> 
	                                                              <td align="left" valign="top" > 
	                                                                <span class="text"><c:out value="${res.key}"/></span></td>
	                                                            </tr>
	                                                          </table>
	                                                          <br> </TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=0 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
	                                height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                                            <tr> 
	                                                              <td><span class="boldText"> 
	                                                                <a href="refreshNode.do"><fmt:message key='webclient.topo.refreshnoderesult.link'/></a> <fmt:message key='webclient.topo.refreshnoderesult.tryagain'/></span> 
	                                                              </td>
	                                                            </tr>
	                                                          </table></TD>
	                                                      </TR>
	                                                      <TR id=high > 
	                                                        <TD align=left colSpan=3 
	                                height=0><IMG height=1 
	                                src="/webclient/topo/images/spacer.gif" 
	                                width=60></TD>
	                                                      </TR>
	                                                    </TBODY>
	                                                  </TABLE></TD>
	                                              </TR>
	                                            </TBODY>
	                                          </TABLE>
	                                          </c:otherwise> </c:choose> </c:forEach> 
	                                          </c:if> </TD>
	                                      </TR>
	                                    </TBODY>
	                                  </TABLE>
	                                </TD>
	                              </TR>
	                            </TBODY>
	                          </TABLE></TD>
	                      </TR>
	                    </TBODY>
                  </TABLE>
   
   </td>
</tr>
</table>

</BODY>


