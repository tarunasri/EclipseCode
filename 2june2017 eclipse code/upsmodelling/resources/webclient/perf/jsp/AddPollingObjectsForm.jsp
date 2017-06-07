<%-- $Id: AddPollingObjectsForm.jsp,v 1.6 2010/10/29 13:47:12 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/common/js/general.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="Javascript" SRC="/webclient/common/js/DO.js" type="text/javascript"></script>
<script>
    var daob = new DataObject();
</script>
<%@include file="/webclient/perf/jspf/addPollingObjects.jspf" %>
<body onload="javascript:initialize()">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td> 

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<c:choose> <c:when test="${param.toPerform == 'fillUpDetails'}"> <fmt:message key='webclient.perf.pollingobj.modifypo.header'/> 
            </c:when> <c:otherwise><fmt:message key='webclient.perf.pollingobj.addpo.header'/> 
            </c:otherwise> </c:choose>
</h1></td>
		<td align="right"><span class="mandatory">*</span> <span  class="textSmall"> <fmt:message key='webclient.perf.mandatory.message'/></span> &nbsp;</td>
        </tr>
        </table>
          </td>
        </tr>
      </table>

<table>
  <tr> 
    <td width="10"><img src="/webclient/common/images/spacer.gif" height="10" width="5"></td>
  </tr>
  <c:if test="${!empty success}"> 
  <tr> 
    <td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="20%"></td>
          <td height="25" nowrap class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${success}"/></td>
        </tr>
      </table></td>
  </tr>
  </c:if> <c:if test="${!empty failure}">
  <tr> 
    <td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="20%"></td>
          <td width="80%" class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${failure}"/></td>
        </tr>
      </table></td>
  </tr>
  </c:if> 
