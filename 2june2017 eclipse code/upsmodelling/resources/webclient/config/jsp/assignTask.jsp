<%-- $Id: assignTask.jsp,v 1.3 2010/10/29 13:47:05 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
</head>
<script>

function validateAssignTasks()
{
    var associatedSize = document.dlForm.associatedTasks.options.length;
    var availableSize = document.dlForm.availableTasks.options.length;

    var associateditems = "";
    var availableitems = "";
    if(associatedSize != 0)
    {
        for(var i=0; i<associatedSize; i++)
        {
                if(i==0)
                {
                        associateditems = document.dlForm.associatedTasks.options[i].value;
                }
                else
                {
                        associateditems = associateditems + "," + document.dlForm.associatedTasks.options[i].value;
                }
        }
        document.dlForm.associatedItems.value = associateditems;

    }
    if(availableSize != 0)
    {
        for(var i=0; i<availableSize; i++)
        {
                if(i==0)
                {
                        availableitems = document.dlForm.availableTasks.options[i].value;
                }
                else
                {
                        availableitems = availableitems + ","+ document.dlForm.availableTasks.options[i].value;
                }
        }

        document.dlForm.availableItems.value = availableitems;
    }
    return true;
}

function add()
{
	var currentSize = document.dlForm.availableTasks.options.length;
	var selectSize =  document.dlForm.associatedTasks.options.length;
	var selectionModel = new Array();
    	for(var i=0; i<currentSize; i++)
    	{
        	selectionModel[i] = 0;
        	if(document.dlForm.availableTasks.options[i] != null)
        	{
                	if(document.dlForm.availableTasks.options[i].selected == true)
                	{
                        	selectionModel[i] = 1;
                	}
        	}
    	}

    	for(i=(selectionModel.length-1);i>-1;i--)
    	{
        	if(selectionModel[i]==1)
        	{
                	var xv = document.dlForm.availableTasks.options[i].value;
                        var xn = document.dlForm.availableTasks.options[i].text;
                        document.dlForm.availableTasks.options[i] = null;
                        var add = new Option(xn, xv);
                        document.dlForm.associatedTasks.options[selectSize] = add;
                        selectSize = ++selectSize;
        	}
    	}
}

function remove()
{

	var currentSize = document.dlForm.availableTasks.options.length;
	var selectSize =  document.dlForm.associatedTasks.options.length;

      	var selectionModel = new Array();
       	for(var i=0; i<selectSize; i++)
       	{
     		selectionModel[i] = 0;
       		if(document.dlForm.associatedTasks.options[i] != null)
         	{
                	if(document.dlForm.associatedTasks.options[i].selected == true)
                	{
                		selectionModel[i] = 1;
                	}
            	}
        }
        for(i=(selectionModel.length-1);i>-1;i--)
        {
          	if(selectionModel[i]==1)
            	{
                	var xv = document.dlForm.associatedTasks.options[i].value;
                	var xn = document.dlForm.associatedTasks.options[i].text;
                	document.dlForm.associatedTasks.options[i] = null;
		        var add = new Option(xn, xv);
                	document.dlForm.availableTasks.options[currentSize] = add;
		        currentSize = ++currentSize;
            	}
        }
}

function resetFields1()
{
    var currentSize = document.dlForm.availableGroups.options.length;
    var selectSize =  document.dlForm.existingGroups.options.length
    var selectionModel = new Array();

    for(var i=(currentSize-1);i>-1;i--)
    {
        document.dlForm.availableGroups.options[i] = null;
    }
    for(var j=(selectSize-1);j>-1;j--)
    {
        document.dlForm.existingGroups.options[j] = null;
    }

    var existingitems = document.dlForm.existingItems.value;
    var availableitems = document.dlForm.availableItems.value;
    if(existingitems != '') 
    {
        var tokeniz = existingitems.split(",");
        for(var i=0;i<tokeniz.length; i++)
        {
            var add = new Option(tokeniz[i], tokeniz[i]);
            document.dlForm.existingGroups.options[i] = add;
        }
    }

    if(availableitems != '') 
    {
        var tokeniz2 = availableitems.split(",");
        for(var j=0;j<tokeniz2.length; j++)
	//alert('Available user ' +tokeniz2[j]);
	var add = new Option(tokeniz2[j], tokeniz2[j]);
            document.dlForm.availableGroups.options[j] = add;
    }
}
</script>
 <body>
