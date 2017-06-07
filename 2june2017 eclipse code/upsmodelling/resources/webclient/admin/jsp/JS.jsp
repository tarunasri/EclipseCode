<!--$Id: JS.jsp,v 1.2 2007/09/14 09:51:46 gnanasekar Exp $-->
<meta http-equiv="pragma" content="no-cache">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script>
function openGraphWindow(theURL,winName,width,height,parms)
{
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var winParms = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width +",scrollbars=yes";
    if (parms) { winParms += "," + parms; }
    window.open(theURL, winName, winParms);
}

function openReportInNewWindow(theURL,winName,width,height,parms)
{
	
    var w = Math.floor(screen.width * .97);
    var h = Math.floor(screen.height * .97);
    var left = ( (screen.width - w) / 2);
    var top = ( (screen.height - h) / 2);
    var winParms = "top=" + top + ",left=" + left + ",height=" + h+ ",width=" + w+",scrollbars=yes";
    if (parms) { winParms += "," + parms; }
    window.open(theURL, winName, winParms);
}

function noFunction()
{
   alert("We have disabled this feature for the Online Demo. This feature is available when you download and install the software for evaluation or in production.");
return false;
}
function noLinksFunction()
{
   alert("We have disabled this feature for the Online Demo. This feature is available when you download and install the software for evaluation or in production.");

}
function confirmDelete(url)
{
    if(confirm('<fmt:message key="webclient.js.confirmdelete"/>'))
    {
        location.href = url;
    }
}

function confirmDelURL(url)
{
    if(confirm('<fmt:message key="webclient.js.confirmdelete.url"/>'))
    {
        location.href = url;
    }
}

function confirmMoveTo(url)
{
    if(confirm('<fmt:message key="webclient.js.confirmmoveto"/>'))
    {
        location.href = url;
    }
}


// added for threshold limit alone
function isInteger(inpString, where)
{
    var str = trim(eval(inpString).value);
    var invalid = "."; // Invalid character is a .
    
    if (str.indexOf(invalid) > -1) 
    {
        alert("<fmt:message key="webclient.js.integerValue"/> " + where);
	return false;
    }
    return true;
}
function isValNumber(inpString, where)
{
    var str = trim(eval(inpString).value);
    if(/^[-+]?\d+(\.\d+)?$/.test(str))
    {
        if(str >= 0)
        {
            return true;
        }
        else
        {
            alert("<fmt:message key="webclient.js.enterPositive"/> "+ where);
        }
    }
    else
    {
        alert("<fmt:message key="webclient.js.integerValue"/> " + where);
    }
    eval(inpString).value = "";
    eval(inpString).focus();
    return false;
}

//added for threshold limit alone - ends

function isValidNumber(inpString, where)
{
    var str = trim(eval(inpString).value);
    if(/^[-+]?\d+(\.\d+)?$/.test(str))
    {
        if(str > 0)
        {
            return true;
        }
        else
        {
            alert("<fmt:message key="webclient.js.enterPositive"/> "+ where);
        }
    }
    else
    {
        alert("<fmt:message key="webclient.js.integerValue"/> " + where);
    }
    eval(inpString).value = "";
    eval(inpString).focus();
    return false;
}

            function trim(s) {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }

function openHelp()
{
    window.open('/help/user_guide/index.html','_help');
}
function openSupport()
{
//  window.open('/help/user_guide/index.html','_help');
    window.location = "/support.do?selectedTab=Support";
}
function gotoURL(url)
{
window.location = url;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
      d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
        if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
      for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
        if(!x && d.getElementById) x=d.getElementById(n); return x;}

function showLayer(sShowElement)
{
    var id = document.getElementById(sShowElement);
    var bulletObj=MM_findObj("img"+sShowElement);
    if (id.style.display == "none")
    {
    eval("id.style.display = 'block';");
    bulletObj.src="/webclient/common/images/opentriangle.gif"
//  selectedColor(showCSS);
//  eval("id.imgShowHide.src='/webclient/admin/add.jpg'");
    }
    else
    {
        eval("id.style.display = 'none';");
    bulletObj.src="/webclient/common/images/triangle.gif"
//  unSelectedColor(showCSS);
    }
}

