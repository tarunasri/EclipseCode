<%-- $Id: ModifyPollingObjectsForm.jsp,v 1.2 2010/10/29 13:47:12 swaminathap Exp $ --%>
   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/perf/jspf/modifyPollingObjects.jspf" %>



<body onload="javascript:setValues('<c:out value='${defCollectionProps.oid}'/>','<c:out value='${defCollectionProps.type}'/>','<c:out value='${defCollectionProps.name}'/>')">

<p align="center" class="boldText"><fmt:message key='webclient.perf.modifypo.modifypollingobjects'/></p>


<html:form action="/UpdatePollingObjects.do" onsubmit="formSubmit()">
<input type="hidden" name="toPerform" value="modifyPO">
<input type="hidden" name="hiddenFlag" value="<c:out value='${ModifyPO.map.hiddenFlag}'/>"/>
<input type="hidden" name="modifyPO" property="hiddenFlag"/>


    <table class="htableBorder" border="0" width="100%" cellspacing="1" cellpadding="3">

    <tr height="22" class="header2Bg">
    <td width="40%" colspan="4" class="boldText"><fmt:message key='webclient.perf.modifypo.pollingobjectdetails'/></td>
    </tr>
         
    <tr> 
    <td width="25%" class="greyBg text"><fmt:message key='webclient.perf.modifypo.poname'/></td>
    <td width="25%" class="greyBg text">
    <html:select styleClass="formStyle" property="POName" name="ModifyPO" value="<c:out value='${POName}'/>" onchange="getPollingObjectDetails(this.options[this.options.selectedIndex].value,true)"> 
    <option name="ModifyPO" value=""><fmt:message key='webclient.perf.modifypo.selectpollingobject'/></option>
    <c:forEach var="poNames" items="${poVector}" varStatus="status">
    <option name="ModifyPO" value="<c:out value='${poNames}'/>"
    <c:choose>
    <c:when test="${poNames==POName}">
    selected="true"
    </c:when>
    </c:choose>
    ><c:out value="${poNames}"/>
    </option>
    </c:forEach>
    </html:select>
    </td>
    <td width="25%" colspan="2" class="greyBg text"></td>
    </tr>

    <tr> 
    <td width="25%" class="greyBg text"><fmt:message key='webclient.perf.modifypo.updatemanagedobjects'/></td>
    <td width="25%" class="greyBg text">      
    <html:select styleClass="formStyle" name="ModifyPO" property="Status"> 
				    <option value='true' <c:choose>    <c:when test="${POStatus=='true'}">    selected="true"    </c:when></c:choose>><fmt:message key='webclient.perf.modifypo.true'/></option> 
				    <option value='false' <c:choose>    <c:when test="${POStatus=='false'}">    selected="true"  </c:when></c:choose>><fmt:message key='webclient.perf.modifypo.false'/></option> 
    </html:select>
    </td>
    <td width="25%" class="greyBg text" colspan="2"></td>
    </tr>

    <tr> 
    <td width="25%" class="greyBg text"><fmt:message key='webclient.perf.modifypo.classname'/></td>
    <td width="25%" class="greyBg text"><html-el:text name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="Class" value="${defCommonProps.Class}"/> </td>
    <td width="25%" colspan="2" class="greyBg text"></td>
    </tr>

</table>

<br>

<table class="htableBorder" border="0" width="100%" cellspacing="1" cellpadding="3">

    <tr height="22" class="header2Bg">
    <td width="40%" colspan="4" class="boldText"><fmt:message key='webclient.perf.modifypo.pollingobjectdetails'/></td>
    </tr>

<c:choose>
<c:when test="${empty criteriaLength}">
    <tr>
    <td align="left" class="greyBg text" nowrap>
    <html:select styleClass="formStyleDisabled" disabled="true" name="ModifyPO" property="compareType"> 
    <option value=''></option>
    <option value=''>---------------------------------</option> 
    </html:select>
    </td>

    <td align="center" class="greyBg text" nowrap>
    <html-el:text name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareProperty" value=""/>
    </td>

    <td align="center" class="greyBg text" nowrap>
    <html:select name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareCondition"> 
    <option value=''></option>
    <option value=''>----------------------------------</option> 
    </html:select>
    </td>

    <td align="left" class="greyBg text" nowrap>
    <html-el:text name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareValue" value=""/>
    </td>

    </tr>
