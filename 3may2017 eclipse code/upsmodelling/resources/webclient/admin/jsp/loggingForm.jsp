<%-- $Id: loggingForm.jsp,v 1.9 2010/10/29 13:46:54 swaminathap Exp $--%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/calendar" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/calendar-en" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/calendar-setup" type="text/javascript"></script>

	<script type="text/javaScript" >
		function checkData()
                {
                        var selectedInValue="";
                        for(var i = 0; i < document.configureSPYForm.inCategories.options.length; i++)
                        {
                            if(document.configureSPYForm.inCategories.options[i].selected)
                            {
                                if(selectedInValue != "")
                                {
                                        selectedInValue = selectedInValue+",";
                                }
                                selectedInValue = selectedInValue+document.configureSPYForm.inCategories.options[i].value;
                            }
                        }
                        document.configureSPYForm.includeCategories.value=selectedInValue;
                        var selectedExValue="";
                        for(var j = 0; j < document.configureSPYForm.exCategories.options.length; j++)
                        {
                            if(document.configureSPYForm.exCategories.options[j].selected)
                            {
                                if(selectedExValue != "")
                                {
                                        selectedExValue = selectedExValue+",";
                                }
                                selectedExValue = selectedExValue+document.configureSPYForm.exCategories.options[j].value;
                            }
                        }

			var reloadInterval="";
                        reloadInterval = document.configureSPYForm.reloadInterval.value;
                        var backUpFileCount="";
                        backUpFileCount=document.configureSPYForm.FileBackUp.value;
			if(reloadInterval != "")
			{
				if(!isPositiveInteger(reloadInterval))
                                {
                                	alert('<fmt:message key="webclient.admin.spy.reloadNumeric.format"/>');
                                        return false;
                                }
				else
				{
					if(backUpFileCount != "")
					{
	        		                if(!isPositiveInteger(backUpFileCount))
        	        		        {
                	        		    alert('<fmt:message key="webclient.admin.spy.FileBackUpNumeric.format"/>');
	                        		    return false;
			                        }	
					}
					else
					{
						alert('<fmt:message key="webclient.admin.spy.fileCount.empty"/>');
						return false;
					}
				}
			}
			else
			{
				alert('<fmt:message key="webclient.admin.spy.reloadInterval.empty"/>');
                                return false;
			}

                        document.configureSPYForm.excludeCategories.value = selectedExValue;
                        var enableOutage="";
                        enableOutage=document.configureSPYForm.enableOutage.checked;
			if(enableOutage == true)
                        {
                        	var outageInterval="";
                                outageInterval = document.configureSPYForm.outageInterval.value;
				if(outageInterval != "")
				{
	                        	if(!isPositiveInteger(outageInterval))
        	                        {
                	                	alert('<fmt:message key="webclient.admin.spy.outageNumeric.format"/>');
                        	                return false;
					}
                                        else if(document.configureSPYForm.logPath.value==""){
	                                     alert('<fmt:message key="webclient.admin.spy.logPath.empty"/>');
        	                             return false;
                	                }
                        	        else{
                                        return true;
                                	}
	                        }
				else
				{
                                        alert('<fmt:message key="webclient.admin.spy.outageInterval.emtpy"/>');
                                        return false;

				}
			}
	                else if(document.configureSPYForm.logPath.value==""){
                        alert('<fmt:message key="webclient.admin.spy.logPath.empty"/>');
                        return false;
                        }
	                else{
                        return true;
			}
                }
		function returnData(NCategories, XCategories, OutageCheck, StackCheck, LogCheck)
		{
			if(LogCheck=="false")
			{
                               	document.configureSPYForm.enableLog.checked=false;
				document.configureSPYForm.logPath.className='formStyleDisabled';
				document.configureSPYForm.logPath.readonly=true;
			}
			else
			{
                             if(document.configureSPYForm != undefined)
                             {
			        document.configureSPYForm.enableLog.checked=true; 
                                document.configureSPYForm.logPath.className='formStyle';
                                document.configureSPYForm.logPath.readonly=false;
                             }
			}
	
			if (OutageCheck=="false")
			{
				document.configureSPYForm.enableOutage.checked=false;
				document.configureSPYForm.outageInterval.className='formStyleDisabled';
				document.configureSPYForm.outageInterval.disabled=true;
			}	
			else
			{
                            if(document.configureSPYForm != undefined)
                            {
				document.configureSPYForm.enableOutage.checked=true;
                                document.configureSPYForm.outageInterval.className='formStyle';
                                document.configureSPYForm.outageInterval.disabled=false;
                            }
			}
			if (StackCheck=="false")
			{
                            if(document.configureSPYForm != undefined)
                             {
				document.configureSPYForm.enStackTrace.checked=false;
				document.configureSPYForm.stackTraceClass.className='formStyleDisabled';
				document.configureSPYForm.stackTraceClass.disabled=true;
                             }
			}
			else
			{
                            if(document.configureSPYForm != undefined)
                            {
				document.configureSPYForm.enStackTrace.checked=true;
                                document.configureSPYForm.stackTraceClass.className='formStyle';
                                document.configureSPYForm.stackTraceClass.disabled=false;
                            }
			}
			var IncludedCategory = NCategories.split(',');
			var length = IncludedCategory.length;
			
			for(var i = 0;i < length;i++)
			{
                             if(document.configureSPYForm != undefined)
                             {
				var optionsLength = document.configureSPYForm.inCategories.options.length;

				for(var j = 0;j < optionsLength; j++)
				{
					if(IncludedCategory[i] == document.configureSPYForm.inCategories.options[j].value)
					document.configureSPYForm.inCategories.options[j].selected = true;
				}
                             }
			}
			

			var ExcludedCategory = XCategories.split(',');
			var length = ExcludedCategory.length;
			for(var i = 0;i < length;i++)
                        {
                            if(document.configureSPYForm != undefined)
                             {
                                var optionsLength = document.configureSPYForm.exCategories.options.length;
                                for(var j = 0;j < optionsLength; j++)
                                {
                                        if(ExcludedCategory[i] == document.configureSPYForm.exCategories.options[j].value)
                                        document.configureSPYForm.exCategories.options[j].selected = true;
                                }
                             }
                        }
		return true;
		}
		function checkLogs()
                {
	                var enableLog="";
                        enableLog=document.configureSPYForm.enableLog.checked;
                        if(enableLog==false)
                        {
                                document.configureSPYForm.logPath.readonly=true;
                                document.configureSPYForm.logPath.className='formStyleDisabled';
                        }
                        else
                        {
                                document.configureSPYForm.logPath.readonly=false;
                                document.configureSPYForm.logPath.className='formStyle';
                        }
                        return true;
                }

		function checkStack()
                {
                var stackTrace="";
                        stackTrace=document.configureSPYForm.enStackTrace.checked;
                        if(stackTrace==false)
                        {
                                document.configureSPYForm.stackTraceClass.disabled=true;
                                document.configureSPYForm.stackTraceClass.className='formStyleDisabled';

                        }
                        else
                        {
                                document.configureSPYForm.stackTraceClass.disabled=false;
                                document.configureSPYForm.stackTraceClass.className='formStyle';
                        }
                        return true;
                }
		
		function checkOutage()
		{
			var enableOutage="";
                        enableOutage=document.configureSPYForm.enableOutage.checked;
                        if(enableOutage==false)
                        {
                                document.configureSPYForm.outageInterval.disabled=true;
				document.configureSPYForm.outageInterval.className='formStyleDisabled';
                        }
			else
			{
				document.configureSPYForm.outageInterval.disabled=false;
				document.configureSPYForm.outageInterval.className='formStyle';
			}
			return true;
		}
		function InvokeViewer(NCategories, XCategories, OutageCheck, StackCheck, LogCheck, log4jStatus)
		{
			if(top.window.location.href.indexOf("loggingAction") != -1 || top.window.location.href.indexOf("admin/logAction") != -1)
                        {
                                InvokeLogsViewer();
                        }
                        if(top.window.location.href.indexOf("spyAction") != -1 || top.window.location.href.indexOf("/admin/FillSpyForm") != -1)
                    	{
                               	InvokeSPYViewer(NCategories, XCategories, OutageCheck, StackCheck, LogCheck );
                        }

		}
		function InvokeSPYViewer1()
                {
                        location.href="/admin/FillSpyForm.do";
                }

		function InvokeSPYViewer(NCategories, XCategories, OutageCheck, StackCheck, LogCheck)
		{
			document.getElementById('spyPropertyConfigurator').className='';
		        //document.getElementById('logViewConfigurator').className='hide';
			//document.getElementById('Tab1').className='';
			//document.getElementById('Tab2').className='hide';
			returnData(NCategories, XCategories, OutageCheck, StackCheck, LogCheck);
		}
		
		function InvokeLogsViewer()
		{
			document.getElementById('spyPropertyConfigurator').className='hide';
                        document.getElementById('logViewConfigurator').className='';
			document.getElementById('Tab1').className='hide';
			document.getElementById('Tab2').className='';
		}
	
		function InvokeLogsViewer1()
                {
                        location.href="/admin/loggingAction.do";
                }
	
		function wrapChange()
		{
			var enableWrap="";
			enableWrap = document.loadLogsForm.wordWrap.checked;
			if(enableWrap == false)
			{
				document.getElementById('wrapped').className='hide';
				document.getElementById('nowrapped').className='';
			}
			else
			{
				document.getElementById('wrapped').className='';
				document.getElementById('nowrapped').className='hide';
			}
			return true;
		}
		function addFilter()
		{
			document.getElementById('expand').className='hide';
			document.getElementById('collapse').className='';	
			document.getElementById('collapsed').className='';
			document.getElementById('collapses').className='';
		}
		function existFilter()
		{
			document.getElementById('expand').className='';
			document.getElementById('collapse').className='hide';
			document.getElementById('collapsed').className='hide';
			document.getElementById('collapses').className='hide';
		}
		function configure()
		{
			location.href="/admin/log4jAction.do";
		}

