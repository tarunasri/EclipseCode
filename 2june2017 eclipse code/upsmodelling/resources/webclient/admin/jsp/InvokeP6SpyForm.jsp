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
	 
			function spyInNewWindow()
			{
				openWindow("/admin/spyLogInNewWindow.do?newWindow=true",'assign','1000','850','resizable=yes');
			}

			function openWindow(theURL,winName,width,height,parms)
			{
				var left = Math.floor( (screen.width - width) / 2);
				var top = Math.floor( (screen.height - height) / 2);
				var winParms = "top=5,left=5,height= 760,width=1000,scrollbars=yes";
				if (parms) { winParms += "," + parms; }
				window.open(theURL, winName, winParms);
			}

			function logData()
			{
				var spyLogFileSize="";
				spyLogFilesSize=document.loadLogsForm.spyFilesWithSize.value;
				var spyLogFileSize=spyLogFilesSize.substring(1,(spyLogFilesSize.length-1));
				var spyFileWithSize=spyLogFileSize.split(',');
				for(var i=0; i<spyFileWithSize.length;i++)
				{
					var logFile=document.loadLogsForm.spyFile.value;
					var spyLogFile=spyFileWithSize[i].split('=');
					if(spyLogFile[0] != "")
					{
						if(trimAll(spyLogFile[0])==logFile)
						{
							if(spyLogFile[1] > 102 )
							{
								var user_selection=confirm("The SPY Log File size is greater than 1 MBytes. File loading may affect the Web NMS performance. Do you want to continue?");
								if(user_selection==false)
								{
									return false;
								}
							}
						}					
					}
				}				
				var connectionText="";
				connectionText=document.loadLogsForm.connectionId.disabled;
				
				if(connectionText == false)
				{
					var connectionId="";
                                	connectionId = document.loadLogsForm.connectionId.value;
                                 	if(!isPositiveInteger(connectionId))
                                 	{
                                	        alert("Please Specify a Positive Numeric value");
                                        	return false;
                                 	}
				}
				var startDateWithTime="";
                                startDateWithTime=document.getElementById('dateField').value;
                                if(startDateWithTime != "")
                                {
                                        dateTimeCheck=isDate(startDateWithTime);
                                        if(dateTimeCheck==false)
                                        {
                                                alert("Please specify a valid Start Time: Format(yyyy-mm-dd hh:mm:ss)");
						return false;
                                        }
					var endDateWithTime="";
	                                endDateWithTime=document.getElementById('dateField1').value;
					if(endDateWithTime != "")
					{
						dateTimeCheck=isDate(endDateWithTime);
	                                        if(dateTimeCheck==false)
        	                                {
                	                                alert("Please specify a valid End Time: Format(yyyy-mm-dd hh:mm:ss)");
                        	                        return false;
                                	        }

						return true;
					}
					else
					{
						alert("The end Time column is null:Please specify the end time");
						return false;
					}
                                }
                                var endDateWithTime="";
                                endDateWithTime=document.getElementById('dateField1').value;
                                if(endDateWithTime != "")
                                {
                                        dateTimeCheck=isDate(endDateWithTime);
                                        if(dateTimeCheck==false)
                                        {
                                                alert("Please specify a valid End Time: Format(yyyy-mm-dd hh:mm:ss)");
						return false;
                                        }
					var startDateWithTime="";
	                                startDateWithTime=document.getElementById('dateField').value;
        	                        if(startDateWithTime != "")
                	                {
						return true;
					}
					else
					{
						alert("The start Time column is null:Please specify the end time");
						return false;
					}
                                }
				return true;
			}
				
			function categoryChange()
			{
				var filterCategories="";
                                filterCategories = document.loadLogsForm.categories.value;
                                if( (filterCategories=="error") || (filterCategories=="debug") || (filterCategories=="info"))
                                {
					alert("The check for value category error working");
                   			document.loadLogsForm.connectionId.disabled=true;
		                        document.loadLogsForm.connectionId.className = 'formStyleDisabled';
					document.loadLogsForm.connectionId.value='';
                                }
                                else
                                {
					document.loadLogsForm.connectionId.disabled = false;
                                        document.loadLogsForm.connectionId.className = 'formStyle';

                                }

                                        return true;
			}


			function isDate(str)
                        {
                                /***************************************************************
                                input  : str
                                purpose : To check if given str is in date format
                                output  : true or false
                                ***************************************************************/
                                var objRegExp = /\b\d{4}[\/-]\d{2}[\/-]\d{2}[\/ ]\d{2}[\/:]\d{2}[\/:]\d{2}\b/;

                                return objRegExp.test(str);
                        }


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
			document.configureSPYForm.excludeCategories.value = selectedExValue;	
			var enableOutage="";
        	        enableOutage=document.configureSPYForm.enableOutage.checked;
		        if(document.configureSPYForm.realDriver.value==""){	
				alert("Please Specify a Driver name");
				return false;	
				}
			else if(document.configureSPYForm.logPath.value==""){
				alert("Please Specify a logPath");
				return false;
			}
			else if(enableOutage == true)
                        {
                        	 var outageInterval="";
	                         outageInterval = document.configureSPYForm.outageInterval.value;
        	                 if(!isPositiveInteger(outageInterval))
                	         {
                        	        alert("Please Specify a Positive Numeric value");
	                                return false;
        	                 }
			}	
			else{
				return true;
			}			
		}

		function returnData(NCategories, XCategories, OutageCheck, StackCheck, LogCheck, ReloadCheck)
		{
			if(ReloadCheck=="false")
			{
				document.configureSPYForm.enableReload.checked=false;
				document.configureSPYForm.reloadInterval.className='formStyleDisabled';
				document.configureSPYForm.reloadInterval.disabled=true;
			}
			else
			{
				document.configureSPYForm.enableReload.checked=true;
                                document.configureSPYForm.reloadInterval.className='formStyle';
                                document.configureSPYForm.reloadInterval.disabled=false;
			}
			if(LogCheck=="false")
			{
				document.configureSPYForm.enableLog.checked=false;
				document.configureSPYForm.logPath.className='formStyleDisabled';
				document.configureSPYForm.logPath.disabled=true;
			}
			else
			{
				document.configureSPYForm.enableLog.checked=true;
                                document.configureSPYForm.logPath.className='formStyle';
                                document.configureSPYForm.logPath.disabled=false;
			}
	
			if (OutageCheck=="false")
			{
				document.configureSPYForm.enableOutage.checked=false;
				document.configureSPYForm.outageInterval.className='formStyleDisabled';
				document.configureSPYForm.outageInterval.disabled=true;
			}	
			else
			{
				document.configureSPYForm.enableOutage.checked=true;
                                document.configureSPYForm.outageInterval.className='formStyle';
                                document.configureSPYForm.outageInterval.disabled=false;
			}
			if (StackCheck=="false")
			{
				document.configureSPYForm.enStackTrace.checked=false;
				document.configureSPYForm.stackTraceClass.className='formStyleDisabled';
				document.configureSPYForm.stackTraceClass.disabled=true;
			}
			else
			{
				document.configureSPYForm.enStackTrace.checked=true;
                                document.configureSPYForm.stackTraceClass.className='formStyle';
                                document.configureSPYForm.stackTraceClass.disabled=false;
			}
			var IncludedCategory = NCategories.split(',');
			var length = IncludedCategory.length;
			
			//include = document.configureSPYForm.includeCategories.value;
			for(var i = 0;i < length;i++)
			{

				var optionsLength = document.configureSPYForm.inCategories.options.length;

				for(var j = 0;j < optionsLength; j++)
				{
					if(IncludedCategory[i] == document.configureSPYForm.inCategories.options[j].value)
					document.configureSPYForm.inCategories.options[j].selected = true;
				}
			}
			

			var ExcludedCategory = XCategories.split(',');
			var length = ExcludedCategory.length;
			for(var i = 0;i < length;i++)
                        {

                                var optionsLength = document.configureSPYForm.exCategories.options.length;
                                for(var j = 0;j < optionsLength; j++)
                                {
                                        if(ExcludedCategory[i] == document.configureSPYForm.exCategories.options[j].value)
                                        document.configureSPYForm.exCategories.options[j].selected = true;
                                }
                        }


		return true;
		}

		function checkReload()
                {
        	        var enableReload="";
                        enableReload=document.configureSPYForm.enableReload.checked;
                        if(enableReload==false)
                        {
				
                                document.configureSPYForm.reloadInterval.disabled=true;
				document.configureSPYForm.reloadInterval.className='formStyleDisabled';
				document.configureSPYForm.reloadInterval.value='';
                        }
                        else
			{
                                document.configureSPYForm.reloadInterval.disabled=false;
				document.configureSPYForm.reloadInterval.className='formStyle';
			}
                        return true;
                }
		function checkLogs()
                {
	                var enableLog="";
                        enableLog=document.configureSPYForm.enableLog.checked;
                        if(enableLog==false)
                        {
                                document.configureSPYForm.logPath.disabled=true;
                                document.configureSPYForm.logPath.className='formStyleDisabled';
                        }
                        else
                        {
                                document.configureSPYForm.logPath.disabled=false;
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
		function ViewDetails()
		{
			document.getElementById('configureSPYForm').className='hide';
		        document.getElementById('loadLogsForm1').className='';
			document.getElementById('viewLogTab').className='';
			document.getElementById('configureTab').className='hide';
		}
		
		function ConfigureSPY()
		{
			document.getElementById('configureSPYForm').className='';
                        document.getElementById('loadLogsForm1').className='hide';
			document.getElementById('viewLogTab').className='hide';
                        document.getElementById('configureTab').className='';		
		}
		
		function wrapChange()
		{
			var enableWrap="";
			enableWrap = document.loadLogsForm.wordWrap.checked;
			if(enableWrap == false)
			{
				document.getElementById('wrapped').className='';
				document.getElementById('nowrapped').className='hide';
			}
			else
			{
				document.getElementById('wrapped').className='hide';
				document.getElementById('nowrapped').className='';
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

</script>
	
    <body onload="return returnData('<c:out value="${inHidden}"/>','<c:out value="${outHidden}"/>','<c:out value="${Outage}"/>','<c:out value="${StackTrace}"/>','<c:out value="${Log}"/>','<c:out value="${Reload}"/>')"> 

<br>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="10">&nbsp;</td>
      <td height="25" valign="middle"><span class="header1"><fmt:message key='webclient.admin.spy.config'/></span></td>
    </tr>
    <tr> 
      <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
    </table>

<br>

<TABLE WIDTH="100%" HEIGHT=60% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
        <td height="5" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>
	<tr><td width="2"></td><td align="left">	
    <table class="bannerbox" border=0 cellspacing="0" cellpadding="0" height="100%" width="100%" align="left">
    <tr class="bannerbox"><td colspan="4" height="6"></td></tr>	
    <tr class="bannerbox" id="viewLogTab" height="25">
    <td width="2%">&nbsp;</td>
    <td  width="15%" class="menuOnBg" valign="middle" align="center"><span class="tabTextSel">Log Viewer<span></td>
    <td width="15%" class="menuOff" valign="middle" align="center"><a href="javascript:ConfigureSPY()" class="tabTextUnSel">Configuration</td>
    <td width="68%">&nbsp;</td>
    </tr>

    <tr id="configureTab" height="25" class="hide">
    <td width="2%">&nbsp;</td>
    <td class="menuOff" width="15%" valign="middle" align="center"><a href="javascript:ViewDetails()" class="tabTextUnSel">Log Viewer</td>
    <td class="menuOnBg" width="15%" valign="middle" align="center"><span class="tabTextSel">Configuration</span></td>
    <td width="68%">&nbsp;</td>
    </tr>

    </table>
</td></tr><tr><td width="2"></td><td>
<div id="loadLogsForm1">
<html:form action="/getData.do" onsubmit="return logData()">
<input type="hidden" name="spyFilesWithSize" value="<c:out value="${FilesList}"/>"/>
     <TABLE class="spyBorder" ALIGN=CENTER WIDTH="100%" HEIGHT="355" BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
	<td align="right" height="1" nowrap> <html:checkbox name="loadLogsForm" property="wordWrap" onclick="javascript:wrapChange()"/><span class="text"><bean:message key='webclient.admin.spy.wordWrap'/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:choose>
<c:when test="${spyLogInNew == 'false'}">
<a href="javascript:spyInNewWindow()"><img border="0" src="/webclient/common/images/<c:out value="${selectedskin}"/>/newwindow_icon.gif" /></a>&nbsp;<a href="javascript:spyInNewWindow()"><span class="text"><bean:message key='webclient.admin.spy.OpenInNew'/></span></a>
</c:when>
</c:choose>
</td>
	</tr>
	<tr>
	<td align="center" width="100%" valign="top">
	<table width="90%" border=0 cellpadding=0 valign="center" cellspacing=4>
	<tr>
	<td width="2%" nowrap align="left"><span class="text"><fmt:message key='webclient.admin.spy.logfile'/></span></td>
	<td nowrap align="center" ><html:select styleClass="formStyle"  style="width=165px;" name="loadLogsForm" property="spyFile">
	<c:forEach var="list" begin="1" items="${logFiles}">
	<option > <c:out value="${list}"/></option>
	</c:forEach>
	</html:select>
	</td>&nbsp;&nbsp;
	<td colspan="0" width="23%" align="left" nowrap valign="middle">
	<span  class="text"><p align="left" valign="middle" ><fmt:message key='webclient.admin.spy.Categories'/></span></p>
        <td width="40%" align="left" >
        <html:select styleClass="formStyle" style="width=165px;" name="loadLogsForm" property="categories" onchange="javascript:categoryChange()">
        <option value="All" >All</option>
        <option value="batch" >Batch</option>
        <option value="commit" >Commit</option>
        <option value="debug" >Debug</option>
        <option value="error" >Error</option>
        <option value="info" >Info</option>
        <option value="resultset" >ResultSet</option>
        <option value="rollback" >Rollback</option>
        <option value="statement" >Statement</option>
        </html:select> 
	</td>
	</tr>
	<tr width="100%" id="collapsed">
	<td align="left" valign="middle" nowrap><span  class="text"><p align="left" valign="middle" ><fmt:message key='webclient.admin.spy.connection'/></span></p>
	<td width="40%" align="center" >
	<html:text styleClass="formStyle" name="loadLogsForm"  style="width=165px;" property="connectionId" />
	</td>
	<td width="10%" nowrap align="left"></td>
	<td width="10%" nowrap align="center" valign="middle" ></td>
	</tr>
	<tr width="100%" id="collapses">
	<td width="10%" ><span class="text"><fmt:message key='webclient.admin.spy.startTime'/></span></td>
	<td height="30" align="center" nowrap class="bodyText">&nbsp;&nbsp;&nbsp; <input type="text" name="startTime" id="dateField" class="formStyle" size="19">
                <a href="javascript:;"><img src="/webclient/common/images/SteelBlue/cal.gif" border=0 align="absmiddle" id="startTrigger"></a>
                <script type="text/javascript">
                        var today = new Date();
                        Calendar.setup({
                        inputField     :    "dateField",     // id of the input field
                        ifFormat       :    "%Y-%m-%d %H:%M:%S",      // format of the input field
                        showsTime          :    true,
                        button         :    "startTrigger",  // trigger for the calendar (button ID)
                        timeFormat     :    "12",
                        weekNumbers     :    false,
                        align          :    "Bl",           // alignment (defaults to "Bl")
                        singleClick    :    true,
                        dateStatusFunc :function (date)
                        {
                            return date.getTime() > today.getTime() && date.getDate() != today.getDate();
                        }
                        });
        </script> </td>


	<td width="5%" nowrap align="left"><span class="text"><fmt:message key='webclient.admin.spy.endTime'/></span></td>
	<td height="30" align="left" styleClass="formStyle" nowrap class="bodyText"> <input type="text" name="endTime" class="formStyle" id="dateField1" class="txtbox" size="19">
                <a href="javascript:;"><img src="/webclient/common/images/SteelBlue/cal.gif" border=0 align="absmiddle" id="startTrigger"></a>
                <script type="text/javascript">
                        var today = new Date();
                        Calendar.setup({
                        inputField     :    "dateField1",     // id of the input field
                        ifFormat       :    "%Y-%m-%d %H:%M:%S",      // format of the input field
                        showsTime          :    true,
                        button         :    "startTrigger",  // trigger for the calendar (button ID)
                        timeFormat     :    "12",
                        weekNumbers     :    false,
                        align          :    "Bl",           // alignment (defaults to "Bl")
                        singleClick    :    true,
                        dateStatusFunc :function (date)
                        {
                            return date.getTime() > today.getTime() && date.getDate() != today.getDate();
                        }
                        });
        </script> </td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td height="24" colspan="3" align="center" valign="middle" >
	<input type="submit" name="loadLogsForm" class="button" value="<fmt:message key='webclient.admin.logging.button.viewLogs'/>" />
	<input type="reset" name="Reset" class="button" value="<fmt:message key='webclient.admin.logging.button.reset'/>" />
	</td>
	</tr>
	</table>
	</td>
	</tr>

	<tr>
  	<td>
	<table width="100%" border=0 cellpadding=0 cellspacing=0>
	<tr>
	<td colspan="3" align="center" valign="top" class="text" >
	<c:choose>
	<c:when test="${spyLogInNew == 'false'}">	
	<TEXTAREA COLS=95 ROWS=20  name="loadLogsForm" id="wrapped" property="logViews" ><c:out value="${logviews}"/></TEXTAREA>
        <TEXTAREA COLS=95 ROWS=20 wrap=off name="loadLogsForm" id="nowrapped" class="hide" property="logViews" ><c:out value="${logviews}"/></TEXTAREA></td></tr>
	</c:when>
	<c:otherwise>
	<TEXTAREA COLS=115 ROWS=27  name="loadLogsForm" id="wrapped" property="logViews" ><c:out value="${logviews}"/></TEXTAREA>
        <TEXTAREA COLS=115 ROWS=27 wrap=off name="loadLogsForm" id="nowrapped" class="hide" property="logViews" ><c:out value="${logviews}"/></TEXTAREA></td></tr>
	</c:otherwise>
	</c:choose>
	</table>
	</td>
	</tr>
     </TABLE>

  </html:form>
  </div>
<div id="configureSPYForm" class="hide" >
<html:form action="/spyAction.do" method="POST" onsubmit="return checkData()">
<input type=hidden name="includeCategories" value='includeCategories'/>
    <input type=hidden name="excludeCategories" value='excludeCategories' />


     <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
     <TR>
        <TABLE class="spyBorder" WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>	
        <TD VALIGN=TOP ALIGN=CENTER>
           <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
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
                        <html:option value="org.firebirdsql.jdbc.FBDriver" >Firebird</html:option>
                        <html:option value="com.informix.jdbc.IfxDriver" >Informix</html:option>
                        <html:option value="com.ashna.jturbo.driver.Driver" >MsSql</html:option>
			<html:option value="org.gjt.mm.mysql.Driver" >MySql</html:option>
			<html:option value="oracle.jdbc.driver.OracleDriver" >Oracle</html:option>
			<html:option value="solid.jdbc.SolidDriver" >Solid</html:option>
			<html:option value="com.sybase.jdbc2.jdbc.SybDriver" >Sybase</html:option>
			<html:option value="com.timesten.jdbc.TimesTenDriver" >Timesten</html:option>
                        </html:select>
			<span class="mandatory">&nbsp;*</span>
		    </td>
	         </TR>
		 <tr>
        <td height="5" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>

	     	 <TR><TD VALIGN=BOTTOM><span class="mandatory">&nbsp;*</span>&nbsp;&nbsp;<span class="text"><fmt:message key='webclient.admin.spy.mandatoryfield'/></span></TD>
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
			<TR><TD WIDTH=48%><html:checkbox name="configureSPYForm" property="enableReload" onclick="javascript:checkReload()"/><span class="text"><bean:message key="webclient.admin.spy.enableReload"/></span></TD> 
			</TR>
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
		 <tr>
        <td height="2" width="1%"> <img src="/webclient/common/images/spacer.gif"  width="10" height="2"></td>
        <td height="5"> </td>
        </tr>

		<TR><TD WIDTH=44% VALIGN=TOP><span class="text"><bean:message key="webclient.admin.spy.logFilePath"/></span></TD>
                    <td><html:text styleClass="formStyle" name="configureSPYForm" property="logPath" /></td>
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr >
<td height="24" colspan="3" align="center" valign="middle" >
<input type="submit" name="configureSPYForm" class="button" value="<fmt:message key='webclient.admin.logging.button.submit'/>" />
 <input type="button" name="Cancel" class="button" value="<fmt:message key='webclient.admin.logging.button.cancel'/>" onclick="history.back()" />
 <input type="reset" name="Reset" class="button" value="<fmt:message key='webclient.admin.logging.button.reset'/>" />

</td>
</tr>
<br><br>
</table>
</TR>
</TABLE>
  </html:form>
  </div>
</td></tr></table>
  </body>  
   
</html>
