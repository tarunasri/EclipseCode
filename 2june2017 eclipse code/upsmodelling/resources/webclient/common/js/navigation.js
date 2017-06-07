/* $Id: navigation.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ */

//Function : Used for Page Selection
function showPage(link)
{
        mainlink = link.substring(1,(link.length-1))
        splitlinks = mainlink.split("&");
        for(i=0;i<(splitlinks.length-1);i++)
        {
                splitvalues = splitlinks[i].split("=");
                if(!storePageDetails(splitvalues[0],splitvalues[1]))
                {
                        return;
                }
        }
        document.pagexform.submit();        
}

//Function : Used for storing in hidden fields
function storePageDetails(field,value)
{
        if(field == "FROM_INDEX")
        {
               document.pagexform.FROM_INDEX.value = value;
               return true;
        }
        else if(field == "TO_INDEX")
        {
               document.pagexform.TO_INDEX.value = value;
               return true; 
        }
        else if(field == "PAGE_NUMBER")
        {
               document.pagexform.PAGE_NUMBER.value = value;
               return true;
        }
        else
        {
                return false;
        }
        
}

//Function : Used for Column Customizer popup windows
function openNewWindow(url)
{
        win_name="ColumnCustomizer";

        win_props="width=550,height=250,screenX=300,screenY=200,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";

        custwindow = window.open(url,win_name,win_props);
        custwindow.opener = window;

	navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
}

//Function : Used for form submission - on page-length change.
function updatePageLength()
{     
     document.pagexform.FROM_INDEX.value = "1";
     document.pagexform.TO_INDEX.value = parseInt(document.pagexform.FROM_INDEX.value) + parseInt(document.pagexform.viewLength.value)-1;
     document.pagexform.PAGE_NUMBER.value = "1";
     document.pagexform.submit();
}

//Function : Used for form submission from the list view - for sorting/ordering by column
function doSorting(isAscending,orderByColumn)
{
        if(orderByColumn != document.pagexform.orderByColumn.value )
        {
	        document.pagexform.isAscending.value = "true";
	        document.pagexform.orderByColumn.value = orderByColumn;
        }
        else
        {
                if(isAscending == "true")
                {
                        isAscending="false";
                }       
                else if(isAscending == "false")
                {
                        isAscending="true";
                }
	        document.pagexform.isAscending.value = isAscending;
	        document.pagexform.orderByColumn.value = orderByColumn;
                
        }
        document.pagexform.FROM_INDEX.value="1";
        document.pagexform.TO_INDEX.value = parseInt(document.pagexform.FROM_INDEX.value) + parseInt(document.pagexform.viewLength.value)-1;
        document.pagexform.PAGE_NUMBER.value="1";
	document.pagexform.submit();
}

//Function : Used for form submission from other window popups - on column customization
function doForeignSubmit(wndHndl)
{
	document.pagexform.submit();
	wndHndl.close();
}

