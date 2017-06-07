<%-- $Id: SearchLayout.jsp,v 1.4 2010/10/29 13:47:02 swaminathap Exp $ --%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ include file="/webclient/common/jspf/SearchUIFunctions.jspf"%>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/listrowselection.js"></script>
</head>

<body onload="initialize()">
<html-el:form action="${searchAction}" onsubmit="return search()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
      <tiles:insert attribute="Header"/>
</td>
</tr>
    <tr> 
    <td align="left" valign="top"> 
        
        <table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
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
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
     
<div style="margin-top:10px;"><tiles:insert attribute="Footer"/></div>
</td>
  </tr>
  </table>
</html-el:form>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
