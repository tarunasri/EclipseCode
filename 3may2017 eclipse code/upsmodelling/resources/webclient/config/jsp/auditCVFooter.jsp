<%-- $Id: auditCVFooter.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript">
function previewResults()
{
                search();
                document.searchForm.method.value = "search";
}
function addCV()
{
    if(validateMultipleRows() && validateInputs() && validateSearch())
        {
            document.searchForm.method.value = "create";
            document.searchForm.submit();
        return true;
        }
    else
        {
            return false;
        }

}

function validateSearch()
{
   var numrows = parseInt(document.searchForm.rows.value);
    for(ci=0;ci<numrows;ci++)
    {
        criteriaValues = document.searchForm.elements["searchForm["+ci+"].criteriaValues"];
        var values = criteriaValues.value;
        if(trimAll(values) == "")
        {
            alert("<fmt:message key='webclient.common.fields.validation.empty'/>");
            return false;
        }
    }
    changeNames();
    document.searchForm.method.value = "search";
return true;
 }

function modifyCV()
{
    if(validateMultipleRows() && validateInputs() && validateSearch())
        {
            document.searchForm.method.value = "modify";
            document.searchForm.submit();
        return true;
        }
    else
        {
            return false;
        }
}

function validateInputs()
{
        var value = document.searchForm.cvName.value;
        if(trimAll(value) == "")
        {
            alert("<fmt:message key='webclient.config.audit.validation.cvname.empty'/>");
            return false;
        }
        return true;
}

function validateMultipleRows()
{
	var numrows = parseInt(document.searchForm.rows.value);
	var keys = "";
	for(ci=0;ci<numrows;ci++)
	{
		criteriaKeys = document.searchForm.elements["searchForm["+ci+"].selectedKeys"];
		if(keys == '')
		{			
			keys = criteriaKeys.value;
		}
		else
		{
			if(keys.indexOf(',')==-1)
			{
				if(keys == criteriaKeys.value)
				{
					alert("<fmt:message key='webclient.common.search.sameCriteriaError'/>"+" "+criteriaKeys.value);
					return false;
				}
				else
				{
					keys = keys+','+criteriaKeys.value;
				}
			}
			else
			{
				var keyNames = keys.split(',');
				for(ki=0;ki<keyNames.length;ki++)
				{
					if(keyNames[ki] == criteriaKeys.value)
					{
						alert("<fmt:message key='webclient.common.search.sameCriteriaError'/>"+" "+criteriaKeys.value);
						return false;
					}
				}
				keys = keys+','+criteriaKeys.value;
			}
		}
	}
	return true;
}
</script>
<tr>
        <td align="center"> <input name="morebutton" type="button" class="button" onClick="more()" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>">
		<input name="fewerbutton" type="button" class="button" onClick="fewer()" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>"></td>
</tr>
<tr>
        <td height="5">&nbsp;</td>
</tr>
<tr > 
    <td align="left" valign="top"> <table width="596" border="0" cellspacing="0" cellpadding="6">
        <tr> 
          <td align="center"> 
<c:choose>
<c:when test ='${searchForm.map.actionToPerform == "create"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="addCV()" value='<fmt:message key='webclient.config.audit.cv.button.create'/>'> 
</c:when>
<c:when test ='${searchForm.map.actionToPerform == "modify"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="modifyCV()" value='<fmt:message key='webclient.config.audit.cv.button.modify'/>'> 
</c:when>
</c:choose>
                <input type="button"  value="<fmt:message key='webclient.config.audit.cv.button.cancel'/>" class="button" onClick="location.href='/config/AuditView.do?selectedTab=Configuration&viewId=ConfigAudit&firstChild=false&swipe=true&nodeClicked=ConfigAudit&selectedNode=ConfigAudit&displayName=Audit'"/>&nbsp;
            </td>
        </tr>
      </table></td>
  </tr>

