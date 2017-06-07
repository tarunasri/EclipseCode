//$Id: moFunctions.js,v 1.2 2010/10/29 13:47:15 swaminathap Exp $

function toggleScroll(id)
{
   if(document.getElementById(id).style.overflow != 'hidden')
   {
  	document.getElementById(id).style.overflow="hidden";
   }
   else
  {
  	document.getElementById(id).style.overflow="auto";
  }
}

function showAlarmChart(id,pos)
{
  
  toShow = document.getElementById(id);
   
  setPosForAS(pos,id,280);
  
  toShow.style.display="block";
}

function setPosForAS(a, b, popDivWidth){
        
        if(prevDiv!=null && document.getElementById(prevDiv)!=null)
        {
                document.getElementById(prevDiv).style.display='none'
        }
        
        prevDiv=b;
        
        element1 = document.getElementById(a);
        
        popDivEle = document.getElementById(b);
                              
        posi = getDivLocation(element1);
         
        popDivEle.style.position='absolute';
       
        popDivEle.style.left=parseInt((posi[0] + document.getElementById(a).offsetWidth/2) -(popDivWidth/2))+'px';
        
        popDivEle.style.top=parseInt(posi[1]-250)+'px';
        
        popDivEle.style.display = '';
        
}



function showMOActions(id)
{
  
  if(count==0)
  {
    var actions_id = document.getElementById(id);
    actions_id.style.display="block";
    count++;
    
  }
  else
  {
    var actions_id_hide = document.getElementById(id);
    actions_id_hide.style.display="none";
    count=0;
    
  }
}

function showNetworkDetails()
{
  
  var val = document.getElementById('parentnetslist2').value; 
  
  location.href="/topo/objectdetails.do?requestid=SNAPSHOT&name="+val; 
 }

function showSubNetworks()
 {
  var val = document.getElementById('subnetslist').value;
  location.href="/topo/objectdetails.do?requestid=SNAPSHOT&name="+val;
 }

function showGroups()
{
  var val = document.getElementById('groupslist').value;
  location.href="/topo/objectdetails.do?requestid=SNAPSHOT&name="+val;
}

var edit_page = false;
function hidediv1(id1,id2,id3)
{    
      
      document.getElementById(id1).style.display= "block";
      document.getElementById(id2).style.display= "none";
      if(id3 != 'null1' && id3 != 'cancel')
      {
        
        document.getElementById(id3).style.display= "none";  
      }
      
        if(id1 == 'devicedetail' && id3 != 'cancel') 
        { 
           
                document.getElementById('hometab1').className='tabLeftBgSel';
                document.getElementById('hometab2').className='tabLeftBgnotSel';
                
               if(edit_page == false)
               { 
                  if(document.getElementById('edittoggle') != null)
                  {
                    document.getElementById('edittoggle').innerHTML = document.getElementById('edittoggle1').innerHTML;
                  }
                  if(document.getElementById('edit') != null)
                  {
                    document.getElementById('edit').style.display = "";
                  }
		       }
		       if(edit_page == true)
		       {
		         
		          document.getElementById('devicedetail_edit').style.display="block"; 
		          document.getElementById('devicedetail').style.display="none";
		          document.getElementById('edittoggle').innerHTML = document.getElementById('canceltoggle').innerHTML;
                  document.getElementById('cncl').style.display = "";
		          
               }
        }

        if (id1 == 'devicedetail' && id3 == 'devicedetail_edit')
        {
              
                document.getElementById('hometab1').className='tabLeftBgSel';
                document.getElementById('hometab2').className='tabLeftBgnotSel';
                
               if(edit_page == false)
               { 
                    if(document.getElementById('edittoggle') != null)
                    {
		          document.getElementById('edittoggle').innerHTML = document.getElementById('edittoggle1').innerHTML;
                    }
                  if(document.getElementById('edit') != null)
                  {
                    document.getElementById('edit').style.display = "";
                  }
		       }
		        if(edit_page == true)
		       {
		          
		          document.getElementById('devicedetail_edit').style.display="block"; 
		          document.getElementById('devicedetail').style.display="none";
		          document.getElementById('edittoggle').innerHTML = document.getElementById('canceltoggle').innerHTML;
                  document.getElementById('cncl').style.display = "";
		         
               }
        }
        if(id1 == 'DeviceNote')
        { 
                
                document.getElementById('hometab2').className='tabLeftBgSel';
                document.getElementById('hometab1').className='tabLeftBgnotSel';
                
                
                if(document.getElementById('edit') != null)
                {
		          document.getElementById('edit').style.display = "none";
		        }
		        if(document.getElementById('cncl') != null)
		        {
                  document.getElementById('cncl').style.display = "none";
                }

        }
        if(id1 == 'devicedetail_edit')
        {
                if(document.getElementById('edittoggle') != null)
                {
                  document.getElementById('edittoggle').innerHTML = document.getElementById('canceltoggle').innerHTML;
                }
                document.getElementById('cncl').style.display = "";
                edit_page = true;
        }

        if(id3 == 'cancel')
        {       
                if(document.getElementById('edittoggle') != null)
                {
                  document.getElementById('edittoggle').innerHTML = document.getElementById('edittoggle1').innerHTML;
                }
                
                if(document.getElementById('edit') != null)
                {
                  
                 document.getElementById('edit').style.display = "";
                }
                edit_page = false;
                
        }
          
}

