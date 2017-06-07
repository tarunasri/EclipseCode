/* $Id: windowFunctions.js,v 1.2 2010/10/29 13:47:01 swaminathap Exp $ */

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

if (checkBrowserVer() == 'IE4' || checkBrowserVer() == 'NS4') 
{ 
	imgload = new Image(); 
	imgload.src = "/webclient/common/images/icon_load.gif"; 
	imgload1 = new Image(); 
	imgload1.src = "/webclient/common/images/icon_load.gif"; 
	imgunload = new Image(); 
	imgunload.src = "/webclient/common/images/icon_unload.gif"; 
	imgunload1 = new Image(); 
	imgunload1.src = "/webclient/common/images/icon_unload.gif"; 
	imgparam = new Image(); 
	imgparam.src = "/webclient/common/images/icon_parameters.gif"; 
	imgparam1 = new Image(); 
	imgparam1.src = "/webclient/common/images/icon_parameters.gif"; 
	imgget = new Image(); 
	imgget.src = "/webclient/common/images/icon_get.gif"; 
	imgget1 = new Image(); 
	imgget1.src = "/webclient/common/images/icon_get.gif"; 
	imggetnext = new Image(); 
	imggetnext.src = "/webclient/common/images/icon_getnext.gif"; 
	imggetnext1 = new Image(); 
	imggetnext1.src = "/webclient/common/images/icon_getnext.gif"; 
	imggetbulk = new Image(); 
	imggetbulk.src = "/webclient/common/images/icon_getbulk.gif"; 
	imggetbulk1 = new Image(); 
	imggetbulk1.src = "/webclient/common/images/icon_getbulk.gif"; 
	imgset = new Image(); 
	imgset.src = "/webclient/common/images/icon_set.gif"; 
	imgset1 = new Image(); 
	imgset1.src = "/webclient/common/images/icon_set.gif"; 
	imgtable = new Image(); 
	imgtable.src = "/webclient/common/images/icon_table.gif"; 
	imgtable1 = new Image(); 
	imgtable1.src = "/webclient/common/images/icon_table.gif"; 
	imgclear = new Image(); 
	imgclear.src = "/webclient/common/images/icon_mibclear.gif"; 
	imgclear1 = new Image(); 
	imgclear1.src = "/webclient/common/images/icon_mibclear.gif"; 
	imghelp = new Image(); 
	imghelp.src = "../images/tbhelp.png"; 
	imghelp1 = new Image(); 
	imghelp1.src = "../images/tbhelp1.png"; 
} 

function submitViaPost(nodeToOpen,anchor) 
{   
	document.mibForm.pressType.value="Treeplus"; 
	document.mibForm.pressName.value=nodeToOpen; 
	document.mibForm.nodeToOpen.value=nodeToOpen; 
	document.forms["mibForm"].action=document.forms["mibForm"].action+"#"+anchor;
	document.forms["mibForm"].submit(); 
} 

function SbtTreelnk(nodeToOpen,type,displayName) 
{
	document.mibForm.pressType.value="Treelink"; 
	document.mibForm.pressName.value=type; 
	document.mibForm.type.value=type; 
	document.mibForm.displayName.value=displayName; 
	document.forms["mibForm"].submit(); 
} 

