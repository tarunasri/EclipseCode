//$Id: perf.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}

function openWindow(theURL,winName,width,height,parms) 
{ 
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var winParms = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
    if (parms) { winParms += "," + parms; }
    window.open(theURL, winName, winParms);
}


function reloadParent(url)
{
    top.window.opener.location.href = url;
    window.close(); 
}
/*
function AddPO()
{
	location.href="/report/AddPollingObjectValues.do?toPerform=userProperties";
}
function ModifyPO()
{
	location.href="/report/UpdatePollingObjects.do?toPerform=fillUpDetails&list_oid=none";
}
*/
function getPollingObjectDetails(poName)
{
	location.href("/report/ModifyPollingObjects.do?poName="+poName);
}
function DeletePO()
{
    var left = Math.floor( (screen.width - 400) / 2);
    var top = Math.floor( (screen.height - 200) / 2);
    window.open("/perf/DeletePollingObjects.do","Delete_Polling_Objects","height=220,width=400,resizable=no,top="+top+",left="+left);
}

function removePollingObject(index)
{    
    location.href="/perf/DeletePollingObjects.do?reqType=delete&poName="+index;
}




function showStatistics(host)
{
    var url = "/perf/ConfiguredCollection.do?agentName="+host;

    var viewLength = document.pagexform.viewLength.value;
    var isAscending = document.pagexform.isAscending.value;
    var orderByColumn = document.pagexform.orderByColumn.value
    var from = document.pagexform.FROM_INDEX.value; 
    var page = document.pagexform.PAGE_NUMBER.value;
    
    url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&viewLength="+viewLength;

    location.href = url;

}



function performOperation(url, errMsg)
{
    var listViewForm = document.listView;
    var len = listViewForm.elements.length;

    var selectedEntity = '';
    for ( var i=0; i < len; i++)
    {
        formElement = listViewForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedEntity == '')
            {
                selectedEntity = formElement.value;
            }
            else
            {
                selectedEntity += ',' + formElement.value;
            }
        }
    }
	
    if(selectedEntity == '')
    {
        alert(errMsg);
        return;
    }
    var viewLength = document.pagexform.viewLength.value;
    var isAscending = document.pagexform.isAscending.value;
    var orderByColumn = document.pagexform.orderByColumn.value
    var from = document.pagexform.FROM_INDEX.value; 
    var page = document.pagexform.PAGE_NUMBER.value;
    
    url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&selectedEntity=" + selectedEntity+"&viewLength="+viewLength;

    location.href = url;
}
   


function addStatistics(url)
{
    location.href = url;    
}

function modifyStatistics(url, errMsg)
{
    var listViewForm = document.listView;
    var len = listViewForm.elements.length;
    var selectedStatistics = '';
    for ( var i=0; i < len; i++)
    {
        formElement = listViewForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
           
             selectedStatistics = formElement.value;
            break;
            
        }
    }
     if(selectedStatistics == '')
     {
        alert(errMsg);
        return;          
     }
    url = url +"&selectedStatistics=" + selectedStatistics;
    location.href = url;

}

function deleteStatistics(url, errMsg, confirmMsg)
{
    var listViewForm = document.listView;
    var len = listViewForm.elements.length;
    var selectedStatistics = '';
    for ( var i=0; i < len; i++)
    {
        formElement = listViewForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedStatistics == '')
            {
                selectedStatistics = formElement.value;
            }
            else
            {
                selectedStatistics += ',' + formElement.value;
            }
        }
    }
    if(selectedStatistics == '')
    {
        alert(errMsg);
        return;
    }

    var con = confirm(confirmMsg);
    if ( con != true)
    {
        return;
    }
    else
    {
        var viewLength = document.pagexform.viewLength.value;
        var isAscending= document.pagexform.isAscending.value;
        var orderByColumn = document.pagexform.orderByColumn.value;
        var from= document.pagexform.FROM_INDEX.value; 
        var page= document.pagexform.PAGE_NUMBER.value;
        
        url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&selectedStatistics=" + selectedStatistics+"&viewLength="+viewLength;
        //url = url +"&selectedStatistics=" + selectedStatistics;

        location.href = url;
    }
}    

/*
function popupWin(field,action)
{
    var obj = new DateObject(field,action);
    obj.popup();
}


function openAlarmView(url, target)
{
    window.open(url,target);
}

function openAlarmView(url)
{
 top.location.href=url;
}
*/

function selected(index,element)
{    
    var url =element.options[index].value;
    if(url != 'select' && url !='separator')
    {
        location.href = element.options[index].value;
        element.value="select";
    }
    else
    {

    }
}

