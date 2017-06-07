/* $Id: CustomizeColumns.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ */

//Function : Submit Form 
function submitForm()
{
	var cansubmit = verifyTokens();
	if(cansubmit)
	{
		document.ModifyColumns.submit();
	}
}

//Function : Verifies storage of space-delimitted string in hidden field
function verifyTokens()
{
    var selectedViewSize = document.ModifyColumns.selectedView.options.length;
    var selecteditems = "";
  
    if(document.ModifyColumns.selectedView.options.length != 0)
    {
        for(var i=0; i<selectedViewSize; i++)
        {
	        if(i==0)
	        {
		        selecteditems = document.ModifyColumns.selectedView.options[i].value;
	        }
	        else
	        {
		        selecteditems = selecteditems+" "+document.ModifyColumns.selectedView.options[i].value;
	        }
        }
        
        document.ModifyColumns.selitems.value = selecteditems;
        return true;
    }
}

//Function : Select item move-up(Multiple select added)
function moveup()
{
    var box = document.ModifyColumns.selectedView;
    
    if(box.length != 0)    
    {
        var selectionModel = new Array();

        for(i=0; i<box.length;i++)
        {
    	        selectionModel[i] = 0;
                if(box.options[0].selected == false)
                {
		        if(box.options[i].selected == true)
		        {
			        selectionModel[i] = 1;	
		        }
                }
        }
        
        for(i=0;i<box.length;i++)
        {
    	        if(selectionModel[i]==1)
	        {
	                var temptext = box.options[i-1].text;
                        var tempvalue = box.options[i-1].value;
                        box.options[i-1].text = box.options[i].text;
                        box.options[i-1].value = box.options[i].value;
                        box.options[i].text = temptext;
                        box.options[i].value = tempvalue;
                        box.options[i].selected = false;
                        box.options[i-1].selected = true;
	 	}
        }
    }
}

//Function : Select item move-down(Multiple select added)
function movedown()
{
    var box = document.ModifyColumns.selectedView;
    var selectionModel = new Array();

    if(box.length != 0)    
    {
        for(i=0; i<box.length;i++)
        {
    	        selectionModel[i] = 0;
                if(box.options[box.length-1].selected == false)
                {
		        if(box.options[i].selected == true)
		        {
			        selectionModel[i] = 1;	
		        }       
                }
        }


        for(i=(box.length-1);i>-1; i--)
        {
    	        if(selectionModel[i]==1)
	        {
	                var temptext = box.options[i+1].text;
                        var tempvalue = box.options[i+1].value;
                        box.options[i+1].text = box.options[i].text;
                        box.options[i+1].value = box.options[i].value;
                        box.options[i].text = temptext;
                        box.options[i].value = tempvalue;
                        box.options[i].selected = false;
                        box.options[i+1].selected = true;
	        }
        }
   }
}

//Function : Add item/items from un-viewed list to selection list
function add()
{
    var currentSize = document.ModifyColumns.unViewedList.options.length;
    var selectSize = document.ModifyColumns.selectedView.options.length;
    var selectionModel = new Array();

    for(var i=0; i<currentSize; i++)
    {
        selectionModel[i] = 0;
        if(document.ModifyColumns.unViewedList.options[i] != null)
        {
        	if(document.ModifyColumns.unViewedList.options[i].selected == true)
        	{
                        selectionModel[i] = 1;
                }
        }
    }

    for(i=(selectionModel.length-1);i>-1;i--)
    {
        if(selectionModel[i]==1)
        {
             		var xv = document.ModifyColumns.unViewedList.options[i].value;
            		var xn = document.ModifyColumns.unViewedList.options[i].text;
            		document.ModifyColumns.unViewedList.options[i] = null;
            		var add = new Option(xn, xv);
            		document.ModifyColumns.selectedView.options[selectSize] = add;
            		selectSize = ++selectSize;
        }
    }
  
}

//Function : Remove item/items from selection list and appends to unviewed list
function remove()
{
    var currentSize = document.ModifyColumns.unViewedList.options.length;
    var selectSize = document.ModifyColumns.selectedView.options.length;
    var allSelected = true;
            
    for(var j=0; j<selectSize; j++)
    {
        if(document.ModifyColumns.selectedView.options[j].selected == false)
        {
             allSelected = false;
             break;
        }
    }    

    if(allSelected == false)
    {
            var selectionModel = new Array();

            for(var i=0; i<selectSize; i++)
            {
                selectionModel[i] = 0;
                if(document.ModifyColumns.selectedView.options[i] != null)
                {
        	        if(document.ModifyColumns.selectedView.options[i].selected == true)
        	        {
                                selectionModel[i] = 1;
                        }
                }
            }

            for(i=(selectionModel.length-1);i>-1;i--)
            {
                if(selectionModel[i]==1)
                {
                        var xv = document.ModifyColumns.selectedView.options[i].value;
            		var xn = document.ModifyColumns.selectedView.options[i].text;
                        document.ModifyColumns.selectedView.options[i] = null;
            		var add = new Option(xn, xv);
            		document.ModifyColumns.unViewedList.options[currentSize] = add;
            		currentSize = ++currentSize;
                }
            }

    }
    else
    {
        alert("Sorry! This operation cannot be performed");
    }
}

