<%-- $Id: StatsProperties.jsp,v 1.5 2010/10/29 13:47:12 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script>

function setThresholdList()
{
     var len = document.StatsPropsForm.thresholdList.options.length;
     var thresNames = "";
     for(var i=0; i<len; i++)
     {
         if(document.StatsPropsForm.thresholdList.options[i].selected == true)
         {
            thresNames = thresNames + document.StatsPropsForm.thresholdList.options[i].value + ",";
         }
     }
    document.StatsPropsForm.selectedThreshold.value=thresNames;
}


function submitTheForm()
{
/*
    if (isEmpty(document.TrapParserForm.name.value))
    {
        alert('<fmt:message key="webclient.fault.trapparser.form.enterusername"/>');
        document.TrapParserForm.name.focus();
        return false;
    }

    if (document.TrapParserForm.type[0].checked)
    {
        if (isEmpty(document.TrapParserForm.enterprise.value))
        {
            alert('<fmt:message key="webclient.fault.trapparser.form.enterenterprise"/>'); 
            document.TrapParserForm.enterprise.focus();
            return false;
        }
        if (isEmpty(document.TrapParserForm.GT.value) || !isPositiveInteger(document.TrapParserForm.GT.value))
        {
            alert('<fmt:message key="webclient.fault.trapparser.form.entergt"/>'); 
            document.TrapParserForm.GT.focus();
            return false;
        }
        if (isEmpty(document.TrapParserForm.ST.value))
        {
            alert('<fmt:message key="webclient.fault.trapparser.form.enterst"/>');
            document.TrapParserForm.ST.focus();
            return false;
        }
    }
    else
    {
        if(document.TrapParserForm.trapOid.value=="")
        {
            alert('<fmt:message key="webclient.fault.trapparser.form.enteroid"/>');
            document.TrapParserForm.trapOid.focus();
            return false;
        }
    }
    var formAction = window.location.href;
    if (formAction.indexOf("#userProp") != -1 )
    {
        var length = document.TrapParserForm.userPropsName.length;
        for (i = 0; i<length;i++)
        {
            if(isEmpty(document.TrapParserForm.userPropsName[i].value))
            {
                alert('<fmt:message key="webclient.fault.trapparser.form.userpropname.errormessage"/>');
                document.TrapParserForm.userPropsName[i].focus();
                return false;
            }
            if(isEmpty(document.TrapParserForm.userPropsValue[i].value))
            {
                alert('<fmt:message key="webclient.fault.trapparser.form.userpropvalue.errormessage"/>');
                document.TrapParserForm.userPropsValue[i].focus();
                return false;
            }
        }
    }
*/

    //var val = document.StatsPropsForm.actionToPerform.value;
    document.StatsPropsForm.actionToPerform.value="modifyStatistics";
    document.StatsPropsForm.toPerform.value="modifyStatistics";
    //window.location.href = window.location.href+toPerform="modifyStatistics";
    document.StatsPropsForm.submit();
}


</script>

</head>

<script language="Javascript" SRC="/webclient/perf/js/statisticsForm.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>

<%--   <c:out value='${searchForm.map.reqlayout}' />
    <% java.util.Enumeration enumerate=  request.getAttributeNames();
    for(;enumerate.hasMoreElements();) {
        String key=(String)enumerate.nextElement();
        out.println("the key "+key+" value "+request.getAttribute(key));
    }
    %>
--%>

<body onload="javascript:loadtheForm()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<c:choose>
    <c:when test="${statsOperation == 'add'}">
    <fmt:message key='webclient.perf.statistics.add.prop'/>
    </c:when>
    <c:otherwise>
    <fmt:message key='webclient.perf.statistics.modify.prop'/>
    </c:otherwise>
    </c:choose>
    </span></h1></td>
		<td align="right"><span class="mandatory">*</span> <span  class="textSmall"> <fmt:message key='webclient.perf.mandatory.message'/></span> &nbsp;</td>
        </tr>
        </table>
 
<html:form action="/StatisticDetails" onsubmit="return validateStatsPropsForm(this);" > 


