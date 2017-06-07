<%--$Id: ShowColumns.jsp,v 1.3 2007/10/18 06:30:33 gnanasekar Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
	<title><fmt:message key="webclient.tableview.columncustomizer.title"/></title>
         <%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
	<script language="javascript" SRC="/webclient/common/js/CustomizeColumns.js"></script>
</head>

<body>
<form METHOD=post name="ModifyColumns" action='<c:out value="${action}"/>'>
<input type="hidden" name="viewId" value='<c:out value="${param.viewId}"/>'>
<input type="hidden" name="selitems" value="">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key="webclient.tableview.columncustomizer.header"/></h1></td>
        </tr>
        </table>

<table style="margin-bottom:10px;" align="center" width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
    <tr> 
      <td align="right" colspan="3"> 
        <table width="85%" border="0" cellspacing="1" cellpadding="1" align="center">
          <tr align="center">
            <td width="32%" class="header2"><fmt:message key="webclient.tableview.columncustomizer.unviewedcolumn.header"/></td>
            <td width="10%">&nbsp;</td>
            <td width="33%" class="header2" height="30"><fmt:message key="webclient.tableview.columncustomizer.viewedcolumn.header"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td> 

              <select multiple class="formStyle" style="width:190; height:120; " exclusive name="unViewedList" size="5" >
              <c:forEach var="value" items="${defaultList}">
              <option value='<c:out value="${value.value}"/>'>
                        <c:out value="${value.key}"/>
              </option>
              </c:forEach>	      
              </select>

            </td>
            <td> 
		    <p><a href="javascript:add()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_add.gif" width="32" height="25" title="Add to view" hspace="5" alt="Add" border="0"></a></p>
		    <a href="javascript:remove()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_remove.gif" width="32" height="25" title="Remove from view" alt="Remove" border="0"></a></td>
            <td> 
              <select multiple exclusive class="formStyle" style="width:190; height:120; " name="selectedView" size="5" >
                    <c:forEach var="value" items="${viewList}">
                       <option value='<c:out value="${value.columnName}"/>'>
                                     <c:out value="${value.displayName}"/>
                       </option>
                    </c:forEach>
              </select>
            </td>
            <td align="right"> 
		    <p><a href="javascript:moveup()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_moveup.gif" width="32" height="25" title="Move Up" border="0"></a></p>
		    <p><a href="javascript:movedown()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_movedown.gif" width="32" height="25" title="Move Down" border="0"></a> 
              </p>
            </td>
          </tr>
          <%--tr align="center">
            <td>&nbsp;</td>
            <td colspan="2" align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr--%>
        </table>
      </td>
    </tr>
    <tr>
      <td align="right" colspan="3"> 
<input type="button" class="button" title="Apply changes" name="apply" value='<fmt:message key="webclient.tableview.columncustomizer.applybutton.text"/>' onclick="javascript:submitForm()">
&nbsp;&nbsp;<input type="button" title="Cancel" class="button" name="cancel" value='<fmt:message key="webclient.tableview.columncustomizer.cancelbutton.text"/>' onclick="javascript:window.close()">&nbsp;&nbsp;

      </td>
    </tr>
  </table>
</td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
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
