<%-- $Id: RTAMultiThreadEAProcessing.jsp,v 1.2 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<link href="css/SteelBlue/style.css" rel="stylesheet" type="text/css">
<%@include file="/webclient/admin/jspf/RTAMultiThreadEAFunction.jspf" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /></head>
<script type="text/javascript" src="/webclient/admin/js/AdminOperations.js"></script>
<script type="text/javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript">


var resultxml = null;

function displayResult(type)
{
	if(resultxml == null){
		//alert('Empty Result');
		return;
	}
	var table = "<table style='margin-bottom:10px;' width='100%' border='0' cellpadding='0' cellspacing='0'><tr><td class='generalCurveLeftTop'><img src='images/spacer.gif' width='1px' height='1px'></td><td align='left' valign='top' nowrap class='generalCurveTop' style='padding-right:10px;'><span class='generalTitle'>";
	if(type == 'EventThreadDetails'){
		table += "<fmt:message key='webclient.admin.mtap.eventthreads.title'/>";
	}
	else if(type=='AlertThreadDetails'){
		table += "<fmt:message key='webclient.admin.mtap.alertthreads.title'/>";
	}
	table += "</span></td><td class='generalCurveRightTop'><img src='images/spacer.gif' width='1px' height='1px'></td></tr><tr><td class='generalCurveLeft'>&nbsp;</td><td valign='top' class='generalTBPadding' ><table cellspacing='0' cellpadding='0'  border=0 width='100%'><tr><td width='10'></td><td><table border=0 class='tableBdr2' cellspacing='0' cellpadding='0' width='100%'><tr height=25 class='header2Bg'><td align='center' valign='middle' class='boldText' nowrap><fmt:message key='webclient.admin.mtap.threads.id'/></td><td valign='middle' class='boldText' nowrap><fmt:message key='webclient.admin.mtap.threads.name'/></td><td align='center' valign='middle' class='boldText' nowrap><fmt:message key='webclient.admin.mtap.threads.inq'/></td><td align='center' valign='middle' class='boldText' nowrap><fmt:message key='webclient.admin.mtap.threads.outq'/></td></tr>";

	var threadResult = resultxml.getElementsByTagName('ThreadDetails')[0];
	var threadTags = threadResult.getElementsByTagName("Thread");
	if(threadTags.length == 0){
		
		table += "<tr height='20px' class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\"><td colspan='4'></td></tr>";
		table += "<tr height='20px' class='generalEvenRow' onmouseout=\"this.className='generalEvenRow'\" onmouseover=\"this.className='generalHover'\"><td colspan='4'></td></tr>";
		table += "<tr height='20px' class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\"><td colspan='4' class='boldText' align='center'><fmt:message key='webclient.admin.mtap.multithreaddisabledmsg'/></td></tr>";
		table += "<tr height='20px' class='generalEvenRow' onmouseout=\"this.className='generalEvenRow'\" onmouseover=\"this.className='generalHover'\"><td colspan='4'></td></tr>";
		table += "<tr height='20px' class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\"><td colspan='4'></td></tr>";
	}
	else{
		for(var i =0; i < threadTags.length; i++){
			if(i % 2 == 0){
				table += "<tr height='20px' class='generalEvenRow' onmouseout=\"this.className='generalEvenRow'\" onmouseover=\"this.className='generalHover'\">";
			}
			else{
				table += "<tr height='20px' class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\">";
			}
			table += "<td align='center' width='10%'><span class='text'>" + (i+1) + "</span></td>";
			var threadDetails = threadTags[i];
			var threadCriteria = threadDetails.getAttribute("processing_criteria");
			//threadName += " s " + threadName.length;
			// ----
			if(threadCriteria.length > 110){

				var tempName = threadCriteria.substring(0,110);
				tempName += "...";
				var dispContent = parseContent(threadCriteria);
				var tempHtml = "<a onmouseover=\"ShowContent('ShowContent', '" + dispContent + "',event); return true;\" href=\"javascript:HideContent('ShowContent')\">";
				tempHtml += tempName + "</a>";
				threadCriteria = tempHtml;
			}
			// ----
			table += "<td width='70%'><span class='text'>" + threadCriteria + "</span></td>";
			table += "<td align='center' width='10%'><span class='text'>" + threadDetails.getAttribute("inqsize"); + "</span></td>";
			table += "<td align='center' width='10%'><span class='text'>" + threadDetails.getAttribute("outqsize"); + "</span></td>";
			table += "</tr>";
		}
	}
	table += "</table></td></tr><td width='10'></td></table></td><td class='generalCurveRight'>&nbsp;</td></tr><tr><td class='generalCurveLeftBot'><img src='images/spacer.gif' width='1px' height='1px'></td><td class='generalCurveBottom'><img src='images/spacer.gif' width='1px' height='1px'></td><td class='generalCurveRightBot'><img src='images/spacer.gif' width='1px' height='1px'></td></tr></table>";

	document.getElementById(type).innerHTML=table;

}

