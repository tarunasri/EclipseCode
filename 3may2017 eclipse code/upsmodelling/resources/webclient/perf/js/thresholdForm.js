//$Id: thresholdForm.js,v 1.2 2010/10/29 13:47:12 swaminathap Exp $



function ShowReqTab(divIdToShow)
{
  	if(divIdToShow=="long")
	{
		var idToHide = document.getElementById("pagePercent");
		eval("idToHide.style.display = 'none';");
		var idToHide = document.getElementById("pageString");
		eval("idToHide.style.display = 'none';");
        
        var idToBlock = document.getElementById("pageLongPt");
		eval("idToBlock.style.display = 'block';");

	}
	else if(divIdToShow=="string")
	{
		var idToHide = document.getElementById("pageLongPt");
		eval("idToHide.style.display = 'none';");
		var idToHide = document.getElementById("pagePercent");
		eval("idToHide.style.display = 'none';");
       
        var idToBlock = document.getElementById("pageString");
		eval("idToBlock.style.display = 'block';");

	}
	else if(divIdToShow=="percentage")
	{
	
        var idToHide = document.getElementById("pageString");
		eval("idToHide.style.display = 'none';");
	    var idToBlock1 = document.getElementById("pageLongPt");
		eval("idToBlock1.style.display = 'block';");
        
	    var idToBlock2 = document.getElementById("pagePercent");
		eval("idToBlock2.style.display = 'block';");

	}
}



function loadtheForm()
{
    if (document.ThresholdObject.actionToPerform.value == "showThreshold")
    {
        document.ThresholdObject.actionToPerform.value = "modifyThreshold";
        document.ThresholdObject.toPerform.value    = "modifyThreshold";
    }
    else if(document.ThresholdObject.actionToPerform.value == "addThresholdForm")
    {
       document.ThresholdObject.toPerform.value    = "addThreshold";
       document.ThresholdObject.kind.value="long";
    }
    ShowReqTab(document.ThresholdObject.kind.value);
}

function resetFields()
{

	if(document.ThresholdObject.actionToPerform.value == "addThresholdForm")
	{

	var divIdToShow=ThresholdObject.kind.value;
	ShowReqTab(divIdToShow);

	document.ThresholdObject.name.value="";
	document.ThresholdObject.category.value="";
	document.ThresholdObject.message.value="";
	document.ThresholdObject.clrMessage.value="";
	document.ThresholdObject.severity.selectedIndex=0;
	document.ThresholdObject.thresholdType.selectedIndex=0;
	document.ThresholdObject.thresholdValue.value="";
	document.ThresholdObject.rearmValue.value="";
	document.ThresholdObject.sendClear.selectedIndex=0;
	document.ThresholdObject.triggerSeverity.selectedIndex=0;
	document.ThresholdObject.resetSeverity.selectedIndex=0;
	document.ThresholdObject.allowed.value="";
	document.ThresholdObject.disAllowed.value="";
	document.ThresholdObject.oid.value="";
	document.ThresholdObject.isMultiplePolledData.selectedIndex=0; 
	}
	else
	{
		document.ThresholdObject.reset();
	}
}
