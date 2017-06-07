/* $Id: taskconfig.js,v 1.2 2010/10/29 13:47:04 swaminathap Exp $ */
var snmpProps1 = new Array("label", "identifier", "type","value");
var telnetProps = new Array("identifier", "cmdArgs", "value");
var ftpProps = new Array("srcFileName", "identifier", "mode", "destFileName");
var tftpProps = new Array("srcFileName", "identifier", "binaryMode", "destFileName");
var tl1Props = new Array("messagePayLoadBlock", "targetID", "identifier", "accessID", "generalBlock");

var snmpArray = new Array(1);
var telnetArray = new Array(1);
var tl1Array = new Array(1);
var ftpArray = new Array(1);
var tftpArray = new Array(1);

function closeDiv(divname)
{
if(document.TaskForm != null && document.TaskForm.dataSource != null)
{
	for(i=0;i<document.TaskForm.dataSource.length;i++)
	{
		document.TaskForm.dataSource[i].checked = false;
	}
}
        divname.style.display="none";
}

function GetXMLHttpRequest()
{
    if (window.XMLHttpRequest)
    {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function updateRow(index)
{
	var protocol = document.TaskForm.protocol.value;
	if(validateRow(protocol)==false) return;
	var totalRows = dob.getTables().length;
	var row = constructArray(protocol);
	if(index == -1)	
	{
                // for addition of new attribute row.
                dob.addRowsForTable("table"+totalRows,row);
	}
	else
        {
		// for modify... need to test if this modified existing row and adds a new row??? --- ajs
		dob.deleteFirstRow("table"+index);
		dob.addRowsForTable("table"+index,row);
        }
	populateAttrTable();
	document.getElementById('attrFormTable').style.display='none';
}

function constructArray(protocol)
{
	var elements = "";
        switch(protocol)
        {
                case "snmp" : elements = snmpProps1; break;
                case "telnet" : elements = telnetProps; break;
                case "tftp" : elements = tftpProps; break;
                case "ftp" : elements = ftpProps; break;
                case "tl1" : elements = tl1Props; break;
                default : ""; break;
        }

	var attrs = new Array(elements.length);
	for(i=0;i<attrs.length;i++)
        {
                attrs[i] = new Array(2);
        }
	for (var i=0; i<elements.length; i++)
    	{
		var element = elements[i];
                if(protocol == 'snmp')
                {
                        if(element == 'identifier')
                        {
				attrs[i][0] = element;
                                attrs[i][1] = eval("document.TaskForm.oid").value;
                                continue;
                        }
                        else if(element == 'label')
                        {
				attrs[i][0] = element;
                                attrs[i][1] = eval("document.TaskForm.name").value;
                                continue;
                        }
                }
        	var prop = eval("document.TaskForm."+elements[i]);
	        attrs[i][0] = prop.name;
		if(document.TaskForm.isTemplate.value == 'true')
		{
			if(protocol == 'snmp')
			{
				if(prop.name=='value')
				{
					var placeholder = eval("document.TaskForm.placeholder");
					if(placeholder.value != 'None')
					{
						attrs[i][1] = "$"+placeholder.value+"$"+prop.value;
						continue;
					}
				}
			}
			else if((protocol == 'ftp' || protocol =='tftp') && (prop.name == 'srcFileName' || prop.name=='destFileName'))
			{
				var placeholder = eval("document.TaskForm."+prop.name+"_placeholder");
                               	if(placeholder.value != 'None')
	                        {
        	                	attrs[i][1] = "$"+placeholder.value+"$"+prop.value;
					continue;
                	        }
			}
			else if(protocol == 'tl1' &&(prop.name != 'identifier'))
			{
                                var placeholder = eval("document.TaskForm."+prop.name+"_placeholder");
                                if(placeholder.value != 'None')
                                {
                                        attrs[i][1] = "$"+placeholder.value+"$"+prop.value;
                                        continue;
                                }
			}
                        else if(protocol == 'telnet')
                        {
                                var placeholder = eval("document.TaskForm."+prop.name+"_placeholder");
                                if(placeholder.value != 'None')
                                {
                                        attrs[i][1] = "$"+placeholder.value+"$"+prop.value;
                                        continue;
                                }
                        }
		}
	        attrs[i][1] = prop.value;
	}
	return attrs;
}

function loadAttr()
{
        // this function should load the data from the request into the dob. based on this viewAttr will work.
        var attrs = document.TaskForm.attrXML.value;
        if(attrs == "")
        {
                return;
        }
        var tokenizer = attrs.split(";");
        for(var i=0;i<tokenizer.length;i++)
        {
                var row = tokenizer[i];
                var attrToken = row.split(", ");
                var attrElement = new Array(attrToken.length);
                for(var k=0;k<attrToken.length;k++)
                {
                        attrElement[k] = new Array(2);
                }
                for(var j=0;j<attrToken.length;j++)
                {
                        var attr = attrToken[j].split("=");
                        attrElement[j][0] = attr[0];
                        attrElement[j][1] = attr[1];
                }
                dob.addRowsForTable("table"+i,attrElement);
        }
}

function loadTableAttr()
{
	var tableXML = document.TaskForm.tableXML.value;
	if(tableXML == "")
	{
		return;
	}
	var tokenizer = tableXML.split(";#");
	for(var i=0;i<tokenizer.length;i++)
	{
		var table = tokenizer[i];
		if(table == '') continue;
		var tok = table.split(":");
		var tableId = tok[0];
		var instances = tok[1];
		var tok1 = instances.split(";");
		for(var j=0;j<tok1.length;j++)
		{
			var row = tok1[j];
               		var attrToken = row.split(", ");
	                var attrElement = new Array(attrToken.length);
        	        for(var k=0;k<attrToken.length;k++)
                	{
                        	attrElement[k] = new Array(2);
	                }
        	        for(var k=0;k<attrToken.length;k++)
                	{
                        	var attr = attrToken[k].split("=");
	                        attrElement[k][0] = attr[0];
        	                attrElement[k][1] = attr[1];
                	}
	                tob.addRowsForTable(tableId,attrElement);
		}
	}
}

function init(rbTask,operation)
{
	var overwrite = document.TaskForm.overwrite.value;
	if(document.TaskForm.protocol.value == 'snmp') showTableAttrTitle();
	if(overwrite == 'true')
	{
		document.TaskForm.taskName.className='disabledBg';
		loadAttr();
        	loadTableAttr();
		if(operation != 'execute')
		{
			populateAttrTable();
			populateTableAttr("");
			//loadRBTable();
		}
		loadDataSources();
		loadDeviceList();
	}
	else
	{
		loadDeviceList();
		//loadRBTable();
	}
	//showConfigDSLink();
	formEmptyDeviceTable();
}

function loadDeviceList()
{
	var checkEmpty = false;
	var taskName = document.TaskForm.taskName.value;
        var protocol = document.TaskForm.protocol.value;
	var url = "/config/TaskAction.do?actionToPerform=getDeviceLists&taskName="+taskName+"&protocol="+protocol;
	var xmlhttp=GetXMLHttpRequest();
	var dlTable = "<table width='100%' cellspacing='0' cellpadding='2' border='0' align='left'><tbody>";
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4)
		{
                        var result = xmlhttp.responseText.split(":");
                        if(result == "")
                        {
				checkEmpty = true;
                        }
                        else
                        {
				var dlist = result[0].split(",");
				var associateddl = result[1].split(",");
                                for(var i=0; i<dlist.length;i++)
                                {
					var dl = trimAll(dlist[i]);
					if(dl == '')
					{
						checkEmpty = true;
						continue;
					}
					checkEmpty = false;
                                        if(i%2==0)
                                        {
                                                dlTable = dlTable+"<tr class='generalEvenRow' onmouseout=\"this.className='generalEvenRow'\" onmouseover=\"this.className='generalHover'\">";
                                        }
                                        else
                                        {
                                                dlTable = dlTable+"<tr class='generalOddRow' onmouseout=\"this.className='generalOddRow'\" onmouseover=\"this.className='generalHover'\">";
                                        }
                                        dlTable = dlTable+"<td style='padding-left: 5px;'><input type='checkbox' id=dl"+dl+" ";
                                        for(var j=0;j<associateddl.length;j++)
                                        {
                                                if(dl == trimAll(associateddl[j]))
                                                {
							dlTable = dlTable+"checked='checked'";
                                                }
                                        }
				       	dlTable = dlTable+" name='rowSelectionDl' value="+dl+" style='vertical-align:middle;margin:0px;padding:0px' onclick = \"javascript:ToggleDl(this,this.form,event)\"/>&nbsp;<label for=dl"+dl+">"+dl+"</label></td>";
                                }                                
				if(checkEmpty)
	                        {				
					if(document.TaskForm.deviceattr.value == '')
					{
	                                  showEmptyDL();
					}
	                                  return;
	                        }
				else
				{
					
					showCompleteDeviceList();
					
				}
				
                                dlTable = dlTable+"</tr></tbody></table>";
			}
			document.getElementById('dlTable').innerHTML=dlTable;
		}	
	}
        xmlhttp.open("POST",url,true);
        xmlhttp.send(null);
}