</c:when>
<c:otherwise>
    <c:forEach begin="0" end="${criteriaLength-1}" varStatus="status">

    <tr>
    <td align="left" class="greyBg text" nowrap>
    <html:select styleClass="formStyleDisabled" disabled="true" name="ModifyPO" property="compareType"> 
				    <option value='${compareVector[status.count-1].type}' selected="true"><c:out value="${compareVector[status.count-1].type}"/></option> 
    </html:select>
    </td>

    <td align="center" class="greyBg text" nowrap>
    <html-el:text name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareProperty" value="${compareVector[status.count-1].property}"/>
    </td>

    <td align="center" class="greyBg text" nowrap>
    <html:select name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareCondition"> 
				    <option value='${compareVector[status.count-1].condition}' selected="true"><c:out value="${compareVector[status.count-1].condition}"/></option> 
    </html:select>
    </td>

    <td align="left" class="greyBg text" nowrap>
    <html-el:text name="ModifyPO" styleClass="formStyleDisabled" disabled="true" property="compareValue" value="${compareVector[status.count-1].value}"/>
    </td>

    </tr>
    </c:forEach>
</c:otherwise>
</c:choose>
</table>

<br>

<table class="htableBorder" border="0" width="100%" cellspacing="1" cellpadding="3">

    <tr height="22" class="header2Bg">
    <td width="50%" colspan="2" class="boldText"><fmt:message key='webclient.perf.modifypo.dataidentifierdetails'/></td>
    <td width="50%" align="right" colspan="2"><a class="linkNoUnderline" href="javascript:addOID()"><img src="/webclient/common/images/add.gif" border="0"/></a>&nbsp;&nbsp;<a class="linkNoUnderline" href="javascript:modifyOID()"><img src="/webclient/common/images/editcv.gif" border="0"/></a>&nbsp;&nbsp;<a class="linkNoUnderline" href="javascript:deleteOID()"><img src="/webclient/common/images/removecv.gif" border="0" onclick="deleteOID()"/></a>&nbsp;&nbsp;
    </td>
    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.prefix'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="Prefix" value="${defCommonProps.prefix}"/> </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.period'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="PollingPeriod" value="${defCommonProps.pollingPeriod}"/> </td>
    </tr>

    <tr>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.oidlist'/></td>
    <td width="25%" class="text greyBg">
    <html:select styleClass= "formStyle" name="ModifyPO" property="PollList"  onchange="getOIDDetails(this.options[this.options.selectedIndex].value)"> 
    <c:forEach var="oidsList" items="${completeOIDs}" varStatus="status">
    <option 
    <c:choose>
    <c:when test="${selectedOID==completeOIDs[status.count-1].oid}">
    selected="true"
    </c:when>
    </c:choose>
    value="<c:out value='${completeOIDs[status.count-1].oid}'/>"><c:out value="${completeOIDs[status.count-1].oid}"/></option> 
    </c:forEach>

    </html:select>
    </td>

    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.dataidentifier'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="oid" value="${defCollectionProps.oid}"/> </td>

    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.name'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" property="Name" styleClass="formStyle" value="${defCollectionProps.name}"/> </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.type'/></td>
    <td width="25%" class="text greyBg">
    <html:select name="ModifyPO" styleClass="formStyle" property="POType">
    <option value='none' <c:choose>    <c:when test="${defCollectionProps.type=='none'}">        selected='true'    </c:when></c:choose>>none</option> 
    <option value='node' <c:choose>    <c:when test="${defCollectionProps.type=='node'}">    selected="true"    </c:when></c:choose>>node</option> 
    <option value='interface' <c:choose>    <c:when test="${defCollectionProps.type=='interface'}">        selected='true'    </c:when></c:choose>>interface</option> 
    <option value='multiple' <c:choose>    <c:when test="${defCollectionProps.type=='multiple'}">    selected="true"    </c:when></c:choose>>multiple</option>
    </html:select>
    </td>

    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.protocol'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="Protocol" value="${defCollectionProps.protocol}"/>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.interval'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="Interval" value="${defCollectionProps.interval}"/> </td>
    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.community'/></td>
    <td width="25%" class="text greyBg"><html-el:text  name="ModifyPO" styleClass="formStyle" property="Community" value="${defCollectionProps.community}"/> </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.savepollcount'/></td>
    <td width="25%" class="text greyBg"><html-el:text name="ModifyPO" styleClass="formStyle" property="Save" value="${defCollectionProps.savePollCount}"/></td>
    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.statstable'/></td>
    <td width="25%" class="text greyBg"><html-el:text  name="ModifyPO" styleClass="formStyle" property="StatsData" value="${defCollectionProps.statsDataTableName}"/> </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.stringtable'/></td>
    <td width="25%" class="text greyBg"><html-el:text  name="ModifyPO" styleClass="formStyle" property="StringData" value="${defCollectionProps.stringDataTableName}"/> </td>
    </tr>

    <tr> 

    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.failurethreshold'/></td>
    <td width="25%" class="text greyBg"><html-el:text  name="AddReports" styleClass="formStyle" property="Failure" value="${defCollectionProps.failureThreshold}"/> </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.storedata'/></td>
    <td width="25%" class="text greyBg">      
    <html:select styleClass="formStyle" name="ModifyPO" property="StoreData"> 
    <option value='true' <c:choose>    <c:when test="${defCollectionProps.StoreData=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
    <option value='false' <c:choose>    <c:when test="${defCollectionProps.StoreData=='false'}">    selected="true"  </c:when></c:choose>>False</option> 
    </html:select>
    </td>
    </tr>

    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.saveonabsolute'/></td>
    <td width="25%" class="text greyBg"> 
    <html:select name="ModifyPO" styleClass="formStyle" property="SaveAbsolute"> 
    <option value='false' <c:choose>    <c:when test="${defCollectionProps.saveAbsolutes=='false'}">    selected="true"    </c:when></c:choose>>False</option> 
    <option value='true' <c:choose>    <c:when test="${defCollectionProps.saveAbsolutes=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
    </html:select>
    </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.timeaverage'/></td>
    <td width="25%" class="text greyBg">       
    <html:select name="ModifyPO" styleClass="formStyle" property="TimeAverage"> 
    <option value='false' <c:choose>    <c:when test="${defCollectionProps.timeAvg=='false'}">    selected="true"    </c:when></c:choose>>False</option> 
    <option value='true' <c:choose>    <c:when test="${defCollectionProps.timeAvg=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
    </html:select>
    </td>
    </tr>


    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.active'/></td>
    <td width="25%" class="text greyBg">       
    <html:select name="ModifyPO" styleClass="formStyle" property="Active"> 
				    <option value='true' <c:choose>    <c:when test="${defCollectionProps.Active=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
				    <option value='false' <c:choose>    <c:when test="${defCollectionProps.Active=='false'}">    selected="true"    </c:when></c:choose>>False</option> 
    </html:select>
    </td>
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.threshold'/></td>
    <td width="25%" class="text greyBg">
    <html:select name="ModifyPO" styleClass="formStyle" property="Threshold">
    <option value='false' 
    <c:choose>    
    <c:when test="${defCollectionProps.Threshold=='false'}">    
    selected='true'    
    </c:when>
    </c:choose>
    >False
    </option> 
    <option value='true' <c:choose>    <c:when test="${defCollectionProps.Threshold=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
    </html:select>
    </td>
    </tr>


    <tr> 
    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.saveonthreshold'/></td>
    <td width="25%" class="text greyBg">       
    <html:select name="ModifyPO" styleClass="formStyle" property="SaveThreshold"> 
    <option value='false' <c:choose>    <c:when test="${defCollectionProps.saveOnThreshold=='false'}">    selected="true"    </c:when></c:choose>>False</option> 
    <option value='true' <c:choose>    <c:when test="${defCollectionProps.saveOnThreshold=='true'}">    selected="true"    </c:when></c:choose>>True</option> 
    </html:select>
    </td>

    <td width="25%" class="text greyBg"><fmt:message key='webclient.perf.modifypo.thresholdlist'/><c:out value="${defCollectionProps.ThresholdName1}"/></td>
    <td width="25%" class="text greyBg">
    <html:select style="height:auto"  multiple="true" size="3" styleClass= "formStyle" name="ModifyPO" property="ThresholdList"> 
    <c:forEach var="threshold" items="${thresholdProps}" varStatus="status">
    <option value="<c:out value='${threshold.key}'/>"><c:out value="${threshold.key}"/></option> 
    </c:forEach>
    </html:select>
    </td>
    </tr>


    <tr>
    <td width="20%" class="text greyBg"></td>
    <td width="20%" align="right" class="text greyBg"><input type="submit" class="button" value="   Apply   " name=Submit2></td>
    <td width="30%" class="text greyBg">
<%--
<input class= "button" type="button" value=" Cancel " onClick='javascript:closeForm()'></td>
--%>
    <td width="30%" class="text greyBg"></td>
    </tr>

<%--
    <td width="66%" height="35">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="   Modify   " name=Submit2>
--%>                            
 
    </table>

</html:form>

