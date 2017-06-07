<%--  $Id: HomeLayout.jsp,v 1.9 2010/10/29 13:47:09 swaminathap Exp $  --%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/common/jspf/ModalPopup.jspf" %>
<%@include file="/webclient/common/jspf/HomePageFunctions.jspf" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.*" %>
<html>

<script language="javascript" src="/webclient/common/js/swipe.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/importxml.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
<script language="javascript">


$(document).ready(function()
{
$('.groupWrapper').each(function(i)
{
	$(this).sortable(
			{

			opacity:0.9,
			handle : '.itemHeader',
			scroll: true,
			helper: 'sortHelper',
			start: function(e,ui)
			{
				ui.helper.css("width", ui.item.width());
			}, 
			revert: true,
			connectWith: [$('.groupWrapper').not($(this))],
			tolerance: 'pointer',
			update: function()
			{
			        var itemOrder=new Array();
		       		if($("#col1").length!=0)
				{		
				itemOrder[itemOrder.length] = new widgetOrder("col1",$('#col1').sortable("toArray"));
				}
				if($("#col2").length!=0)
				{
				itemOrder[itemOrder.length] = new widgetOrder("col2",$('#col2').sortable("toArray"));
				}
				if($("#col3").length!=0)
				{
				itemOrder[itemOrder.length] = new widgetOrder("col3",$('#col3').sortable("toArray"));
				}
				if($("#col4").length!=0)
				{
				itemOrder[itemOrder.length] = new widgetOrder("col4",$('#col4').sortable("toArray"));
				}
				getOrder(itemOrder);
			}

			});

});

$('.groupItem .itemContent').mouseover(function(){
	$(this).css("overflow-x","auto");
});

$('.groupItem .itemContent').mouseout(function(){

	$(this).css("overflow-x","hidden");
});


});

function openWindow(url)
{
width = screen.width;
height= screen.height;
delayhideDropDiv(0,'dashboardListDiv');
window.showModalDialog(url,window,"dialogHeight="+height/2+";dialogWidth="+width/2+";center=1;status=0;resizable=1;help=0");
}

function setWidth(id,width)
{
	screenWidth = screen.width;
	var x=document.getElementById(id);
	x.style.width=(screenWidth*width/100);

}


function hidediv(tab1,tab2,tab3)
{
        document.getElementById(tab1).style.display = "";
        document.getElementById(tab2).style.display = "none";
        document.getElementById(tab3).style.display = "none";
        if(tab1 == 'tab1')
        {
                document.getElementById('hometab1').className='navLeftBgSel';
                document.getElementById('hometab2').className='navLeftBg';
                document.getElementById('hometab3').className='navLeftBg';
        }
        if(tab1 == 'tab2')
        {
                document.getElementById('hometab2').className='navLeftBgSel';
                document.getElementById('hometab1').className='navLeftBg';
                document.getElementById('hometab3').className='navLeftBg';
        }
        if(tab1 == 'tab3')
        {
                document.getElementById('hometab3').className='navLeftBgSel';
                document.getElementById('hometab1').className='navLeftBg';
                document.getElementById('hometab2').className='navLeftBg';
        }
}
var selectedskin="SteelBlue";
function showHide(id,id1,skin)
{
        selectedskin = skin;
        if(document.getElementById(id).style.display=='')
	{
                document.getElementById(id).style.display='none';
		document.getElementById(id1).style.display='';
		document.getElementById(id1+1).src='/webclient/common/images/'+selectedskin+'/close-arrow.gif';
		document.getElementById(id+1).src='/webclient/common/images/'+selectedskin+'/open-arrow.gif';
		
	}
	else
	{
		document.getElementById(id).style.display='';
		document.getElementById(id1).style.display='none';
		document.getElementById(id1+1).src='/webclient/common/images/'+selectedskin+'/open-arrow.gif';
		document.getElementById(id+1).src='/webclient/common/images/'+selectedskin+'/close-arrow.gif';
	}
}
    
function showNetworkDatabaseFromPieChart(nodetype)
{
        var url = "/topo/NetworkInventory.do?selectedTab=Network+Database&viewId=Network+Database&type="+nodetype+"&displayName="+nodetype;
        window.location.href= url;
}

function showAlarmsFromAcc(severity)
{
        var category = '<c:out value="${requiredCategory}"/>';
        if(category=='All')
        {
                var url = "/fault/AlarmView.do?selectedTab=Fault&selectedNode=Alerts&severity="+severity;
        }
        else
        {
                var url = "/fault/AlarmView.do?selectedTab=Fault&selectedNode=Alerts&severity="+severity+"&category="+'<c:out value="${requiredCategory}"/>';
        }
        window.location.href= url;    
}




</script>
<body > 
<%
	int count =0;
	Vector data=(Vector) request.getAttribute("widgetDetails");
	Vector dashboardColumn=(Vector) request.getAttribute("dashboardDetails");