</script>
<%--body onload="javascript:InvokeViewer('<c:out value="${inHidden}"/>','<c:out value="${outHidden}"/>','<c:out value="${Outage
}"/>','<c:out value="${StackTrace}"/>','<c:out value="${Log}"/>','<c:out value="${log4jStatus}"/>')"--%>

<body onload="javascript:InvokeSPYViewer('<c:out value="${inHidden}"/>','<c:out value="${outHidden}"/>','<c:out value="${Outage
}"/>','<c:out value="${StackTrace}"/>','<c:out value="${Log}"/>')">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.admin.logging.spylog'/></h1></td>
        </tr>
      </table>


<table  class="whiteBG" align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
<tbody>
<tr>
<td width="55%" align="right" nowrap style="padding-right:10px;">
<a href="/admin/log4jAction.do" class="fontBlueBoldLink"><fmt:message key='webclient.admin.logging.log4jtitle'/></a>
</td>
</tr>
</tbody>
</table>




<%--
 <div id="logViewConfigurator" style="width: 100%">
<c:choose>
<c:when test="${log4jStatus=='true'}">
<table border="1" style="width: 100%; height: 400px;"><tr class="reportsOddRow"><td align="center" class="boldText"><fmt:message key="webclient.admin.log4jDisable.message"/><br><br><fmt:message key="webclient.admin.logConfigure.message"/><br><br><fmt:message key="webclient.admin.log4jConfigure.message"/><br><br><a href="javascript:configure();">Click Here</a> to configure Log4J.</td></tr></table>
</c:when>
<c:otherwise>
 <html:form action="/logAction.do" method="POST">
 <input type="hidden" name="method" value="logFormAction">
 <input type="hidden" name="log4jStatus" value="<c:out value="${log4jStatus}"/>"/>
 