function showFileLayer(sShowElement)
{
    var id = document.getElementById(sShowElement);
    var bulletObj=MM_findObj("img"+sShowElement);
    if (id.style.display == "none")
    {
    eval("id.style.display = 'block';");
    bulletObj.src="/webclient/common/images/folder_open.gif"
//  selectedColor(showCSS);
//  eval("id.imgShowHide.src='/webclient/admin/add.jpg'");
    }
    else
    {
        eval("id.style.display = 'none';");
    bulletObj.src="/webclient/common/images/folder_closed.gif"
//  unSelectedColor(showCSS);
    }
}

function showSnpMonitor(sShowElement)
{
    var id = document.getElementById(sShowElement);
    //var bulletObj=MM_findObj("img"+sShowElement);
    if (id.style.display == "none")
    {
    eval("id.style.display = 'block';");
    //bulletObj.src="/webclient/admin/images/htmlbtnShowHideSSClicked.gif"
//  selectedColor(showCSS);
//  eval("id.imgShowHide.src='/webclient/admin/add.jpg'");
    }
    else
    {
        eval("id.style.display = 'none';");
    //bulletObj.src="/webclient/admin/images/htmlbtnShowHideSSNormal.gif"
//  unSelectedColor(showCSS);
    }
}

function showSnpProfile(sShowElement)
{
    var id = document.getElementById(sShowElement);
//    var bulletObj=MM_findObj("img"+sShowElement);
    if (id.style.display == "none")
    {
    eval("id.style.display = 'block';");
//    bulletObj.src="/webclient/admin/images/htmlbtnHideProfilesSS.gif"
//  selectedColor(showCSS);
//  eval("id.imgShowHide.src='/webclient/admin/add.jpg'");
    }
    else
    {
        eval("id.style.display = 'none';");
//    bulletObj.src="/webclient/admin/images/htmlbtnShowProfilesNormalSS.gif"
//  unSelectedColor(showCSS);
    }
}



function showElement(sShowElement)
{
    var id = document.getElementById(sShowElement);
    var bulletObj=MM_findObj("img"+sShowElement);
    eval("id.style.display = 'block';");
    bulletObj.src="/webclient/common/images/opentriangle.gif"
}
function hideElement(sShowElement)
{
    var id = document.getElementById(sShowElement);
    var bulletObj=MM_findObj("img"+sShowElement);
    eval("id.style.display = 'none';");
    bulletObj.src="/webclient/common/images/triangle.gif"
}


function showHideLayer(sShowElement)
{
    var elements = document.getElementsByTagName("DIV")
    for(var i=0 ; i < elements.length ;i++)
    {
    var elem = elements[i].getAttribute("id");
    if(elem == "dropmenudiv")
    {
        continue;
    }
    if(elem == sShowElement)
    {
        showElement(elem);

    }else
    {
        hideElement( elem );

    }

    }
}

function getSelectedRadio(buttonGroup)
{
  // returns the array number of the selected radio button or -1 if no button is selected
  if (buttonGroup[0])
  { // if the button group is an array (one button is not an array)
     for (var i=0; i<buttonGroup.length; i++)
     {
        if (buttonGroup[i].checked)
    {
           return i
        }
     }
  } else
  {
     if (buttonGroup.checked)
     {
    return 0;
     } // if the one button is checked, return zero
  }
  // if we get to this point, no radio button is selected
  return -1;
} // Ends the "getSelectedRadio" function

function getSelectedRadioValue(buttonGroup,value)
{
  // returns the value of the selected radio button or "" if no button is selected
  var i = getSelectedRadio(buttonGroup);
  if (i == -1)
  {
   alert( '<fmt:message key="webclient.admin.notification.association.selectany" />'+' '+value );
     return false;
  }
  return true;
} // Ends the "getSelectedRadioValue" function

function toggleSwipe(gName)
{
	var selRowObj = document.getElementById(gName);
	//var module = document.getElementsByName("tabName")[0].value;
	var userID = 'admin';  //document.getElementsByName("loggedUserID")[0].value;
	//var bulletObj=MM_findObj("bullet"+gName);
	if (selRowObj.style.display == 'none')
	{
		eval("selRowObj.style.display='block';");
		//bulletObj.src="images/actionitems_expand.gif";
		createCookie(userID+gName,gName+'show',30);
	}
	else if(selRowObj.style.display == 'block')
	{
		eval("selRowObj.style.display = 'none';");
		//bulletObj.src="images/actionitems_collapse.gif";
		createCookie(userID+gName, gName+'hide', 30);
	}
	else if(selRowObj.style.display == '')
	{
		//alert(" style empty ");
		eval("selRowObj.style.display = 'none';");
		//bulletObj.src="images/actionitems_collapse.gif";
		createCookie(userID+gName, gName+'show', 30);
	}
}