</table>
<c:set var="isReadOnly" value="${param.toPerform eq 'fillUpDetails'}" /> <c:set var="actionName" value='${actionToPerform}'/> 
<html-el:form action="${actionName}" onsubmit="return formSubmit()"> 
<input type="hidden" name="toPerform" value="<c:out value='${param.toPerform}'/>">
<input type="hidden" name="displaySaveOption" value="<c:out value='${AddPollingObject.map.displaySaveOption}'/>">
<input type="hidden" name="matchCriteria" value="">
<input type="hidden" name="rowCount" value="<c:out value='${AddPollingObject.map.rowCount}'/>"/>
<input type="hidden" name="typeSelection" value=""/>
<input type="hidden" name="actionToPerform" value="<c:out value='${actionToPerform}'/>">
<input type="hidden" name="polledDataAsString" value="<c:out value='${polledDataAsString}'/>">
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
  <c:if test="${!empty poNameVector}" > <td width="20%" valign="top">
  <table width="100%" border="0" cellspacing="0" cellpadding="3" valign="top" >
    <tr> 
      <td  nowrap class="rowtbborder">&nbsp; <fmt:message key="webclient.perf.pollingobj.polist" /></td></tr><tr><td align="left"><select style="height:auto;width:100%" class="formstyle2" name="pollingList" onchange="showPollingObject(this.options[this.selectedIndex].value);" size="33">
    <c:forEach var="value" items="${poNameVector}" varStatus="status"> <c:set var="poName" value="${value}" scope="request" /> 
    <c:url var="modifyURL" value="/perf/ModifyPollingObjects.do?toPerform=fillUpDetails&PollingObject=${value}"></c:url> 
    <%
        String name  = (String) request.getAttribute("poName");
        if (name.length() > 30)
        {
            request.setAttribute("trimpoName",(name.substring(0,27)+".."));
        }
        else
        {
            request.setAttribute("trimpoName",name);
        }
     %><option value='<c:out value="${value}"/>' 
    <c:if test="${poName==pobjName}"> selected </c:if>> <c:out value="${trimpoName}"/></option> 
    </c:forEach> </select> </td></tr> 
  </table></td>
  </c:if> 
  <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td height="1" width="1%"> <img src="/webclient/common/images/spacer.gif"  height="1"></td>
        <td > <div id="pageOneA" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="25" height="22" nowrap class="rowtbborder">
				<a href="javascript:ShowReqTab1('pageOneB')"> 
				<img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" border='0' width="21" height="18" hspace="3" align="absmiddle"></a>
                  </td>
                <td class="rowtbborder"><fmt:message key="webclient.perf.addpo.properties"></fmt:message></td>
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>

          </div></td>
      </tr>
      <tr> 
        <td> <img src="/webclient/common/images/spacer.gif" width="5" height="10"></td>
        <td valign="top"> <div id="pageOneB" style="display:block"> 

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td nowrap class="rowtbborder" height="22" width="25"><a href="javascript:ShowReqTab1('pageOneA')"> 
                        <img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" hspace="3" width="21" border='0' height="18" align="absmiddle"></a>
                      </td>
					  <td class="rowtbborder"><fmt:message key="webclient.perf.addpo.properties"> </fmt:message></td>
                    </tr>
                  </table></td>
              </tr>
              <tr valign="top"> 
                <td nowrap> <table border="0" width="100%" cellspacing="1" cellpadding="3">
                    <tr>
                      <td><img src="/webclient/common/images/spacer.gif" width="10" height="10"></td>
                    </tr>
                    <tr> 
                      <td height="50%" width="210" class="text"><fmt:message key='webclient.perf.addpollingobj.name'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" readonly="${isReadOnly}" property="PollingObject"/> 
                        <font color="red" size="2" weight="300" >*</font></td>
                      <td class="text" colspan="2" > <c:if test="${param.toPerform ne 'fillUpDetails'}" > 
                        (<fmt:message key='webclient.perf.addpo.example'/>) </c:if></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key="webclient.perf.pollingobj.status"/></td>
                      <td width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject" property="status" > 
                        <html-el:option value='true'><fmt:message key='webclient.perf.addpo.true'/></html-el:option> 
                        <html-el:option value='false'><fmt:message key='webclient.perf.addpo.false'/></html-el:option> 
                        </html-el:select> </td>
                      <td colspan="2" align="left" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key="webclient.perf.addpo.updatemanagedobjects"/></td>
                      <td width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject" property="updateDiscoveredMO" > 
                        <html-el:option value='false'><fmt:message key='webclient.perf.addpo.false'/></html-el:option> 
                        <html-el:option value='true'><fmt:message key='webclient.perf.addpo.true'/></html-el:option> 
                        </html-el:select> </td>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.prefix'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject"  property="prefix"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"> <fmt:message key='webclient.perf.addpo.period'/> 
                        (<fmt:message key='webclient.perf.addpo.seconds'/> )</td>
                      <td width="25%" class="text"> <html-el:text name="AddPollingObject" styleClass="formStyle"  property="pollingPeriod"/></td>
                      <td width="25%" colspan="2" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"> <fmt:message key='webclient.perf.pollingobj.class'/> 
                      </td>
                      <td width="25%" class="text"> <html-el:text name="AddPollingObject" styleClass="formStyle" readonly="${isReadOnly}" property="Class"/></td>
                      <td width="25%" colspan="2" class="text"> <c:if test="${param.toPerform ne 'fillUpDetails'}" > 
                        (<fmt:message key='webclient.perf.pollingobj.classhelp'/> 
                        ) </c:if> </td>
                    </tr>
                    <tr> 
                      <td colspan="4" class="text"><img src="/webclient/common/images/spacer.gif" width="10" height="8"></td>
                    </tr>
                  </table>
                  <table class="simpleBorder" border="0" width="80%" cellspacing="0" cellpadding="3" align="left">
                    <input type="hidden" name="AddPollingObject" property="rowCount"/>
                    <input type="hidden" name="AddPollingObject" property="oidToBeModified" />
                    <tr height="22" > 
                      <td colspan="4" class="boldText"> <fmt:message key='webclient.perf.addpo.matchcriteria'/> 
                      </td>
                    </tr>
                    <%-- ***************************** Start of Match Criteria related code ***************************** --%>
                    <c:if test="${AddPollingObject.map.rowCount > 0}"> <c:forEach begin="0" end="${AddPollingObject.map.rowCount-1}" varStatus="status"> 
                    <tr> 
                      <td align="right" class="text" nowrap> <html-el:text styleClass= "formStyle" name="AddPollingObject" readonly="${isReadOnly}" property="Criteria" value="${AddPollingObject.map.Criteria[status.index]}" indexed="true" > 
                        </html-el:text> <c:if test="${param.toPerform ne 'fillUpDetails'}" > 
                        <input type="button" name="selectCriteria<c:out value='${status.index}'/>" class="button" value='<fmt:message key='webclient.perf.addpo.browse'/>...' onclick="selectCriteria(this)" indexed="true"/> </c:if> 
                      </td>
                      <td align="center" class="text" nowrap> <html-el:select styleClass= "formStyle" name="AddPollingObject"  property="conditions" value="${AddPollingObject.map.conditions[status.index]}" disabled="${isReadOnly}" indexed="true"> 
                        </html-el:select> </td>
                      <td align="left" class="text" nowrap> <html-el:text styleClass="formStyle" name="AddPollingObject" property="Props" readonly="${isReadOnly}" value="${AddPollingObject.map.Props[status.index]}" indexed="true"/><font color="red" size="2" weight="300"> *</font> 
                        <c:if test="${param.toPerform ne 'fillUpDetails'}" > &nbsp;&nbsp;
                        <input type="button" name="selectOption<c:out value='${status.index}'/>" class="button" value='<fmt:message key='webclient.perf.addpo.browse'/>...' onclick="selectValue(this)" indexed="true"/> </c:if> 
                      </td>
                    </tr>
                    </c:forEach> </c:if> 
                    <c:if test="${param.toPerform ne 'fillUpDetails'}" > 
                    <tr> 
                      <td class="text" colspan="3"> <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>" onClick="javascript:more()"> 
                        <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>" onClick="javascript:fewer()"> 
                      </td>
                    </tr>
                    </c:if> 
                  </table>
                  <%-- ***************************** End of Code related to Match Criteria part ***************************** --%>
                  <!--End request view-->
                </td>
              </tr>
              <tr> 
                <td height="10" colspan="5"></td>
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
          </div></td>
      </tr>
      <tr> 
        <td height="1" width="1%"> <img src="/webclient/common/images/spacer.gif"  height="1"></td>
        <td > 