<c:choose>
<c:when test='${showForm eq "false"}'>
 <table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
	  <td align='center' class="generalTBPadding">
	  <c:out value='${result}'/></td>
	  <td class="generalCurveRight">&nbsp;</td>
  </tr>
        <tr class="header2bg" height="25" > 
          <td class="generalCurveLeft">&nbsp;</td> 
          <td align="center"> 
		  	<input name="ok" type="button" id="Submit" value="<fmt:message key='webclient.config.dl.assign.cancel'/>" class="button" onclick="javascript:window.close();">
          </td>
	  <td class="generalCurveRight">&nbsp;</td>
        </tr>

  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</c:when>
<c:otherwise>

<form name="dlForm" action="/config/TaskAction.do?actionToPerform=saveAssociateDLForm" method="POST" onSubmit="return validateAssignTasks()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
		<fmt:message key="webclient.config.dl.assign.title"> <fmt:param><c:out value='${dlName}'/></fmt:param> </fmt:message></h1></td>
		<td align="right"></td>
        </tr>
        </table>

<input type="hidden" name="dlName" value="<c:out value='${dlName}'/>">
<input type="hidden" name="assnTasks" value="<c:out value='${assnTasks}'/>">
<input type="hidden" name="availableItems" value="">
<input type="hidden" name="associatedItems" value="">

 <table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
<table width="70%" border="0" cellpadding="0" cellspacing="0">
  <tr align="center" > 
  <td width="10">&nbsp;</td>
  <td align="left" align="center" valign="top" > 
    <table width="100%" border="0" cellpadding="1" cellspacing="1" >
        <tr align="center"> 
      <td height="25" colspan="3" align="left" class="text"><fmt:message key="webclient.config.dl.assign.message"/></td>
     </tr>
      <tr><td colspan="3" >&nbsp; </td>
     <tr valign="top"> 
       <td class="text"><fmt:message key="webclient.config.dl.assign.available"/></td>
       <td align="middle"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       <td   ><span class="text"><fmt:message key="webclient.config.dl.assign.associated"/></span></td>
     </tr>
     <tr valign="top"> 
     <td> 
        <select class="formStyle" multiple name="availableTasks" size="5" style="height:auto;" > <c:forEach items="${availableTasks}" var="task" varStatus="status"> 
        <option value='<c:out value="${task}"/>'> <c:out value="${task}"/>
       </option>
       </c:forEach> 
       </select> </td>

      <td align="center" width="0"> <table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr > 
       <td><a href="javascript:add()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_add.gif" 
        width="35" height="25" alt='<fmt:message key="webclient.config.dl.assign.img.add.alt"/>' 
        border="0"></a></td>
     </tr>
     <tr> 
      <td> <img src="/webclient/common/images/trans.gif" width="1" height="3"></td>
     </tr>
     <tr> 
 <td><a href="javascript:remove()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_remove.gif"
        width="35" height="25" alt='<fmt:message key="webclient.config.dl.assign.img.remove.alt"/>' 
        border="0"></a></td>
     </tr>
    </table></td>
    <td> <select class="formStyle" multiple name="associatedTasks" size="5" style="height:auto;"> <c:forEach items="${associatedTasks}" var="task" varStatus="status"> 
                  <option value='<c:out value="${task}"/>'> <c:out value="${task}"/> 
                  </option>
                  </c:forEach> </select> </td>
              </tr>
            </table></td>
        </tr>
        <tr><td colspan="2" >&nbsp; </td>
        </tr>
        <tr class="header2bg" height="25" > 
          <td align="center" colspan="2"> 
		  	<input name="Submit" type="submit" id="Submit" value="<fmt:message key='webclient.config.dl.assign.submit'/>" class="button">
			 <input name="Reset" type="button" class="button" value="<fmt:message key='webclient.config.dl.assign.reset'/>" onclick="window.location.href=window.location.href">
            <input name="Cancel" type="button" class="button" onclick="javascript:window.close()" value='<fmt:message key="webclient.config.dl.assign.cancel"/>'> 
          </td>
        </tr>
       <tr><td colspan="2" >&nbsp; </td>
        </tr>
</table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</c:otherwise>
</c:choose>
</body>
</html>
