//$Id: discoveryConfiguration.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

/*function toggleSnmpv3()
{
    if(document.DiscForm.snmpv3Discovery.type=="checkbox" && document.DiscForm.snmpv3Discovery.checked)
    {
        document.DiscForm.v3UserName.disabled=false;
        document.DiscForm.v3UserName.className="formStyleSmall";
        document.DiscForm.v3ContextName.disabled=false;
        document.DiscForm.v3ContextName.className="formStyleSmall";
    }
    else
    {
        document.DiscForm.v3UserName.disabled=true;
        document.DiscForm.v3UserName.className="formStyleSmallDisabled";
        document.DiscForm.v3ContextName.disabled=true;
        document.DiscForm.v3ContextName.className="formStyleSmallDisabled";
    }
}*/
function fillAndSetRediscovery()
{
        
	if( document.ReDiscForm.schedular[0].checked )
		toggleFields('days,hours,dateorday,dateBased,daysOfMonth,daysOfWeek,selectedHour','reDiscInt');
	else
		if( document.ReDiscForm.schedular[1].checked )
		{
			toggleFields('reDiscInt','days,hours,dateorday,dateBased,daysOfMonth,daysOfWeek,selectedHour');
			if(document.ReDiscForm.dateorday[1].checked)
			{
				toggleFields('days,daysOfWeek','dateBased,daysOfMonth');
				if(document.ReDiscForm.dateBased[0].checked)
					toggleFields('daysOfMonth','');
				else
				if(document.ReDiscForm.dateBased[1].checked)
					toggleFields('','daysOfMonth');
				else
					document.ReDiscForm.dateBased[0].selected="true";

				if(document.ReDiscForm.hours[0].checked)
					toggleFields('selectedHour','');
				else
				if(document.ReDiscForm.hours[1].checked)
					toggleFields('','selectedHour');
				else
					document.ReDiscForm.hours[0].selected="true";
	
			}
			else
			if(document.ReDiscForm.dateorday[0].checked)
			{
				toggleFields('dateBased,daysOfMonth','days,daysOfWeek');
				if(document.ReDiscForm.days[0].checked)
					toggleFields('daysOfWeek','');
				else
				if(document.ReDiscForm.days[1].checked)
					toggleFields('','daysOfWeek');
				else
					document.ReDiscForm.days[0].selected="true";

			}
	}
}


function schedular()
{
    document.DiscForm.toPerform.value="schedular";
    document.DiscForm.actionToPerform.value="schedular";
    var url = document.DiscForm.action + "#sch";
    document.DiscForm.action = url;
    document.DiscForm.submit();
}

function hideschedular()
{
    document.DiscForm.toPerform.value="";
    document.DiscForm.actionToPerform.value="";
    var url = "/admin/ConfigDiscParam.do";
    location.href = url;
}


function toggleFields(todisable,toEnable)
{
    var fields = new String(todisable);
    if (fields != '')
    {
        var f = fields.split(",");
        for(i=0; i<f.length;i++)
        {
			for(var j=0;j<document.ReDiscForm.elements.length;j++)
		   	{
            	if(document.ReDiscForm.elements[j].name ==  f[i])
				{
					//alert ("enterted ");
					if(document.ReDiscForm.elements[j].type ==  "text")
		 	   			document.ReDiscForm.elements[j].className="formStyleSmallDisabled";
	         		document.ReDiscForm.elements[j].disabled=true;
				}
	    	}
        }
    }
	
    var to = new String(toEnable);
    if(to != '')
    {
        var x = to.split(",");
        for(j=0;j<x.length;j++)
        {
			for(var k=0;k<document.ReDiscForm.elements.length;k++)
	   		{
            	if(document.ReDiscForm.elements[k].name ==  x[j])
				{
					//alert ("enterted ");
					if(document.ReDiscForm.elements[k].type ==  "text")
		 	   			document.ReDiscForm.elements[k].className="formStyleSmall";
	            	document.ReDiscForm.elements[k].disabled=false;
				}
	    	}
        }
    }
}

function toggleScheduler() {
	var regIntState=document.ReDiscForm.schedular[0].checked
	document.getElementById("regularInterval").style.display=(regIntState)?"block":"none";
	document.getElementById("userScheduler").style.display=(regIntState)?"none":"block";
}

function toggleSchBasedOn() {
	var dayBasedState=document.ReDiscForm.dateorday[0].checked
	document.getElementById("dayBasedLayer").style.display=(dayBasedState)?"block":"none";
	document.getElementById("dateBasedLayer").style.display=(dayBasedState)?"none":"block";
}

function toggleSchFreqncy(basedOn,currVal) {
	if (basedOn=='days') document.getElementById("dow").style.display=(currVal=="selDays")?"block":"none";
	else document.getElementById("customDates").style.display=(currVal=="selectedDates")?"block":"none";
}

function toggleSchHours(currVal) {
	document.getElementById("scheduleHours").style.display=(currVal=="selHours")?"block":"none";
}
