<%-- $Id: OperationTree.jsp,v 1.3 2008/10/15 14:07:34 lakshmipriya Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="tree" uri="http://www.adventnet.com/webclient/tree-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el"  %>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="Javascript" SRC="/webclient/common/js/DO.js" type="text/javascript"></script>


<script>
    var daobj = new DataObject();
    var operationList = new Array();

</script>
<%@include file="/webclient/admin/jspf/operationTree.jspf" %>
<script>
function DisplayDO()
{
    //alert(daobj.displayDO());
     //daobj.displayDO();
    document.write(daobj.displayDO());
}

function deleteOperation(operationName)
{
    var con = confirm('<fmt:message key="webclient.admin.operationtree.delconfirm"/>');
    if ( con != true)
    {
        return;
    }
    location.href="/admin/OperationsAction.do?toPerform=removeOperation&operationName="+operationName;
}

</script>
<body onload="javascript:initializeTree()">
<form name="OperationTree" method="post" action="/admin/OperationsAction.do" onsubmit="return onOperationSubmit()">

<c:choose> <c:when test="${Operation eq 'AddGroup'}" > 

<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr> 
    <td height="20"><span class="pageHeader"><fmt:message key="webclient.admin.operationtree.addgroup"/></span></td>
  </tr>
  <tr> 
    <td class="hline" height="1"><img src="/webclient/common/images/trans.gif" height="1" width="1"></td>
  </tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr>
  	<td class="text" align="right" width="15%" valign="bottom" nowrap ><fmt:message key="webclient.admin.operationtree.gname"/></td>
	<td height="35" valign="bottom"><input type="text" name="groupName" value="<c:out value='${groupName}'/>" class="formStyleSmall" style="width:150px"></td>
  </tr>
</table>
<br>

</c:when> <c:otherwise> 
    <input type=hidden name="groupName" value="<c:out value="${groupName}"/>" />
 </c:otherwise> </c:choose>

 <input type=hidden name="OperationConfig" value="<c:out value="${OperationConfig}" default="${param.OperationConfig}" />"/>
    <input type=hidden name="selectedUser" value="<c:out value="${selectedUser}" default="${param.selectedUser}" />" />
    <input type=hidden name="toPerform" value="<c:out value="${toPerform}" default="${param.toPerform}"  />" />
    <input type=hidden name="OperationTreeAsXML"  value="" />
   <input type=hidden name="pageinfo" value="<c:out value="${pageinfo}" default="${param.pageinfo}" />" />   

<%--
    for(java.util.Enumeration en = request.getParameterNames(); en.hasMoreElements(); )
    {
        String keyy = (String)en.nextElement();
        System.out.println("The key --- "+ keyy + "     value     "+request.getParameter(keyy));
    }
--%>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr> 
    <td height="20"><span class="pageHeader"><fmt:message key="webclient.admin.operationtree.header"/></span></td>
    <td align="right"> <%-- <a href="javascript:DisplayDO()" class="text">Display DO</a> --%> </td>
  </tr>
</table>
<%--
<c:choose> <c:when test="${Operation eq 'AddOperation'}" > --%>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="#FFFFE5" align="center" style="margin-top:3px;border:1px solid #666">
  <tr> 
    <td nowrap valign="top" class="text"><img src="/webclient/common/images/hint.gif" hspace="3" align="absmiddle"><strong><fmt:message key="webclient.admin.operationtree.hint"/> </strong></td>
 <!-- </tr>
  <tr>  -->
    <td valign="top"><ul class="text" style="margin-top:0px;margin-bottom:0px">
     <c:choose>
     <c:when test="${Operation eq 'AddOperation'}" >
        <li><img src="/webclient/common/images/addnode.gif" hspace="2"><fmt:message key="webclient.admin.operationtree.hint11"/></li>
        <li><img src="/webclient/common/images/delnode.gif" hspace="2"><fmt:message key="webclient.admin.operationtree.hint21"/></li>
      </c:when>
     <c:when test="${OperationConfig eq 'UserBased'&& Operation ne 'AddGroup'}" >
         <li><img src="/webclient/common/images/checkbox_included.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.included"/></li>
        <li><img src="/webclient/common/images/checkbox_excluded.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.excluded"/></li>
         <li><img src="/webclient/common/images/checkbox_void.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.void.excluded"/></li>
        <li><img src="/webclient/common/images/checkbox_inc_disabled.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.included.disabled"/></li>
         <li><img src="/webclient/common/images/checkbox_ex_disabled.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.excluded.disabled"/></li>
     </c:when>
      <c:otherwise>
        <li><img src="/webclient/common/images/checkbox_included.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.included"/></li>
        <li><img src="/webclient/common/images/checkbox_excluded.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.excluded"/></li>
         <li><img src="/webclient/common/images/checkbox_void.gif" hspace="2"> - <fmt:message key="webclient.admin.operationtree.void.excluded"/></li>
     </c:otherwise>
     </c:choose>
      </ul></td>
  </tr>