<table width="99%" border="0" cellspacing="0" cellpadding="0">
  <c:set var="isReadOnly" value="${actionToPerform eq 'showStatistics'}" /> 
  <input type="hidden" name="toPerform" value="<c:out value='${actionToPerform}'/>"/>
  <input type="hidden" name="actionToPerform" value="<c:out value='${actionToPerform}'/>" />
  <input type="hidden" name="lastCounterValu" value="<c:out value='${lastCounterValu}'/>" />
  <input type="hidden" name="lastTimeValu" value="<c:out value='${lastTimeValu}'/>" />
  <input type="hidden" name="timeValu" value="<c:out value='${timeValu}'/>" />
  <input type="hidden" name="statsOperation" value="<c:out value='${statsOperation}'/>" />
  <input type="hidden" name="selectedThreshold" value="<c:out value='${selectedThreshold}'/>" />
  
  <tr align="left" valign="top" > 
    <td class="text"><img src="/webclient/common/images/spacer.gif"  width="5" height="1"></td>   
    <td colspan="4" class="htableBorder">

                                      <%--   PART ONE STATIC FIELDS --%>

    <div id="pageOneA" style="display:block"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
     <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">

   <tr height="25" class="header2bg" > <td>

 <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.agentdetails.header"/></td><td width="40" nowrap>
<a class="propFormLink" href="javascript:ShowReqTab1('pageOneB')"><fmt:message key='webclient.topo.objectdetails.edit'/></td><td  width="20" nowrap><a href="javascript:ShowReqTab1('pageOneB')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></td></a> </tr>
</table>
</td>
  </tr>

 <tr valign="top"> 
            <td nowrap > <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="1%" height="28" class="text">&nbsp;</td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.name'/>
                  <td width="25%" class="blackText"><c:out value="${StatsPropsForm.map.name}"/></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.snmpversion'/></td>
                  <td width="25%" class="blackText"><c:out value="${StatsPropsForm.map.snmpVersion}"/></td>
                  <td width="1%" class="text">&nbsp;</td>
                </tr>
               
                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.agent'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.agent}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.period'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.period}"/></td>
                  <td class="text">&nbsp;</td>
                </tr>


                <c:set var="pdOID" value="${StatsPropsForm.map.oid}" scope="request" />
                  <%
                    String pdoid  = (String) request.getAttribute("pdOID");
                    if (pdoid !=null && pdoid.length() > 30)
                    {
                        request.setAttribute("trimOID",(pdoid.substring(0,28)+".."));
                    }
                    else
                    {
                        request.setAttribute("trimOID",pdoid);
                    }
                  %>

                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.port'/></td>
                  <td class="blackText"><c:out value="${StatsPropsForm.map.port}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.oid'/></td>
                  <td class="blackText">  <a style="text-decoration:none" title="<c:out value='${StatsPropsForm.map.oid}'/>"><c:out value="${trimOID}"/></a>
<%--
<c:out value="${StatsPropsForm.map.oid}"/> --%> </td>
                  <td class="text">  &nbsp; </td>
                </tr>

                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.ismultiple'/></td>
                  <td class="blackText"><c:out value="${StatsPropsForm.map.isMultiplePolledData}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.active'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.active}"/></td>
                </tr>
                
                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.parentobj'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.parentObj}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.protocol'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.protocol}"/>
                  <td class="text">&nbsp;</td>
                </tr>

                 <tr class="odd"> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.community'/></td>
                  <td class="blackText"><c:out value="${StatsPropsForm.map.community}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.writecommunity'/></td>
                  <td height="28" class="blackText"><c:out value="${StatsPropsForm.map.writeCommunity}"/></td>
                  <td class="text">&nbsp;</td>
                </tr>
               
              </table>
              <!--End request view-->
            </td>
          </tr>
        
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
      </div>
                                             <%--   PART ONE DYNAMIC FIELDS --%>

    <div id="pageOneB" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
      <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">
         
      <tr height="25" class="header2bg" > <td>

        <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.agentdetails.header"/>
            </td><td width="40" nowrap>
  <c:if test="${actionToPerform ne 'addStatisticsForm'}">
<a class="propFormLink" href="javascript:ShowReqTab1('pageOneA')"><fmt:message key='webclient.topo.objectdetails.cancel'/></td><td  width="20" nowrap><a href="javascript:ShowReqTab1('pageOneA')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></a>
</c:if></td>
 </tr>
