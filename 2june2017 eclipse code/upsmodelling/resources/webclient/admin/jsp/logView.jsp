<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script>
function test()
{
	var testStr=document.logViewForm.logLines.value;
	var strr=testStr.split("\n");
	var plainText = document.logViewForm.logLines.value;
    plainText = plainText.replace(/\n/gi,"<br>");   
   //__edoc.setContent(plainText);	
   document.logViewForm.enctype.value = "text/html";
	document.logViewForm.logLines.value="<b>ds</b>";
	//if(strr[1]=="b")
	//{
		//document.logViewForm.logLines.innerHTML.value="\<b\>has\<\/b\>";
	//}
}
</script>
    <body>
<br>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="10">&nbsp;</td>
      <td height="25" valign="middle"><span class="header1"><fmt:message key='Logs Viewer'/></span></td>
    </tr>
    <tr>
      <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
    </table>

<br>

        <html:form action="/getLinesOfLogFile.do" method="POST" enctype="text/html">
	<TABLE class="spyBorder" ALIGN=CENTER WIDTH=98% HEIGHT="505" BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr><td width="2%">&nbsp;</td><td colspan="9">&nbsp;</td></tr>
		<tr>
		<td width="2%"></td>
		<td width="2%"></td>
		<td width="12%" nowrap align="left" colspan="2"><span class="text"><fmt:message key='webclient.admin.logViewer.NumberOfLines'/></span></td>
	        <td width="12%" nowrap align="left" ><html:select styleClass="formStyle" name="logViewForm" property="NumberOfLines">
                        <option value="50" >50</option>
                         <option value="100" >100</option>
                        <option value="150" >150</option>
                        <option value="250" >250</option>
                        <option value="500" >500</option>
                        <option value="1000" >1000</option>
                </html:select></td>
		<td width="4%"></td>
		<td width="2%" nowrap align="left" colspan="2"><span class="text"><fmt:message key='webclient.admin.logViewer.FileName'/></span></td>
		<td colspan="1" nowrap align="left"><html:select styleClass="formStyle" name="logViewForm" property="logFile">
			<c:forEach var="list" begin="1" items="${logFileList}">
				<option > <c:out value="${list}"/></option>
			</c:forEach>
		</html:select> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="logViewForm" class="button" value="<fmt:message key='webclient.admin.logViewer.Submit'/>" /></td>
</tr>
		</td>	
</tr>
		<tr><td colspan="9">&nbsp;</td></tr>
        <tr>
	<td width="2%">&nbsp;</td>
        <td colspan="9" align="left" valign="top" class="text" >
        <%--html:textarea cols="85" rows="25"  name="logViewForm" property="logLines"></html:textarea></td--%>
	<TEXTAREA COLS=85 ROWS=25  name="logViewForm" property="logLines" ><c:out value="${linesOfFile}"/></TEXTAREA>

	<%-- <html:textarea cols="85" rows="25"  name="logViewForm" id="wrapped" property="logLines" ><c:out value="${linesOfFile}"/></html:textarea>
        <html:textarea cols="85" rows="25" wrap="off" name="logViewForm" id="nowrapped" class="hide" property="logLines1" ><c:out value="${linesOfFile}"/></html:textarea>--%>
</tr>

	</TABLE>	               
        </html:form>
    </body>

