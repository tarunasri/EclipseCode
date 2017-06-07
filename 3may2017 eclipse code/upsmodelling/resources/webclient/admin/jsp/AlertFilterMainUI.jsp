<%-- $Id: AlertFilterMainUI.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<script>
    function loadAlertForm()
    {
        document.getElementById('LoadForm').className='';
        document.getElementById('SaveForm').className='hide';
    }
    function saveAlertForm()
    {
        document.getElementById('LoadForm').className='hide';
        document.getElementById('SaveForm').className='';
    }
    function closeSaveAlertForm()
    {
        document.getElementById('LoadForm').className='hide';
        document.getElementById('SaveForm').className='hide';
    }
    function closeLoadAlertForm()
    {
        document.getElementById('LoadForm').className='hide';
        document.getElementById('SaveForm').className='hide';
    }

</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="bottom">
        <td valign=bottom width="100%">
	<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.filters.alert'/></h1></td>
		<td align="right"><table class="headerInclude" width="50%" border="0" cellspacing="0" cellpadding="0">
      <tr height="25"> <td width="1%">&nbsp;</td> 
      <td nowrap align="right"><span class="text"><b>&nbsp;<fmt:message key='webclient.admin.filters.actions'/> :</b></span> &nbsp;&nbsp;

<c:if test="${setAlertFilters == 'true'}">
<a href="/admin/AlertFilterAction.do?toPerform=view" class="adminLink"><fmt:message key='webclient.admin.filters.add'/></a> &nbsp;&nbsp;| &nbsp;&nbsp; <a href="javascript:saveAlertForm()" class="adminLink"><fmt:message key='webclient.admin.filters.save'/></a>&nbsp;&nbsp;| &nbsp;&nbsp;
</c:if>

<c:if test="${getAlertFilters == 'true'}">
<a href="javascript:loadAlertForm()" class="adminLink"><fmt:message key='webclient.admin.filters.load'/></a> &nbsp;&nbsp;
</c:if>

 </td>
     </tr>
    </table>
        </td>
        </tr>
        </table>	
	</td>
</tr>
</table>

<div id="LoadForm" class="hide">

     <html:form action="/LoadAlertFilterAction" onsubmit="return validateLoadAlertForm()">
    <table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.alertfilters.load'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
    <table border=0 class="dbborder1" cellspacing="0" cellpadding="2" width="100%">

        <tr height=25 class="header2Bg">
            <td valign="middle" class="boldText" align="right" nowrap><fmt:message key='webclient.admin.filters.loadfrom'/></td>
            <td align="right"><a href="javascript:closeSaveAlertForm()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" hspace="5" border="0" align="middle"></a></td>
        </tr>
        
        <tr colspan="2" height="10"><td></td></tr>

        <tr>
            <td width="50%" align="center"><span class="boldText"><fmt:message key='webclient.admin.filters.filename'/></span></td>
            <td align="center"><html-el:text styleClass="formStyle" property="FileName"/></td>
        </tr>

        <tr colspan="2" height="5"><td></td></tr>

        <tr class="reportsOddRow" height="30">
            <td align="center" colspan="2"><input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.loadbutton'/>"/></td>
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
</html:form>

</div>

<div id="SaveForm" class="hide">

    <html:form action="/SaveAlertFilterAction" onsubmit="return validateSaveAlertForm()">
 <table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.alertfilters.save'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >              
    <table border=0 class="dbborder1" cellspacing="0" cellpadding="2" width="100%">

        <tr height=25 class="header2Bg">
            <td align="right" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.filters.saveto'/></td>
            <td align="right"><a href="javascript:closeSaveAlertForm()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" hspace="5" border="0" align="middle"></a></td>
        </tr>
        
        <tr colspan="2" height="10"><td></td></tr>

        <tr>
            <td width="50%" align="center"><span class="boldText"><fmt:message key='webclient.admin.filters.filename'/></span></td>
            <td align="center"><html-el:text styleClass="formStyle" property="FileName"/></td>
        </tr>

        <tr colspan="2" height="5"><td></td></tr>

        <tr class="reportsOddRow" height="30">
            <td align="center" colspan="2"><input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.savebutton'/>"/></td>
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
</html:form>
</div>
    <table width="50%" border="0" cellspacing="0" cellpadding="0">
       <c:if test="${!empty success}">
       <tr> 
       <TD class=tableheader-bg vAlign=center align="center" height=28>
           <TABLE cellSpacing=0 cellPadding=0 width="60%" border=0>
           <TBODY><tr> 
              <TD width=10><IMG height=15 hspace=4  src="/webclient/common/images/tick.gif" width=15></TD>
              <TD nowrap class="responseText"><c:out value="${success}"/> <c:out value="${filename}"/></TD>
            </TR></TBODY>
        </TABLE></TD>
</TR>    
      </c:if>

      <c:if test="${!empty failure}">
       <tr> 
       <TD class=tableheader-bg vAlign=center align="center" height=28>
           <TABLE cellSpacing=0 cellPadding=0 width="60%" border=0>
           <TBODY><tr> 
              <TD width=10></TD>
              <TD nowrap class="errorText"><c:out value="${failure}"/> <c:out value="${filename}"/></TD>
            </TR></TBODY>
        </TABLE></TD>
</TR>    
      </c:if>

      <c:if test="${!empty deleteMsg}">
       <tr> 
       <TD class=tableheader-bg vAlign=center align="center" height=28>
           <TABLE cellSpacing=0 cellPadding=0 width="60%" border=0>
           <TBODY><tr> 
              <TD width=10><IMG height=15 hspace=4  src="/webclient/common/images/tick.gif" width=15></TD>
              <TD nowrap class="responseText"><c:out value="${name}"/> <c:out value="${deleteMsg}"/> <c:out value="${fileName}"/></TD>
            </TR></TBODY>
        </TABLE></TD>
</TR>    
      </c:if>
    </table>
 

<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.filters.alertlist'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
    <table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td width="5%">&nbsp;&nbsp;</td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.filters.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.filters.delete'/></td>
        </tr>

        <c:choose>    
            <c:when test="${empty AlertFilters}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptyalertfilters'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>

            <c:forEach var="evtFilters" items="${AlertFilters}" varStatus="status">
            <c:choose>
            <c:when test="${status.count%2==0}">
            <tr height="25" class="reportsOddRow">
            </c:when>
            <c:otherwise>
            <tr height="25" class="reportsEvenRow">
            </c:otherwise>
            </c:choose>
            <td width="5%">&nbsp;&nbsp;</td>
            <td align="center" width="40%">
            <a class="adminLink" href ="/admin/AlertFilterAction.do?toPerform=view&name=<c:out value='${evtFilters.name}'/>"><c:out value="${evtFilters.name}"/></a>
            </td>
            <td width="55%" align="center">
            <a class="adminLink" href ="javascript:deleteAlertFilters('<c:out value='${evtFilters.name}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
            </td>
            </tr>
            
            </c:forEach>
            </c:otherwise>
       </c:choose>
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