function showSelectedActiveMonTab(selTab)
{
    
    var tabsAvailable = new Array("AD_MonitorsList","MSSQL_MonitorsList","MSEX_MonitorsList");
    var tabsLen = tabsAvailable.length;
    var selectedTab = document.getElementById(selTab);

    for (var i=0; i < tabsLen; i++)
    {
        var idToHide = document.getElementById(tabsAvailable[i]); 
         //    alert('THE DIV LISTED ID >>>>>>>'+ idToHide.id);  
 
        if(idToHide.style.display == 'block')
        {
            //var showAddDiv = document.getElementById(monitor[i]+"AddDiv");
            //eval("showAddDiv.style.display = 'block';");
            eval("idToHide.style.display = 'none';");
        }
    }
    eval("selectedTab.style.display = 'block';");
    //eval("monAddDiv.style.display = 'none';");
    //var userID = 'MNIAtabs';
    createCookie('ApplicationMonitorsTab', selTab, 30);  

    if(selTab == 'AD_MonitorsList') {
            var monID = readCookie('SelectedADMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedADMon(monID);
            }
            else {
                 var monitor = new Array("NETWORK","DB","NTFRS",
                                            "SYSTEM", "PERFCOUNTER", "LSASS", "ADService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedADMon(monitor[i]); 
                        break;
                    }
                }
            }
        } 
    else if(selTab == 'MSSQL_MonitorsList') {
            var monID = readCookie('SelectedMSSQLMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMSSQLMon(monID);
            }
            else {
                 var monitor = new Array("MSSQLBuffer","MSSQLCache","MSSQLDatabase",
                             "MSSQLGeneral", "MSSQLLocks", "MSSQLMemory", "MSSQLService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMSSQLMon(monitor[i]); 
                        break;
                    }
                }
            }
        } 
    else if(selTab == 'MSEX_MonitorsList') {
            var monID = readCookie('SelectedMSEXMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMSEXMon(monID);
            }
            else {
                 var monitor = new Array("ISMailbox","MTA","SMTP","ISPublic", 
                                "IS", "DS", "POP3IMAP", "ES", "MSEXService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMSEXMon(monitor[i]); 
                        break;
                    }
                }
            }
        } 
}

function showSelectedADMon(selMon)
{
    var monitor = new Array("NETWORK","DB","NTFRS",
                             "SYSTEM", "PERFCOUNTER", "LSASS", "ADService");
    var moniLen = monitor.length;
    var selMonitor = document.getElementById(selMon); 
    var monAddDiv = document.getElementById(selMon+"AddDiv");
    for (var i=0; i < moniLen; i++)
    {
        var idToHide = document.getElementById(monitor[i]); 

        //alert('THE ID TO HIDE  ' + idToHide);
        if(idToHide != null && idToHide != '' && idToHide.style.display == 'block')
        {
            var showAddDiv = document.getElementById(monitor[i]+"AddDiv");
            eval("idToHide.style.display = 'none';");
            if(showAddDiv != null && showAddDiv != '')
            {
                eval("showAddDiv.style.display = 'block';");
            }
        }
       
    }
    eval("selMonitor.style.display = 'block';");
    if(monAddDiv != null && monAddDiv != '' && monAddDiv.style.display == 'block')
    {
        eval("monAddDiv.style.display = 'none';");
    }
    ChangeTabStyle(selMon, 'leftcontentAD');
    createCookie('SelectedADMonitor', selMon, 30); 
}