if(dashboardColumn==null || dashboardColumn.size()==0)
{
%>

<table width="97%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 7px; margin-bottom: 7px;">
<tr>    
 <td nowrap="" valign="middle" align="center" class="configParams" style="padding-left: 10px;">
<div style="padding: 3px; text-align: center;">
<fmt:message key ='webclient.home.dashboards.message.nodata'/><a href=#" class="bluelink boldTxt" onclick="setPosToDiv('popUpDiv', 'addDashboard', 550);" style="cursor:pointer"><fmt:message key ='webclient.home.dashboards.menuitem.newdashboard'/></a>
</div>
</td>
</tr>
</table>


<%
}
else
{
	Properties dashProps =(Properties) dashboardColumn.get(0);
	session.setAttribute("currentDashboard",dashProps.get("ID"));
	Hashtable columnLevelList=(Hashtable) request.getAttribute("columnLevel");
%> 
<%--  ******************************** Widget related Code Snippet ************************************* --%> 

<table class="pageHeaderStr" width="99%" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px; ">
<tr> 
   <td  nowrap><h1><fmt:message key='${DashboardName}'/></h1></td>
 
<c:if test="${!isRecite eq true}">
 <td style="padding-right:30px;" align="right" valign="bottom">
<table border="0" cellpadding="0" cellspacing="0">
<tr>

 <!--start-->

 <div class="rightF" class="txtGlobal" > 
<td style="padding-right:4px;" onmouseover="closeMenu('actionListDiv');enableMenu('dashboardListDiv',100);" onmouseout="disableMenu();">
   <table id="dashboardListTable" style="width:115px;border-bottom:0px solid;" border="0" cellspacing="0" cellpadding="0" class="dropdownnTxt" > 
    <tr> 
       <td nowrap="nowrap" width="95" ><fmt:message key ='webclient.home.dashboards.firstmenu'/></td> 
       <td width="20" align="right"  style="background-image: url(/webclient/common/images/pulldown_arrow.gif); background-position:center; ">&nbsp;</td> 
     </tr> 
  </table> 
<c:if test="${!empty dashboards}"> 
<% 
// This is done for trimming the menu item dashboard names.
ArrayList dashboards=(ArrayList)request.getAttribute("dashboards");
ArrayList modifiedDashboards = new ArrayList();
for(int i=0;i<dashboards.size();i++)
{
	Hashtable trimmedDash = new Hashtable();
	Hashtable dash= (Hashtable)dashboards.get(i);
	
	String name = (String)dash.get("caption");
	String value = (String)dash.get("tgturl");

	if(name.trim().length()>15)
	{
		name=name.substring(0,15)+"...";
	}
	trimmedDash.put("caption",name);	
	trimmedDash.put("tgturl",value);	
	modifiedDashboards.add(trimmedDash);
}
request.setAttribute("dashboards",modifiedDashboards);


%>
  <div id="dashboardListDiv" class="menuDiv1" style="width:133px;padding:2px;display:none;text-align:left; margin-top:0px;"><c:forEach var="prop" items="${dashboards}" varStatus="status" >
<p onmouseout="disableMenu();removeSelect(this)" onmouseover="javascript:enableMenu('dashboardListDiv',100);mouseSelect(this);" class="menuDivider" onClick="javascript:disableMenu();window.open('<c:out value='${prop.tgturl}'/>','_self');" style="margin: 0px; padding: 0px; clear: both;line-height:20px;cursor:pointer;"><a href="javascript:void(0);"  style="text-decoration:none"> <fmt:message key ='${prop.caption}'/></a>
</p>
</c:forEach> 
  </div> 
   </c:if> 
  </div> 
</td>

 <!--end-->

<td onmouseover="closeMenu('dashboardListDiv');enableMenu('actionListDiv',100);" onmouseout="disableMenu();">
    <!-- Dashboard Actions Drop Down --> 
    <c:if test="${!empty actionList}"> <div class="rightF" class="txtGlobal" style="margin-right:0px"> 
    <table id="actionListTable" style="width:115px;border-bottom:0px solid;" border="0" cellspacing="0" cellpadding="0" class="dropdownnTxt" > 
      <tr> 
        <td nowrap="nowrap" width="95" ><fmt:message key ='webclient.home.dashboards.secondmenu'/></td> 
        <td width="20" align="right"  style="background-image: url(/webclient/common/images/pulldown_arrow.gif); background-position:center; " >&nbsp;</td> 
      </tr> 
    </table> 
    

<div id="actionListDiv" class="menuDiv1" style="width:133px;padding:2px;display:none;text-align:left; margin-top:0px;"> 
        <c:forEach var="prop" items="${actionList}" varStatus="status" > 
        <p onmouseout="disableMenu();removeSelect(this)" onmouseover="enableMenu('actionListDiv',100);mouseSelect(this)" class="menuDivider" onclick="disableMenu();window.open('<c:out value="${prop.tgturl}"/>','_self');" style="margin: 0px; padding: 0px; clear: both;line-height:20px;cursor:pointer;"><a href= "javascript:void(0);" style="text-decoration:none"> <c:out value="${prop.caption}" /> 
          </a> </p>
          </c:forEach> 
<p onmouseout="disableMenu();removeSelect(this)" onmouseover="enableMenu('actionListDiv',100);mouseSelect(this)" class="menuDivider" onclick="disableMenu();setPosToDiv('popUpDiv', 'test2', 550);" style="margin: 0px; padding: 0px; clear: both;line-height:20px;cursor:pointer;">
<a href="javascript:void(0);" style="text-decoration:none"><fmt:message key ='webclient.home.dashboards.menuitem.addwidget'/></a></p>
	<p onmouseout="disableMenu();removeSelect(this)" onmouseover="enableMenu('actionListDiv',100);mouseSelect(this)" class="menuDivider" onclick="disableMenu();setPosToDiv('popUpDiv', 'addDashboard', 550);setDashboardFocus();" style="margin: 0px; padding: 0px; clear: both;line-height:20px;cursor:pointer;"><a href="javascript:void(0);" style="text-decoration:none"><fmt:message key ='webclient.home.dashboards.menuitem.newdashboard'/></a></p>
    </div> 
    </div> 
    </c:if> 
    <%-- Drop down Action list End--%> </td></tr></table>
    </td> 
</c:if>
  </tr> </table> 
  
<%
}
%>