<div id="pageTwoA" style="display:block"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
			   <td class="rowtbborder" width="25" height="22"> <a href="javascript:ShowReqTab2('pageTwoB')"> 
                  <img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" border='0' width="21" height="18" hspace="3" align="absmiddle"> 
                  </a> </td>
                <td nowrap class="rowtbborder"><fmt:message key="webclient.perf.pollingobj.dataconfig"></fmt:message></td>
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
          </div>
</td>
      </tr>
      <tr align="left" valign="top"> 
        <td> <img src="/webclient/common/images/spacer.gif" width="5" height="10"></td>
        <td> <div id="pageTwoB" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
						<td class="rowtbborder" width="25" height="22"> <a href="javascript:ShowReqTab2('pageTwoA')">
                        <img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" width="21" border='0' height="18" hspace="3" align="absmiddle"></a></td>
                      <td nowrap class="rowtbborder"><fmt:message key="webclient.perf.pollingobj.dataconfig"></fmt:message></td>                      
                    </tr>
                  </table></td>
              </tr>
              <tr valign="top"> 
                <td nowrap  > <table  border="0" width="80%" cellspacing="1" cellpadding="3">
                    <tr>
                      <td  colspan="4"><img src="/webclient/common/images/spacer.gif" width="10" height="1"></td>
                    </tr>
                    <tr> 
                      <td width="290" valign="top" class="text"><fmt:message key="webclient.perf.pollingobj.dataids"/></td>
                      <td width="25%"  class="text"> <html-el:select style="height:auto" styleClass="formstyle" name="AddPollingObject" property="listOfOIDs" onchange="javascript:viewPD()" size="5" > 
                        <c:forEach var="tName" items="${nameOIDProps}"> <html-el:option value="${tName.key}" > 
                        <c:out value="${tName.key}"/></html-el:option> </c:forEach> 
                        </html-el:select></td>
                      <td  width="25%" colspan="2" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text" align="left"><fmt:message key='webclient.report.snmpoid'></fmt:message></td>
                      <td width="25%" class="text"  align="left"> <html-el:text readonly="${isReadOnly}" styleClass="formStyle" property="oid" name="AddPollingObject"/> 
                        <font color="red" size="2" weight="300" >*</font></td>
                      <td colspan="2" nowrap align="left" class="text"> <input type="button" name="mibBrowser" class="button" value='<fmt:message key='webclient.perf.addpo.select'/>' onclick="javascript:window.open('/report/SelectOID.do?formName=AddPollingObject', 
                        'OID', 'scrollbars=yes,width=550,height=320,screenX=650,screenY=150,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes')"> 
                        <c:if test="${param.toPerform ne 'fillUpDetails'}" > &nbsp;&nbsp; 
                        <a href="javascript:showHelp()"><fmt:message key='webclient.perf.addpo.help'/></a></c:if> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.type'/></td>
                      <td  width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject" property="isMultiplePolledData" > 
                        <html-el:option value='node'><fmt:message key='webclient.perf.addpo.node'/></html-el:option> 
			<html-el:option value='interface'><fmt:message key='webclient.perf.modifypo.interface'/></html-el:option>
                        <html-el:option value='multiple'><fmt:message key='webclient.perf.addpo.multiple'/></html-el:option> 
                        </html-el:select>&nbsp;<font color="red" size="2" weight="300" >*</font> 
                      </td>
                      <td width="25%" colspan="2" class="text"></td>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.name'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" readonly="${isReadOnly}" property="name"/> 
                        <font color="red" size="2" weight="300" >*</font> </td>
                      <%-- <td width="25%" class="text" colspan="2" ></td> --%>
                      <%-- Added below is for testing the DATA OBJECT --%>
                      <td colspan="2" width="25%" align="left" class="text"> </td>
                      <%-- Added below is for testing the DATA OBJECT --%>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.protocol'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" property="protocol"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.interval'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" property="interval"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.threshold'/> 
                      </td>
                      <td colspan="2" width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject"  property="Threshold" > 
                        <option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></option>
                        <option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></option>
                        </html-el:select></td>
                      <td width="25%" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.storedata'/> 
                      </td>
                      <td  width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject" property="StoreData" > 
                        <html-el:option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></html-el:option> 
                        <html-el:option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></html-el:option> 
                        </html-el:select></td>
                      <td width="25%" colspan="2" class="text"></td>
                    </tr>
                  </table>
                  <%-- ***************************** End of INPUT CODE  DIV PART 2 ***************************** --%>
                </td>
              </tr>
              <tr> 
                <td height="10" colspan="5"></td>
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
          </div></td>
      </tr>
      <tr> 
        <td height="1" width="1%"> <img src="/webclient/common/images/spacer.gif"  height="1"></td>
        <td > <div id="pageThreeA" style="display:block"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
			  	<td width="25" height="22" class="rowtbborder"> <a href="javascript:ShowReqTab3('pageThreeB')"> 
                  <img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" border='0' width="21" height="18" hspace="3" align="absmiddle"> 
                  </a> </td>
                <td nowrap class="rowtbborder"><fmt:message key="webclient.perf.pollingobj.dataconfig1"></fmt:message></td>                
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
          </div></td>
      </tr>
      <tr align="left" valign="top"> 
        <td> <img src="/webclient/common/images/spacer.gif" width="5" height="10"></td>
        <td> <div id="pageThreeB" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<td class="rowtbborder" width="25" height="22"> <a href="javascript:ShowReqTab3('pageThreeA')"> 
                        <img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" width="21" border='0' height="18" hspace="3" align="absmiddle"></a></td>
                      <td nowrap class="rowtbborder"><fmt:message key="webclient.perf.pollingobj.dataconfig1"></fmt:message></td>                      
                    </tr>
                  </table></td>
              </tr>
              <tr valign="top"> 
                <td nowrap  > <table  border="0" width="80%" cellspacing="1" cellpadding="3">
                    <tr>
                      <td><img src="/webclient/common/images/spacer.gif" width="10" height="1"></td>
                    </tr>
                    <tr> 
                      <td width="210" class="text"><fmt:message key='webclient.perf.pollingobj.statsdata'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" property="statsDataTableName"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.stringdata'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" styleId="storageTableName" property="stringDataTableName"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.failureThreshold'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" property="failureThreshold"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.saveabs'/> 
                      </td>
                      <td colspan="2" width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject"  property="saveAbsolutes" > 
                        <html-el:option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></html-el:option> 
                        <html-el:option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></html-el:option> 
                        </html-el:select></td>
                      <td width="25%" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.timeavg'/> 
                      </td>
                      <td colspan="2" width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject"  property="timeAvg" > 
                        <html-el:option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></html-el:option> 
                        <html-el:option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></html-el:option> 
                        </html-el:select></td>
                      <td width="25%" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.active'/> 
                      </td>
                      <td colspan="2" width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject" property="Active" > 
                        <html-el:option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></html-el:option> 
                        <html-el:option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></html-el:option> 
                        </html-el:select></td>
                      <td width="25%" class="text"></td>
                    </tr>
                    <tr> 
                      <td height="25%" class="text"><fmt:message key='webclient.perf.pollingobj.savepollcount'/></td>
                      <td width="25%" class="text"> <html-el:text styleClass="formStyle" name="AddPollingObject" property="savePollCount"/> 
                      </td>
                      <td width="25%" class="text" colspan="2" ></td>
                    </tr>
                    <tr> 
                      <td width="25%" class="text"><fmt:message key='webclient.perf.pollingobj.saveonthresh'/> 
                      </td>
                      <td colspan="2" width="25%" class="text"> <html-el:select styleClass="formStyle" name="AddPollingObject"  property="saveOnThreshold" > 
                        <html-el:option value='false'><fmt:message key='webclient.perf.pollingobj.false'/></html-el:option> 
                        <html-el:option value='true'><fmt:message key='webclient.perf.pollingobj.true'/></html-el:option> 
                        </html-el:select></td>
                      <td width="25%" class="text"></td>
                    </tr>
                    <tr> 
                      <td width="25%" valign="top" class="text"><fmt:message key="webclient.perf.pollingobj.threshlist"/></td>
                      <td width="25%" class="text"> <html-el:select  multiple="true" style="height:auto" size="5" styleClass="formstyle"  name="AddPollingObject" property="ThresholdList" > 
                        <c:forEach var="tName" items="${thresholdVector}"> 
                        <option value='<c:out value="${tName}"/>' > <c:out value="${tName}"/></option>
                        </c:forEach> </html-el:select> </td>
                    </tr>
                  </table>
                  <%-- ***************************** End of Code  PART 3 ***************************** --%>
                </td>
              </tr>
              <tr> 
                <td height="10" colspan="5"></td>
              </tr>
            </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
          </div></td>
      </tr>
      <tr> 
        <td colspan="5"> <div id="PDbutton" style="display:none"> 
            <table border="0" width="80%" cellspacing="1" cellpadding="3">
              <tr> 
                <td width="40%" align="center"> <input type="button" name="addp" class="button" value="<fmt:message key='webclient.perf.addpo.add'/>" onclick="javascript:addPD()"> 
                  <input type="button" name="modifyp" class="button" value="<fmt:message key='webclient.perf.addpo.modify'/>" onclick="javascript:modifyPD()"> 
                  <input type="button" name="deletep" class="button" value="<fmt:message key='webclient.perf.addpo.delete'/>" onclick="javascript:deletePD()"> 
                  <input type="button" name="cancelp" class="button" value="<fmt:message key='webclient.perf.addpo.clear'/>" onclick="javascript:resetPD()"> 
                </td>
              </tr>
            </table>
          </div></td>
      </tr>
      <tr> 
        <td height="7" colspan="5"></td>
      </tr>
      <tr> 
	  	<td></td>
        <td colspan="4" align="center" class="header2Bg" height="25"> 
		<input type="submit" value='<fmt:message key='webclient.perf.addpo.submit'/>' class="button" name=Submit2> 
		<input type="reset" value='<fmt:message key='webclient.perf.addpo.reset'/>' class="button" name=Submit3> 
		<input type="button" value='<fmt:message key='webclient.perf.addpo.cancel'/>' class="button" onclick="javascript:location.href='/perf/ConfiguredCollection.do';" name=Submit4>
	   </td>
      </tr>      
    </table></td>
  </tr>
</table></td></tr>
</table> </html-el:form> 
</body>
<script>
var pageArray=new Array("pageOne","pageTwo","pageThree");
for (i=0;i<pageArray.length;i++) {
	if (get_cookie(pageArray[i]+"A")==null || get_cookie(pageArray[i]+"A")=="") {
		document.getElementById(pageArray[i]+"A").style.display = (i==0) ? "none" : "block";
		document.getElementById(pageArray[i]+"B").style.display = (i==0) ? "block" : "none";
	} else {
		document.getElementById(pageArray[i]+"A").style.display = (get_cookie(pageArray[i]+"A")=="none") ? "none" : "block";
		document.getElementById(pageArray[i]+"B").style.display = (get_cookie(pageArray[i]+"B")=="none") ? "none" : "block";
	}
}
</script>