function showSelectedMSSQLMon(selMon)
{
    var monitor = new Array("MSSQLBuffer","MSSQLCache","MSSQLDatabase",
                             "MSSQLGeneral", "MSSQLLocks", "MSSQLMemory", "MSSQLService");
    var moniLen = monitor.length;
    var selMonitor = document.getElementById(selMon); 
    var monAddDiv = document.getElementById(selMon+"AddDiv");
    for (var i=0; i < moniLen; i++)
    {
        var idToHide = document.getElementById(monitor[i]); 

        //alert('THE ID TO HIDE  ' + idToHide);
        if(idToHide != null && idToHide != '' && idToHide.style.display == 'block')
        {
            var showAddDiv = document.getElementById(monitor[i]+"AddDiv");
            eval("idToHide.style.display = 'none';");
            if(showAddDiv != null && showAddDiv != '')
            {
                eval("showAddDiv.style.display = 'block';");
            }
        }
       
    }
    eval("selMonitor.style.display = 'block';");
    eval("monAddDiv.style.display = 'none';");
    ChangeTabStyle(selMon, 'leftcontentMSSQL');
    createCookie('SelectedMSSQLMonitor', selMon, 30); 
}

function showSelectedMSEXMon(selMon)
{
    var monitor = new Array("ISMailbox","MTA","SMTP","ISPublic", 
                                "IS", "DS", "POP3IMAP", "ES", "MSEXService");
    var moniLen = monitor.length;
    var selMonitor = document.getElementById(selMon); 
    var monAddDiv = document.getElementById(selMon+"AddDiv");
    for (var i=0; i < moniLen; i++)
    {
        var idToHide = document.getElementById(monitor[i]); 

        //alert('THE ID TO HIDE  ' + idToHide);
        if(idToHide != null && idToHide != '' && idToHide.style.display == 'block')
        {
            var showAddDiv = document.getElementById(monitor[i]+"AddDiv");
            eval("idToHide.style.display = 'none';");
            if(showAddDiv != null && showAddDiv != '')
            {
                eval("showAddDiv.style.display = 'block';");
            }
        }
       
    }
    eval("selMonitor.style.display = 'block';");
    eval("monAddDiv.style.display = 'none';");
    ChangeTabStyle(selMon, 'leftcontentMSEX');
    createCookie('SelectedMSEXMonitor', selMon, 30); 
}


function LoadSelectedPage3(column, leftcontent)
{
    SetBGTabStyle(column, leftcontent);
    //SetTabStyle(column, leftcontent);
   // SetSelectedView(column+"Page");
    createCookie('default'+leftcontent, column, 30);  
    showSelectedActiveMonTab(column);
}

function LoadSelectedPage2(column, leftcontent)
{
    SetBGTabStyle(column, leftcontent);
    //SetTabStyle(column, leftcontent);
   // SetSelectedView(column+"Page");
    createCookie('default'+leftcontent, column, 30);  
    showSelectedTab(column);
}



function showSelectedTab(selTab)
{
    //var tabsAvailable = new Array("monitorsList","notificationProfile","interfaceList", "alarmsList");
    var tabsAvailable = new Array("monitorsList","notificationProfile","interfaceList");
    var tabsLen = tabsAvailable.length;
    var selectedTab = document.getElementById(selTab);


    for (var i=0; i < tabsLen; i++)
    {
        var idToHide = document.getElementById(tabsAvailable[i]); 
         //    alert('THE DIV LISTED ID >>>>>>>'+ idToHide.id);  
 
        if(idToHide.style.display == 'block')
        {
            eval("idToHide.style.display = 'none';");
        }
    }

    eval("selectedTab.style.display = 'block';");
    createCookie('MNIAtabs', selTab, 30);  


    if(selTab == 'monitorsList') {
            var monID = readCookie('SelectedMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMon(monID);
            }
            else {
                 //var monitor = new Array("serviceMonitor","winserviceMonitor","httpMonitor", "Resource", "Traffic", "Application", "Vendor Specific","Custom");
                var monitor = Array ('serviceMonitor','winserviceMonitor','httpMonitor','Performance');
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMon(monitor[i]); 
                        break;
                    }
                }
            }
        } 
}