function returnTableAttrs()
{
	var tableAttrs = "";
	var tables = tob.getTables();
	for(var i in tables)
	{
		var tableOID = tables[i];
		var rows = tob.getRowsForTable(tableOID);
		if(rows == null) continue;
		tableAttrs+= tableOID+":";
		for(i in rows)
		{
			var instance = rows[i];
			if(rows[i] == null) continue;
			for(var name in rows[i])
			{
				tableAttrs+=name+"="+rows[i][name]+", ";
			}
			tableAttrs = tableAttrs.substring(0,tableAttrs.length-2);
			tableAttrs+=";";
		}
		tableAttrs+="#";
	}
	if(tableAttrs.length>0)
	{
		tableAttrs = tableAttrs.substring(0,tableAttrs.length-2)
	}
	return tableAttrs;
}
function saveTask()
{
	if(validateTaskForm() == 'false') return false;
	document.TaskForm.attrXML.value = dob.constructXML();
	document.TaskForm.tableXML.value = returnTableAttrs();
	var url="/config/TaskAction.do?actionToPerform=saveTask&operation=save";
	var deviceList = processDeviceList();
	if(deviceList.length>0)
	{
		url += "&deviceList="+deviceList.substring(1);
	}
	$.post(url, $('form').serialize(),function (data) 
	{
		var index = data.indexOf(":");
		if(index==-1)// this indicates success. usually error is thrown as exception message string. so ':' will be there for sure...
		{
			document.TaskForm.overwrite.value = "true";
			var url="/config/TaskList.do?selectedTab=Configuration&viewId=Batch+Configuration&displayName=Batch+Configuration";
			location.href=url;
		}
		else
		{
			alert(data);
		}
		
	});
}