</table>
<%--
</c:when> <c:otherwise> 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td class="hline" height="1"><img src="/webclient/common/images/trans.gif" height="1" width="1"></td>
  </tr>
</table>
</c:otherwise> </c:choose> 

--%>
<table width="100%" cellspacing="0" cellpadding="2" border="0" style="margin-top:7px;">
 



    <tree:simpleTree dataSource="OperationTreeModel" treeNodeRenderer="com.adventnet.nms.webclient.useradmin.OperationTreeRenderer" showLines="true" openFirstChild="true" > 
    <tr> 
      <td nowrap class="text"> <c:url var="link" value="/admin/OperationsView.do"> 
        <%-- <c:url var="link" value="${expand_collapse_link}"> --%>
        <c:param name="nodeClicked" value="${NODEID}"/> 
        <%--  <c:param name="normal" value="true"/> --%>
        </c:url> <c:forEach var="image" items="${pageScope[\"TREE-IMAGES\"]}"> 
        <c:choose> <c:when test="${image == 'ME'}"> <a href="javascript:expandCollapseOperation('<c:out value="${link}"/>&<c:out value="${querystring}"/>')"><img src="/webclient/common/images/minus.gif" alt="Expand/Collapse Item" border="0" align="absmiddle"></a> 
        </c:when> <c:when test="${image == 'MC'}"> <a href="javascript:expandCollapseOperation('<c:out value="${link}"/>&<c:out value="${querystring}"/>')"><img src="/webclient/common/images/minus.gif" alt="Expand/Collapse Item" border="0" align="absmiddle"></a> 
        </c:when> <c:when test="${image == 'PE'}"> <a href="javascript:expandCollapseOperation('<c:out value="${link}"/>&<c:out value="${querystring}"/>')"><img src="/webclient/common/images/plus.gif"  border="0" align="absmiddle"></a> 
        </c:when> <c:when test="${image == 'PC'}"> <a href="javascript:expandCollapseOperation('<c:out value="${link}"/>&<c:out value="${querystring}"/>')"><img src="/webclient/common/images/plus.gif" border="0" align="absmiddle"></a> 
        </c:when> <c:when test="${image == 'E'}"> <img src="/webclient/common/images/treedot.gif" width="15" border="0" align="absmiddle"> 
        </c:when> <c:when test="${image == 'L'}"> <img src="/webclient/common/images/treedot.gif" width="15" border="0" align="absmiddle"> 
        </c:when> <c:when test="${image == 'V'}"> <img src="/webclient/common/images/trvline.png" width="15" border="0" align="absmiddle"> 
        </c:when> <c:when test="${image == 'S'}"> <c:choose> <c:when test="${ status.last }"> 
        <img src='/webclient/common/images/treedot.gif' border="0" width="15" align="absmiddle"> 
        </c:when> <c:otherwise> <img src="/webclient/common/images/trans.gif" border="0" width="15" align="absmiddle"> 
        </c:otherwise> </c:choose> </c:when> </c:choose> </c:forEach> 
        <c:if test = "${IMAGE_ICON != null && IMAGE_ICON ne \"\"}"> <img src='<c:out value="${IMAGE_ICON}"/>' border="0" align="absmiddle"> 
        </c:if>

 <c:choose>
     <c:when test="${Operation eq 'AddOperation'}" > <a href="javascript:;" title="<fmt:message key='webclient.admin.operationtree.add'/>" ><img id="createNode" src='/webclient/common/images/addnode.gif' alt='<fmt:message key="webclient.admin.operationtree.add"/>' hspace="2" onClick="showCreateBox(this,'<c:out value="${NODEID}"/>')" 
        border="0" align="absmiddle"></a> <c:if test="${NODEID ne 'Operation Tree Root'}">  <a   title="<fmt:message key='webclient.admin.operationtree.delete'/>" href="javascript:deleteOperation('<c:out value="${NODEID}"/>')" 
        class="text" style="color:#00C;font:normal 11px verdana;text-decoration:none"> 
        <img src='/webclient/common/images/delnode.gif' alt='<fmt:message key="webclient.admin.operationtree.delete"/>' hspace="2" border="0" align="absmiddle"> </a> </c:if>
        </c:when>
         <c:otherwise>
          <img name="treeImgSRC" src="/webclient/common/images/checkbox_void.gif" border="0" onClick="updateChildren(this, '<c:out value='${NODEID}'/>');">
             <input name="treeRow" type="hidden" value="<c:out value='${NODEID}'/>" 
         <%--   onclick = "javascript:updateChildNodes(this)" --%> > 
        </c:otherwise> 
    </c:choose> <c:out value="${NODEID}"/> 
    </td>
    </tr>
    </tree:simpleTree> </td> </tr>
 