<span class="errorText"><html:errors/></span>

 <table width="100%" class="spyBorder" border="0" align="left" cellpadding="0" cellspacing="0">

 <tr>
 <td colspan="2"><table width="100%" border="0" align="left" cellpadding="5" class="botborder" cellspacing="0">

 <c:if test="${!empty successMsg}">

 <tr align="center">
 <td align="center" colspan=5 class="responseText"><img src="/webclient/common/images/tick.gif" hspace="4"><c:out
 value="${successMsg}"/></td>
 </tr>

 </c:if>

<tr class="header2Bg">
 <td><span class="boldText"><fmt:message key="webclient.admin.logging.loggingform.filename"/></span></td>
 <td><span class="boldText"><fmt:message key="webclient.admin.logging.loggingform.maxlines"/></span></td>
 <td><span class="boldText"><fmt:message key="webclient.admin.logging.loggingform.filecount"/></span></td>
 <td><span class="boldText"><fmt:message key="webclient.admin.logging.loggingform.maxlinescached"/></span></td>
 <td><span class="boldText"><fmt:message key="webclient.admin.logging.loggingfrom.loglevel"/></span></td>
 </tr>
 <c:forEach var="file" items="${LoggingBean.fileName}" varStatus="status">
 <c:if test = "${file != 'nmsout.txt' && file != 'nmserr.txt' && file != 'stdout.txt' && file != 'stderr.txt'}">
 <tr>
 <td>
 <c:choose>
 <c:when test="${file == 'nmsout.txt' || file == 'nmserr.txt'}">
 <c:out value="${file}"/>
 <input type=hidden name="fileName" value="<c:out value="${file}"/>">
 </c:when>
 <c:otherwise>
 <input type=hidden name="fileName" value="<c:out value="${file}"/>">
 <span class="text">
         <c:out value="${file}"/>
         </span>
 </c:otherwise>
 </c:choose>
 </td>
 <td>
 <p>
 <select  style="width:110" styleClass="logFormStyle" name="maxLines">
 <option value='5000' 
 <c:if test="${LoggingBean.maxLines[status.index] == '5000'}">selected</c:if>>
 5000
 </option>
 <option value='10000' 
 <c:if test="${LoggingBean.maxLines[status.index] == '10000'}">selected</c:if>>
 10000
 </option>
 <option value='20000' 
 <c:if test="${LoggingBean.maxLines[status.index] == '20000'}">selected</c:if>>
 20000</option>
 </select>
 </td>
 <td>
 <input type="text" name="fileCount"  class="logFormStyle" value="<c:out value='${LoggingBean.fileCount[status.index]}'/>">
 </td>
 <td>
 <c:choose>
 <c:when test="${file != 'stdout.txt' && file != 'stderr.txt'}">