<div  id="popUpDiv"></div>
<jsp:include page="/associateWidget.do?method=input"/>

<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id="addCctv">

<jsp:include page="/associateWidget.do?method=addCctv"/>
</div>
<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id="addDashboard">

<jsp:include page="/modifyDashboard.do?method=getWidgetList"/>
</div>

  
<c:forEach var="dashboardProps" items="${dashboardDetails}" varStatus="status"> 
<%-- column --%> 
<div class="groupWrapper" id="<c:out value='col${dashboardProps.COLUMNID}'/>" style="<c:out value='width:${dashboardProps.COLUMNWIDTH-1}'/>%"> 

<c:forEach var="widgetProps" items="${widgetDetails}" varStatus="count"> 

<c:if test="${widgetProps.COLUMNID == dashboardProps.COLUMNID}"> 
  <%-- Widget Construction Part --%> 
  <div class="groupItem" id="<c:out value='${widgetProps.ID}'/>"> 
    <div class="itemHeaderBg"> 
      <%--Widget Header--%> 
      <div class="itemHeader" id="<c:out value='widget_title${widgetProps.ID}'/>"> <fmt:message key ='${widgetProps.NAME}'/></div> 
      <div class="itemHeader1"> <span onclick="javascript:cancelEdit('<c:out value="${widgetProps.ID}"/>', '<c:out value="${dashboardProps.ID}"/>','<c:out value="${dashboardProps.COLUMNWIDTH}"/>');"><img src="/webclient/common/images/reloadWidget.gif" border="0" title="<fmt:message key ='webclient.home.dashboards.widgetheader.reloadwidget'/>"/></span> <span onclick="javascript:editDashWidget('<c:out value="${widgetProps.ID}"/>', '<c:out value="${widgetProps.NAME}"/>','<c:out value="${dashboardProps.COLUMNWIDTH}"/>','<fmt:message key="webclient.home.dashboards.widget.reloading"/>');"><img src="/webclient/common/images/editWidget.gif" border="0" title="<fmt:message key ='webclient.home.dashboards.widgetheader.editwidget'/>"/></span> <span onclick="javascript:deleteWidget('<c:out value="${widgetProps.ID}"/>','<c:out value="${dashboardProps.ID}"/>');"><img src="/webclient/common/images/deleteWidget.gif" border="0" title="<fmt:message key ='webclient.home.dashboards.widgetheader.deletewidget'/>"/></span> </div> 
    </div> 
    <%--Widget Header End--%> 
    <%-- Widget Content Part --%> 
    <div class="itemContent" id="<c:out value='widget${widgetProps.ID}'/>"></div> 
    <%-- Widget Content Part End--%> 
  </div> 
  </c:if> </c:forEach>  </div> <em  class="colomnSpliter"> </em>
</c:forEach> 
<%-- Widget Construction Part End--%> 

<script>
<c:forEach var="dashboardProps" items="${dashboardDetails}" varStatus="status">
<c:forEach var="widgetProps" items="${widgetDetails}" varStatus="count">

<c:if test="${widgetProps.COLUMNID == dashboardProps.COLUMNID}">
getContent('<c:out value="${widgetProps.ID}"/>','<c:out value="${dashboardProps.ID}"/>','<c:out value="${dashboardProps.COLUMNWIDTH}"/>');	
new widget('<c:out value="${widgetProps.ID}"/>','<c:out value="${dashboardProps.ID}"/>','<c:out value="${widgetProps.INTERVAL}"/>','<c:out value="${dashboardProps.COLUMNWIDTH}"/>');
</c:if>
<%--setWidth('<c:out value="col${dashboardProps.COLUMNID}"/>','<c:out value="${dashboardProps.COLUMNWIDTH}"/>');--%>
</c:forEach>
</c:forEach>

</script> 
</body>
</html>
