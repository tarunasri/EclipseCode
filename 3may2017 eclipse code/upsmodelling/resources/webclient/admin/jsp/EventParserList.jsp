<%-- $Id: EventParserList.jsp,v 1.6 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.fault.eventparser.title'/></title>
</head>

<script language="Javascript" SRC="/webclient/common/js/listrowselection.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/admin/jspf/EventParserAdmin.jspf" %>

<body  <c:if test="${param.toPerform == 'showSaveParsersOption'}"> onload="javascript:CheckAll(document.EventParser)" </c:if>>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="bottom">
        <td valign=bottom width="100%">
	<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.eventparser.header'/></h1></td>
		<td align="right"><table class="headerInclude" width="50%" border="0" cellspacing="0" cellpadding="0">
      <tr height="25"> <td width="1%">&nbsp;</td> 
      <td nowrap align="right"><span class="text"><b>&nbsp;<fmt:message key='webclient.admin.filters.actions'/> :</b></span> &nbsp;&nbsp;

<c:if test="${setEventParsers == true}"><a href="/admin/EventParserConfiguration.do?toPerform=addEPForm" class="textSmall"><fmt:message key='webclient.fault.eventparser.link.add'/></a> <span class="textSmall">|</span> </c:if> <c:if test="${setEventParsers == true}"><a href="/admin/EventParserFromFile.do?toPerform=showLoadParsersForm" class="textSmall"><fmt:message key='webclient.fault.eventparser.link.loadparsers'/></a> <span class="textSmall">|</span> </c:if> 

                      <c:choose>
                        <c:when test="${setEventParsers == true && param.toPerform != 'showSaveParsersOption'}"> 
                           <a href="/admin/EventParserFromFile.do?toPerform=showSaveParsersOption" class="textSmall"><fmt:message key='webclient.fault.eventparser.link.savefile'/></a>
                       </c:when>
                       <c:otherwise>
                      </c:otherwise>
                      </c:choose>

 </td>
     </tr>
    </table>
        </td>
        </tr>
        </table>	
	</td>
</tr>
</table>


    <form name="EventParser" action="/admin/EventParserConfiguration.do" onSubmit="return false;">

    <input type="hidden" name="toPerform" value="">
    
        <table width="100%" cellpadding="2" cellspacing="0" border="0">
       <c:if test="${!empty successMsg}">
        <tr><td>
         <table width="80%" border="0" align="left" cellpadding="2" cellspacing="0">
          <tr align="center">  
              <td>&nbsp;</td>
              <td class="responseText" colspan="3"><img src="/webclient/common/images/tick.gif" hspace="4"><c:out value="${successMsg}"/></td>
          </tr>
        </table>
        </td></tr>
       </c:if>

       <c:if test="${!empty failureMsg}">
        <tr><td>
         <table width="80%" border="0" align="left" cellpadding="2" cellspacing="0">
          <tr align="center">  
              <td>&nbsp;</td>
              <td class="errorText" colspan="3"><c:out value="${failureMsg}"/></td>
          </tr>
        </table>
        </td></tr>
       </c:if>


        <tr><td>                
        <table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.fault.eventparser.configuredlist'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
                <tr> 
                  <td >
        <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">

              <c:if test="${setEventParsers == true}">
                <tr>
                  <td align="center" class="text">&nbsp;</td>
                  <td height="35" colspan="3">
                      <input name="Enable" type="button" class="button" value="<fmt:message key='webclient.fault.eventparser.button.enable'/>" onclick="javascript:enable()">
                      <input name="Disable" type="button" class="button" value="<fmt:message key='webclient.fault.eventparser.button.disable'/>" onclick="javascript:disable()">
                      <input name="Delete" type="button" class="button" value="<fmt:message key='webclient.fault.eventparser.button.delete'/>" onclick="javascript:deleteParsers()">
                  </td>
                </tr>
              </c:if>       
                <tr> 
                  <td width="4%" align="center" class="text"> <input type="checkbox" name="toggleAll" onclick="javascript:ToggleAll(this,this.form)">                   </td>
                  <td width="23%" height="35" class="boldText"><fmt:message key='webclient.fault.eventparser.parsername'/></td>
                  <td width="17%" align="center" class="boldText"><fmt:message key='webclient.fault.eventparser.enabled'/></td>
                  <td width="56%" align="left">&nbsp; </td>
                </tr>

            <c:choose>    
            <c:when test="${empty eventParsersList}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptyeventparsers'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>
                <c:forEach var="parser" items="${eventParsersList}">
                <c:forEach var="list" items="${parser}">

                <tr> 
                  <td align="center" class="text"><input type="checkbox" name="rowSelection" value="<c:out value='${list.key}'/>" onclick="Toggle(this,this.form,event)"></td>
                  <td height="25" class="text">
                      <c:choose>
                       <c:when test="${setEventParsers == true && list.value == true}">
                        <a href="/admin/EventParserConfiguration.do?toPerform=modifyEPForm&parserName=<c:out value="${list.key}"/>"><c:out value='${list.key}'/></a>
                       </c:when>
                       <c:otherwise>
                         <c:out value='${list.key}'/>
                       </c:otherwise>
                      </c:choose>
                      </td>
                  <td align="center" class="text">
                  <c:choose>
                   <c:when test="${list.value == true}">
                          <img src="/webclient/common/images/tick.gif" name="tick" border="0" id="Image1">
                   </c:when>
                   <c:otherwise>
                          <img src="/webclient/common/images/del.gif" name="del" border="0" id="Image1">
                   </c:otherwise>
                  </c:choose>

                </td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>

                </c:forEach>
                </c:forEach>
              </c:otherwise>
            </c:choose>

            </table></td>
           </tr>

           <c:if test="${param.toPerform == 'showSaveParsersOption' && param.toPerform != 'saveParsers'}">
               <tr> 
                  <td><br><br>
                    <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
                     <tr> 
                      <td height="25" colspan="2" class="header2Bg"><span class="header2">
                      <a name="saveParser"></a><fmt:message key='webclient.fault.eventparser.savetofile.title'/></span></td>
                     </tr>
                     <tr> 
                      <td align="left" class="text" colspan="2" height="25"> 
                      <fmt:message key='webclient.fault.eventparser.savetofile.message'/></td>
                     </tr>  
                     <tr align="left">
                      <td height="30" width="20%">
                       <input name="fileName" type="text" class="formStyle" value="conf/event.parsers">
                      </td>
                      <td>
                       <input name="Submit" type="button" class="button" value="<fmt:message key='webclient.fault.eventparser.link.savefile'/>" onclick="saveParsers()">
                       <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/admin/EventParser.do';"></td>
                      </td>
                    </tr>  
                    <tr> 
                     <td colspan="2">&nbsp;</td>
                   </tr>       
                  </table>
</td>
                </tr>                
                
          </c:if>
      
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
</td></tr></table>
  </form>
</body>
</html>