function saveAndExecute()
{
	if(validateTaskForm() == 'false') return;
	document.TaskForm.attrXML.value = dob.constructXML();
	document.TaskForm.tableXML.value = returnTableAttrs();	
	var url = "/config/TaskAction.do?actionToPerform=saveTask&operation=saveAndExecute";
        var deviceList = processDeviceList();
        if(deviceList.length>0)
        {
                url += "&deviceList="+deviceList.substring(1);
        }
	$.post(url, $('form').serialize(),function (data) 
	{
		var index = data.indexOf(":");
		if(index==-1)// this indicates success. usually error is thrown as exception message string. so ':' will be there for sure...
		{
			//alert(data);
			document.TaskForm.overwrite.value = "true";
			executeTask(document.TaskForm);
		}
		else
		{
	//		data = data.substring(index+1);
			alert(data);
		}
	});
}

function processDeviceList()
{
        var dl = "";
	var dlElements = document.getElementsByName("rowSelectionDl");
        var len = dlElements.length;
        for(var i = 0 ; i < len ; i++)
        {
            var formElement = dlElements[i];
            if (formElement.checked == true)
            {
                dl = dl + "," + formElement.value;
            }
        }
	return dl;
}

function setProtocol()
{
	loadRBTable();
        if(document.getElementById('xContent').style.display == "block")
        {
                displayHelpMsg();
        }
        if(dob.getTables().length>0)
        {
                dob = new DataObject();
                document.getElementById('attrTable').style.display='none';
        }
        document.getElementById('attrFormTable').style.display='none';
	showTableAttrTitle();
        document.getElementById('tableAttr').style.display='none';
	if(document.getElementById('attrTable').style.display != 'none')
	{
	        populateAttrTable();
	}
	loadDeviceList();
}

function selectRbTask(cbox,rbtask)
{
        var elements = document.getElementsByName("rollbackTask");
        for(var i=0;i<elements.length;i++)
        {
		if(elements[i].value == rbtask && cbox.checked)
		{
			loadRollbackTaskDetails(rbtask);
		}
		else
                {
                        elements[i].checked=false;
			document.getElementById(elements[i].value).className="vSeparator2";
                }
	}
	if(cbox.checked == false)
	{
		gettingDisplay('none');
                document.getElementById("rbtdetail1").innerHTML="&nbsp;";
	        document.getElementById("rbtdetail2").innerHTML="&nbsp;";
                document.getElementById("rbtdetail3").innerHTML="&nbsp;";
       	        document.getElementById("rbtdetail4").innerHTML="&nbsp;";
               	document.getElementById("rbtdetail5").innerHTML="&nbsp;";
                document.getElementById("rbtdetail6").innerHTML="&nbsp;";
	}
        
}

