//$Id $

function deleteReports(url)
{
    var editReportsForm = document.editReports;
    var len = editReportsForm.elements.length;
    var selectedEntity = '';
    for ( var i=0; i < len; i++)
    {
        formElement = editReportsForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedEntity == '')
            {
                selectedEntity = formElement.value;
            }
            else
            {
                selectedEntity = selectedEntity+','+formElement.value;
            }
        }
    }
    
    location.href = "/report/CustomizeReports.do?type="+url+"&selectedRows="+selectedEntity;
}

function Preferences(count,period)
{
    location.href="/report/Preferences.do?ReportsLength="+count+"&ReportsPeriod="+period;
}

function Preferences(count,period,indReports,moType,Type,pdName,units)
{
    if(units=='%')
    {
        units="Percentage";
    }
    location.href="/report/Preferences.do?ReportsLength="+count+"&ReportsPeriod="+period+"&reportsPage="+indReports+"&moType="+moType+"&type="+Type+"&pdName="+pdName+"&units="+units;
}

function exportReports(count,period,indReports,moType,type,pdName,units,fileType)
{
    if(units=='%')
    {
        units="Percentage";
    }
	window.open("/report/PDFReports.do?ReportsLength="+count+"&ReportsPeriod="+period+"&reportsPage="+indReports+"&moType="+moType+"&type="+type+"&pdName="+pdName+"&units="+units+"&fileType="+fileType,"PDFFormat","height=500,width=750,resizable=yes,menubar=yes,toolbar=yes,scrollbars=yes");
}

function addReports()
{
    //window.open("/report/AddReports.do","AddReports","height=350,width=450,resizable=no,menubar=no,toolbar=no");
    location.href="/report/AddReports.do";
}
function AddPO()
{
	location.href="/report/AddPollingObjectValues.do?toPerform=userProperties";
}
function ModifyPO()
{
	location.href="/report/UpdatePollingObjects.do?toPerform=fillUpDetails&list_oid=none";
}
function getPollingObjectDetails(poName)
{
	location.href("/report/ModifyPollingObjects.do?poName="+poName);
}
function DeletePO()
{
    var left = Math.floor( (screen.width - 400) / 2);
    var top = Math.floor( (screen.height - 200) / 2);
    window.open("/report/DeletePollingObjects.do","Delete_Polling_Objects","height=180,width=400,resizable=no,top="+top+",left="+left);
}
function removePollingObject(index)
{    
    location.href="/report/DeletePollingObjects.do?reqType=delete&poName="+index;
}
function invokeFaultReport(moType)
{	
	
	var url="/report/FaultReport.do?&moType="+moType+"&selectparent=alert&type=allSeverity&category=AllEvents"	
	document.location.href=url;	  
}

function invokePerfReport(moType)
{
	var perid=document.getElementById("Period");
	rPeriod=perid.options[perid.selectedIndex].value;
	var lenid=document.getElementById("Length");
	rLength=lenid.options[lenid.selectedIndex].value;	
 var url="/report/ReportViewAction.do?selectedTab=report&viewId=reportPage&displayName=Reports&moType="+moType+"&ReportsLength=10&ReportsPeriod=Today";
 document.location.href=url;
}
function invokePROnClick(moType,type,pdName,units,periodId,LengthId)
{
	if(units=='%')
	{
		units="Percentage";
	}
	var perid=document.getElementById(periodId);
	rPeriod=perid.options[perid.selectedIndex].value;
	var lenid=document.getElementById(LengthId);
	rLength=lenid.options[lenid.selectedIndex].value;	
	var url="/report/ReportViewAction.do?selectedTab=report&viewId=reportPage&displayName=Reports&moType="+moType+"&ReportsLength="+rLength+"&ReportsPeriod="+rPeriod+"&type="+type+"&pdName="+pdName+"&units="+units;	
	 document.location.href=url;	
}
function invokePreviousReport(name,moType,type,category,periodId,lengthId)
{
	var perid=parent.document.getElementById(periodId);
	var period=perid.options[perid.selectedIndex].value;
	var lenid=parent.document.getElementById(lengthId);
	var rLength=lenid.options[lenid.selectedIndex].value;	
	if(period=='Today')
	{
		period='Hour';
	}
	if(period=='Last 7 days')
	{
		period='Week';
	}
	if(period=='Last 30 days')
	{
		period='Month';
	}
	if(type=='allSeverity'||type=='deviceSeverity')
	{
		type='allSeverity';
	}
	else if(type=='allCategory'||type=='deviceCategory')
	{
		type='allCategory';
	}

	var url="/report/FaultReport.do?selectparent=alert&type="+type+"&category="+category+"&time="+period+"&count="+rLength+"&moType="+moType+"&name="+name;	
	parent.document.location.href=url;	

	
	
}
function invokeFROnClick(name,moType,type,category,periodId,lengthId,source,criticality)
{
	
	var perid=document.getElementById(periodId);	
	var period=perid.options[perid.selectedIndex].value;	
	var lenid=document.getElementById(lengthId);	
	var rLength=lenid.options[lenid.selectedIndex].value;
	
	
	if(period=='Today')
	{
		period='Hour';
	}
	if(period=='Last 7 days')
	{
		period='Week';
	}
	if(period=='Last 30 days')
	{
		period='Month';
	}

	var url="/report/FaultReport.do?selectparent=alert&type="+type+"&category="+category+"&time="+period+"&count="+rLength+"&moType="+moType+"&name="+name+"&source="+source+"&criticality="+criticality;
	
	
	document.location.href=url;	
	
	
}
//To handle FaultReports Specific
function getCategoryReports(per,cat,moType,name,severityLevel)
{
	category=cat;

	var url="/report/FaultReport.do?requestType=AJAX&category=devicespecific&selectparent=alert&type=allCategoryVsSeverity&time="+per+"&evtcategory="+cat+"&moType="+moType+"&name="+name+"&criticality="+severityLevel;
	var uri = encodeURI(url);
	getHtml(uri,"showPopUp");	

}
function setDefaultValues(etype,rows,rowscount)
{	  

	var type=etype;
	if(type=='allSeverity' || type=='allCategory'||type=='deviceCategory' ||type=='deviceSeverity' )
	{
		var detailsid=document.getElementById("inputform");
		if(detailsid!=null)
		{

			var detailsForm=detailsid.details;

			if(!detailsForm[0].checked &&! detailsForm[1].checked )
			{
				detailsForm[0].checked=true;
			}
			if(detailsForm[0].checked)
			{
				var srcid=document.getElementById("source");
				srcid.value='';
			}
		}
	}

	if(type=='completecategory')
	{
		var ifrm=parent.document.getElementById("reportFrame");
		var rowsString=rows;
		var rows=parseInt(rowsString);
		if(rows<11)
		{

			ifrm.style.height="370px";
		}
		else
		{				
			var ht=rowscount+"px";			
			ifrm.style.height=ht;

		}

	}

}
function getFaultReport(value,moType)
{
	//var name="<c:out value='${name}'/>";
	if(value=="allCategory")
	{
			var name="webclient.report.event.categoryvstime";
	}
	if(value=="allSeverity")
	{
			var name="webclient.report.event.severityvstime";		
	}
	//var url="/report/FaultReport.do?requestType=AJAX&category=AllEvents&selectparent=alert&time="+time+"&type=all"+group;
	var url="/report/FaultReport.do?category=AllEvents&selectparent=alert&time="+time+"&type="+value+"&moType="+moType+"&name="+name;	
	parent.document.location.href=url;
}