</table>
<c:choose> <c:when test="${Operation eq 'AddOperation'}" > 
</c:when> <c:otherwise> 
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td class="header2bg" height="25" align="center"><input type="submit" value="<fmt:message key="webclient.admin.operationtree.update"/>" class="button">
	<input type="button" value="<fmt:message key="webclient.admin.operationtree.cancel"/>" class="button" onClick="window.close()"></td>
  </tr>
</table>
</c:otherwise> </c:choose> 
 </form>




<div style="position:absolute;top:-1000px;left:-1000px;z-index:10;background:#DEDBD3;border:1px solid #999;" id='createBox' onKeyDown="performAction(event)"> 
  <table cellpadding="2" cellspacing="2" border="0">
    <form action="/admin/OperationsAction.do" name="createNodeFrm" >
      <input type="hidden" name="parentName" value="" >
      <input type="hidden" name="toPerform" value="" >
      <tr> 
        <td class="text" nowrap><fmt:message key="webclient.admin.operationtree.addlabel"/>
        <td align="right"><a href="javascript:;"><img id="closeicon" src="/webclient/common/images/close.gif" border="0"></a></td>
      </tr>
      <%--
<tr>
	<td class="text" nowrap>Parent :</td><td align="center"><input type="text" name="parentName" readonly="true">&nbsp;<input type="submit" value="Delete" class="button"></td>
</tr>
--%>
      <tr> 
        <td colspan="2"><input type="text" name="operationName" size="30">
          &nbsp;
          <input type="submit" onclick="return validateField()" value="<fmt:message key="webclient.admin.operationtree.opsave"/>" class="button"></td>
      </tr>
    </form>
  </table>
</div>

<script language="JavaScript">

function validateField()
{
    var oName = trimAll(document.createNodeFrm.operationName.value);
    if(oName == '')
    {
        alert('<fmt:message key="webclient.admin.operationtree.operation.empty"/>');
        document.createNodeFrm.operationName.value="";
        document.createNodeFrm.operationName.focus();
        return false;
    }

    for(var i=0;i<oName.length;i++)
    {
        var charcode = oName.charCodeAt(i);
        if(charcode <32 || (charcode>32 && charcode<45) || (charcode>45 && charcode<48) || (charcode>58 && charcode<65) || (charcode>90 && charcode<95) || (charcode>95 && charcode<97) || charcode>122)
        {
            alert("<fmt:message key='webclient.admin.operationtree.operation.invalid'/>");
            document.createNodeFrm.operationName.value="";
            document.createNodeFrm.operationName.focus();
            return false;
        }
    }
    document.createNodeFrm.operationName.value = oName;
    var parentName = document.createNodeFrm.parentName.value;
    if(parentName == 'Operation Tree Root') {
        document.createNodeFrm.parentName.value = "";
    }
    return true;
}


function updateOperation()
{
    //window.close();
    //top.window.opener.location.href
}

var createBoxObj;
function showCreateBox(currObj, parentName) {
	createBoxObj=getObj("createBox")
	var left=findPosX(currObj)
	var top=parseInt(findPosY(currObj))+15

	var left=findPosX(currObj)
	var top=findPosY(currObj)
	var width=currObj.offsetWidth
	var height=createBoxObj.offsetHeight
	
	createBoxObj.style.top=(top+15)+"px"
	createBoxObj.style.left=left+"px"
	
	if (top+height>document.body.offsetHeight+document.body.scrollTop)
		document.body.scrollTop+=100
		
	if (left+width>document.body.offsetWidth+document.body.scrollLeft)
		document.body.scrollLeft+=100

	document.createNodeFrm.operationName.focus()
	document.createNodeFrm.parentName.value =  parentName;
    document.createNodeFrm.toPerform.value =  "addOperation";
}

function hideCreateBox(ev) {
	if (browser_ie)	var obj=window.event.srcElement
	else if (browser_nn4 || browser_nn6) var obj=ev.target

	if (obj.id.indexOf("createNode")<0) {
		if (obj.id=="closeicon") {
			createBoxObj.style.top="-1000px"
			createBoxObj.style.left="-1000px"
		} else {
			if (createBoxObj) {
				if (createBoxObj.style.left.indexOf("-")<0) {
					var innerElement=false
					if (document.getElementById || document.all) {
						while (obj.offsetParent) {
							if (obj.offsetParent==getObj("createBox"))
								innerElement=true
							obj = obj.offsetParent;
						}
					}
					
					if (innerElement==false) {
						createBoxObj.style.top="-1000px"
						createBoxObj.style.left="-1000px"
					}
				}
			}
		}
	}
}

document.body.onclick=function hideCB(event) {
	hideCreateBox(event,"")
}

function performAction(ev) {
	if (browser_ie)
		var keyCode=window.event.keyCode
	else if (browser_nn4 || browser_nn6)
		var keyCode=ev.which
	
	if (keyCode==27) {
		createBoxObj.style.top="-1000px"
		createBoxObj.style.left="-1000px"
	}
}
</script>