function addNewRow(tableName){
	var tableObject = document.getElementById(tableName);
	var newRowIndex = tableObject.rows.length;
	//var tableBody = tableObject.childNodes;
	var maxCount = document.MTAPForm.PossibleMaxCount.value;
	var totalrows = 0;
	var txtName = "";
	var rowName = "";
	if(tableName == 'ValueTable'){
		totalrows = parseInt(document.MTAPForm.TotalRows[1].value);
		txtName = "txtCriteriaRow";
		rowName = "Row";
	}
	else{
		totalrows = parseInt(document.MTAPForm.TotalRows[0].value);
		txtName = "DynamicCriteriaRow";
		rowName = "DynamicRow";
	}
	if(totalrows >= maxCount){
		alert("webclient.admin.mtap.maxaddition");
		return;
	}

	// Creating New Row
	var newRow = tableObject.insertRow(1);//newRowIndex);
	if(newRowIndex % 2 != 0){
		newRow.setAttribute("class","generalOddRow");
		newRow.setAttribute("onmouseout","this.className='generalOddRow'");
	}
	else{
		newRow.setAttribute("class","generalEvenRow");
		newRow.setAttribute("onmouseout","this.className='generalEvenRow'");
	}
	newRow.setAttribute("id", rowName+newRowIndex);
	newRow.setAttribute("onmouseover","this.className='generalHover'");
	// Creating TD
	var rowDataHTML = "";
	var cellIndex = 0;
	if(tableName == 'ValueTable'){
		var tdEdit = newRow.insertCell(cellIndex++);
		tdEdit.setAttribute("style","padding-right:5px;");
		tdEdit.setAttribute("align","center");
		tdEdit.setAttribute("id", "TDXML"+newRowIndex);
		rowDataHTML = "<img align='absmiddle' src='/webclient/common/images/spacer.gif' border='0'/>";
		tdEdit.innerHTML=rowDataHTML;
	}

	var tdDel = newRow.insertCell(cellIndex++);
	tdDel.setAttribute("style","padding-right:10px;");
	tdDel.setAttribute("align","center");
	rowDataHTML ="<a href=\"javascript:deleteRow("+newRowIndex+",'" + rowName +"')\" title='<fmt:message key='webclient.admin.mtap.deletevalue'/>'> <img align='absmiddle' class='deleteIcon' src='/webclient/common/images/spacer.gif' border='0'/></a>";
	tdDel.innerHTML=rowDataHTML;
	var tdText = newRow.insertCell(cellIndex++);
	rowDataHTML="";
	if(tableName == 'ValueTable'){
		rowDataHTML ="<span id='valueRow"+newRowIndex+"' style='display:none;'></span>";
	}
		
	rowDataHTML += "<input type='text' value='' style='width: 300px;' class='formstyle' name='"+txtName+"' id='"+txtName+"Id"+newRowIndex+"'/>";
	tdText.innerHTML=rowDataHTML;
	totalrows += 1;
	if(tableName == 'ValueTable'){
		document.MTAPForm.TotalRows[1].value=totalrows;
	}
	else{
		document.MTAPForm.TotalRows[0].value=totalrows;
	}
	document.getElementById(txtName+"Id"+newRowIndex).focus();
}

</script>
<body> 
	<div id="configpage" class='<c:choose> <c:when test="${empty isInProgress}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>' >
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.mtap.title'/>
</h1></td>
	        <td align="right">