</table>
</td>
  </tr>
         
          <tr valign="top"> 
            <td nowrap > <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="1%" class="text"><img src="/webclient/common/images/spacer.gif"  width="10" height="1"></td>
                  <td width="24%" height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.name'/>
                  <td width="25%" height="28" class="blackText">
                    <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.name}"/>
                     <html-el:hidden name="StatsPropsForm" property="name" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="name" styleClass="formStyle" /><font color="red" size="2" weight="300" >*</font>
                    </c:otherwise>
                     </c:choose></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.snmpversion'/></td>
                  <td width="25%" class="blackText"> <html-el:text name="StatsPropsForm" property="snmpVersion" styleClass="formStyle"/> 
                  <td width="1%" class="text">&nbsp;</td>
                </tr>
               
                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.agent'/></td>
                  <td class="blackText">
                <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.agent}"/>
                     <html-el:hidden name="StatsPropsForm" property="agent" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="agent" styleClass="formStyle" /><font color="red" size="2" weight="300" >*</font>
                    </c:otherwise>
                     </c:choose>
<%--
 <html-el:text name="StatsPropsForm" property="agent" styleClass="formStyle" readonly="${isReadOnly}"/><font color="red" size="2" weight="300" >*</font> --%> </td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.period'/></td>
                  <td class="blackText"> <html-el:text name="StatsPropsForm"  property="period" styleClass="formStyle"/><font color="red" size="2" weight="300" >*</font></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.port'/></td>
                  <td align="left" class="blackText"><html-el:text name="StatsPropsForm"  property="port" styleClass="formStyle"/></td>
                 
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.oid'/></td>
                  <td align="left" class="blackText">

                <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                <a style="text-decoration:none" title="<c:out value='${StatsPropsForm.map.oid}'/>"><c:out value="${trimOID}"/></a>
<%--     <c:out value="${StatsPropsForm.map.oid}"/> --%>
                     <html-el:hidden name="StatsPropsForm" property="oid" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="oid" styleClass="formStyle" /><font color="red" size="2" weight="300" >*</font>
                    </c:otherwise>
                     </c:choose>
<%--
 <html-el:text name="StatsPropsForm" property="oid" styleClass="formStyle" readonly="${isReadOnly}" /><font color="red" size="2" weight="300" >*</font> --%>
                    <c:if test="${actionToPerform eq 'addStatisticsForm'}"> 
                    <input type="button" class="button" value='<fmt:message key='webclient.perf.addpo.select'/>' onclick="javascript:window.open('/perf/GetSnmpOid.do?formName=StatsPropsForm',                    'OID', 'scrollbars=yes,width=550,height=320,screenX=650,screenY=150,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes')"> 
                    </c:if></td> 
                  <td align="left">  &nbsp; </td>
                </tr>

                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.ismultiple'/></td>
                  <td class="blackText">

                 <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.isMultiplePolledData}"/>
                     <html-el:hidden name="StatsPropsForm" property="isMultiplePolledData" />
                    </c:when>
                    <c:otherwise>
                     <html-el:select name="StatsPropsForm" styleClass="formStyle"  property="isMultiplePolledData" > 
                       <html:option value="true" >true</html:option> 
                       <html:option value="false">false</html:option>
                    </html-el:select> 
                    </c:otherwise>
                     </c:choose>
        
<%--
                    <c:choose> 
                    <c:when test="${isReadOnly}" >
                    <html-el:text name="StatsPropsForm" property="isMultiplePolledData" readonly="true" styleClass="formStyle"/>
                    </c:when>
                    <c:otherwise>
                    <html-el:select name="StatsPropsForm" styleClass="formStyle"  property="isMultiplePolledData" > 
                       <html:option value="true" >true</html:option> 
                       <html:option value="false">false</html:option>
                    </html-el:select> 
                    </c:otherwise>
                    </c:choose>
--%>
                 </td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.active'/></td>
                  <td class="blackText"> 
                    <html:select property="active"  style="width:160"> <html:option value="true" >true</html:option> 
                    <html:option value="false">false</html:option> </html:select></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>
                
                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.parentobj'/></td>
                  <td height="28" class="blackText">

                <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.parentObj}"/>
                     <html-el:hidden name="StatsPropsForm" property="parentObj" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="parentObj" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
 <html-el:text name="StatsPropsForm" property="parentObj" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                 
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.protocol'/></td>
                  <td class="blackText">
                  <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.protocol}"/>
                     <html-el:hidden name="StatsPropsForm" property="protocol" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="protocol" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