function showSelectedMon(selMon)
{
    
    //var monitor = new Array("serviceMonitor","winserviceMonitor","httpMonitor", "Traffic", "Application", "Resource", "Vendor Specific","Custom");
    var monitor = Array ('serviceMonitor','winserviceMonitor','httpMonitor','Performance');
                
    var moniLen = monitor.length;
    var selMonitor = document.getElementById(selMon); 
    var monAddDiv = document.getElementById(selMon+"AddDiv");
    for (var i=0; i < moniLen; i++)
    {
        var idToHide = document.getElementById(monitor[i]); 

        //alert('THE ID TO HIDE  ' + idToHide);
        if(idToHide != null && idToHide != '' && idToHide.style.display == 'block')
        {
            var showAddDiv = document.getElementById(monitor[i]+"AddDiv");
            eval("idToHide.style.display = 'none';");
            if(showAddDiv != null && showAddDiv != '')
            {
                eval("showAddDiv.style.display = 'block';");
            }
        }
      
    }
    eval("selMonitor.style.display = 'block';");
    if(monAddDiv != null && monAddDiv != '' && monAddDiv.style.display == 'block')
    {
        eval("monAddDiv.style.display = 'none';");
    }
    ChangeTabStyle(selMon, 'leftcontent');
    createCookie('SelectedMonitor', selMon, 30); 
}





function ChangeTabStyle(column, leftcontent) {

    var divName = document.getElementById(leftcontent);
    tableList = divName.getElementsByTagName('TABLE');

    var lengthh = tableList.length;
    //alert('The table length '+ lengthh );
    for(i=0; i<lengthh; i++) {

        oTable = tableList.item(i);

        // Retrieve the rows collection for the table.
        var aRows=oTable.rows;
        //alert('The table rows length '+ aRows.length);

        // Retrieve the cells collection for the first row.
        var aCells=aRows[0].cells;
        //alert('The table cells length '+ aCells.length);

        //alert('The table name '+ oTable.id);
        var columnTab = column+"LeftTab";
        var hideName = oTable.id;
        hideName = hideName.substring(0,hideName.length-7);
        //alert('The table  name '+ hideName);
        var divHideLine = document.getElementById(hideName+"HideLine");
        var divTabExt = document.getElementById(hideName+"TabExt");

        //alert('THE TABLE NAME DISPLAYX '+ divHideLine);
        if(oTable.id ==columnTab) {
            //alert('The selected table name '+ oTable.id);
            eval("divTabExt.style.display = 'block';");
            aCells[0].className = "lines2";
            aCells[1].className = "lines2";
            aCells[2].className = "lines2";
            aCells[3].className = "lines2";
            //aCells[4].className = "";
            //aCells[5].className = "";
            //aCells[6].className = "lines2";
            eval("divHideLine.style.display = 'block';");
        }
        else {
            eval("divTabExt.style.display = 'none';");
            aCells[0].className = "";
            aCells[1].className = "unselMonitor";
            aCells[2].className = "unselMonitor";
            aCells[3].className = "addTxt";
            //aCells[4].className = "unselMonitor";
            //aCells[5].className = "unselMonitor";
            //aCells[4].className = "addTxt";
            eval("divHideLine.style.display = 'none';");
       }
    }
}



function createCookie(name, value, days)
{
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
    }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name)
{
  var ca = document.cookie.split(';');
  var nameEQ = name + "=";
  for(var i=0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1, c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
  return null;
}

function eraseCookie(name)
{
  createCookie(name, "", -1);
}



function loadCookieData()
{
    //loadSelectedSnapshotDDTab();
    loadMonitorsTab(); 
    loadApplicationMonitorsTab();
}

function loadMonitorsTab()
{   
    var tabsAvailable = new Array("monitorsList","notificationProfile","interfaceList"); 
    //var tabsAvailable = new Array("monitorsList","notificationProfile","interfaceList", "alarmsList"); 
    var tabsNo = new Array("1","2","3");
    var tabID = readCookie('MNIAtabs')
    var idToBlock = document.getElementById(tabID);

    if(idToBlock == null || idToBlock == '' ) {
        idToBlock = document.getElementById('monitorsList');
         //alert('Load Cookie Data method ' + idToBlock);
    }
    var selNo;
    for(var i = 0; i<4; i++) {
        if(idToBlock.id == tabsAvailable[i]) {
            selNo = tabsNo[i];
            break;
        }
    }
    //tabs(selNo, 'junk');
    //alert('Great work :' + selNo + " BlockToID :" + idToBlock.id + "  Tabs Array : " + tabsAvailable[selNo]);

    SetBGTabStyle(idToBlock.id, 'SnapshotMNITabs');

    eval("idToBlock.style.display = 'block';");

    if(idToBlock.id == 'monitorsList') {
            var monID = readCookie('SelectedMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMon(monID);
            }
            else {
                var monitor = Array ('serviceMonitor','winserviceMonitor','httpMonitor','Performance');
                //var monitor = new Array("serviceMonitor","winserviceMonitor","httpMonitor","Resource", "Traffic", "Application", "Vendor Specific","Custom");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMon(monitor[i]); 
                        break;
                    }
                }
            }
        }

}

