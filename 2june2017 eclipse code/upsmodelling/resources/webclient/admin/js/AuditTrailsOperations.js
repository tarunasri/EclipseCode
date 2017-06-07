//$Id: AuditTrailsOperations.js,v 1.3 2010/10/29 13:46:53 swaminathap Exp $


function clearAudit(url, errMsg, confirmMsg)
{
    var listViewForm = document.listView;
    var len = listViewForm.elements.length;
    var selectedAuditId = '';
    for ( var i=0; i < len; i++)
    {
        formElement = listViewForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedAuditId == '')
            {
                selectedAuditId = formElement.value;
            }
            else
            {
                selectedAuditId += ',' + formElement.value;
            }
        }
    }
    if(selectedAuditId == '')
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
        
        url = url +"&isAscending="+isAscending+"&orderByColumn="+orderByColumn+"&FROM_INDEX="+from+"&PAGE_NUMBER="+page+"&authAuditId=" + selectedAuditId+"&viewLength="+viewLength;
        location.href = url;
    }
}    

function loadSearchPage(id)
{
 	var url="/admin/authAuditAdvancedSearch.do?ComplexSearchView=AuthAudit&viewId="+id+"&searchAction=authAuditAdvancedSearch.do";
	window.location.href=url; 
}