<table class="headerInclude" cellspacing="0" cellpadding="0"  border=0 width="95%">
<tr><td width="10"></td>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height="25"> 
    <td nowrap class="text"></td>
    <td >
    </td>
    <td nowrap align="right" class="text"><b>
		    <span id="linkDynamicConfiguration" class='<c:choose> <c:when test="${!empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'><a href="javascript:showPage('DynamicConfiguration')" class="mnuText"><fmt:message key='webclient.admin.mtap.configure'/></a></span><span id="nolinkDynamicConfiguration" class='<c:choose> <c:when test="${empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'><fmt:message key='webclient.admin.mtap.configure'/></span>&nbsp;&nbsp;| &nbsp;&nbsp;

		    <span id="linkConfigureMTAP" class='<c:choose> <c:when test="${empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'><a href="javascript:showPage('ConfigureMTAP')" class="mnuText"><fmt:message key='webclient.admin.mtap.configurexml'/></a></span><span id="nolinkConfigureMTAP" class='<c:choose> <c:when test="${!empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'><fmt:message key='webclient.admin.mtap.configurexml'/></span>&nbsp;&nbsp;| &nbsp;&nbsp;

		    <span id="linkEventThreadDetails"><a href="javascript:getThreadDetails('EventThreadDetails')" class="mnuText"><fmt:message key='webclient.admin.mtap.EventDetails'/></a></span><span id="nolinkEventThreadDetails" class="hide"><fmt:message key='webclient.admin.mtap.EventDetails'/></span>&nbsp;&nbsp;| &nbsp;&nbsp;
		    <span id="linkAlertThreadDetails"><a href="javascript:getThreadDetails('AlertThreadDetails')" class="mnuText"><fmt:message key='webclient.admin.mtap.AlertDetails'/></a></span><span id="nolinkAlertThreadDetails" class="hide"><fmt:message key='webclient.admin.mtap.AlertDetails'/></span>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
</table>
</td></tr></table>

</td>
        
        </tr>
</table>
<html:form action="/ConfigureMTAPForm.do" onsubmit="return validateForm()">
	<br>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="StatusTable">
		<c:if test="${!empty success && empty failure}"> <tr>
			<td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> <td width="20%"></td>
						<td height="25" nowrap class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${success}"/></td> </tr>  </table>  </td>  </tr>
		</c:if>
		<c:if test="${!empty failure}">  <tr>
			<td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>  <td width="20%"></td>
						<td width="80%" class="errorText" height="25" nowrap><img src="/webclient/common/images/negativeRes.gif" width="17" height="13" hspace="5" border="0"><c:out value="${failure}"/></td> </tr> </table>  </td>  </tr>
		</c:if>
	</table>
	<br>
	<div id="DynamicConfiguration" class='<c:choose> <c:when test="${empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'>

<table class="greyboxStyle1" width="100%" border="0" cellspacing="0" cellpadding="0" style="display:<c:choose><c:when test='${!empty DynamicPattern}'><c:out value=''/></c:when> <c:otherwise><c:out value='none'/></c:otherwise></c:choose>;">
  <tr>
    <td style="padding:5px;"><table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:1px;" valign="top" class="whiteBg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="generalTBHeader">
			<td>&nbsp;<fmt:message key='webclient.admin.mtap.dynamictitle'/></td>
                </tr>
              </table>
              <table style="margin-top:10px;margin-bottom:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                <tbody>
                  <tr>
                    <td width="10%" valign="top" nowrap="nowrap"><fmt:message key='webclient.admin.mtap.selectedcriteria'/> :</td>
		    <td valign="top" nowrap> <b> <c:out value="${dynamicCriteria}" /> </b>
			    <html-el:hidden property="dynamicCriteria" />
		      &nbsp;&nbsp;<a href="javascript:showOrHideDiv('DynamicContextHelp')" title="<fmt:message key='webclient.admin.mtap.contexthelp'/>"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"/></a></td>
                  </tr>
                </tbody>
	</table>
	
	<div id="DynamicContextHelp" class="hide">
		<table style="margin-top:10px;margin-bottom:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left"><tr><td>
		<table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="#FFFFE5" align="center" style="margin-top:3px;border:1px solid #666">
  <tr>
    <td nowrap valign="top" class="text"><img src="/webclient/common/images/hint.gif" hspace="2" align="absmiddle"><strong><fmt:message key="webclient.admin.mtap.help"/> </strong></td>
	  <td valign="top"><ul class="text" style="margin-top:0px;margin-bottom:0px">
		<li><fmt:message key="webclient.admin.mtap.dynamichelp1"/></li>
		<li><fmt:message key="webclient.admin.mtap.dynamichelp2"/></li>
		<li><fmt:message key="webclient.admin.mtap.dynamichelp3"/></li>
		</ul>
	</td>
  </tr>