function loadApplicationMonitorsTab()
{   
    var tabsAvailable = new Array("AD_MonitorsList","MSSQL_MonitorsList","MSEX_MonitorsList"); 
    var tabsNo = new Array("1","2","3");
    var tabID = readCookie('ApplicationMonitorsTab')
    var isTabAvail = document.getElementById(tabID + 'Tab');
    var idToBlock;
     if(isTabAvail) {
        //alert('TabAvail >>>>>>>>>>>>>>>>>>>  method ' + isTabAvail.id);
        idToBlock = document.getElementById(tabID );
    }
    //alert('Load Cookie Data method ' + idToBlock);
    if(idToBlock == null || idToBlock == '' ) {
        <c:choose> 
        <c:when test="${!empty ADMonitor}">
            idToBlock = document.getElementById('AD_MonitorsList');
        </c:when>
        <c:when test="${!empty MSSQL_ApplicationServicesDO || !empty MSSQL_ApplicationMonitors}">
            idToBlock = document.getElementById('MSSQL_MonitorsList');
        </c:when>
        <c:when test="${!empty MSEX_ApplicationServicesDO || !empty MSEX_ApplicationMonitors}">
            idToBlock = document.getElementById('MSEX_MonitorsList');
        </c:when>
        </c:choose> 
         //alert('Load Cookie Data method ' + idToBlock);
    }

    if(idToBlock == null || idToBlock == '' ) {
        return; //returns when there is no add features for the snapshot page
    }

    var selNo;
    for(var i = 0; i<3; i++) {
        if(idToBlock.id == tabsAvailable[i]) {
            selNo = tabsNo[i];
            break;
        }
    }
    
    //ADtabs(selNo, 'junk'); //second arg not required
    //SetTabStyle(idToBlock.id, 'SnapshotEAMTabs');
    SetBGTabStyle(idToBlock.id, 'SnapshotEAMTabs');

    eval("idToBlock.style.display = 'block';");

    if(idToBlock.id == 'AD_MonitorsList') {
            var monID = readCookie('SelectedADMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedADMon(monID);
            }
            else {
                var monitor = new Array("NETWORK","DB","NTFRS",
                                            "SYSTEM", "PERFCOUNTER", "LSASS", "ADService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedADMon(monitor[i]); 
                        break;
                    }
                }
            }
        }
     else if(idToBlock.id == 'MSSQL_MonitorsList') {
            var monID = readCookie('SelectedMSSQLMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMSSQLMon(monID);
            }
            else {
                 var monitor = new Array("MSSQLBuffer","MSSQLCache","MSSQLDatabase",
                             "MSSQLGeneral", "MSSQLLocks", "MSSQLMemory", "MSSQLService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMSSQLMon(monitor[i]); 
                        break;
                    }
                }
            }
        } 
    else if(idToBlock.id == 'MSEX_MonitorsList') {
            var monID = readCookie('SelectedMSEXMonitor')
            //alert('Selected monitor ID '+ monID);

            var monToBlock = document.getElementById(monID+"LeftTab");
             //alert('SELECTED MONITOR LEFT TAB '+ monToBlock);
            if(monToBlock != null && monToBlock != '')
            {
                //alert('Selected monitor ID Left tab '+ monToBlock);
                showSelectedMSEXMon(monID);
            }
            else {
                 var monitor = new Array("ISMailbox","MTA","SMTP","ISPublic", 
                                "IS", "DS", "POP3IMAP", "ES", "MSEXService");
                var moniLen = monitor.length;
                for (var i=0; i < moniLen; i++)
                {
                    var monAddDiv = document.getElementById(monitor[i]+"LeftTab");
                     //alert('NEW MONITOR ID TO BE SELECTED '+ monAddDiv + ' selected tab ' + monitor[i]);
                    if(monAddDiv != null && monAddDiv != '')
                    {
                        showSelectedMSEXMon(monitor[i]); 
                        break;
                    }
                }
            }
        }
}

