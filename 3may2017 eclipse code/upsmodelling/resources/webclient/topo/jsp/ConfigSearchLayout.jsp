<%-- $Id: ConfigSearchLayout.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@ include file="/webclient/common/jspf/SearchUIFunctions.jspf"%>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/listrowselection.js"></script>
<script language="javascript" SRC="/webclient/config/js/config.js" type="text/javascript"></script>
<script language="javascript" SRC="/webclient/common/js/jquery.js" type="text/javascript"></script>
</head>

<body onload="initialize()">

<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
      <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
      <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
    </tr>
    <tr>
      <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg"><table style="clear:both; margin-top: 10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>

	    <%
	    String type = request.getParameter("searchType");
	    request.setAttribute("searchType",type);
	    %>
<html-el:form action="/deviceAdvancedSearch.do?searchType=${searchType}" onsubmit="return false">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<input type="hidden" name="searchType" value='<c:out value="${searchType}"/>'>
      <tiles:insert attribute="Header"/>
    <tr> 
    <td align="left" valign="top"> 
        
        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tiles:insert attribute="Body"/>
        <tr> 
          <td colspan="2" align="left" valign="top"> 
             <tiles:insert attribute="Core"/>
			</td>
        </tr>
      </table>
        </td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
      <br> </td>
  </tr>
<tr>
</html-el:form>
   <tiles:insert attribute="Footer"/>
</tr>
  </table>


  <table width="100%" cellspacing="0" cellpadding="0" border="0" style="clear: both;margin-bottom: 4px;">
                <tr  class="rowSeparator">
                  <td><span class="boldTxt"><fmt:message key='webclient.common.searchcomponent.searchresults'/></span></td>
                </tr>
		</table>

 <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody>
                  <tr>
                    <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
                    <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                    <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
                  </tr>
                  <tr>
			  <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                    <td style="padding:1px;" valign="top" class="whiteBg">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			      <tr class="generalTBHeader">
				      <td  style="width:10px;padding-right:6px;padding-left:6px" nowrap="nowrap">
<c:if test="${searchType ne 'invSearch' && searchType ne 'neSearch'}">
<input type="checkbox" id="title_check" onclick="selectAllResults('title_check','rowSelectionDevices');" style="margin: 0px; padding: 0px;"/></td>
</c:if>
                          <td style="width:200px;padding-right:6px;" nowrap="nowrap"><fmt:message key='webclient.common.searchcomponent.searchresults.title'/></td>
                        </tr>
                      </table>
                      <div style=" overflow:auto; height:100px;" id="searchRes">&nbsp;</div></td>
                    <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                  </tr>
                  <tr>
                    <td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
                    <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                    <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
                  </tr>
                </tbody>
              </table>
</td>
      <td class="alarmLeftBdrRight">&nbsp;</td>
    </tr>
    <tr>
      <td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
      <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
    </tr>
  </tbody>
</table>



<table style="margin-top:15px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><input type="button" value="<fmt:message key='webclient.common.searchcomponent.searchbutton.adddevice'/>" class="button" name="Submit" onclick="javascript:getSelectedResult('<c:out value="${searchType}"/>');window.close();"/>
      &nbsp;&nbsp;
      <input type="button" value="<fmt:message key='webclient.common.searchcomponent.searchbutton.cancel'/>" class="button" name="cancel" onclick="javascript:window.close();"/></td>
  </tr>
</table>


<br>
<br>
<br>
<br>
<br>
</body>
</html>