function loadRollbackTaskDetails(rbTask)
{
	if(rbTask == 'Current Configuration' || rbTask == '')
	{
		gettingDisplay('none');
	}
	else
	{
		gettingDisplay("");
		document.getElementById(rbTask).className="tabNavCurrent2";
        	var url = "/config/TaskAction.do?actionToPerform=getRollbackTaskDetails&rbTask="+rbTask;
	        var xmlhttp=GetXMLHttpRequest();
        	xmlhttp.onreadystatechange=function()
	        {
			if (xmlhttp.readyState==4)
			{
				var result = xmlhttp.responseText;
				document.getElementById("rbtdetail1").innerHTML=": "+rbTask;
				var index1 = result.indexOf("rollbackTask=");
				var index2 = result.indexOf("lastExecTime=");
				var prop = result.substring(5,index1);
				document.getElementById("rbtdetail2").innerHTML=": "+prop;
				document.getElementById("rbtdetail3").innerHTML=": "+document.TaskForm.protocol.value;
				document.getElementById("rbtdetail4").innerHTML=": false";
				prop = result.substring(index1+13,index2);
				document.getElementById("rbtdetail5").innerHTML=": "+prop;
				prop = result.substring(index2+13);
				document.getElementById("rbtdetail6").innerHTML=": "+prop;
			}
	        }
        	xmlhttp.open("POST",url,true);
		xmlhttp.send(null);
	}
}

function gettingDisplay(dis)
{
	document.getElementById("rbName").style.display = dis;
	document.getElementById("rbVal").style.display = dis;
	document.getElementById("tName").style.display = dis;
	document.getElementById("rbtdetail1").style.display = dis;
	document.getElementById("rbDesc").style.display = dis;
	document.getElementById("rbtdetail2").style.display = dis;
	document.getElementById("rbProto").style.display = dis;
	document.getElementById("rbtdetail3").style.display = dis;
	document.getElementById("rbTemp").style.display = dis;
	document.getElementById("rbtdetail4").style.display = dis;
	document.getElementById("rbCon").style.display = dis;
	document.getElementById("rbtdetail5").style.display = dis;
	document.getElementById("rbExtime").style.display = dis;
	document.getElementById("rbtdetail6").style.display = dis;

	for(i = 0 ; i < varStorage.length ; i++)
	{
		var idVal = varStorage[i];
		document.getElementById(idVal).style.display = dis;
	}
}


function fetchDSDetails(selectedDS)
{
        var url = "/config/TaskOperations.do?method=getDSDetails&selectedDS="+selectedDS.value;
        var xmlhttp=GetXMLHttpRequest();
        xmlhttp.onreadystatechange=function()
        {
                if (xmlhttp.readyState==4)
                {
                        var text = trimAll(xmlhttp.responseText);
                        if(processDS(text)=='false')
                        {
			//	selectedDS.checked=false;
                                return;
                        }
                        var param = text.split(",");
                        var configuredParams = '';
                        for(var i=0;i<param.length;i++)
                        {
                                configuredParams = configuredParams+","+param[i]+"=";
                        }
                        configuredParams = configuredParams.substring(1);
                        document.TaskForm.dsp.value=configuredParams;
			formDSConfig(selectedDS);
                }
        }
        xmlhttp.open("POST",url,true);
        xmlhttp.send(null);
}

function updateDSP()
{
        var params = document.TaskForm.dsp.value.split(",");
	var configuredParams = '';
        for(var i=0;i<params.length;i++)
        {
		var row = params[i].split("=");
		var key = row[0];
                var value = trimAll(document.TaskForm.elements[key].value);
                configuredParams = configuredParams+","+key+"="+value;
        }
        configuredParams = configuredParams.substring(1);
        document.TaskForm.dsp.value=configuredParams;
        document.getElementById('configureDataSource').style.display="none";
}

function toggleTable(div)
{
	var display = div.style.display;	
	var imgId = 'toggleImg_'+div.id;
	if(display=='none')
	{
			
        	switch(div.id)
        	{
                	case "attrTable" : populateAttrTable(); break;
	                case "rbTable" : loadRBTable(); break;
        	        case "dsComp" : loadDataSources(); break;
                	case "deviceTables" : div.style.display='block';loadDeviceList(); break;
			case "tableAttr" : populateTableAttr(""); break;
			case "neInputTable":loadNEInputTable();break;
			case "invInputTable":loadInvInputTable();break;
			case "userInputTable":loadUserInputTable();break;
        	        default : alert('this will never happen...'); break;
	        }
		document.getElementById(imgId).src="/webclient/common/images/toggleIcon1.gif";
	}
	else
	{
		div.style.display = 'none';
		document.getElementById(imgId).src="/webclient/common/images/toggleIcon2.gif";
	}
}