<input type="text" name="cache"  class="logFormStyle" value="<c:out value='${LoggingBean.cache[status.index]}'/>">
 </c:when>
 <c:otherwise>
 <input type=hidden name="cache" value="0">&nbsp;
 </c:otherwise>
 </c:choose>
 </td>

 <td>
<c:choose>
<c:when test="${file != 'nmsout.txt' && file != 'nmserr.txt' && file != 'stderr.txt' && file != 'stdout.txt'}">
  <select style="width:110" class="logFormStyle" name="logLevel" value="${LoggingBean.logLevel[status.index]}">
   <option value='1' <c:if test="${LoggingBean.logLevel[status.index] == '1'}">selected</c:if>>Summary</option>
   <option value='2' <c:if test="${LoggingBean.logLevel[status.index] == '2'}">selected</c:if>>Intermediate</option>
   <option value='3' <c:if test="${LoggingBean.logLevel[status.index] == '3'}">selected</c:if>>Verbose</option>
 <option value='4' <c:if test="${LoggingBean.logLevel[status.index] == '4'}">selected</c:if>>Debug</option>
  </select>
 </c:when>
 <c:otherwise>
 <input type=hidden name="logLevel" value="0">&nbsp;
 </c:otherwise>
 </c:choose>
 </td>
 </tr>

</c:if>
 </c:forEach>
 
 <c:forEach var="file" items="${LoggingBean.fileName}" varStatus="status"> 
 <c:if test = "${file == 'nmserr.txt' || file == 'nmsout.txt'}">
 <tr>
 <td class="text">
 <c:choose>
 <c:when test="${file == 'nmsout.txt' || file == 'nmserr.txt'}">

<c:out value="${file}"/>
 <input type=hidden name="fileName" value="<c:out value="${file}"/>">
 </c:when>
 <c:otherwise>
 <input type=hidden name="fileName" value="<c:out value="${file}"/>">