</table></td></tr></table>
	</div>
	<div id="DynamicTabPanel">
              <table style="clear:both;" width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody>
                  <tr>
                    <td class="norTabBotline"><img height="4" width="10" src="/webclient/common/images/spacer.gif"/></td>
		    <td class='selTabLeft1' ><img height="4" width="4" src="/webclient/common/images/spacer.gif"/></td>

		    <td nowrap="" class='selTabCenter1'>
			<label for="001">
				<c:choose><c:when test="${DynamicPattern=='COUNT_BASED'}">
					<fmt:message key='webclient.admin.mtap.countbased'/>
				</c:when>
				<c:otherwise>
					<fmt:message key='webclient.admin.mtap.valuebased'/>
				</c:otherwise></c:choose>
			</label></td>
		    <td class='selTabRight1' ><img height="4" width="5" src="/webclient/common/images/spacer.gif"/></td>

		    <td nowrap="" width="90%" align="right" style="padding-right: 10px;" class="norTabBotline">&nbsp;</td>
                  </tr>
                </tbody>
	</table>
	<div style="clear:both;" class='<c:choose><c:when test="${DynamicPattern == \'COUNT_BASED\'}"><c:out value="" /></c:when><c:otherwise><c:out value="hide" /></c:otherwise></c:choose>'>
              <table style="clear:both;display:;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top" style="padding:5px;"><table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                      <tbody>
                        <tr>
				<td width="10%" nowrap="nowrap"><fmt:message key="webclient.admin.mtap.selectthreadcount"/>:</td>
                          <td valign="top">
						  
				  <html-el:select style="width:100px;" property="dynamicCount" styleClass="formstyle">
					  <c:forEach var="count" begin="${dynamicCount}" end="${PossibleMaxCount}" step="1" varStatus="icount">
					  <html-el:option value="${count}"> <c:out value="${count}"> </c:out></html-el:option>
					</c:forEach>
                      		</html-el:select>
						  
						  </td>
                        </tr>
                      </tbody>
                    </table></td>
                </tr>
		</table>
		</div>
			  
		<div style="clear:both;" class='<c:choose><c:when test="${DynamicPattern == \'VALUE_BASED\'}"><c:out value="" /></c:when><c:otherwise><c:out value="hide" /></c:otherwise></c:choose>'>
			  <table style="clear:both;margin-bottom:6px;margin-top:6px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
			<td><span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:addNewRow('DynamicValueTable')"><fmt:message key='webclient.admin.mtap.addnew'/></a>&nbsp;&nbsp;</span></td>
                </tr>
              </table>
              <table  class="tableBdr2" width="100%" cellspacing="0" cellpadding="2" border="0" align="left" id="DynamicValueTable">
                <tbody>
                  <tr class="generalTBHeader">
                    <td align="center">&nbsp;</td>
		    <td width="98%" ><fmt:message key='webclient.admin.mtap.criteriavalues'/></td>
	    	  </tr>
		  <c:if test="${DynamicPattern == 'VALUE_BASED'}">
		<c:forEach var="threadValues" items="${DynamicValues}" varStatus="status">
		<c:choose><c:when test="${status.count%2==0}">
		<tr class="generalEvenRow" onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'" id='<c:out value="DynamicRow${status.count}"/>'>
		</c:when><c:otherwise>
		  <tr class="generalOddRow" onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'" id='<c:out value="DynamicRow${status.count}"/>'>
		</c:otherwise></c:choose>
		    <td style="padding-right:10px;padding-left:7px;" align="center">&nbsp;</td>
		    <td  class=""><span id="<c:out value='DynamicValueRow${status.count}'/>"><c:out value="${threadValues}"></c:out></span><html-el:text value="${threadValues}" style="width:300px;display:none" styleClass="formstyle" property="DynamicCriteriaRow" styleId="DynamicCriteriaRowId${status.count}"/></td>
	    	</tr>
		</c:forEach>
		</c:if>
                </tbody>
              </table>
      </div>
      </div>
              <table width="100%" cellspacing="0" cellpadding="0" border="0" style="clear:both;margin-top: 15px;">
                <tbody>
                  <tr>
                    <td align="center"><html-el:submit styleClass="button" value="Update" onclick="javascript:setSubmitAction('dynamicConfiguration')"/>
                      </td>
                  </tr>
                </tbody>
            </table></td>
            <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>
          <tr>
            <td class="generalCurveLeftBot"><img height="1" width="1" src=/webclient/common/"images/corner2-4.gif"/></td>
            <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table></td>
  </tr>
  
  	<html-el:hidden property="DynamicPattern" value="${DynamicPattern}"/>
	<html-el:hidden property="TotalRows" value="${DynamicTotalRows}"/>
	<html-el:hidden property="ExistingDynamicCount" value="${dynamicCount}"/>
	</table>
	<table align="center" class="messageStyle" width="60%" border="0" cellspacing="0" cellpadding="6" valign="center" style="display:<c:choose><c:when test='${empty DynamicPattern}'><c:out value=''/></c:when> <c:otherwise><c:out value='none'/></c:otherwise></c:choose>;">
        <tr>
                <td align="center" class="text"><fmt:message key='webclient.admin.mtap.multithreaddisabledmsg'/></td>
        </tr>
        <tr>
                <td align="center">&nbsp;
                </td>
        </tr>
        </table>
