<%-- $Id: MapCustomLayout.jsp,v 1.4 2007/10/18 06:45:25 gnanasekar Exp $ --%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@ include file="/webclient/map/jspf/mapUIFunctions.jspf"%>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/listrowselection.js"></script>
</head>

<body onload="initialize()">
<html-el:form action="${searchAction}" onsubmit="return checkMethod()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.maps.title.header'/></h1></td>
        </tr>
      </table>


    <tiles:insert attribute="Header"/>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
    <td align="left" valign="top"> 

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td colspan="2" align="left" valign="top" class="propertyHeader"> 
       <tiles:insert attribute="Body"/>
        </td></tr>
        <tr> 
          <td colspan="2" align="left" valign="top" class="propertyHeader"> 
             <tiles:insert attribute="Core"/>
			</td>
    </tr>
    </table>
      </td>
  </tr>
        </html-el:form>
        <tiles:insert attribute="Footer"/>
</table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</body>
</html>
