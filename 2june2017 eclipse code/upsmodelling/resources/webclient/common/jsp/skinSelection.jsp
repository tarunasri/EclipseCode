<%-- $Id: skinSelection.jsp,v 1.6 2010/10/29 13:47:02 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.common.skinselection.pagetitle'/></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/common/jspf/ModalPopup.jspf" %>
<script language="javascript" src="/webclient/common/js/treeSelection.js" type="text/javascript"></script>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="cache-control" CONTENT="no-store">
</head>

<body onLoad="javascript:MM_preloadImages('/webclient/common/images/Skin_OliveGreen.gif','/webclient/common/images/Skin_SteelBlue.gif')">
<form action="/preferencesSavedResponse.do" name="changeSkin">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.common.skinselection.personalise'/></h1></td>
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
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td> <table width="350" border="0" cellpadding="1" cellspacing="1">
          <tr align="left"> 
            <td height="30" colspan="2"><fmt:message key='webclient.common.skinselection.selectiondialog'/></td>
          </tr>
          <tr> 
            <td width="156" height="30" valign="top"> <p class="text"> 

                <input name="skins" type="radio" onClick="javascript:MM_swapImage('skin','','/webclient/common/images/Skin_OliveGreen.gif',1)" value="OliveGreen" <c:if test="${selectedskin == 'OliveGreen'}">checked</c:if>><fmt:message key='webclient.common.skinselection.olivegreen'/><br>

                <input name="skins" type="radio" onClick="javascript:MM_swapImage('skin','','/webclient/common/images/Skin_SteelBlue.gif',1)" value="SteelBlue" <c:if test="${selectedskin == 'SteelBlue'}">checked</c:if>><fmt:message key='webclient.common.skinselection.steelblue'/><br>

                <input name="showaccpanel" type="checkbox" 
                    
<c:choose>
<c:when test="${showaccpanel=='true'}">checked
</c:when>
<c:otherwise>
unchecked
</c:otherwise>
</c:choose>
><fmt:message key='webclient.common.skinselection.alarmpanel'/>

</p></td>

            <td width="194" align="right"><img src="/webclient/common/images/Skin_<c:out value='${selectedskin}'/>.gif" name="skin" width="190" height="107" border="1" id="skin"></td>
          </tr>
          <tr> 
            <td height="30" colspan="2"><input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.common.skinselection.apply'/>"> 
           <input type="button" name="Cancel" class=button value="<fmt:message key='webclient.common.skinselection.cancel'/>" onclick="window.close();">
            </td>
          </tr>
        </table></td>
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

