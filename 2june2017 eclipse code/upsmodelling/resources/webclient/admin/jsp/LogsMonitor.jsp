<!--$Id: LogsMonitor.jsp,v 1.8 2010/10/29 13:46:54 swaminathap Exp $-->
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


			function findInMulSelect(searchString)
			{
				var textFieldValue = searchString;						
				var multipleSelectObj = document.logViewForm.logsArea;						
				var logLine = "";
				var flag=false;
				//Loop through and unsleict ALL values by default so we can show if a match was found
				for (var loop=0; loop < multipleSelectObj.options.length; loop++)
				{
					multipleSelectObj.options[loop].selected = false;
				}
				//Loop through and search line by line
				for (var loop=0; loop < multipleSelectObj.options.length; loop++)
				{
					//To upper case to make the search case insensitive
					logLine = multipleSelectObj.options[loop].text.toUpperCase();							
					if(logLine.search(textFieldValue.toUpperCase()) == -1)
						continue;
					else
					{
						flag=true;
						multipleSelectObj.options[loop].selected = true;
					}
				}			
				if(!flag)
				{
					alert('<fmt:message key="webclient.admin.spy.search.nomatch"/>')
				}			
				return;
			}
			
			function LogsInNew()
                        {
                                openWindow1("/admin/viewlogAction.do?newWindow=true&selectTab=logsView",'assign','1000','850','');
                        }

			function LogsInNewWindow(lines,fileName)
                        {
                                if(lines == null || lines == "")
                                {
                                        LogsInNew();
                                }
                                else
                                {
                                       openWindow1("/admin/getLogFiles.do?newWindow=true&selectTab=logsView&NumberOfLines="+lines+"&logFile="+fileName,'assign','1000','850','');
                                }
                        }

			function spyInNewWindow()
                        {
                                var fileName=document.loadLogsForm.spyFile.value;
                                var connId=document.loadLogsForm.connectionId.value;
                                var Spycategories=document.loadLogsForm.categories.value;
                                var SpystartTime=document.loadLogsForm.startTime.value;
                                var SpyendTime=document.loadLogsForm.endTime.value;

                                openWindow1("/admin/getSpyData.do?newWindow=true&selectTab=p6spyView&spyFileName="+fileName+"&categories="+Spycategories+"&connectionId="+connId+"&startTime="+SpystartTime+"&endTime="+SpyendTime,'assign','1000','850','');
                        }


			function openWindow1(theURL,winName,width,height,parms)
			{
				var left = Math.floor( (screen.width - width) / 2);
				var top = Math.floor( (screen.height - height) / 2);
				var winParms = "top=5,left=5,height= 760,width=1000,scrollbars=yes,resizable=yes";
				if (parms) { winParms += "," + parms; }
				window.open(theURL, winName, winParms);
				return true;
			}
			
			function callSearch(startString,endString)
			{
				
				var str = prompt('<fmt:message key="webclient.admin.spy.string.enter"/>','<fmt:message key="webclient.admin.spy.search.string"/>');
				
				if(str==null||str=='')
				{
					return;
				}
				findInMulSelect(str);
			        //searchString(str,"NMS"+startString,"END_"+endString);
			}

			function searchString(strVal,startString,endString)
			{
			        var bodyText = document.body.innerHTML;
			        if (bodyText.length > 0) 
        			{
					var flag = false;
					var fromIndex = bodyText.indexOf(startString);
					var endIndex = bodyText.indexOf(endString);
			        	var strLength = strVal.length;
										
					while(fromIndex<endIndex)
					{
				                var index = bodyText.indexOf(strVal,fromIndex);
						if(index > 0)
						{
				        	        bodyText=bodyText.substring(0,index)+"<span class=selectionBg>"+strVal+"</span>"+bodyText.substring(index+strLength,bodyText.length);
							fromIndex = index+strLength+24;
							flag=true;
						}
						else
						{
							break;
						}
					}
					if(!flag)
					{
						alert('<fmt:message key="webclient.admin.spy.search.nomatch"/>')
					}
        			}

			        document.body.innerHTML=bodyText;
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
							if(spyLogFile[1] > 1024 )
							{
								var user_selection=confirm('<fmt:message key="webclient.admin.spy.logFile.greaterSize"/>');
								if(user_selection==false)
								{
									return false;
								}
							}
						}					
					}
				}				
				var logFiles="";
				logFiles=document.loadLogsForm.spyFile.value;
				if(logFiles == null || logFiles == "")
				{
					alert('<fmt:message key="webclient.admin.spy.logFiles.message"/>');
					return false;
				}
				var connectionText="";
				connectionText=document.loadLogsForm.connectionId.disabled;
				
				if(connectionText == false)
				{
					var connectionId="";
                                	connectionId = document.loadLogsForm.connectionId.value;
                                 	if(!isPositiveInteger(connectionId))
                                 	{
						alert('<fmt:message key="webclient.admin.spy.idNumeric.format"/>');
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
						alert('<fmt:message key="webclient.admin.spy.startTime.format"/>');
						return false;
                                        }
					var endDateWithTime="";
	                                endDateWithTime=document.getElementById('dateField1').value;
					if(endDateWithTime != "")
					{
						dateTimeCheck=isDate(endDateWithTime);
	                                        if(dateTimeCheck==false)
        	                                {
							alert('<fmt:message key="webclient.admin.spy.endTime.format"/>');
                        	                        return false;
                                	        }

						return true;
					}
					else
					{
						alert('<fmt:message key="webclient.admin.spy.endTimeNull.check"/>');
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
						alert('<fmt:message key="webclient.admin.spy.endTime.format"/>');
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
						alert('<fmt:message key="webclient.admin.spy.endTimeNull.check"/>');
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
			if(document.configureSPYForm.logPath.value==""){
				alert('<fmt:message key="webclient.admin.spy.logPath.empty"/>');
				return false;
			}
			else if(enableOutage == true)
                        {
                        	 var outageInterval="";
	                         outageInterval = document.configureSPYForm.outageInterval.value;
        	                 if(!isPositiveInteger(outageInterval))
                	         {
					alert('<fmt:message key="webclient.admin.spy.outageNumeric.format"/>');
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
		var selectedTab = "";
                var selectedskin = "SteelBlue";
		function InvokeViewer(lines,logFileName,wrap,category,startTime,endTime, selectedTab, skin)
		{
                        selectedskin = skin;
			if(top.window.location.href.indexOf("viewlogAction") != -1 || top.window.location.href.indexOf("getLogFiles") != -1 || selectedTab=="logsView")
			{
				InvokeLogsViewer();	
				if(lines != '')
				{
					document.logViewForm.NumberOfLines.value=lines;
				}
			}
			if(top.window.location.href.indexOf("getSpyData") != -1 || selectedTab=="p6spyView")
			{
				InvokeSPYViewer();
				if(wrap != null && wrap != '')
				{
					document.loadLogsForm.wordWrap.checked = true;
					document.getElementById('wrapped').className='';
					document.getElementById('nowrapped').className='hide';
					document.loadLogsForm.categories.value = category;
					document.loadLogsForm.startTime.value = startTime;
					document.loadLogsForm.endTime.value = endTime;
				}
				else
				{
					document.loadLogsForm.wordWrap.checked = false;
					document.getElementById('wrapped').className='hide';
					document.getElementById('nowrapped').className='';
					document.loadLogsForm.categories.value = category;
                                        document.loadLogsForm.startTime.value = startTime;
                                        document.loadLogsForm.endTime.value = endTime;
				}
			}
		}
		function InvokeSPYViewer()
		{
                    document.getElementById('tab2Left').src="/webclient/common/images/"+selectedskin+"/tabtype1-selLeft1.gif";
                    document.getElementById('tab2Middle').className="tabType1SelBg boldTxt";
                    document.getElementById('tab2Right').src="/webclient/common/images/"+selectedskin+"/tabtype1-selRight1.gif";
                    document.getElementById('tab1Left').src="/webclient/common/images/"+selectedskin+"/tabtype1-norLeft1.gif";
                    document.getElementById('tab1Middle').className="tabType1NorBg boldTxt";
                    document.getElementById('tab1Right').src="/webclient/common/images/"+selectedskin+"/tabtype1-norRight1.gif";
                    document.getElementById('LogsViewerDiv').style.display='none';
                    document.getElementById('LogsViewerDisplay').style.display='none';
                    document.getElementById('SPYLogsViewerDiv').style.display='';
		    //document.getElementById('SPYLogContents').style.display='';	
		    var id= document.getElementById('SPYLogContents');  //check if spy log contents is there
		    if(id!=null)
		    {
			    id.style.display='';
		    }
                    selectedTab="LogsViewer"; 
		}
		
		function InvokeLogsViewer()
		{
                    document.getElementById('tab1Left').src="/webclient/common/images/"+selectedskin+"/tabtype1-selLeft1.gif";
                    document.getElementById('tab1Middle').className="tabType1SelBg boldTxt";
                    document.getElementById('tab1Right').src="/webclient/common/images/"+selectedskin+"/tabtype1-selRight1.gif";
                    document.getElementById('tab2Left').src="/webclient/common/images/"+selectedskin+"/tabtype1-norLeft1.gif";
                    document.getElementById('tab2Middle').className="tabType1NorBg boldTxt";
                    document.getElementById('tab2Right').src="/webclient/common/images/"+selectedskin+"/tabtype1-norRight1.gif";
                    document.getElementById('LogsViewerDiv').style.display='';
                    document.getElementById('LogsViewerDisplay').style.display='';
                    document.getElementById('SPYLogsViewerDiv').style.display='none';
//                  document.getElementById('SPYLogContents').style.display='none';
		    var id= document.getElementById('SPYLogContents'); //check if spy log contents is there
		    if(id!=null)
		    {
			    id.style.display='none';
		    }

		    selectedTab="SPYViewer";
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

		function validateFormData()
		{
			if(document.logViewForm.logFile[document.logViewForm.logFile.selectedIndex].value.indexOf("-------")!=-1)
			{
				alert('<fmt:message key="webclient.admin.logs.view.file"/>');
				return false;
			}
		}

</script>

<body onload="javascript:InvokeViewer('<c:out value="${NumberOfLines}"/>','<c:out value="${logFileName}"/>','<c:out value="${wrapText}"/>','<c:out value="${category}"/>','<c:out value="${sTime}"/>','<c:out value="${nTime}"/>','<c:out value="${selectTab}"/>','<c:out value="${selectedskin}"/>');">




<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td><h1>Logs Monitor</h1></td>
    </tr>
    </table>


    <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td valign="bottom" >
    
    <table border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="15px"></td>
    </tr>
    </table>
    </td>
    <td align="left" valign="top" nowrap style="padding-bottom:5px;"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td class="logViewerHLine" width="10"><img id="tab1" src="/webclient/common/images/<c:out value="${selectedskin}"/>/tabtype1-selLeft1.gif" width="15" height="1"></td>
    <td width="6"><img id="tab1Left" src="/webclient/common/images/<c:out value="${selectedskin}"/>/tabtype1-selLeft1.gif" width="6" height="29"></td>
    <td id="tab1Middle" align="center" nowrap class="tabType1SelBg boldTxt"><a href="javascript:InvokeLogsViewer();"><fmt:message key="webclient.admin.runtimelog.view"/></a></td>
    <td width="6"><img id="tab1Right" src="/webclient/common/images/<c:out value="${selectedskin}"/>/tabtype1-selRight1.gif" width="6" height="29"></td>
    <td  class="logViewerHLine"><img src="/webclient/common/images/spacer.gif" width="4" height="1"></td>
    <td width="6"><img id="tab2Left" src="/webclient/common/images/<c:out value="${selectedskin}"/>/tabtype1-norLeft1.gif" width="6" height="29"></td>
    <td id="tab2Middle" class="tabType1NorBg boldTxt" nowrap><a href="javascript:InvokeSPYViewer()"><fmt:message key="webclient.admin.runtimespy.view"/></a></td>
    <td ><img id="tab2Right" src="/webclient/common/images/<c:out value="${selectedskin}"/>/tabtype1-norRight1.gif" width="6" height="29"></td>
    <td class="logViewerHLine" width="90%">&nbsp;</td>
        </tr>
        </table></td>
        <td valign="bottom" ><table border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="15px"></td>
        </tr>
        </table></td>
        </tr>
        
        
        <tr>
        <td class="generalCurveLeft">&nbsp;</td>
            <td valign="top" >
            
            <div id="LogsViewerDiv">

            <html:form action="/getLogFiles.do" onsubmit="return validateFormData()">
            <input type="hidden" name="isNewWindow" value="<c:out value="${spyLogInNew}"/>"/>
                
                <table class="logViewerHeaderBg" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                <td align="right"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                <td nowrap>Show Last </td>
                <td style="padding-left:6px;">

                <html:select styleClass="logViewerSelectBox" name="logViewForm" property="NumberOfLines">
                <option value="50" selected="true">50</option>
                <option value="100" >100</option>
                <option value="150" >150</option>
                <option value="250" >250</option>
                <option value="500" >500</option>
                <option value="1000" >1000</option>
                </html:select></td>
                <td style="padding-left:6px;"><fmt:message key='webclient.admin.logViewer.FileName'/></td>
                <td style="padding-left:6px;">
                
                <html:select styleClass="logViewerSelectBox" name="logViewForm" property="logFile">
                <c:forEach var="list" begin="1" items="${logFileList}">
                <c:choose>
                <c:when test="${list.value eq logFileName}">
                <option value="<c:out value="${list.value}"/>" selected="true"> <c:out value="${list.key}"/></option>
                    </c:when>
                    <c:otherwise>
                    <option value="<c:out value="${list.value}"/>"> <c:out value="${list.key}"/></option>
                        </c:otherwise>
                        
                        </c:choose>

                        </c:forEach>
                        </html:select>
                        </td>
                        <td style="padding-left:6px;"><input type="submit" class="buttonNew" name="Submit" value="View Logs"></td>
                        
                        </tr>
                        </table></td>
                        </tr>
                        </table>
                        
 <div id="LogsViewerDisplay" class="logViewerDiv">
 <table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >

<c:choose>
<c:when test="${empty linesOfFile}">
<c:set var="linenumber" value="1"/>
<c:forEach begin="0" end="21" varStatus="status">
                        <tr>
                <td align="right" valign="top" nowrap class="logViewerNo" ><c:out value="${linenumber}"/></td>
                <td style="padding-left:10px;" nowrap>&nbsp;</td>
              </tr>
    <c:set var="linenumber" value="${linenumber+1}"/>
</c:forEach>
</c:when>
<c:otherwise>
<c:set var="lineno" value="1"/>
<c:forEach var="fileContents" items="${linesOfFile}" varStatus="status">
<c:if test="${fileContents ne ''}">    
        <tr>
                <td align="right" valign="top" nowrap class="logViewerNo" ><c:out value="${lineno}"/></td>
                <td style="padding-left:10px;" ><c:out value="${fileContents}"/></td>
              </tr>
    <c:set var="lineno" value="${lineno+1}"/>
</c:if>
</c:forEach>

</c:otherwise>
</c:choose>

</table>             		 


                     
        </html:form>
	</div>			        

</div>







<div id="SPYLogsViewerDiv" style="display: none;">

<table width="100%" border=0 cellpadding=0 align="center" valign="center" cellspacing=2>
<tr id="SPYLogRow">
<td align="left" valign="top">
<c:choose>
<c:when test="${empty FilesList}">
<table border="0" style="width: 100%; height: 400px;"><tr class="reportsOddRow"><td align="center" class="boldText"><fmt:message key="webclient.admin.spylogfile.empty"/><br><br><fmt:message key="webclient.admin.spylogfile.view"/></td></tr></table>
</c:when>
<c:otherwise>



<html:form action="/getSpyData.do" onsubmit="return logData()">
<input type="hidden" name="spyFilesWithSize" value="<c:out value="${FilesList}"/>"/>
<input type="hidden" name="isNewWindow" value="<c:out value="${spyLogInNew}"/>"/>



<table class="logViewerHeaderBg" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="right"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
<td width="10%" nowrap align="center"><span class="text"><fmt:message key='webclient.admin.spy.logfile'/></span></td>
<td width="15%" nowrap align="center"><html:select styleClass="formStyle"  style="width=165px;" name="loadLogsForm" property="spyFile">

<c:forEach var="list" begin="1" items="${logFiles}">
<option value="<c:out value="${list}"/>"

<c:choose>
<c:when test="${list==logFile}">
selected
</c:when>
</c:choose>

> <c:out value="${list}"/></option>
</c:forEach>
</html:select>
</td>
<td width="3%">&nbsp;</td>
<td width="10%" align="center" valign="middle" nowrap><span  class="text" align="left" valign="middle" ><fmt:message key='webclient.admin.spy.connection'/></span>
<td width="15%" align="center" ><html:text styleClass="formStyle" name="loadLogsForm"  style="width=165px;" property="connectionId" /></td>
<td width="3%">&nbsp;</td>

<td width="15%" nowrap ><span class="text"><fmt:message key='webclient.admin.spy.Categories'/></span></td>
<td width="20%" height="10" align="center" nowrap class="bodyText">
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

<td  width="30%" nowrap align="center" valign="middle" > <input type="submit" name="loadLogsForm" class="buttonNew" value="<fmt:message key='webclient.admin.logging.button.viewLogs'/>" /></td>

</tr>

<tr>

<td width="10%">
<span  class="text"><p align="center" valign="middle" ><fmt:message key='webclient.admin.spy.startTime'/></span></p>
    <td  width="15%" align="center" nowrap>
<input type="text" name="startTime" id="dateField" class="formStyle" size="19">                                                                                                  
</td>
<td align="center" width="3%"> <a href="javascript:;"><img src="/webclient/common/images/SteelBlue/cal.gif" border=0 align="absmiddle" id="startTrigger"></a>                                                                        <script type="text/javascript">
	    var today = new Date();
	    Calendar.setup({
	    inputField     :    "dateField", 
	    ifFormat       :    "%Y-%m-%d %H:%M:%S",
	    showsTime          :    true, 
	    button         :    "startTrigger",
	    timeFormat     :    "12", 
	    weekNumbers     :    false,
	    align          :    "Bl",
	    singleClick    :    true,
	    dateStatusFunc :function (date)
	    {
	       return date.getTime() > today.getTime() && date.getDate() != today.getDate();
	    } 
	    });
    </script></td>
<td width="10%" nowrap align="center"><span class="text"><fmt:message key='webclient.admin.spy.endTime'/></span></td>                                                     
 <td  width="15%" align="center" styleClass="formStyle" nowrap class="bodyText"> <input type="text" name="endTime" class="formStyle" id="dateField1" class="txtbox" size="19"></td>
<td align="center" width="3%"> 	<a href="javascript:;"><img src="/webclient/common/images/SteelBlue/cal.gif" border=0 align="absmiddle" id="startTrigger1"></a>
	<script type="text/javascript">
		var today = new Date();
		Calendar.setup({
		inputField     :    "dateField1",
		ifFormat       :    "%Y-%m-%d %H:%M:%S",
		showsTime          :    true,
		button         :    "startTrigger1",
		timeFormat     :    "12",
		weekNumbers     :    false,
		align          :    "Bl",
		singleClick    :    true,
		dateStatusFunc :function (date)
		{
		    return date.getTime() > today.getTime() && date.getDate() != today.getDate();
		}
		});
</script> </td>
                </tr>
              </table>
</td></tr></table>
<div id="SPYLogContents" style="display: none;" class="logViewerDiv">
<table width="100%" border=0 cellpadding=0 cellspacing=0>
<tr>
<td colspan="3" align="center" valign="top" class="text" >
 <table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
<c:choose>
<c:when test="${empty logviews}">
<c:set var="linenumber" value="1"/>
<c:forEach begin="0" end="21" varStatus="status">
        <tr>
                <td align="right" valign="top" nowrap class="logViewerNo" ><c:out value="${linenumber}"/></td>
                <td style="padding-left:10px;" nowrap>&nbsp;</td>
              </tr>
    <c:set var="linenumber" value="${linenumber+1}"/>
</c:forEach>
</c:when>
<c:otherwise>
<c:set var="linenumber" value="1"/>
<c:forEach var="fileContents" items="${logviews}" varStatus="status">
<c:if test="${fileContents ne ''}">    
        <tr>
                <td align="right" valign="top" nowrap class="logViewerNo" ><c:out value="${linenumber}"/></td>
                <td style="padding-left:10px;"><c:out value="${fileContents}"/></td>
              </tr>
    <c:set var="linenumber" value="${linenumber+1}"/>
</c:if>
</c:forEach>
</c:otherwise>
</c:choose>
</table>
</td></tr>
</table>

</div>
</html:form>




</c:otherwise>
</c:choose>
</td>
</tr>
</table>
</div>



















</td>
    <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        </table>  
</body>  
   
</html>