</div>
<div id="ConfigureMTAP" class='<c:choose> <c:when test="${!empty toPerform}"><c:out value=""/></c:when><c:otherwise><c:out value="hide"/></c:otherwise></c:choose>'>
	

<table class="greyboxStyle1" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px;"><table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:1px;" valign="top" class="whiteBg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="generalTBHeader">
			<td>&nbsp; <fmt:message key='webclient.admin.mtap.xmltitle'/></td>
                </tr>
              </table>
              <table style="margin-top:10px;margin-bottom:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                <tbody>
                  <tr>
                    <td width="10%" valign="top" nowrap="nowrap"><fmt:message key='webclient.admin.mtap.selectcriteria'/> :</td>
		    <td valign="top"><html-el:select style="witdth:250px;" property="selectedCriteria" styleClass="formstyle">
			<c:forEach var="criterias" items="${PossibleCriteria}" varStatus="">
			<html-el:option value="${criterias}"><c:out value="${criterias}"></c:out></html-el:option>
			</c:forEach>
                      </html-el:select>
		      &nbsp;<a href="javascript:showOrHideDiv('ContextHelp')" title="<fmt:message key='webclient.admin.mtap.contexthelp'/>"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"/></a></td>
                  </tr>
                </tbody>
	</table>
	<div id="ContextHelp" class="hide">
		<table style="margin-top:10px;margin-bottom:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left"><tr><td>
		<table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="#FFFFE5" align="center" style="margin-top:3px;border:1px solid #666">
  	<tr>
    	<td nowrap valign="top" class="text"><img src="/webclient/common/images/hint.gif" hspace="2" align="absmiddle"><strong><fmt:message key="webclient.admin.mtap.help"/> </strong></td>
	  <td valign="top"><ul class="text" style="margin-top:0px;margin-bottom:0px">
		<li><fmt:message key="webclient.admin.mtap.xmlhelp1"/></li>
		<li><fmt:message key="webclient.admin.mtap.xmlhelp2"/></li>
		<li><fmt:message key="webclient.admin.mtap.xmlhelp3"/></li>
		<li><fmt:message key="webclient.admin.mtap.xmlhelp4"/></li>
		<li><fmt:message key="webclient.admin.mtap.xmlhelp5"/></li>
		</ul>
	</td>
  	</tr>
	</table></td></tr></table>
	</div>
	<div id="TabPanel" class='<c:choose><c:when test="${CriteriaName == \'NONE\'}"><c:out value="hide"/></c:when><c:otherwise><c:out value=""/></c:otherwise></c:choose>' >
              <table style="clear:both;" width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody>
                  <tr>
                    <td class="norTabBotline"><img height="4" width="10" src="/webclient/common/images/spacer.gif"/></td>
		    <td class='<c:choose><c:when test="${ConfigPattern == \'COUNT_BASED\'}"><c:out value="selTabLeft1"/></c:when><c:otherwise><c:out value="norTabLeft1"/></c:otherwise></c:choose>' id="LeftCelltab1"><img height="4" width="4" src="/webclient/common/images/spacer.gif"/></td>

		    <td nowrap="" class='<c:choose><c:when test="${ConfigPattern == \'COUNT_BASED\'}"><c:out value="selTabCenter1"/></c:when><c:otherwise><c:out value="norTabCenter1"/></c:otherwise></c:choose>' onClick="javascript:selectTab('tab1','tab2')" id="Celltab1">
			    <html-el:radio style="vertical-align:middle;margin:0px;padding:0px;" property="ConfigPattern" value="COUNT_BASED"/>
			    <label for="001"><fmt:message key='webclient.admin.mtap.countbased'/></label></td>

		    <td class='<c:choose><c:when test="${ConfigPattern == \'COUNT_BASED\'}"><c:out value="selTabRight1"/></c:when><c:otherwise><c:out value="norTabRight1"/></c:otherwise></c:choose>' id="RightCelltab1"><img height="4" width="5" src="/webclient/common/images/spacer.gif"/></td>

		    <td width="4" class="norTabBotline"><img height="4" width="4" src="/webclient/common/images/spacer.gif"/></td>

		    <td class='<c:choose><c:when test="${ConfigPattern == \'VALUE_BASED\'}"><c:out value="selTabLeft1"/></c:when><c:otherwise><c:out value="norTabLeft1"/></c:otherwise></c:choose>' id="LeftCelltab2"><img height="4" width="4" src="/webclient/common/images/spacer.gif"/></td>

		    <td nowrap="" class='<c:choose><c:when test="${ConfigPattern == \'VALUE_BASED\'}"><c:out value="selTabCenter1"/></c:when><c:otherwise><c:out value="norTabCenter1"/></c:otherwise></c:choose>' onClick="javascript:selectTab('tab2','tab1')" id="Celltab2">
			    <html-el:radio style="vertical-align:middle;margin:0px;padding:0px;" property="ConfigPattern" value="VALUE_BASED"/>
			    <label for="002"><fmt:message key='webclient.admin.mtap.valuebased'/></label></td>

		    <td class='<c:choose><c:when test="${ConfigPattern == \'VALUE_BASED\'}"><c:out value="selTabRight1" /></c:when><c:otherwise><c:out value="norTabRight1"/></c:otherwise></c:choose>' id="RightCelltab2"><img height="4" width="5" src="/webclient/common/images/spacer.gif"/></td>

                    <td nowrap="" width="90%" align="right" style="padding-right: 10px;" class="norTabBotline">&nbsp;</td>
                  </tr>
                </tbody>
	</table>
	<div style="clear:both;" class='<c:choose><c:when test="${ConfigPattern == \'COUNT_BASED\'}"><c:out value="" /></c:when><c:otherwise><c:out value="hide" /></c:otherwise></c:choose>' id="tab1">
              <table style="clear:both;display:;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top" style="padding:5px;"><table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                      <tbody>
                        <tr>
				<td width="10%" nowrap="nowrap"><fmt:message key="webclient.admin.mtap.selectthreadcount"/>:</td>
                          <td valign="top">
						  
				  <html-el:select style="width:100px;" property="selectedThreadCount" styleClass="formstyle">
					  <c:forEach var="count" begin="1" end="${PossibleMaxCount}" step="1" varStatus="icount">
					  <html-el:option value="${count}"> <c:out value="${count}"> </c:out></html-el:option>
					</c:forEach>
                      		</html-el:select>
						  
						  </td>
                        </tr>
                      </tbody>
                    </table></td>
                </tr>
		</table>
		</div>
			  
			  
			  
		<div style="clear:both;" class='<c:choose><c:when test="${ConfigPattern == \'VALUE_BASED\'}"><c:out value="" /></c:when><c:otherwise><c:out value="hide" /></c:otherwise></c:choose>' id="tab2">
			  <table style="clear:both;margin-bottom:6px;margin-top:6px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
			<td><span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:addNewRow('ValueTable')"><fmt:message key='webclient.admin.mtap.addnew'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<img align="absmiddle" class="editIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:modifyAllRows('ValueTable')"><fmt:message key='webclient.admin.mtap.modifyall'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:deleteAllRows('ValueTable')"><fmt:message key='webclient.admin.mtap.deleteall'/></a></span></td>
                </tr>
              </table>
              <table  class="tableBdr2" width="100%" cellspacing="0" cellpadding="2" border="0" align="left" id="ValueTable">
                <tbody>
                  <tr class="generalTBHeader">
                    <td align="center">&nbsp;</td>
                    <td align="center">&nbsp;</td>
		    <td width="98%" ><fmt:message key='webclient.admin.mtap.criteriavalues'/></td>
	    	  </tr>
		  <c:if test="${ConfigPattern == 'VALUE_BASED'}">
		<c:forEach var="threadValues" items="${CRITERIA_VALUES}" varStatus="status">
		<c:choose><c:when test="${status.count%2==0}">
		<tr class="generalEvenRow" onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'" id='<c:out value="Row${status.count}"/>'>
		</c:when><c:otherwise>
		  <tr class="generalOddRow" onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'" id='<c:out value="Row${status.count}"/>'>
		</c:otherwise></c:choose>
		<td style="padding-right:10px;padding-left:5px;" align="center" id="<c:out value='TDXML${status.count}'/>"><a href="javascript:toggleDisplay(<c:out value='${status.count}'/>)" title="<fmt:message key='webclient.admin.mtap.editvalue'/>"><img align="absmiddle" class="editIcon " src="/webclient/common/images/spacer.gif" border="0"/></a></td>
		    <td style="padding-right:10px;" align="center"><a href="javascript:deleteRow(<c:out value='${status.count}'/>,'Row')" title="<fmt:message key='webclient.admin.mtap.deletevalue'/>"><img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif" border="0"/></a></td>
		    <td  class=""><span id="<c:out value='valueRow${status.count}'/>"><c:out value="${threadValues}"></c:out></span> <html-el:text value="${threadValues}" style="width:300px;display:none" styleClass="formstyle" property="txtCriteriaRow" styleId="txtCriteriaRowId${status.count}"/></td>
		    
	    	</tr>
		</c:forEach>
		</c:if>
                </tbody>
              </table>
      </div>
      </div>
              <table width="100%" cellspacing="0" cellpadding="0" border="0" style="clear:both;margin-top: 15px;">
                <tbody>
                  <tr>
                    <td align="center"><html-el:submit styleClass="button" value="Update" onclick="javascript:setSubmitAction('configureXML')"/>
                      </td>
                  </tr>
                </tbody>
            </table></td>
            <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>
          <tr>
            <td class="generalCurveLeftBot"><img height="1" width="1" src=/webclient/common/"images/corner2-4.gif"/></td>
            <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table></td>
  </tr>
  <html-el:hidden property="PossibleMaxCount" value="${PossibleMaxCount}"/>
  <html-el:hidden property="CriteriaName" value="${CriteriaName}"/>
  <html-el:hidden property="TotalRows" value="${TotalRows}"/>
  <html-el:hidden property="toPerform" value="configureXML"/>
  <html-el:hidden property="XMLConfigPattern" value="${ConfigPattern}"/>
