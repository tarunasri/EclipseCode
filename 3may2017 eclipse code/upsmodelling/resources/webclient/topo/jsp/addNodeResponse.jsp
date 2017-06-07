	<%-- $Id: addNodeResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
	<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
	<TITLE><fmt:message key='webclient.topo.addnoderesult.title'/></TITLE>
	<BODY>
	
<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
<tr>
   <td>&nbsp;</td>
   <td height=30 valign="bottom"><SPAN class=header1><fmt:message key='webclient.topo.addnoderesult.header'/></SPAN></td>
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
				<%--TD vAlign=top align=left width=214 class="addleftbg" height=216> 
				  <TABLE cellSpacing=0 cellPadding=0 width="100%" border="0">
				    <TBODY>
				      <TR> 
					<TD vAlign=top align=right><IMG height=227 
					src="/webclient/topo/images/<c:out value = "${selectedskin}"/>/addnode.gif" 
					  width=214></TD>
				      </TR>
				      <TR> 
					<TD vAlign=top align=right><IMG height=195 
					src="/webclient/topo/images/<c:out value = "${selectedskin}"/>/shadowbottom.gif" 
					  width=10><BR></TD>
				      </TR>
				    </TBODY>
				  </TABLE></TD--%>
				<TD vAlign=top align=middle width=571> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
				      border=0>
				    <TBODY>
				      <TR> 
					<TD align="left" valign="top"> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
					border=0>
					    <TBODY>
					      <TR>
						<TD align=left vAlign=top> <c:if test="${!empty result}"> 
						  <c:url var="url" value="/topo/objectdetails.do?name=${nodeProps['name']} "> 
						  </c:url> <c:forEach var="res" items="${result}">
                                                  <c:choose>
                                                  <c:when test='${process=="discover"}'>

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
								<TD width="157" height=50 colspan="3" align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
								    <tr> 
								      <%--td width="29"><span class="text"><img src="/webclient/topo/images/successful.gif" width="28" height="30"></span></td--%>
								      <td width="385"><span class="boldText"><fmt:message key='webclient.topo.addnoderesult.success'/></span></td>
								    </tr>
								  </table></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 height=0> 
								  <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 height=30> 
								  <SPAN class=text><fmt:message key='webclient.topo.addnoderesult.details'/> 
								  </SPAN></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 
					height=0><IMG height=1 
					src="/webclient/topo/images/spacer.gif" 
					width=60></TD>
							      </TR>
							      <TR id=high> 
								<TD height=30 
					colSpan=3 align=left  class=text> 
								  <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
								    <TR id=high > 
								      <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
								    </TR>
								    <TBODY>
								      <TR align="left" valign="top"  id=high> 
									<TD width="146" height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.name'/></TD>
									<TD width="277" height=30 colSpan=2 class="text"> 
									  <A href='<c:out value="${url}"/>'><c:out value="${nodeProps['name']}"/></A> 
									</TD>
								      </TR>
								      <TR align="left"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.ipaddress'/></TD>
									<TD height=30 colSpan=2 class="text"> 
									  <c:out value="${nodeProps['ipAddress']}"/></TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.netmask'/></TD>
									<TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
								      </TR>
								    </TBODY>
								  </TABLE>
								  <br> </TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 height=0> 
								  <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 
					height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
								    <tr> 
								      <td><span class="text"><strong><a href="addNode.do"><fmt:message key='webclient.topo.addnoderesult.link'/></a> <fmt:message key='webclient.topo.addnoderesult.more'/></strong></span></td>
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
						  </c:when> <c:when test='${res.value == "background"}'> 
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
								<TD width="704" height=50 colspan="3" align=left><SPAN 
					class=text> </SPAN> <table width="432" border="0" cellspacing="6" cellpadding="0">
								    <tr> 
								      <td width="29"><span class="text"><img src="/webclient/topo/images/inprogress.gif" width="28" height="30"></span></td>
								      <td width="385" class="boldText"><fmt:message key='webclient.topo.addnoderesult.inprogress'/></td>
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
								<TD align=left colSpan=3 height=30> 
								  <span class="text"><fmt:message key='webclient.topo.addnoderesult.details'/> 
								  </span></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left colSpan=3 height=0> 
								  <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
							      </TR>
							      <TR id=high> 
								<TD 
					colSpan=3 align=left valign="top"  class=text> 
								  <TABLE cellSpacing=0 cellPadding=0 width=432 
					border=0>
								    <TR id=high > 
								      <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
								    </TR>
								    <TBODY>
								      <TR align="left" valign="top"  id=high> 
									<TD width="146" height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.name'/></TD>
									<TD width="277" height=30 colSpan=2 class="text"> 
									  <c:out value="${nodeProps['name']}"/> 
									</TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.ipaddress'/></TD>
									<TD height=30 colSpan=2 class="text"> 
									  <c:out value="${nodeProps['ipAddress']}"/></TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.netmask'/></TD>
									<TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.message'/></TD>
									<TD height=30 colSpan=2 class="text"><c:out value="${res.key}"/></TD>
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
								<TD align=left colSpan=3 
					height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
								    <tr> 
								      <td class="boldText"><a href="addNode.do"><fmt:message key='webclient.topo.addnoderesult.link'/></a> 
									<fmt:message key='webclient.topo.addnoderesult.more'/></td>
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
							<TD align=left vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width=432 
					border=0>
							    <TBODY>
							      <TR id=high> 
								<TD width="157" 
					height=50 align=left ><table width="432" border="0" cellspacing="0" cellpadding="0">
								    <tr> 
								      <%--td width="29"><span class="text"><img src="/webclient/topo/images/unsuccessful.gif" width="28" height="30"></span></td--%>
								      <td width="385" class="boldText"><fmt:message key='webclient.topo.addnoderesult.failure'/></td>
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
								<TD class=header2 align=left height=30><fmt:message key='webclient.topo.addnoderesult.reason'/></TD>
							      </TR>
							      <TR id=high> 
								<TD  align=left height=0> 
								  <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
							      </TR>
							      <TR id=high> 
								<TD class=text  align=left> 
								  <table width="100%" border="0" cellspacing="0" cellpadding="0">
								    <tr> 
								      <td align="left" valign="top" class="text" > 
									<c:out value="${res.key}"/><br> 
									<br> </td>
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
					height=30 align=left ><SPAN 
					class=header2><fmt:message key='webclient.topo.addnoderesult.details'/> 
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
									<TD width="146" height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.name'/></TD>
									<TD width="277" height=30 colSpan=2 class="text"> 
									  <c:choose> <c:when test='${ res.key == "Node already exists in the database" }'> 
									  <A href='<c:out value="${url}"/>'><c:out value="${nodeProps['name']}"/></A> 
									  </c:when> <c:otherwise> 
									  <c:out value="${nodeProps['name']}"/> 
									  </c:otherwise> 
									  </c:choose> 
									</TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.ipaddress'/></TD>
									<TD height=30 colSpan=2 class="text"> 
									  <c:out value="${nodeProps['ipAddress']}"/></TD>
								      </TR>
								      <TR align="left" valign="top"  id=high> 
									<TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.netmask'/></TD>
									<TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
								      </TR>
								    </TBODY>
								  </TABLE>
								  <br> </TD>
							      </TR>
							      <TR id=high > 
								<TD align=left 
					height=0><IMG height=1 
					src="/webclient/topo/images/spacer.gif" 
					width=60></TD>
							      </TR>
							      <TR id=high > 
								<TD align=left 
					height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
								    <tr> 
								      <td align="left" valign="top"><span class="text"><strong><a href="addNode.do"><fmt:message key='webclient.topo.addnoderesult.link'/></a> 
									<fmt:message key='webclient.topo.addnoderesult.tryagain'/></strong></span></td>
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
                         	  </c:otherwise> </c:choose> 
                                  </c:when>
                                  <c:otherwise> 
                          <c:choose> 
                          <c:when test='${res.value == "success"}'>
                          <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                          <TBODY>
                          <TR>
                          <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD> 
                          </TR>
                          <TBODY>
                          <TR id=high>
                          <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                           <TBODY>
                           <TR id=high>
                           <TD width="157" height=50 colspan="3" align=left><table width="432" border="0" cellspacing="6" cellpadding="0">
                           <tr>
                           <td width="385"><span class="boldText"><fmt:message key='webclient.topo.dontaddnoderesult.success'/></span></td>
                           </tr>
                           </table></TD>
                           </TR>
                           <TR id=high >
                           <TD align=left colSpan=3 height=0>
                   <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                           </TR>
                          <TR id=high >
                          <TD align=left colSpan=3 height=30>
                         <SPAN class=text><fmt:message key='webclient.topo.dontaddnoderesult.details'/>
                          </SPAN></TD>
                         </TR>
                        <TR id=high >
                        <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                        </TR>
                        <TR id=high>
                        <TD height=30 colSpan=3 align=left  class=text>
                        <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                        <TR id=high >
                        <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
                        </TR>
                        <TR align="left"  id=high>
                        <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.ipaddress'/></TD>
                        <TD height=30 colSpan=2 class="text">
                        <c:out value="${nodeProps['ipAddress']}"/></TD>
                        </TR>
                        <TR align="left" valign="top"  id=high>
                        <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.netmask'/></TD>
                         <TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
                          </TR>
                          </TBODY>
                          </TABLE>
                          <br> </TD>
                          </TR>
                          <TR id=high >
                          <TD align=left colSpan=3 height=0>
                          <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD> </TR>
                          <TR id=high >
                           <TD align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                           <td><span class="text"><strong><a href="addNode.do"><fmt:message key='webclient.topo.addnoderesult.link'/></a> <fmt:message key='webclient.topo.dontaddnoderesult.more'/></strong></span></td>
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
                           </c:when> 
                           <c:when test='${res.value == "background"}'>
                           <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                           <TBODY>
                           <TR>
                           <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD>
                           </TR>
                           <TBODY>
                           <TR id=high>
                           <TD vAlign=top align=left> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                           <TBODY>
                           <TR id=high>
                           <TD width="704" height=50 colspan="3" align=left><SPAN class=text> </SPAN> <table width="432" border="0" cellspacing="6" cellpadding="0">
                           <tr>
                           <td width="29"><span class="text"><img src="/webclient/topo/images/inprogress.gif" width="28" height="30"></span></td>
                           <td width="385" class="boldText"><fmt:message key='webclient.topo.dontaddnoderesult.inprogress'/></td>
                           </tr>
                   </table></TD>
                           </TR>
                           <TR id=high >
                           <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                           </TR>
                           <TR id=high >
                           <TD align=left colSpan=3 height=30>
                           <span class="text"><fmt:message key='webclient.topo.dontaddnoderesult.details'/>
                           </span></TD>
                           </TR>
                           <TR id=high >
                           <TD align=left colSpan=3 height=0>
                           <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                           </TR>
                <TR id=high>
                           <TD colSpan=3 align=left valign="top"  class=text>
                           <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                           <TR id=high >
                           <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
                           </TR>
                           <TBODY>
                           <TR align="left" valign="top"  id=high>
                           <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.ipaddress'/></TD>
                           <TD height=30 colSpan=2 class="text">
                           <c:out value="${nodeProps['ipAddress']}"/></TD></TR>
                           <TR align="left" valign="top"  id=high>
                           <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.netmask'/></TD>
                           <TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
                           </TR>
                           <TR align="left" valign="top"  id=high>
                           <TD height=30 class="text"><fmt:message key='webclient.topo.addnoderesult.message'/></TD>
                           <TD height=30 colSpan=2 class="text"><c:out value="${res.key}"/></TD></TR></TBODY>
                          </TABLE>
                          <br> </TD>
                          </TR>
                          <TR id=high >
                          <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                          </TR>
                          <TR id=high > <TD align=left colSpan=3 height=30><table width="100%" border="0" cellspacing="4" cellpadding="0">
                           <tr>
                           <td class="boldText"><a href="addNode.do"><fmt:message key='webclient.topo.addnoderesult.link'/></a>
                            <fmt:message key='webclient.topo.dontaddnoderesult.more'/></td></tr>
                            </table></TD>
                            </TR>
                           <TR id=high >
                           <TD align=left colSpan=3 height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                           </TR></TBODY></TABLE></TD></TR>
                           </TBODY></TABLE>
                           </c:when> <c:otherwise>
                           <TABLE  cellSpacing=0 cellPadding=0 width=432 border=0>
                           <TBODY>
                           <TR>
                           <TD align=right width=432 height=1><IMG height=1 src="/webclient/topo/images/spacer.gif" width=400></TD>
                            </TR>
                            <TBODY>
                            <TR id=high>
                            <TD align=left vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                             <TBODY> <TR id=high>
                             <TD width="157" height=50 align=left ><table width="432" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                              <td width="385" class="boldText"><fmt:message key='webclient.topo.dontaddnoderesult.failure'/></td>
                               </tr>
                               </table></TD>
                               </TR>
                               <TR id=high>
                               <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                                </TR>
                                <TR id=high>
                                <TD class=header2 align=left height=30><fmt:message key='webclient.topo.dontaddnoderesult.reason'/></TD>
                                 </TR>
                                 <TR id=high>
                                <TD class=header2 align=left height=30><c:out value="${res.key}"/><br><br> </td></TD>
                                 </TR>

                                 <TR id=high>
                                 <TD  align=left height=0>
                                 <IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                                  </TR>
                                  <TR id=high>
                                  <TR id=high>
                                </TR>
                                 <TR id=high>
                                 <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                                 </TR>
                                 <TR id=high>
                                 <TD height=30 align=left ><SPAN class=header2><fmt:message key='webclient.topo.dontaddnoderesult.details'/></SPAN></TD>
                                 </TR>
                                 <TR id=high>
                                 <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD></TR>
                                  <TR id=high >
                                <TD height="0" align=left valign="top">
                                <TABLE cellSpacing=0 cellPadding=0 width=432 border=0>
                                <TR id=high >
                                <TD colspan="3" align=left valign="top"><img src="/webclient/topo/images/spacer.gif" width="1" height="8"></TD>
                                 </TR>
                                 <TBODY>
                                 <TR align="left" valign="top"  id=high>
                                 <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.ipaddress'/></TD>
                                  <TD height=30 colSpan=2 class="text">
                                  <c:out value="${nodeProps['ipAddress']}"/></TD></TR>
                                  <TR align="left" valign="top"  id=high>
                                   <TD height=30 class="text"><fmt:message key='webclient.topo.dontaddnoderesult.netmask'/></TD>                                                                                      <TD height=30 colSpan=2 class="text"><c:out value="${nodeProps['netmask']}"/></TD>
                                   </TR></TBODY></TABLE><br> </TD></TR>
                                   <TR id=high >
                                   <TD align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                                  </TR>
                                  <TR id=high >
                                  <TD align=left height=30><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                 <td align="left" valign="top"><span class="text"><strong><a href="addNode.do"><fmt:message key='webclient.topo.dontaddnoderesult.link'/></a>
                                 <fmt:message key='webclient.topo.dontaddnoderesult.tryagain'/></strong></span></td></tr></table></TD></TR>
                                   <TR id=high >
                                   <TD  align=left height=0><IMG height=1 src="/webclient/topo/images/spacer.gif" width=60></TD>
                                   </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                   </c:otherwise> </c:choose></c:otherwise></c:choose></c:forEach> 
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
			  </TABLE></TD>
		      </TR>
		    </TBODY>
		  </TABLE>	 

	</BODY>