<html-el:text name="StatsPropsForm" property="protocol" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                 <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.community'/></td>
                  <td class="blackText"><html:text property="community" styleClass="formStyle"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.writecommunity'/></td>
                  <td class="blackText"><html:text property="writeCommunity" styleClass="formStyle"/></td>
                  <td class="text">&nbsp;</td>
                </tr>

                <c:if test="${actionToPerform ne 'addStatisticsForm'}">   <tr>
                <td colspan=6 align="right" valign="middle"> 
                 <input name="Save" type="submit" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" > 
                 <input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>"> 
                </td>   </tr>
                </c:if>
               
              </table>
              <!--End request view-->
            </td>
          </tr>
        
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
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

 <tr>  <td>&nbsp;</td>
 </tr> 


                                            <%--   PART TWO STATIC FIELDS --%>

 <tr align="left" valign="top" > 
   <td class="text"><img src="/webclient/common/images/spacer.gif"  width="5" height="1"></td> 
    <td colspan="4" class="htableBorder">   
     <div id="pageTwoA" style="display:block"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
     <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">
         
      <tr  class="header2bg"> <td >

<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
      
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.datacoll.header"/>
        </td><td width="40" nowrap>
 <c:if test="${actionToPerform ne 'addStatisticsForm'}">
<a class="propFormLink" href="javascript:ShowReqTab2('pageTwoB')"><fmt:message key='webclient.topo.objectdetails.edit'/></td><td  width="20" nowrap><a href="javascript:ShowReqTab2('pageTwoB')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></a>
</c:if>
 </td></tr>
</table>
<%--
     <table width="98%" border="0" cellspacing="0" cellpadding="0"><tr>
      
    <td width="550" nowrap class="propFormBlackText">  
        <fmt:message key="webclient.perf.stats.optional.header"/></td><td >
<a href="javascript:ShowReqTab2('pageTwoB')">
<img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" border='0' width="21" height="18" hspace="5" align="absmiddle"> </a> </td> </tr>
</table> --%>
</td>
  </tr>

  <tr valign="top"> 
            <td nowrap  class="fontBlack"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr> 
                  <td width="1%" height="28"  class="text">&nbsp;</td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.dnsname'/></td>
                  <td width="25%" class="blackText"> <c:out value="${StatsPropsForm.map.dnsName}"/></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.policyname'/></td>
                  <td width="25%" class="blackText"> <c:out value="${StatsPropsForm.map.policyName}"/></td>
                  <td width="1%" align="left" class="text">&nbsp;</td>
                </tr>
               
                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.threshold'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.threshold}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.thresholdlist'/></td>
                  <td class="blackText"> <c:out value="${selectedThreshold}"/>
                  <td class="blackText">&nbsp;</td>
                </tr>

                <tr > 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.currsavect'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.currentSaveCount}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.failurecount'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.failureCount}"/></td> 
                  <td class="blackText">&nbsp;</td>
                </tr>
                 
                <tr class="odd"> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.saveabs'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.saveAbsolutes}"/></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.pollerName'/></td>
                  <td width="25%" class="blackText"> <c:out value="${StatsPropsForm.map.pollerName}"/></td>
                
                  <td class="text">&nbsp;</td>
                </tr>
                
                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.save'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.save}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.timeval'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.timeVal}"/>
                  <td class="text">&nbsp;</td>
                </tr>
                <tr class="odd"> 
                  <td class="text" height="28">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.lastcval'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.lastCounterValue}"/></td>
                  <td width="180" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.lasttval'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.lastTimeValue}"/></td>
                  <td class="text">&nbsp;</td>
                </tr>

              </table></td>
          </tr>
          
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
      </div>
   
                                         <%--   PART TWO DYNAMIC FIELDS --%>

   <div id="pageTwoB" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
      <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">
         
      <tr  class="header2bg"> <td >

  <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.datacoll.header"/>
        </td><td width="40" nowrap>
<c:if test="${actionToPerform ne 'addStatisticsForm'}">
<a class="propFormLink" href="javascript:ShowReqTab2('pageTwoA')"><fmt:message key='webclient.topo.objectdetails.cancel'/></td><td  width="20" nowrap><a href="javascript:ShowReqTab2('pageTwoA')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></a>
</c:if>
 </td></tr>
