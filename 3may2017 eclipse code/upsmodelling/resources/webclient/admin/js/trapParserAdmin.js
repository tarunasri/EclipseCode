//$Id: trapParserAdmin.js,v 1.2 2010/10/29 13:46:53 swaminathap Exp $

function userProperties()
{
    document.TrapParserForm.toPerform.value="userProperties";
    var url = document.TrapParserForm.action + "#userProp";
    document.TrapParserForm.action = url;
    document.TrapParserForm.submit();
}

function more()
{
    document.TrapParserForm.toPerform.value="more";
    var url = document.TrapParserForm.action + "#userProp";
    document.TrapParserForm.action = url;
    document.TrapParserForm.submit();
}

function fewer()
{
    document.TrapParserForm.toPerform.value="fewer";
    var url = document.TrapParserForm.action + "#userProp";
    document.TrapParserForm.action = url;
    document.TrapParserForm.submit();
}

function disableTheFields()
{
    if(document.TrapParserForm.type[1].checked)
    {
        document.TrapParserForm.enterprise.disabled=true;
        document.TrapParserForm.enterprise.className="formStyleDisabled";
        document.TrapParserForm.GT.disabled=true;
        document.TrapParserForm.GT.className="formStyleDisabled";
        document.TrapParserForm.ST.disabled=true;
        document.TrapParserForm.ST.className="formStyleDisabled";

        document.TrapParserForm.trapOid.disabled=false;
        document.TrapParserForm.trapOid.className="formStyle";

    }
    else
    {
        document.TrapParserForm.trapOid.disabled=true;
        document.TrapParserForm.trapOid.className="formStyleDisabled";

        document.TrapParserForm.enterprise.disabled=false;
        document.TrapParserForm.enterprise.className="formStyle";
        document.TrapParserForm.GT.disabled=false;
        document.TrapParserForm.GT.className="formStyle";
        document.TrapParserForm.ST.disabled=false;
        document.TrapParserForm.ST.className="formStyle";
    }
}


function loadtheForm()
{
    if (document.TrapParserForm.type[0].checked)
    {
        document.TrapParserForm.trapOid.disabled=true;
        document.TrapParserForm.trapOid.className="formStyleDisabled";
    }
    else
    {
        document.TrapParserForm.enterprise.disabled=true;
        document.TrapParserForm.enterprise.className="formStyleDisabled";
        document.TrapParserForm.GT.disabled=true;
        document.TrapParserForm.GT.className="formStyleDisabled";
        document.TrapParserForm.ST.disabled=true;
        document.TrapParserForm.ST.className="formStyleDisabled";
    }
}

function loadMibs()
{
    document.loadParser.toPerform.value="loadParsersFromMIB";
    document.loadParser.submit();
}

function loadParsers(alertMsg)
{
	if(isEmpty(document.loadParser.parserFileName.value))
	{
		alert(alertMsg);
		document.loadParser.parserFileName.focus();
		return;
	}
    document.loadParser.toPerform.value="loadParsersFromFile";
    document.loadParser.submit();
}