</table>
</div>
</html:form>

<div id="EventThreadDetails" class="hide">
</div>

<div id="AlertThreadDetails" class="hide">
</div>
</div>

<div id="progresspage" class='<c:choose> <c:when test="${empty isInProgress}"><c:out value="hide" /></c:when><c:otherwise><c:out value="" /></c:otherwise></c:choose>' >
	<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td nowrap="nowrap"><h1><fmt:message key='webclient.admin.mtap.title'/></h1></td>
			<td align="right">
				<table class="headerInclude" cellspacing="0" cellpadding="0"  border=0 width="95%">
					<tr><td width="10"></td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr height="25">
									<td nowrap class="text"></td>
									<td ></td>
									<td nowrap align="right" class="text"><b>
								<fmt:message key='webclient.admin.mtap.configure'/>&nbsp;&nbsp;| &nbsp;&nbsp;
								<fmt:message key='webclient.admin.mtap.configurexml'/>&nbsp;&nbsp;| &nbsp;&nbsp;
								<fmt:message key='webclient.admin.mtap.EventDetails'/>&nbsp;&nbsp;| &nbsp;&nbsp;
		    						<fmt:message key='webclient.admin.mtap.AlertDetails'/>&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
				</td></tr></table>

			</td>

		</tr>
	</table>

	<br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td align="center"> <b><fmt:message key='webclient.admin.mtap.progressmessage'/> </b></td></tr>

	</table>
	<br><br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr><td align="center"><img src="/webclient/common/images/LoadingTC.gif" border="0" alt='<fmt:message key="webclient.admin.mtap.altprogressmsg"/>'> </td></tr>
	</table>
</div>

<div 
   id="ShowContent" 
   style="display:none;
   font-size: 13px;
  	font-family: Arial, Helvetica, sans-serif; 
	position:absolute; 
	border-top:2px solid #5585C6;
	border-bottom:2px solid #5585C6;
	border-left:2px solid #5585C6;
	border-right:2px solid #5585C6;
      background-color: #ffffe1;
     font-weight: bold;
     padding: 5px;"
     onmouseout="HideContent('ShowContent')">
</div>

<br>