</table>
<%--
        <table width="98%" border="0" cellspacing="0" cellpadding="0"><tr>
        <td width="550" nowrap class="propFormBlackText">
        <fmt:message key="webclient.perf.stats.optional.header"/></td><td >
<a href="javascript:ShowReqTab2('pageTwoA')">
<img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" width="21" border='0' height="18" hspace="5" align="absmiddle"></a></td> </tr>
</table> --%>
</td>
  </tr>

          <tr valign="top"> 
            <td nowrap  class="fontBlack"><table width="100%" border="0" cellpadding="0" cellspacing="0">

                 <tr> 
                  <td width="1%" class="text">&nbsp;</td>
                  <td width="24%" height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.dnsname'/></td>
                  <td width="25%" height="28"  class="blackText"> 
                  <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.dnsName}"/>
                     <html-el:hidden name="StatsPropsForm" property="dnsName" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="dnsName" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
<html-el:text name="StatsPropsForm" property="dnsName" styleClass="formStyle" readonly="${isReadOnly}" /> --%> 
                </td>
                 
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.policyname'/></td>
                  <td width="25%" class="blackText"> 
                  <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.policyName}"/>
                     <html-el:hidden name="StatsPropsForm" property="policyName" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="policyName" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
<html-el:text name="StatsPropsForm" property="policyName" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td width="1%" align="left" class="text">&nbsp;</td>
                </tr>


                
              
                <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.threshold'/></td>
                  <td class="blackText"> 
                    <html:select property="threshold"  style="width:160"> 
                    <html:option value="false" >false</html:option>
                    <html:option value="true" >true</html:option>  </html:select></td>

                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.thresholdlist'/></td>
                  <td class="blackText">
            <html-el:select onchange="javascript:setThresholdList()" style="height:auto"  name="StatsPropsForm" property="thresholdList" multiple="true" styleClass="formstyle" size="5" >
		        <c:forEach var="tName" items="${thresholdVector}">
		        <option value='<c:out value="${tName}"/>' > <c:out value="${tName}"/></option> 
	   	        </c:forEach>
		    </html-el:select></td>
    <%-- <html:text property="thresholdList" styleClass="formStyle"/></td> --%>
                  <td class="text">&nbsp;</td>
                </tr>


                <tr > 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.currsavect'/></td>
                  <td height="28" class="blackText">
                  <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.currentSaveCount}"/>
                     <html-el:hidden name="StatsPropsForm" property="currentSaveCount" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="currentSaveCount" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
 <html-el:text name="StatsPropsForm" property="currentSaveCount" styleClass="formStyle" readonly="${isReadOnly}" /> --%>
                </td>
                
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.failurecount'/></td>
                  <td height="28" class="blackText"> <html-el:text name="StatsPropsForm" property="failureCount" styleClass="formStyle" readonly="${isReadOnly}" /></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>


                 <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.saveabs'/></td>
                  <td height="28" class="blackText"> 
                    <html:select property="saveAbsolutes"  style="width:160"> 
                    <html:option value="true" >true</html:option> <html:option value="false">false</html:option> 
                    </html:select></td>
                 
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.pollerName'/></td>
                  <td width="25%" height="28" class="blackText"> 
                    <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.pollerName}"/>
                     <html-el:hidden name="StatsPropsForm" property="pollerName" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="pollerName" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
<html-el:text name="StatsPropsForm" property="pollerName" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>
               

                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.save'/></td>
                  <td height="28" class="blackText"> 
                    <html:select property="save"  style="width:160"> <html:option value="true" >true</html:option> 
                    <html:option value="false">false</html:option> </html:select></td>
                  <td height="25" class="blackBoldText">
                     <c:if test="${actionToPerform ne 'addStatisticsForm'}"> 
                    <fmt:message key='webclient.perf.statistics.prop.timeval'/> </c:if> </td>
                  <td height="28" class="blackText"> 
                 <c:choose>
                <c:when test="${actionToPerform ne 'addStatisticsForm'}">   
                    <c:out value="${StatsPropsForm.map.timeVal}"/>
                </c:when>
                <c:otherwise>
                </c:otherwise>
                </c:choose> <html-el:hidden name="StatsPropsForm" property="timeVal" />
