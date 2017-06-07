<%-- $Id: addMapFooter.jsp,v 1.2 2010/10/29 13:47:10 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript">

function addCV()
{
    if(validateInputs() && validateSearch())
        {
            document.searchForm.method.value = "addMap";
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
        
    }
    changeNames();
    document.searchForm.method.value = "search";
return true;
 }

function modifyCV()
{
    if(validateInputs() && validateSearch())
        {
            document.searchForm.method.value = "modifyMap";
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
        var value = document.searchForm.name.value;
        if(trimAll(value) == "")
        {
            alert("<fmt:message key='webclient.map.cv.addmap.js.error'/>");
	    document.searchForm.name.value="";
	    document.searchForm.name.focus();
	    return false;
        }

	if(isSpecialSymbol(value))
	{
	   alert("<fmt:message key='webclient.map.alert.specialsymbols'/>");
	   document.searchForm.name.focus();
	   return false;
	}

	//added for validation of field values.
	var numrows = parseInt(document.searchForm.rows.value);
	for(ci=0;ci<numrows;ci++)
	{
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

<tr class="propertyHeader"> 
    <td align="left" valign="top" class="propertyHeader"> <table width="596" border="0" cellspacing="0" cellpadding="6">
     <tr> 
     <td width="137" height="25" align="left"> 
<c:choose>
<c:when test ='${searchForm.map.actionToPerform == "addMap"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="addCV()" value='<fmt:message key='webclient.map.cv.addmap.addbutton'/>'> 
</c:when>
<c:when test ='${searchForm.map.actionToPerform == "modifyMap"}'>
 <input name="customview322" type="button" class="button" id="customview322" onClick="modifyCV()" value='<fmt:message key='webclient.map.cv.addmap.modifybutton'/>'> 
</c:when>
</c:choose>
         
        </tr>
      </table></td>
  </tr>


