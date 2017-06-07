<%-- $Id: customViewScope.jsp,v 1.3 2007/09/18 14:20:26 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

<head>

<script type="text/javascript" language="JavaScript" src="/webclient/common/js/general.js"></script>
<script type="text/javascript" language="JavaScript" src="/webclient/common/js/validation.js"></script>

</head>

<body>

<c:choose>
<c:when test="${toPerform == 'customViewForm'}">>
<c:set var="cvsMode" value="Create" />
</c:when>
<c:otherwise>
<c:set var="cvsMode" value="Modify" />
</c:otherwise>
</c:choose>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.cvs.header'> <fmt:param value="${cvsMode}"/> </fmt:message>
</h1></td>
		<td align="right"></td>
        </tr>
        </table>

<form action="/admin/CustomViewScope.do" onSubmit="return delOtherRows();">

<input type="hidden" name="toPerform" value="<c:out value='${toPerform}'/>"/>
<input type="hidden" name="groupName" value="<c:out value='${groupName}'/>"/>
<input type="hidden" name="operationName" value="<c:out value='${operationName}'/>"/>
<input type="hidden" name="customView" value="<c:out value='${customView}'/>"/>

<c:if test="${operationName != null}">
<div class="text">
<fmt:message key='webclient.admin.cvs.message1'>
<fmt:param value="${operationName}"/>
<fmt:param value="${groupName}"/>
</fmt:message>
<%--
<fmt:message key='webclient.admin.cvs.message1'/><strong> <c:out value="${operationName}"/> </strong><fmt:message key='webclient.admin.cvs.message2'/> <strong><c:out value="${groupName}"/></strong> <fmt:message key='webclient.admin.cvs.message3'/>
--%>
</c:if>
<br>

<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td height="35" nowrap class="text"><strong> <fmt:message key='webclient.admin.cvs.scopename'/> &nbsp; </strong>
        <html-el:text property="cvsName" name="CustomViewScopeBean"  styleClass="formStyle" readonly="${empty customViewKeys}" />
    </td>
      </tr>
</table>

<table id="propertyTable" width="100%" border="0" cellspacing="0" cellpadding="2" class="htableBorder">
  <tr class="header2bg"> 
    <td width="4%" nowrap class="text">&nbsp;</td>
    <td width="40%" nowrap class="text"><strong><fmt:message key='webclient.admin.cvs.propname'/></strong></td>
    <td width="56%" nowrap class="text"><strong><fmt:message key='webclient.admin.cvs.propvalue'/></strong></td>
  </tr>

   <c:forEach begin="0" end="${15}" varStatus="status"> 
   <tr  <c:choose>
        <c:when test="${CustomViewScopeBean.map.rowCount ge status.count}"> 
        </c:when>
        <c:otherwise>
        style="display:none"
        </c:otherwise>
        </c:choose> >  

      <td class="text"><div align="center"><a href="javascript:del('<c:out value="${status.count}"/>');"><img src="/webclient/common/images/delete.gif" width="10" height="10" border="0"></a></div></td>
      <td height="25" class="text"> 
        <c:choose>
        <c:when test="${!empty customViewKeys}"> 
            <html-el:select styleClass="formStyle" name="CustomViewScopeBean" value="${CustomViewScopeBean.map.cvsPropsName[status.index]}" property="cvsPropsName" > 
     <%--    <html-el:options collection="customViewKeys"  name="CustomViewScopeBean" property="customViewKeys" labelProperty="customViewKeys"/> --%>
         <c:forEach var="cvsKey" items="${customViewKeys}" varStatus="status1"> 
    <option value='<c:out value="${cvsKey}"/>' <c:if test="${cvsKey eq CustomViewScopeBean.map.cvsPropsName[status.index]}"> selected </c:if>  >
   <c:out value="${cvsKey}"/></option> </c:forEach> 