function getReport(option)
{
	time=option;
	if(selected=='AllEvents')
	{
		getFaultReport(selected);

	}
	else
	{
		getDeviceFaultReport(document.getElementById("inputform").source.value);
	}
}

function getDeviceFaultReport(src,type,moType)
{




	if (document.getElementById("inputform").details[1].checked)
	{
		if(src=='')
		{
			alert("Please enter valid Source name");
			return;
		}

		selected = document.getElementById("inputform").details[1].value;
		type="device"+type;
	}
	else
	{
		selected=document.getElementById("inputform").details[0].value;
		type="all"+type;
	}



	if(selected=='AllEvents')
	{

		getFaultReport(type,moType);
	}
	else{

		//var name="<c:out value='${name}'/>";
		if(type=="deviceCategory")
		{
			var name="webclient.report.event.categoryvstime";
		}
		if(type=="deviceSeverity")
		{
			var name="webclient.report.event.severityvstime";
		}
		var url="/report/FaultReport.do?&category=devicespecific&selectparent=alert&type="+type+"&time="+time+"&source="+src+"&moType="+moType+"&name="+name;


		//var ifrm=parent.document.getElementById("");
		//ifrm.style.height="400px";

		//ifrm.src=url;
		parent.document.location.href=url;

		//getHtml(url,"getSevCatReport");

	}
}
function getSevCatReport(response)
{

	var divele=document.getElementById("sevCatReport");
	divele.innerHTML=reponse;

}
function validateForm(source)
{

	if(source=='')

	{
		if (document.getElementById("inputform").details[1].checked)
		{
			alert("Please enter valid Source name");
			return false;
		}

	}

	return true;

}


function setDeviceSpecific(textForm)
{
	var checkStatus=document.getElementById("inputform").details[1].checked;	  

	if (!checkStatus)
	{

		document.getElementById("inputform").details[1].checked=true;

	}

	if(textForm.value=='enter single device...')
	{
		textForm.value='';
	}

}
function exportPDF(count,period,moType,pdName,type,units)
{

	if(moType == 'Events')
	{
		var catText = null;
		var catTextId = document.getElementById("catText");
		var url = "/report/ExportPDF.do?method=eventsTab&type="+moType;
		if(catTextId != null)
		{
			url = "/report/ExportPDF.do?method=eventsTab&type="+moType+"&catText="+catTextId.innerHTML;
		}

		window.open(url);
	}
	else
	{
		if(units == '%')
		{
			units = 'Percentage';
		}
		var url = "/report/ExportPDF.do?method=reportsTab&count="+count+"&period="+period+"&moType="+moType+"&type="+type+"&pdName="+pdName+"&units="+units;
		window.open(url);

	}
}
function printView(count,period,moType,pdName,type,units)
{
	if(moType == 'Events' )
	{
		var catText = null;
		var catTextId = document.getElementById("catText");
		var url = "/webclient/report/jsp/ShowPrintView.jsp?moType="+moType;
		if(catTextId != null)
		{
			url = "/webclient/report/jsp/ShowPrintView.jsp?moType="+moType+"&catText="+catTextId.innerHTML;
		}
		var uri = encodeURI(url);
		window.open(uri,'PrintWindow','width=850,height=500,menubar=1,scrollbars=1');
	}
	else
	{
		var url = "/report/PrintView.do?method=reportsTab&count="+count+"&period="+period+"&moType="+moType+"&type="+type+"&pdName="+pdName+"&units="+units;
		var uri = encodeURI(url);
		window.open(uri,'PrintWindow','width=850,height=500,menubar=1,scrollbars=1');
	}
}