<c:out value="${file}"/>
 </c:otherwise>
 </c:choose>
 </td>
 <td>
 <p>
 <select  style="width:110" styleClass="logFormStyle" name="maxLines">
 <option value='5000'
 <c:if test="${LoggingBean.maxLines[status.index] == '5000'}">selected</c:if>>
 5000
 </option>
 <option value='10000'
 <c:if test="${LoggingBean.maxLines[status.index] == '10000'}">selected</c:if>>
 10000
 </option>
 <option value='20000'
 <c:if test="${LoggingBean.maxLines[status.index] == '20000'}">selected</c:if>>
 20000</option>
 </select>
 </td>
 <td>
 <input type="text" name="fileCount"  class="logFormStyle" value="<c:out value='${LoggingBean.fileCount[status.index]}'/>">
 </td> <td>
 <c:choose>
 <c:when test="${file != 'stdout.txt' && file != 'stderr.txt'}">
 <input type="text" name="cache"  class="logFormStyle" value="<c:out value='${LoggingBean.cache[status.index]}'/>">
 </c:when>
 <c:otherwise>
 <input type=hidden name="cache" value="0">&nbsp;
 </c:otherwise>
 </c:choose>
 </td>
 
 <td>
 <c:choose>
 <c:when test="${file != 'nmsout.txt' && file != 'nmserr.txt' && file != 'stderr.txt' && file != 'stdout.txt'}">
 <select style="width:110" class="logFormStyle" name="logLevel" value="${LoggingBean.logLevel[status.index]}">
 <option value='1' <c:if test="${LoggingBean.logLevel[status.index] == '1'}">selected</c:if>>Summary</option>
 <option value='2' <c:if test="${LoggingBean.logLevel[status.index] == '2'}">selected</c:if>>Intermediate</option>
 <option value='3' <c:if test="${LoggingBean.logLevel[status.index] == '3'}">selected</c:if>>Verbose</option>
 <option value='4' <c:if test="${LoggingBean.logLevel[status.index] == '4'}">selected</c:if>>Debug</option>
 </select>
 </c:when>
 <c:otherwise>
 <input type=hidden name="logLevel" value="0">&nbsp;<span class=textSmall><a href="/admin/LogParametersAction.do?fileName=<c:out value="${file}"/>"><fmt:message key='webclient.admin.logging.loggingfrom.linktext'/>&nbsp;<c:out value="${file}"/></a></span>
 </c:otherwise>
 </c:choose>
 </td> 
 </tr>
 </c:if>   
 </c:forEach>
 
 
<c:forEach var="file" items="${LoggingBean.fileName}" varStatus="status">
<c:if test = "${file == 'stderr.txt' || file == 'stdout.txt'}">
<tr>
<td>
<c:choose>
<c:when test="${file == 'nmsout.txt' || file == 'nmserr.txt'}">
<a href="/admin/LogParametersAction.do?fileName=<c:out value="${file}"/>"><c:out value="${file}"/></a>
<input type=hidden name="fileName" value="<c:out value="${file}"/>">
</c:when>
<c:otherwise>
<input type=hidden name="fileName" value="<c:out value="${file}"/>">
<span class="text">
<c:out value="${file}"/>
</span>
</c:otherwise>
</c:choose>
</td>
<td>
<p>
<select  style="width:110" styleClass="logFormStyle" name="maxLines">
<option value='5000'
<c:if test="${LoggingBean.maxLines[status.index] == '5000'}">selected</c:if>>
5000
</option>
<option value='10000'
<c:if test="${LoggingBean.maxLines[status.index] == '10000'}">selected</c:if>>
10000
</option>
<option value='20000'
<c:if test="${LoggingBean.maxLines[status.index] == '20000'}">selected</c:if>>
20000</option>
</select>
</td>
<td>
<input type="text" name="fileCount"  class="logFormStyle" value="<c:out value='${LoggingBean.fileCount[status.index]}'/>">
</td> 
<td>
<c:choose>
<c:when test="${file != 'stdout.txt' && file != 'stderr.txt'}">
<input type="text" name="cache"  class="logFormStyle" value="<c:out value='${LoggingBean.cache[status.index]}'/>">
</c:when>
<c:otherwise>
<input type=hidden name="cache" value="0">&nbsp;
</c:otherwise>
</c:choose>
</td>

