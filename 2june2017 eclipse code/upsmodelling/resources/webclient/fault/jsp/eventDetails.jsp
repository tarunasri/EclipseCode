<%-- $Id: eventDetails.jsp,v 1.4 2010/10/29 13:47:07 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<title><fmt:message key='webclient.fault.eventdetails.pagetitle'/></title>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<br>
     <tr> 
       <td width="1"><img src="/webclient/common/images/trans.gif" width="1" height="1" alt=""></td>
       <td>

        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.fault.eventdetails.tableheader'><fmt:param value="${eventProp.entity}"/></fmt:message></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr> 
              <td valign="top">
                
               <table width="100%" border="0" class="htableBorder" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                    <td width="130" valign="top"> 
                      <table width="130" border="0" align="center" cellpadding="0" cellspacing="0">

                      <tr>
                       <td height="45" align="center"><img src="/webclient/fault/images/general_details_on.gif" alt="<fmt:message key='webclient.fault.eventdetails.general.image.tooltip'/>" border="0" title="<fmt:message key='webclient.fault.eventdetails.general.image.tooltip'/>"></td>
                    </tr>
                    <tr class="propertyTabSelected"> 
                        <td height="20" align="center"><span class="propertyTabSelectedText"><fmt:message key='webclient.fault.eventdetails.general.image.message'/></span></td>
                    </tr>
                   </table>
                    </td>
                 <td width="1" valign="top" class="seperator"><img src="/webclient/common/images/trans.gif" alt="" width="1" height="1"></td>
                    <td> <table width="100%" border="0" align="left" cellpadding="4" cellspacing="0">
                        <tr> 
                          <td width="150" height="20"><span class="boldText"><fmt:message key='webclient.fault.details.properties.entity'/></span></td>
                          <td class="text"><c:out value="${eventProp.entity}"/></td>
                          <c:set target="${eventProp}" property = "entity" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow" > 
                          <td height="20"><span class="boldText"><fmt:message key='webclient.fault.details.properties.source'/></span></td>
                          <td  class="text"><c:out value="${eventProp.source}"/></td>
                          <c:set target="${eventProp}" property = "source" value = "${null}"/> 
                        </tr>
                        <tr> 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.severity'/></span></td>
                          <td  class="text"><img src="<c:out value="${eventProp.statusImg}"/>" 
                            alt="Clear" width="16" align="top" height="16"><c:out value="${eventProp.severity}"/></td>
                          <c:set target="${eventProp}" property = "severity" value = "${null}"/> 
                          <c:set target="${eventProp}" property = "statusImg" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow" > 
                          <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.id'/></span></td>
                          <td  class="text"><c:out value="${eventProp.id}"/></td>
                          <c:set target="${eventProp}" property = "id" value = "${null}"/> 
                        </tr>
                        <tr> 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.message'/></span></td>
                          <td nowrap class="text"><c:out value="${eventProp.message}"/></td>
                          <c:set target="${eventProp}" property = "message" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow"> 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.category'/></span></td>
                          <td  class="text"><c:out value="${eventProp.category}"/></td>
                          <c:set target="${eventProp}" property = "category" value = "${null}"/> 
                        </tr>
                        <tr> 
                          <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.time'/></span></td>
                          <td  class="text"><c:out value="${eventProp.time}"/></td>
                          <c:set target="${eventProp}" property = "time" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow" > 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.groupname'/></span></td>
                          <td  class="text"><c:out value="${eventProp.groupName}"/></td>
                          <c:set target="${eventProp}" property = "groupName" value = "${null}"/> 
                        </tr>
                        <tr> 
                          <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.node'/></span></td>
                          <td  class="text"><c:out value="${eventProp.node}"/></td>
                          <c:set target="${eventProp}" property = "node" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow"> 
                          <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.domain'/></span></td>
                          <td  class="text"><c:out value="${eventProp.domain}"/></td>
                          <c:set target="${eventProp}" property = "domain" value = "${null}"/> 
                        </tr>
                        <tr> 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.network'/></span></td>
                          <td  class="text"><c:out value="${eventProp.network}"/></td>
                          <c:set target="${eventProp}" property = "network" value = "${null}"/> 
                        </tr>
                        <tr class="reportsOddRow"> 
                          <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.helpurl'/></span></td>
                          <td  class="text"><c:out value="${eventProp.helpurl}"/></td>
                          <c:set target="${eventProp}" property = "helpurl" value = "${null}"/> 
                        </tr>
                        <c:forEach var="prop" items="${eventProp}" varStatus="status"> 
                        <tr> 
                          <td><span class="boldText"><c:out value="${prop.key}"/></span></td>
                          <td  class="text"><c:out value="${prop.value}"/></td>
                        </tr>
                        </c:forEach> </table></td>
              </table>
        
                </td>
            <td width="1"><img src="/webclient/common/images/trans.gif" width="1" height="1" alt=""></td>
          </tr>
        
        </td>
      </table>
        <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        </table></td>
    </tr>
  </table>