/* The below method is not required. Can be removed from the page */
function addMonitorss(name, mon)
{
location.href = '/map/addMonitors.do?requestid=SHOW_LIST&deviceName='+ name + '&monitor='+mon;

}

function selectAllCheckboxes( selectall, form )
{  
   var t= form.length;
   for(i=1; i<t; i++) 
   {
	    form[i].checked=selectall.checked; 
   }
}

function getSelectedNamesForDelete( form )
{
   var t= form.length;
   var result="";
   for(i=1; i<t; i++) 
   {
   	if ( form[i].checked )   
   	{
            result+=form[i].name+",";   
   	}   
   }
   return result;
}

function doBlink() {
	var blink = document.all.tags("BLINK")
	for (var i=0; i<blink.length; i++)
		blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "" 
}

function startBlink() {
	if (document.all)
		setInterval("doBlink()",1000)
}
/*if (checkBrowserVer() == 'IE4') 
{
	window.onload = startBlink;
}*/

function checkBrowserVer()
{
        if(navigator.appName == "Netscape")
        {
                if(parseInt(navigator.appVersion) >= 4) {return "NS4";}
                else if
                        (parseInt(navigator.appVersion) >= 3){return  "NS3";}
        }
        else if (navigator.appName == "Microsoft Internet Explorer") 
        {
                if(parseInt(navigator.appVersion) >= 4) {return  "IE4";}
                else if 
                        (parseInt(navigator.appVersion) >= 2){return  "IE3";}
        }
}

function NewWindow(mypage,myname,w,h,scroll,pos,x,y)
{
	var win=null;
	if(scroll!='No')
	{
		scroll="yes"
	}
	if(pos=="random")
	{
		LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;
	}
	if(pos=="center")
	{
		LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;
	}
	else if((pos!="center" && pos!="random") || pos==null)
	{
		LeftPosition=x;TopPosition=y
	}
	settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',screenX='+x+', screenX='+y+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';
	win = window.open(mypage,myname,settings);
}

function showDropDown(sShowElement)
{
	var id = document.getElementById(sShowElement);
	if (id.style.display == "none")
	{
		eval("id.style.display = 'block';");
	}
	else
	{
		eval("id.style.display = 'none';");
	}
}

function isPositiveInteger(str)
{
	var temp  = parseInt(str,10);
	if ( isNaN(temp) || temp.toString().length != str.length || temp > 2147483647) {
		return false;
	}
	var objRegExp = /(^\d\d*$)/;
	return objRegExp.test(temp);
}


/* MOVED FROM MSSQL DASHBOARD PAGE TO USE IT GENERICALLY */

/*
	function showLastValue(value, thresholdCondition, unit, deviceName, graphName, index)
	{
		if(value == '')
		{
			document.write("N/A");
		}
		else
		{
			if(thresholdCondition == "Violated")
			{
				document.write("<font id='xd-red'> <a href=javascript:openGraphWindow('/admin/dynamicGraph.do?name="+deviceName+"&INSTANCE="+index+"&requestid=DynamicGraph&graphName="+graphName+"&index="+graphName+"','GRAPH',800,600)><blink>"+value+""+unit+"</blink></a></font>");
			}
			else
			{
				document.write("<font id='xd-green'> <a href=javascript:openGraphWindow('/admin/dynamicGraph.do?name="+deviceName+"&INSTANCE="+index+"&requestid=DynamicGraph&graphName="+graphName+"','GRAPH',800,600)>"+value+""+unit+"</a></font>");
			}
		}
	}

	function showLastMBRoundOfValue(value, thresholdCondition, thresholdValue, deviceName, graphName, index)
	{
		if(value != '')
		{
			if((thresholdValue * 1) > (value*1))
			{
				thresholdCondition = "Normal";
			}
			var unit = ' KB';
			if(value > 512)
			{
				value = Math.round(value * 100 / 1024)/100;
				unit = ' MB';
			}
		}
		showLastValue(value, thresholdCondition, unit, deviceName, graphName, index);
	}

	function checkThresholdAndShowValue(value, thresholdCondition, thresholdValue, unit, deviceName, graphName, index)
	{
		if(value != '')
		{
			if((thresholdValue * 1) > (value*1))
			{
				thresholdCondition = "Normal";
			}
		}
		showLastValue(value, thresholdCondition, unit, deviceName, graphName, index);
	}

	if (checkBrowserVer() == 'IE4') 
	{
		window.onload = startBlink;
	}

	function deleteSelectedDatabases( form )
	{
		var todel = getSelectedNamesForDelete( form ) ;
		if ( todel!="" )
		{
			confirmDelMonitor("/admin/AddMSSQLMonitors.do?requestid=GotDataBaseTobeManaged&devicename=<c:out value='${devicename}'/>&removedDatabases="+todel);
		}
		else
		{
			alert( '<fmt:message key="webclient.device.dashboard.selecttodelete"/>' );
		}
	}
*/