<td>
<c:choose>
<c:when test="${file != 'nmsout.txt' && file != 'nmserr.txt' && file != 'stderr.txt' && file != 'stdout.txt'}">
<select style="width:110" class="logFormStyle" name="logLevel" value="${LoggingBean.logLevel[status.index]}">
<option value='1' <c:if test="${LoggingBean.logLevel[status.index] == '1'}">selected</c:if>>Summary</option>
<option value='2' <c:if test="${LoggingBean.logLevel[status.index] == '2'}">selected</c:if>>Intermediate</option>
<option value='3' <c:if test="${LoggingBean.logLevel[status.index] == '3'}">selected</c:if>>Verbose</option>
<option value='4' <c:if test="${LoggingBean.logLevel[status.index] == '4'}">selected</c:if>>Debug</option>
</select>
</c:when>
<c:otherwise>
<input type=hidden name="logLevel" value="0">&nbsp;<%--<span class=textSmall><a href="/admin/LogParametersAction.do?fileName=<c:out value="${file}"/>"><fmt:message key='webclient.admin.logging.loggingfrom.linktext'/>&nbsp;<c:out value="${file}"/></a></span>--%>
<%--/c:otherwise>
</c:choose>
</td>
</tr>
</c:if>
</c:forEach>

<tr> 
<td align="right">&nbsp;</td>
<td colspan="5">

<input type="submit" name="Submit" class="button" value="<fmt:message key='webclient.admin.logging.button.submit'/>">
<input type="button" name="Cancel" class="button" value="<fmt:message key='webclient.admin.logging.button.cancel'/>" onclick="history.back();">
 <input type="reset" name="Reset" class="button" value="<fmt:message key='webclient.admin.logging.button.reset'/>">
 </td>
 </td>
 </tr>
 </table></td>
 </tr>
 </table>
 </html:form>
</c:otherwise>
</c:choose>
</div>
--%>


<%-- ********************************************************************************************* --%>

<div id="spyPropertyConfigurator" class="hide" style="width: 97%;">
<c:choose>
<c:when test="${SPYStatus=='false'}">
<table border="1" style="width: 100%; height: 400px;"><tr class="reportsOddRow"><td align="center" class="boldText"><fmt:message key="webclient.admin.runtimespy.disableConfigure"/><br><br><fmt:message key="webclient.admin.runtimespylog.configure"/></td></tr></table>
</c:when>

<c:otherwise>