<%--
<html-el:text name="StatsPropsForm" property="timeVal" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td class="text">&nbsp;</td>
                </tr>


                <c:choose>
                <c:when test="${actionToPerform ne 'addStatisticsForm'}">   
                <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.lastcval'/></td>
                  <td height="28" class="blackText"> <c:out value="${StatsPropsForm.map.lastCounterValue}"/>
                    
<%--
<html-el:text name="StatsPropsForm" property="lastCounterValue" styleClass="formStyle" readonly="${isReadOnly}" /> --%>
                    </td>
                  <td width="180"  class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.lasttval'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.lastTimeValue}"/>
                   
<%--
<html-el:text name="StatsPropsForm" property="lastTimeValue" styleClass="formStyle" readonly="${isReadOnly}" /> --%>
                    </td>
                  <td class="text">&nbsp;</td>
                </tr>

               <tr>
                <td colspan=6 align="right" valign="middle"> 
                 <input name="Save" type="submit" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" > 
                 <input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>"> 
                </td>   </tr>
                </c:when>
                <c:otherwise>
                    <html-el:hidden name="StatsPropsForm" property="lastCounterValue" />
                    <html-el:hidden name="StatsPropsForm" property="lastTimeValue" />
                </c:otherwise>
                </c:choose>
               
              </table></td>
          </tr>
          
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
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


 <tr>  <td>&nbsp;</td>
 </tr> 


                                        <%--   PART THREE STATIC FIELDS --%>


   <tr align="left" valign="top"> 
     <td class="text"><img src="/webclient/common/images/spacer.gif"  width="5" height="1"></td> 
    <td colspan="4" class="htableBorder">
    <div id="pageThreeA" style="display:block"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
     <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">
         
      <tr class="header2bg"> <td >

 <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.datastore.header"/>
        </td><td width="40" nowrap>
<a class="propFormLink" href="javascript:ShowReqTab3('pageThreeB')"><fmt:message key='webclient.topo.objectdetails.edit'/></td><td  width="20" nowrap><a href="javascript:ShowReqTab3('pageThreeB')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></td></a> </tr>
</table>

<%--
     <table width="98%" border="0" cellspacing="0" cellpadding="0"><tr>
      
    <td width="550" nowrap class="propFormBlackText" > 
    <fmt:message key="webclient.perf.stats.custom.header"/></td><td >
<a href="javascript:ShowReqTab3('pageThreeB')">
<img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" border='0' width="21" height="18" hspace="5" align="absmiddle"> </a> </td> </tr>
</table> --%>
</td>
  </tr>

          <tr> 
            <td align="left" valign="top"  class=fontBlack> <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr> 
                  <td width="1%" height="28" class="text">&nbsp;</td>
                  <td width="180" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.statstable'/></td>
                  <td class="blackText"><c:out value="${StatsPropsForm.map.statsDataTableName}"/></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.id'/></td>
                  <td width="25%" class="blackText"> <c:out value="${StatsPropsForm.map.id}"/></td>
                  <td width="1%" align="left" class="text">&nbsp;</td>
                </tr>

                 <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.logdir'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.logDirectly}"/></td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.logfile'/></td>
                  <td height="28" class="blackText"><c:out value="${StatsPropsForm.map.logFile}"/></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                <tr> 
                  <td height="28" class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.savepollcount'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.savePollCount}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.failurethreshold'/></td>
                  <td height="28" class="blackText"><c:out value="${StatsPropsForm.map.failureThreshold}"/></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.saveonthreshold'/></td>
                  <td class="blackText"><c:out value="${StatsPropsForm.map.saveOnThreshold}"/></td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.ownername'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.ownerName}"/></td>
                  <td height="28" align="left" class="text">&nbsp;</td>
                </tr>

                <tr> 
                  <td class="text">&nbsp;</td>
                  <td class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.timeavg'/></td>
                  <td class="blackText"> <c:out value="${StatsPropsForm.map.timeAvg}"/></td>
                  <td height="28" colspan="3" class="blackText">&nbsp;</td>
                </tr>
             
                <c:choose> 
                <c:when test="${StatsPropsForm.map.rowCount != 0}"> 
                <tr> 
                  <td height="25" class="greyBg"> <p>&nbsp;</p></td>
                  <td height="25" colspan="5" class="greyBg"><a name="userProp"></a><span class="header2"><fmt:message key='webclient.fault.trapparser.moreprops'/></span></td>
                </tr>
                </c:when> <c:otherwise> </c:otherwise> </c:choose> 
                <html-el:hidden name="StatsPropsForm" property="rowCount"/> 

                <c:if test="${StatsPropsForm.map.rowCount > 0}"> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.perf.addstats.propname'/></td>
                  <td colspan="4" class="text"><fmt:message key='webclient.perf.addstats.propval'/></td>
                </tr>
                <c:forEach begin="0" end="${StatsPropsForm.map.rowCount-1}" varStatus="status"> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25"  class="text"> <html-el:text property="userPropsName" styleClass="formStyle" value="${StatsPropsForm.map.userPropsName[status.index]}"/></td>
                  <td height="28" align="left" class="text"> <html-el:text property="userPropsValue" styleClass="formStyle" value="${StatsPropsForm.map.userPropsValue[status.index]}"/></td>
                     <td colspan="3"  class="text">&nbsp;</td>
                </tr>
                </c:forEach> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"> <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>" onClick="more()"> 
                    <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>" onClick="fewer()"> 
                  </td>
                  <td colspan="4" align="left" class="text">&nbsp;</td>
                </tr>
                </c:if> </table></td>
          </tr>
        
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
      </div>

                                     <%--   PART THREE DYNAMIC FIELDS --%>

    
     <div id="pageThreeB" style="display:none"> 
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
      <table width="100%" class="table" border="0" cellspacing="0" cellpadding="0">
         
      <tr class="header2bg"> <td >