function isValidNumberWithinLimit(inpString, where, upperLimit, lowerLimit)
{
    var str1= trim(eval(inpString).value);
	if(/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/.test(str1))
    {
		if(!floatCheckRoundToPoints(str1,3))
		 {
			eval(inpString).focus();
			return false;
		 }
		var str = parseFloat(str1); 
		if(str > 0)
        {
			if(str>parseFloat(upperLimit))
			{	
				alert(where +" - <fmt:message key="webclient.devices.intftypes.maxValAlwd"/> "+upperLimit);
				eval(inpString).focus();
				return false;
			}
			/*else if(str<parseFloat(lowerLimit))
			{	
				alert(where +" - <fmt:message key="webclient.devices.intftypes.minValAlwd"/> "+lowerLimit);
				eval(inpString).focus();
				return false;
			}*/
			return true;
        }        
     }   
	alert("<fmt:message key="webclient.devices.intftypes.valGrtrZero"/> " + where);
    eval(inpString).focus();
	return false;
}

function floatCheckRoundToPoints(stringObject, limit)
{
	var indx = stringObject.indexOf(".");
	if(indx !=-1 )
	{
		var str1 = parseFloat(stringObject).toString();
		var str = str1.substr(indx+1);
		if(indx==0)			
			str = str1.substr(indx+2);
		if(str.length >parseInt(limit,	10))
		{
			alert("Please round the value to 3 decimal points");
			return false;
		}		
	}	
	return true;
}

function isSpeedWithinLimit(inpString, where, upperLimit, lowerLimit) 
{
    var str1 = trim(eval(inpString).value);
	if(isNumeric(str1))
    {
		var str = parseInt(str1, 10);
		if(str >= 0)
		{
			if(str>parseInt(upperLimit,10))
			{	
				alert(where +" - Maximum value allowed is 1 Terabits/sec ");
				eval(inpString).focus();	
				return false;
			}
			else if(str<parseInt(lowerLimit,10))
			{	
				alert(where +" - <fmt:message key="webclient.devices.intftypes.minValAlwd"/> "+lowerLimit);
				eval(inpString).focus();
				return false;
			}
			return true; 
		}   
	}
	alert("<fmt:message key="Please enter a valid number for"/> " + where);
    eval(inpString).focus();
	return false;
}

function isFieldEmpty(stringVal, where)
{
	var str = trim(eval(stringVal).value);
	if(str.length == 0) 
    {
		alert(where +" <fmt:message key="webclient.devices.intftypes.cannotEmpty"/>");
		eval(stringVal).value = "";
		eval(stringVal).focus();
		return false;
	}
	return true;
}

function isValidIntegerNumber(inpString, where)
{
    var str = trim(eval(inpString).value);
    if(/^[-+]?\d+(\\d+)?$/.test(str))
    {
        if(str > 0)
        {
            return true;
        }        
    }
	alert("<fmt:message key="webclient.devices.intftypes.positiveInt"/> " + where);
    eval(inpString).value = "";
    eval(inpString).focus();
    return false;
}

function isNumeric(str){
  var re = /[\D]/g
  if (re.test(str)) return false;
  return true;
}

function isValidDisplayName(stringVal, where)
{
	valid="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ./\\()[]{},-_ +=|^$#~";
	if(isFieldEmpty(stringVal, where))
	{
		var str =  trim(eval(stringVal).value);
		for (var i=0; i<str.length; i++) 
		{
			if (valid.indexOf(str.charAt(i)) < 0) 
			{
				alert('Display Name contains invalid character " '+str.charAt(i)+' "');
				eval(stringVal).focus();
				return false;
			}
		}
		return true;
	}
	return false;	
}

</script>