function selectDL(element)
{
	var mapping = document.ComboTaskForm.subtaskVsseldl.value;
	if(element.checked)
	{
		mapping += ";"+element.value;
	}
	else
	{
		var tempMapping="";
		var token = mapping.split(";");
		for(var i=0;i<token.length;i++)
		{
			if(token[i] != "" && element.value != token[i])
			{
				tempMapping += ";"+token[i];
			}
		}
		mapping = tempMapping;
	}
	document.ComboTaskForm.subtaskVsseldl.value= mapping;
}

function executeComboTask(form,errormsg)
{
    var dlmap = form.subtaskVsseldl.value;
    if(validateExecuteCT(form)==false) return;
    var url = "/config/TaskOperations.do?method=executeTask&taskName="+form.taskName.value+"&subtaskVsseldl="+dlmap.substring(1);
	    var refTable = document.getElementById('refTable1');
	    var position = getDivLocation(refTable);
	    var element1Width = getElementWidthHeight(refTable);
	    var div = document.getElementById('ExecutionResult');
	    div.style.left=parseInt((position[0]+(element1Width[0]/2))-(400/2))+'px';
	    div.style.width=100+'px';
	    div.style.top=(parseInt(position[1]) - 300)+'px';
            div.style.display="block";
            div.innerHTML="<table cellspacing='0' cellpadding='0' border='0' align='center' class='tableBdr3 whiteBg'><tr><td style='padding:7px;' width='10' nowrap><img src='/webclient/common/images/LoadingTC.gif' align='absmiddle'>&nbsp;&nbsp;</td><td style='padding:7px;' nowrap>"+errormsg+"</td></tr></table>";


    var xmlhttp = GetXMLHttpRequest();
    xmlhttp.onreadystatechange=function()
    {
	if (xmlhttp.readyState==4)
	{
            resulttxt = xmlhttp.responseText;
            resultxml = xmlhttp.responseXML;
            displayResult('table');
	}	
    }
    xmlhttp.open("POST",url,true);
    xmlhttp.send(null);
}

function toggleTaskList(protocol)
{
    var formElement = document.getElementById(protocol);
    var todo = formElement.style.display=='none'?'':'none';
    performToggle(protocol,todo);
}

function performToggle(protocol,todo)
{
    var formElement = document.getElementById(protocol);
    if(todo == '')
    {
    	formElement.style.display = '';
	document.getElementById(protocol+"_img").src= "/webclient/common/images/toggleIcon1.gif";
	var tr = document.getElementById(protocol+"_tr");
        tr.className=tr.className +" selectedRow";
    }
    else
    {
    	formElement.style.display = 'none';
	document.getElementById(protocol+"_img").src= "/webclient/common/images/toggleIcon2.gif";
	var tr = document.getElementById(protocol+"_tr");
	if(tr.className.indexOf("generalOddRow") != -1)
	{
	    tr.className="generalOddRow";
	}
	else
	{
	    tr.className="generalEvenRow";
	}
    }
}

function toggleSubTasks(todo)
{
    var protocols = new Array("snmp","telnet","tl1","ftp","tftp");
    for(var i=0;i<protocols.length;i++)
    {
	performToggle(protocols[i],todo);
    }
}
function addingDlArray(dlName,protocol)
{
	var dlArray;
	switch(protocol)
	{
		case "snmp" : dlArray = snmpArray; break;
		case "telnet" : dlArray = telnetArray; break;
		case "tftp" : dlArray = tftpArray; break;
		case "ftp" : dlArray = ftpArray; break;
		case "tl1" : dlArray = tl1Array; break;
		default : ""; break;
	}
	if(dlArray.length == 1)
	{
		dlArray[0] = dlName;
	}
	else
	{
		dlArray[dlArray.length+1] = dlName;
	}
}
function gettingDlArrayVal(protocol)
{
	var dlArray;
	switch(protocol)
	{
		case "snmp" : dlArray = snmpArray; break;
		case "telnet" : dlArray = telnetArray; break;
		case "tftp" : dlArray = tftpArray; break;
		case "ftp" : dlArray = ftpArray; break;
		case "tl1" : dlArray = tl1Array; break;
		default : ""; break;
	}
	var lastElmt = dlArray[(dlArray.length)-1];
	return lastElmt;
}

