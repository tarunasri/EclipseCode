// JavaScript Document
/*$Id: swipe.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $*/
/* script for toggling a area's visible to invisible */
function MM_findObj(n, d) 
{ //v4.01
  var p,i,x;
    if(!d) d=document;
	 if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document;
	 n=n.substring(0,p);
	}
  if(!(x=d[n])&&d.all) x=d.all[n];
   for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n);
   return x;
}

function closeSwipe(rowid)
{
		var rowObj=MM_findObj('row'+rowid)
		//var bulletObj=MM_findObj('bullet'+rowid)		
		var swipecontentObj=MM_findObj('swipecontent'+rowid)		
		//bulletObj.src="/webclient/common/images/bullet01.gif"		
		swipecontentObj.className='hide'
		swipecontentObj=MM_findObj('swipecontent'+ (rowid - 1))		
		swipecontentObj.className='pagecontent'		
		var editswipeObj=MM_findObj('editswipe'+ (rowid -1))
		editswipeObj.className=''				
		editswipeObj=MM_findObj('editswipe'+ rowid)
		editswipeObj.className=''								
}

function openSwipe(rowid)
{
		var rowObj=MM_findObj('row'+rowid)
		//var bulletObj=MM_findObj('bullet'+rowid)		
		var swipecontentObj=MM_findObj('swipecontent'+rowid)		
		//bulletObj.src="/webclient/common/images/bullet01.gif"		
		swipecontentObj.className=''
		swipecontentObj=MM_findObj('swipecontent'+ (rowid - 1))		
		if(swipecontentObj != null) {
		swipecontentObj.className='pagecontent'		
		}
		var editswipeObj=MM_findObj('editswipe'+ (rowid -1))
		if(editswipeObj != null) {
		editswipeObj.className=''				
		}
		editswipeObj=MM_findObj('editswipe'+ rowid)
		if(editswipeObj != null) {		
		editswipeObj.className=''
		}								
}

function toggle(rowid)
{
		var swipecontentObj=MM_findObj('swipecontent'+rowid)				
		if(swipecontentObj.className == 'hide')
		{
			swipecontentObj.className = '';
		}
		else
		{
			swipecontentObj.className = 'hide';		
		}
}

  
function toggleSwipe(rowid)
{
    //showtime()
var togglelen = swaptableid;
//alert(togglelen);

if(togglelen == '')
{
togglelen=20;
}
	for (i=1;i<=togglelen;i++)
	{	
		var rowObj=MM_findObj('row'+i)

		var swipecontentObj=MM_findObj('swipecontent'+i)
		
		if ('swipecontent'+i == 'swipecontent'+rowid)
		{
				var editswipeObj=MM_findObj('editswipe'+i)
				editswipeObj.className='hide'
				editswipeObj=MM_findObj('editswipe'+ (i+1) )
				editswipeObj.className='hide'				
		
				swipecontentObj.className='hide'
				i++;
				swipecontentObj = MM_findObj('swipecontent'+ i)
				swipecontentObj.className='pagecontent'
		} 
		else
		{
		    if((i % 2) == 0)
			{
				swipecontentObj.className='hide'
			}
			else
			{
				swipecontentObj.className='pagecontent'			
				var editswipeObj=MM_findObj('editswipe'+ i)
				editswipeObj.className=''				
				editswipeObj=MM_findObj('editswipe'+ (i+1))
				editswipeObj.className=''								
			}
		}
	}
}
