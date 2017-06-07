//$Id: fault.js,v 1.2 2010/10/29 13:47:07 swaminathap Exp $

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

function validateAnnotationMessage(errMsg)
{
    var message = document.annotation.text.value
        if(message == "")
        {
            document.annotation.text.focus();
            alert(errMsg);
            return false;
        }
    document.annotation.submit();
}

function validatePickUp(errMsg)
{
    var who = document.assignForm.assign.value
        if(who == "")
        {
            document.assignForm.assign.focus();
            alert(errMsg);
            return false;
        }
    document.assignForm.submit();
}

function reloadParent(url)
{
    top.window.opener.location.href = url;
    window.close(); 
}

function focusAnnotate()
{
    document.annotation.text.focus();
}

function focusAssign()
{
    document.assignForm.assign.focus();
}

function showAlarms(url, errMsg)
{
    var listViewForm = document.listView;
    var len = listViewForm.elements.length;
    var selectedEvent = '';
    for ( var i=0; i < len; i++)
    {
        formElement = listViewForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedEvent == '')
            {
                selectedEvent = formElement.value;
            }
            else
            {
                selectedEvent += ',' + formElement.value;
            }
        }
    }
    var strr = selectedEvent.split(",");
    var leng = strr.length;
    var entity = '';
    for (var k=1; k < leng; k++)
    {
        if(entity =='')
        {
            entity = strr[k];
        }
        else
        {
            entity += ',' + strr[k];
        }
        k = k+1;
    }
    if(entity == '')
    {
        alert(errMsg);
        return;
    }
    url = url + "&entity=" + entity;
    location.href = url;
    //top.leftFrame.location.href="/Tree.do?selectedTab=Fault&selectedNode=Alerts";
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
   
function deleteAlarm(url, errMsg, confirmMsg)
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
        
        url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&selectedEntity=" + selectedEntity+"&viewLength="+viewLength;
        location.href = url;
    }
}    


function showEvents(url, errMsg)
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

    url = url + "&entity=" + selectedEntity;
    location.href = url;
    //top.leftFrame.location.href="/Tree.do?selectedTab=Fault&selectedNode=Events";
}

function eventAgeController()
{
    document.EventCVForm.cvName.focus();
    var index = document.EventCVForm.eventAgeCategory.selectedIndex;
    var a,b;
    switch(index)
    {
    case 0:		a=1;b=1;c=1;	break;
    case 1:		a=0;b=0;c=0;	break;
    case 2:		a=0;b=0;c=0;	break;
    case 3:		a=0;b=0;c=0;	break;
    case 4:		a=1;b=1;c=0;	break;
    case 5:		a=1;b=1;c=0;	break;
    }
    document.EventCVForm.operator.disabled=a;
    document.EventCVForm.ageValue.disabled=b;
    document.EventCVForm.refreshPeriod.disabled=c;
}

function alarmAgeController()
{
    document.AlarmCVForm.cvName.focus();
    var index = document.AlarmCVForm.alarmAgeCategory.selectedIndex;
    var a,b;
    switch(index)
    {
    case 0:		a=1;b=1;c=1;	break;
    case 1:		a=0;b=0;c=0;	break;
    case 2:		a=0;b=0;c=0;	break;
    case 3:		a=0;b=0;c=0;	break;
    case 4:		a=1;b=1;c=0;	break;
    case 5:		a=1;b=1;c=0;	break;
    }
    document.AlarmCVForm.operator.disabled=a;
    document.AlarmCVForm.ageValue.disabled=b;
    document.AlarmCVForm.refreshPeriod.disabled=c;
}


function popupWin(field,action)
{
    var obj = new DateObject(field,action);
    obj.popup();
}

function assignAlarm(url, errMsg)
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
    url = url + "&entity=" + selectedEntity;
    openWindow(url,'assign','460','185');
}


function openAlarmView(url, target)
{
    window.open(url,target);
}

function openAlarmView(url)
{
 top.location.href=url;
}


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

function eventsFromAlarmDetails(entity)
{
    var url = '/fault/NetworkEvent.do?viewId=Events&entity='+entity;
    location.href = url;
    top.leftFrame.location.href = '/Tree.do?selectedTab=Fault&selectedNode=Events';
}

function pickOrUnpick(url)
{
    var viewLength = document.pagexform.viewLength.value;
    var isAscending = document.pagexform.isAscending.value;
    var orderByColumn = document.pagexform.orderByColumn.value    
    var from = document.pagexform.FROM_INDEX.value; 
    var page = document.pagexform.PAGE_NUMBER.value;
    url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&viewLength="+viewLength;

    location.href = url;
}
