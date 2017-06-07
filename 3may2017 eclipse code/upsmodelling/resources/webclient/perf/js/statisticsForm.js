//$Id: statisticsForm.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

function userProperties()
{
    document.StatsPropsForm.toPerform.value="userProperties";
    var url = document.StatsPropsForm.action + "#userProp";
    document.StatsPropsForm.action = url;
    document.StatsPropsForm.submit();
}

function more()
{
    document.StatsPropsForm.toPerform.value="more";
    var url = document.StatsPropsForm.action + "#userProp";
    document.StatsPropsForm.action = url;
    document.StatsPropsForm.submit();
}

function fewer()
{
    document.StatsPropsForm.toPerform.value="fewer";
    var url = document.StatsPropsForm.action + "#userProp";
    document.StatsPropsForm.action = url;
    document.StatsPropsForm.submit();
}

function ShowReqTab1(divIdToShow)
{
    var actiontoperf = document.StatsPropsForm.actionToPerform.value;
	var idToShow = document.getElementById(divIdToShow);
	if(divIdToShow=="pageOneA")
	{
		var idToHide = document.getElementById("pageOneB");
		eval("idToHide.style.display = 'none';");
	}
    else if(divIdToShow=="pageOneB")
    {
        var idToHide = document.getElementById("pageOneA");
		eval("idToHide.style.display = 'none';");

        if(actiontoperf != "addStatisticsForm")
        {
            ShowReqTab2("pageTwoA");
            ShowReqTab3("pageThreeA");
        }
    }
    eval("idToShow.style.display = 'block';");

   
}

function ShowReqTab2(divIdToShow)
{
    var actiontoperf = document.StatsPropsForm.actionToPerform.value;
	var idToShow = document.getElementById(divIdToShow);
	if(divIdToShow=="pageTwoA")
	{
		var idToHide = document.getElementById("pageTwoB");
		eval("idToHide.style.display = 'none';");
	}
    else if(divIdToShow=="pageTwoB")
    {
        var idToHide = document.getElementById("pageTwoA");
		eval("idToHide.style.display = 'none';");
        if(actiontoperf != "addStatisticsForm")
        {
            ShowReqTab1("pageOneA");
            ShowReqTab3("pageThreeA");
        }
    }
    eval("idToShow.style.display = 'block';");

    
}

function ShowReqTab3(divIdToShow)
{
    var actiontoperf = document.StatsPropsForm.actionToPerform.value;
	var idToShow = document.getElementById(divIdToShow);
	if(divIdToShow=="pageThreeA")
	{
		var idToHide = document.getElementById("pageThreeB");
		eval("idToHide.style.display = 'none';");
	}
    else if(divIdToShow=="pageThreeB")
    {
        var idToHide = document.getElementById("pageThreeA");
		eval("idToHide.style.display = 'none';");
        if(actiontoperf != "addStatisticsForm")
        {
            ShowReqTab1("pageOneA");
            ShowReqTab2("pageTwoA");
        }
    }
    eval("idToShow.style.display = 'block';");

  
}


function loadtheForm()
{
    var actiontoperf = document.StatsPropsForm.actionToPerform.value;
    if (actiontoperf == "showStatistics")
    {
        document.StatsPropsForm.actionToPerform.value = "modifyStatistics";
        document.StatsPropsForm.toPerform.value    = "modifyStatistics";
    }
    else if(actiontoperf == "addStatisticsForm")
    {
       document.StatsPropsForm.toPerform.value    = "addStatistics";
       ShowReqTab1("pageOneB");
       ShowReqTab2("pageTwoB");
       ShowReqTab3("pageThreeB");
    }

    var selectedStats = document.StatsPropsForm.selectedThreshold.value;
    if(selectedStats != "")
    {
        var tokeniz = selectedStats.split(",");
        for(var k=0;k<tokeniz.length; k++)
        { 
            var mytoken = tokeniz[k];
            var len = document.StatsPropsForm.thresholdList.options.length;
            for(var i=0; i<len; i++)
            {
                if(document.StatsPropsForm.thresholdList.options[i].value == mytoken )
                {
                    document.StatsPropsForm.thresholdList.options[i].selected = true;
                }
            }
        }
    }   
}