<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="95%" nowrap class="propFormBlackText"> <fmt:message key="webclient.perf.stats.datastore.header"/>
            </td><td width="40" nowrap>
 <c:if test="${actionToPerform ne 'addStatisticsForm'}">
<a class="propFormLink" href="javascript:ShowReqTab3('pageThreeA')"><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td><td  width="20" nowrap><a href="javascript:ShowReqTab3('pageThreeA')">
<img src="/webclient/common/images/edit.gif" width="14" border='0' height="15" valign="middle"></a> 
</c:if>
</td> </tr>
</table>

<%--
        <table width="98%" border="0" cellspacing="0" cellpadding="0"><tr>
    <td width="550" nowrap class="propFormBlackText">
         <fmt:message key="webclient.perf.stats.custom.header"/> </td><td >
<a href="javascript:ShowReqTab3('pageThreeA')">
<img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" width="21" border='0' height="18" hspace="5" align="absmiddle"></a></td> </tr>
</table> --%>

</td>
  </tr>

          <tr> 
            <td align="left" valign="top"  class=fontBlack> <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                <tr> 
                  <td width="1%" class="text">&nbsp;</td>
                  <td width="180" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.statstable'/></td>
                  <td class="blackText"><html-el:text styleId="storageTableName" name="StatsPropsForm" property="statsDataTableName" styleClass="formStyle"/></td>
                  <td width="24%" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.id'/></td>
                  <td width="25%" class="blackText"> 
                  <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.id}"/>
                     <html-el:hidden name="StatsPropsForm" property="id" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="id" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
<html-el:text name="StatsPropsForm" property="id" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td width="1%" align="left" class="text">&nbsp;</td>
                </tr>

                 <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.logdir'/></td>
                  <td height="28" class="blackText"> 
                    <html:select property="logDirectly"  style="width:160"> <html:option value="true" >true</html:option> 
                    <html:option value="false">false</html:option> </html:select></td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.logfile'/></td>
                  <td height="28" class=""><html:text property="logFile" styleClass="formStyle"/></td>
               
                  <td align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.savepollcount'/></td>
                  <td height="28" class="blackText">
                    <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.savePollCount}"/>
                     <html-el:hidden name="StatsPropsForm" property="savePollCount" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="savePollCount" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>

