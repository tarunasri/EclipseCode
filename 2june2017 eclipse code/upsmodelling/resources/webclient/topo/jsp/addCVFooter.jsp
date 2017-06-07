<%-- $Id: addCVFooter.jsp,v 1.4 2010/10/29 13:47:16 swaminathap Exp $ --%>
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
            alert("<fmt:message key='webclient.topo.cv.cvname.validation.empty'/>");
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

//added for validation of field values.
        var selindex = document.searchForm.elements["searchForm["+ci+"].selectedKeys"].options.selectedIndex;
                        
        var type = types[selindex];    
        if(type == "NUMBER")
        {
            criteriaValues = document.searchForm.elements["searchForm["+ci+"].criteriaValues"];
            var values = criteriaValues.value;
            if(!isPositiveInteger(values))
            {
                alert("<fmt:message key='webclient.common.search.validation.integer'/>");
                document.searchForm.elements["searchForm["+ci+"].criteriaValues"].focus();
                return false;
            }
        }

  	  if(type == "DATE")
        {

          criteriaValues = document.searchForm.elements["searchForm["+ci+"].criteriaValues"];
          var dateValue = criteriaValues.value;
          if(!verifyDateFormat(dateValue))
          {
              return false;
          }
        } 
        if(type == "BOOLEAN")
	{
          criteriaValues = document.searchForm.elements["searchForm["+ci+"].criteriaValues"];
            var value = criteriaValues.value;
		if(!validateBooleanValue(value))
		{
			alert('<fmt:message key="webclient.search.type.boolean.invalidentry"/>');
			return false;
		}
	}


	}
	return true;
}
</script>

<tr > 
    <td align="left" valign="top"> <table width="596" border="0" cellspacing="0" cellpadding="6">
        <tr> 
<td width="100" align="left"><input name="preview" type="button" class="button" id="preview" onClick="previewResults()" value='<fmt:message key='webclient.topo.preview.button'/>'></td>


          <td width="500" height="40" align="left"> 
<c:choose>
<c:when test ='${searchForm.map.actionToPerform == "create"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="addCV()" value='<fmt:message key='webclient.topo.addcv.button'/>'> 
</c:when>
<c:when test ='${searchForm.map.actionToPerform == "modify"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="modifyCV()" value='<fmt:message key='webclient.topo.modifycv.button'/>'> 
</c:when>
</c:choose>
         </td>
        </tr>
      </table></td>
  </tr>

<c:if test ='${param.method == "search"}'>
<c:choose>
<c:when test ='${! empty viewData}'>
<tr class="header1Bg"> 
<table width="100%" cellSpacing=0 border="0">    
<tr class="header1Bg">
<td height="30"><span class="header1"><fmt:message key='webclient.topo.preview.header'/></span></td>
<td class="text" align="right"> <fmt:message key='webclient.topo.preview.count'><fmt:param value="${RECORDS}"/></fmt:message></td>
</tr>
<!--/table>
</tr-->

  <tr > 
    <td colspan="2" align="left" valign="top" class="propertyHeader">
            
  <%@include file = "/webclient/topo/jsp/inventoryList.jsp" %>

    </td>
  </tr>
</table>
</tr>
</c:when>
<c:otherwise>
<tr > 
    <td height="10" class="header1Bg"> <br></td>
</tr>
<tr class="header1Bg"> 
    <td height="30" class="header1Bg" align=center><span class="text"><fmt:message key='webclient.topo.preview.noresult'/> </span></td>
</tr>

</c:otherwise>
</c:choose>

</c:if>