</html-el:select>
        </c:when>
        <c:otherwise>
         <html-el:text property="cvsPropsName" name="CustomViewScopeBean" styleClass="formStyle" value="${CustomViewScopeBean.map.cvsPropsName[status.index]}"/>
         </c:otherwise>
        </c:choose> 

</td>
      <td height="28" class="text"> <html-el:text property="cvsPropsValue" name="CustomViewScopeBean" styleClass="formStyle" value="${CustomViewScopeBean.map.cvsPropsValue[status.index]}"/></td>
   </tr>
   </c:forEach>     

<%--
   <tr style="display:none"> 
    <td><div align="center"><a href="javascript:del(2);"><img src="/webclient/common/images/delete.gif" width="10" height="10" border="0"></a></div></td>
    <td><select name="">
        <option value="id">id</option>
        <option value="text">text</option>
        <option value="category">category</option>
        <option value="domain">domain</option>
      </select></td>
    <td><input name="Input2" type="text" class="formStyle"></td>
  </tr>

--%>

</table>
<table width="60%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td class="text"><input type="button" name="Button" value="<fmt:message key='webclient.admin.cvs.more'/>" class="button" onClick="more()">
    </td>
  </tr>
</table>
<br>
<table width="60%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td class="text"><div align="center">
        <input type="submit" name="Button3" value="<fmt:message key='webclient.admin.cvs.save'/>" class="button">
        <input type="button" name="Button22" onclick="javascript:history.back()" value="<fmt:message key='webclient.admin.cvs.cancel'/>" class="button">
      </div></td>
  </tr>
</table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</form>
</body>
</html>



<script type="text/javascript" language="JavaScript">
var propNameTypeText = <c:out value="${empty customViewKeys}"/>;
var rowCnt='<c:out value="${CustomViewScopeBean.map.rowCount}"/>';
var propRows=getObj("propertyTable").getElementsByTagName("TR")
var totRowCnt=propRows.length
function more() {
	rowCnt++;
	if (rowCnt==totRowCnt) {
		alert("<fmt:message key="webclient.admin.cvs.maxcount1"/> " +(totRowCnt-1)+" <fmt:message key="webclient.admin.cvs.maxcount2"/>");
		rowCnt--;
	} else propRows[rowCnt].style.display=""
}
function del(rowId) {
    var name = document.getElementsByName("cvsPropsName");
    var value = document.getElementsByName("cvsPropsValue");
    name[rowId-1].value = "";
    value[rowId-1].value = "";
	if (rowId>1) {
		propRows[rowId].style.display="none"
		rowCnt--;
	} else {
            name[0].value = "";
            value[0].value = "";
	}
}

function delOtherRows() {

    var cvsName = eval(getObj("cvsName"));
    if(cvsName.value == '') {
        alert("<fmt:message key='webclient.admin.cvsname.empty'/>");
        return false;
    }
    var cvspropName = eval(getObj("cvsPropsName"));
    var cvspropValue = eval(getObj("cvsPropsValue"));

    for (var i=0;i<totRowCnt-1;i++) {
        if (propRows[i+1].style.display=="")
        {
            if (propNameTypeText && cvspropName[i].value.length==0 && trimAll(cvspropValue[i].value).length > 0)
            { 
                alert("<fmt:message key='webclient.admin.cvsname.propname.empty'/>");
                cvspropName[i].focus();
                return false;
            }

            if (trimAll(cvspropName[i].value).length > 0 && trimAll(cvspropValue[i].value).length==0)
            {
                alert("<fmt:message key='webclient.admin.cvsname.propvalue.empty'/>");
                cvspropValue[i].focus();
                return false;
            }
        }
    }

	for (var i=totRowCnt-1;i>1;i--) {
		if (propRows[i].style.display=="none") {
            if (document.all)
    			var onnne = eval(getObj("propertyTable").childNodes[0]);
            else
                var onnne = eval(getObj("propertyTable").childNodes.item(1));

                if(onnne != null )
                {
                    onnne.removeChild(propRows[i]);
                }
		}
       
        
	}
     
}
</script>