<%--
 <html-el:text name="StatsPropsForm" property="savePollCount" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                 
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.failurethreshold'/></td>
                  <td height="28" class="blackText"><html-el:text name="StatsPropsForm" property="failureThreshold" styleClass="formStyle"/></td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                <tr class="odd"> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.saveonthreshold'/></td>
                  <td height="28" class="blackText"> 
                  <html:select property="saveOnThreshold"  style="width:160"> <html:option value="true" >true</html:option> 
                  <html:option value="false">false</html:option> </html:select></td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.ownername'/></td>
                  <td height="28" class="blackText">
                   <c:choose>
                    <c:when test="${actionToPerform ne 'addStatisticsForm'}">
                    <c:out value="${StatsPropsForm.map.ownerName}"/>
                     <html-el:hidden name="StatsPropsForm" property="ownerName" />
                    </c:when>
                    <c:otherwise>
                   <html-el:text name="StatsPropsForm" property="ownerName" styleClass="formStyle" />
                    </c:otherwise>
                     </c:choose>
<%--
 <html-el:text name="StatsPropsForm" property="ownerName" styleClass="formStyle" readonly="${isReadOnly}" /> --%> </td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="blackBoldText"><fmt:message key='webclient.perf.statistics.prop.timeavg'/></td>
                  <td height="28" class="blackText"> 
                    <html:select property="timeAvg"  style="width:160"> <html:option value="true" >true</html:option> 
                    <html:option value="false">false</html:option> </html:select></td>
                  <td align="left" colspan="3" class="text">&nbsp;</td>
                </tr>
             
                <c:choose> <c:when test="${StatsPropsForm.map.rowCount == 0}"> 
                <tr class="odd"> 
                  <td height="25" class="blackText"> <p>&nbsp;</p></td>
                  <td height="25" colspan="5" class="blackBoldText">
                    <a href="javascript:userProperties()"><fmt:message key='webclient.fault.trapparser.moreprops.add'/></a> 
                    </td>
                </tr>
                </c:when> <c:when test="${StatsPropsForm.map.rowCount != 0}"> 
                <tr class="odd"> 
                  <td height="25" class="blackText"> <p>&nbsp;</p></td>
                  <td height="25" colspan="5" class="blackBoldText"><a name="userProp"></a><fmt:message key='webclient.fault.trapparser.moreprops'/></td>
                </tr>
                </c:when> <c:otherwise> </c:otherwise> </c:choose> <html-el:hidden name="StatsPropsForm" property="rowCount"/> 
                <c:if test="${StatsPropsForm.map.rowCount > 0}"> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.perf.addstats.propname'/></td>
                  <td colspan="4" class="text"><fmt:message key='webclient.perf.addstats.propval'/></td>
                </tr>
                <c:forEach begin="0" end="${StatsPropsForm.map.rowCount-1}" varStatus="status"> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25"  class="text"> <html-el:text property="userPropsName" styleClass="formStyle" value="${StatsPropsForm.map.userPropsName[status.index]}"/></td>
                  <td height="28" align="left" class="text"> <html-el:text property="userPropsValue" styleClass="formStyle" value="${StatsPropsForm.map.userPropsValue[status.index]}"/></td>
                     <td colspan="3"  class="text">&nbsp;</td>
                </tr>
                </c:forEach> 
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"> <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>" onClick="more()"> 
                    <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>" onClick="fewer()"> 
                  </td>
                  <td colspan="4" align="left" class="text">&nbsp;</td>
                </tr>
                </c:if> 

              <c:if test="${actionToPerform ne 'addStatisticsForm'}">   <tr> 
                <td colspan=6 align="right" valign="middle"> 
                 <input name="Save" type="submit" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" > 
                 <input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>"> 
                </td>   </tr>
                </c:if>

            </table></td>
          </tr>
        
        </table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
      </div></td>
  </tr>
</table>

<table width="98%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="1">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
</table>


<table width="99%" border="0" cellspacing="0" cellpadding="0">
  <tr > 
    <td height="1" width="10" ><img src="/webclient/common/images/spacer.gif"  width="10" height="20"></td>
    <td align="middle" class="header2Bg">
    <c:if test="${actionToPerform eq 'addStatisticsForm'}"> 
 <input name="Save" type="submit" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" > 
      <input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>"> 
</c:if>
      <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/perf/ConfiguredCollection.do';"> 
    </td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="1">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
</table>
</td>
</html:form> 
</body>


<%
if((request.getParameter("showPage") != null) || (request.getAttribute("showPage") != null))
{
%>
<script>
ShowReqTab3('pageThreeB')
ShowReqTab1('pageOneA')
</script>
<%
}
%>


<html:javascript formName="StatsPropsForm"/> 
</html>