<html:form action="/spyAction.do" method="POST" onsubmit="return checkData()">
<input type=hidden name="includeCategories" value='includeCategories'/>
    <input type=hidden name="excludeCategories" value='excludeCategories' />
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

        <TABLE class="spyBorder" WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>    
        <TD VALIGN=TOP ALIGN=CENTER>
         
	   <TABLE class="spyBorder" WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
           <TR>
           <TD>
                   
              <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=3>
                
              <TR>
              <TD VALIGN=TOP>
                 <TABLE WIDTH=98% BORDER=0 CELLPADDING=4 CELLSPACING=0>
                 <TR><TD WIDTH=100% class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.driver.config"/></span></TD>
                 </TR>
                 </TABLE>
              </TD>
              </TR>

              <TR>
              <TD VALIGN=TOP>
                 <TABLE WIDTH=100% BORDER=0 CELLPADDING=1 CELLSPACING=0>
                 <TR><TD WIDTH=50% ><span class="text"><fmt:message key='webclient.admin.spy.realDriver'/></span></td>
                     <td colspan="3" align="left" valign="top" class="text" nowrap>
                        <html:select styleClass="formStyle" name="configureSPYForm" property="realDriver">
                        <html:option value="com.mysql.jdbc.Driver" >MySql</html:option>
                        <html:option value="oracle.jdbc.driver.OracleDriver" >Oracle</html:option>
			<html:option value="org.postgresql.Driver" >PostgreSQL</html:option>
                        <html:option value="com.sybase.jdbc3.jdbc.SybDriver" >Sybase</html:option>
                        </html:select>
                    </td>
                 </TR>
                 <tr>
        <td height="5" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>
		     <TR><td colspan="3"></td>

                 </TR>
                 </TABLE>
              </TD>
              </TR>
              </TABLE>

           </TD>
           </TR>
         <tr>
        <td height="2" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="2"> </td>
        </tr>

           <TR>
           <TD>        

              <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=3>
              <TR>
              <TD VALIGN=BOTTOM>
                 <TABLE WIDTH=98% BORDER=0 CELLPADDING=4 CELLSPACING=2>
                 <TR><TD WIDTH=100% VALIGN=TOP class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.Categories"/></span></TD>
                 </TR>
                 </TABLE>
              </TD>
              </TR>
              <TR><TD WIDTH=100% VALIGN=TOP>
                 <TABLE WIDTH=400 BORDER=0 CELLPADDING=2 CELLSPACING=0>
                 <TR><TD WIDTH=50% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.includeCategories"/></span></TD>
                     <td colspan="3" align="left" valign="middle" class="text">
                        <html:select styleClass="formStyle" name="configureSPYForm" property="inCategories" multiple="true" size="6">
                           <html:option value="batch" >Batch</html:option>
                           <html:option value="commit" >Commit</html:option>
                           <html:option value="debug" >Debug</html:option>
                           <html:option value="error" >Error</html:option>
                           <html:option value="info" >Info</html:option>
                           <html:option value="result" >Result</html:option>
			   <html:option value="resultset" >ResultSet</html:option>
                           <html:option value="rollback" >Rollback</html:option>
                           <html:option value="statement" >Statement</html:option>
                        </html:select>
                     </td>
                 </TR>
                 <TR><TD WIDTH=50% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.excludeCategories"/></span></TD>
                     <td colspan="3" align="left" valign="middle" class="text">
                        <html:select styleClass="formStyle" size="6" name="configureSPYForm" property="exCategories" multiple="true">
                           <html:option value="batch" >Batch</html:option>
                           <html:option value="commit" >Commit</html:option>
                           <html:option value="debug" >Debug</html:option>
                           <html:option value="error" >Error</html:option>
                           <html:option value="info" >Info</html:option>
                           <html:option value="result" >Result</html:option>
			   <html:option value="resultset" >ResultSet</html:option>
                           <html:option value="rollback" >Rollback</html:option>
                           <html:option value="statement" >Statement</html:option>
                        </html:select>

                     </td>
                 </TR>
                 </TABLE>
                </TD>
              </TR>
              </TABLE>
              <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=2>
                 <TR>
                 <TD>
                     <TABLE WIDTH=97% BORDER=0 CELLPADDING=4 CELLSPACING=2>
                        <TR><TD WIDTH=90% VALIGN=TOP class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.reloadProperties"/></span></TD>
                        </TR>
                     </TABLE>
                 </TD>
                 </TR>
                 <TR>
                 <TD>
                     <TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0>
                                         <tr>
        <td height="5" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>
                        <TR><TD WIDTH=49% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.reloadInterval"/></span></TD>
                            <td colspan="3" align="left" valign="middle" class="text"><html:text styleClass="formStyle" name="configureSPYForm" property="reloadInterval" /> Sec</td>
                        </TR>
                     </TABLE>
                </TD>
                </TR>
        
              </TABLE>
                
          </TD>
          </TR>
          </TABLE>
          </TD>

          <TD>
          <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
          <TR>
          <TD>
          <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=0>
        
                     <TR>
                     <TD ALIGN=CENTER>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=4 CELLSPACING=2>
                <TR><TD WIDTH=100% class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.log"/></span></TD>        
                </TR>      
             </TABLE>
             </TD>
             </TR>
             <TR>
             <TD>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0>
                <TR><TD WIDTH=44%><html:checkbox name="configureSPYForm" property="enableLog" onclick="javascript:checkLogs()"/><span class="text"><bean:message key="webclient.admin.spy.enableLog"/></span></TD>
                </TR>

                <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.logFilePath"/></span></TD>
                    <td><html:text styleClass="formStyle" name="configureSPYForm" property="logPath" /></td>
                </TR>
	        <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.MaxFileBackUp"/></span></TD>
                    <td><html:text styleClass="formStyle" name="configureSPYForm" property="FileBackUp" /></td>
                </TR>


		
             </TABLE>         
          </TD>
          </TR>
          </TABLE>        
          </TD>
          </TR>
          <TR>
          <TD VALIGN=TOP>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=3>
                <TR>
                <TD>
                   <TABLE WIDTH=100% BORDER=0 CELLPADDING=4 CELLSPACING=2>
                      <TR><TD WIDTH=100% class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.P6Outage"/></span></TD>
                      </TR>
                   </TABLE>
                </TD>
                </TR>
                <TR>
                <TD>
                   <TABLE WIDTH=360 BORDER=0 CELLPADDING=2 CELLSPACING=0>
                      <TR><TD WIDTH=360><html:checkbox name="configureSPYForm" property="enableOutage" onclick="javascript:checkOutage()"/><span class="text"><bean:message key="webclient.admin.spy.enableOutage"/></span></TD>
                      </TR>
                         <tr>
        <td height="5" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>

                      <TR><TD WIDTH=45% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.outageInterval"/></span></TD>
                          <td colspan="3" nowrap align="left" valign="middle" class="text"><html:text styleClass="formStyle" name="configureSPYForm" property="outageInterval" /> Sec</td>
                      </TR>
                   </TABLE>
                </TD>
                </TR>
             </TABLE>
          </TD>
          </TR>
          <TR>
          <TD>
          <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=3>
          <TR>
          <TD>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=4 CELLSPACING=0>
                <TR><TD WIDTH=100% VALIGN=TOP class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.Filter"/></span></TD>
                </TR>
             </TABLE>
          </TD>
          </TR>

          <TR>
          <TD VALIGN=TOP>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0>
 
                <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.includeFilter"/></span></TD>
                    <td colspan="3" align="left" valign="middle" class="text"><html:text styleClass="formStyle" name="configureSPYForm" property="inFilter" /></td>
                  </TR>
                <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.excludeFilter"/></span></TD>
                    <td colspan="3" align="left" valign="middle" class="text"><html:text styleClass="formStyle" name="configureSPYForm" property="exFilter" /></td>
                  </TR>
                <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.sqlExpression"/></span></TD>
                    <td colspan="3" align="left" valign="middle" class="text"> <html:text styleClass="formStyle" name="configureSPYForm" property="sqlExpression" /></td>
                </TR>
                <TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.stringMatcher"/></span></TD>
                    <td colspan="3" align="left" valign="middle" class="text"> <html:text styleClass="formStyle" name="configureSPYForm" property="stringMatcher" /></td>
               </TR>
                <TR><TD COLSPAN="2"></TD></TR>

             </TABLE>
          </TD>
          </TR>
          </TABLE>
          </TD>
          </TR>
         <tr>
        <td height="2" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="2"> </td>
        </tr>

          <TR>
          <TD VALIGN=MIDDLE>
          <TABLE WIDTH=100% BORDER=0 CELLPADDING=3 CELLSPACING=3>
          <TR>
          <TD>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=4 CELLSPACING=0>
                 <TR><TD WIDTH=100% VALIGN=TOP class=header2Bg><span class="text"><b><bean:message key="webclient.admin.spy.StackTrace"/></span></TD>
                 </TR>
             </TABLE>
          </TD>
          </TR>
          
          <TR>
          <TD VALIGN=TOP>
             <TABLE WIDTH=100% BORDER=0 CELLPADDING=4 CELLSPACING=2>
                 <TR><TD WIDTH=44% VALIGN=TOP><html:checkbox name="configureSPYForm" property="enStackTrace" onclick="javascript:checkStack()"/><span class="text"><bean:message key="webclient.admin.spy.stackTrace"/></span></TD>
                 </TR>
                 <TR><TD WIDTH=43% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.stackTraceClass"/></span></TD>
                     <td ><html:text styleClass="formStyle" name="configureSPYForm" property="stackTraceClass" /></td>
                 </TR>
             </TABLE>
          </TD>
          </TR>
          </TABLE>
          </TD>
          </TR>
          </TABLE>
          </TD>

<table class="spyBorder" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr >
<td height="24" colspan="3" align="center" valign="middle" >
<input type="submit" name="configureSPYForm" class="button" value="<fmt:message key='webclient.admin.logging.button.submit'/>" />
 <input type="button" name="Cancel" class="button" value="<fmt:message key='webclient.admin.logging.button.cancel'/>" onclick="history.back()" />
 <input type="reset" name="Reset" class="button" value="<fmt:message key='webclient.admin.logging.button.reset'/>" />

</td>
</tr>
</table>
        </td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
</table>
  </html:form>
</c:otherwise>
</c:choose>
  </div>




  </body>  
   
</html>







