//$Id: listrowselection.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $
    var pre;
    function Toggle(e,form,event)
    {
        if(event.shiftKey)
        {
           shiftSelection(e);
        }
	if (e.checked) {
	    Highlight(e);
	    form.toggleAll.checked = AllChecked(form);
	}
	else {
	    Unhighlight(e);
	    form.toggleAll.checked = false;
	}
        pre = e;
    }

    function shiftSelection(el)
    {
       var p = pre;
       if(p)
       {
           var l = document.getElementsByName(p.name);
           var from;
           var to;
           for(var i=0; i < l.length ; i++)
           {
              if(l[i] == p)
              {
                 from = i;              
              }
              if(l[i] == el)
              {
                 to = i;
              }
           }
           if(parseInt(from)>parseInt(to))
           {
              var swap = from;
              from =to;
              to = swap;
           }
          checkSelected(from,to,l,el);
       }
    }
   
    function checkSelected(from,to,l,el)
    {
       var lastElement = el.checked;
       for(var i=0; i < l.length ; i++)
       {
          if(l[i]!=el)
          {
             if(i >= parseInt(from) && i <= parseInt(to))
             {
                    if(lastElement)
                       l[i].checked=true;
                    else
                       l[i].checked=false;
             }
          }
       }
    }

    function ToggleAll(e,form)
    {
	if (e.checked) {
	    CheckAll(form);
	}
	else {
	    ClearAll(form);
	}
    }

    function Check(e)
    {
	e.checked = true;
	Highlight(e);
    }

    function Clear(e)
    {
	e.checked = false;
	Unhighlight(e);
    }

    function CheckAll(form)
    {
	var ml = form;
	var len = ml.elements.length;
	for (var i = 0; i < len; i++) {
	    var e = ml.elements[i];
	    if (e.name == "rowSelection") {
		Check(e);
	    }
	}
	ml.toggleAll.checked = true;
    }

    function ClearAll(form)
    {
	var ml = form;
	var len = ml.elements.length;
	for (var i = 0; i < len; i++) {
	    var e = ml.elements[i];
	    if (e.name == "rowSelection") {
		Clear(e);
	    }
	}
	ml.toggleAll.checked = false;
    }

    function Highlight(e)
    {
	var r = null;
	if (e.parentNode && e.parentNode.parentNode) {
	    r = e.parentNode.parentNode;
	}
	else if (e.parentElement && e.parentElement.parentElement) {
	    r = e.parentElement.parentElement;
	}
	if (r) {
        //        r.className = "selectedColor";
        
	    if (r.className == "rowOdd") {
		r.className = "rowOddSelected";
	    }
	    else if (r.className == "rowEven") {
		r.className = "rowEvenSelected";
	    }
        
	}
    }

    function Unhighlight(e)
    {
	var r = null;
	if (e.parentNode && e.parentNode.parentNode) {
	    r = e.parentNode.parentNode;
	}
	else if (e.parentElement && e.parentElement.parentElement) {
	    r = e.parentElement.parentElement;
	}
	if (r) {
        //        r.className = "deselectedColor";
       
	    if (r.className == "rowOddSelected") {
		r.className = "rowOdd";
	    }
	    else if (r.className == "rowEvenSelected") {
		r.className = "rowEven";
	    }
        
	}
    }

    function AllChecked(form)
    {
	ml = form;
	len = ml.elements.length;
	for(var i = 0 ; i < len ; i++) {
	    if (ml.elements[i].name == "rowSelection" && !ml.elements[i].checked) {
		return false;
	    }
	}
	return true;
    }
