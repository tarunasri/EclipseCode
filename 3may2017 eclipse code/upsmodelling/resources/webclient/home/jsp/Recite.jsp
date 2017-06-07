<%-- $Id: Recite.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tree" uri="http://www.adventnet.com/webclient/tree-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.Vector"%>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>
<script language="javascript" src="/webclient/common/js/importxml.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
<script language="javascript">
var currentIndex=0;
var dashIDS;

function showCctvError()
{
	alert('<fmt:message key="webclient.homepage.cctv.error.nodashboards"/>');
}

</script>

<style>
#exitTitle
{
position:relative;
left:95%;
padding:10px ;
}
</style>

<%

Object array[] =(Object [])request.getAttribute("selectedDash"); 
Vector values=new Vector();
for(int i=0;i<array.length;i++)
{
values.add(Long.parseLong(array[i].toString()));
%>


<% 
}
request.setAttribute("dashIDs",values);
session.setAttribute("isReciteView",true);
%>


<script>
callCctv(<c:out value="${dashIDs}"/>,<c:out value="${REFRESHINTERVAL}"/>)
</script>

<div id="scriptDiv"></div>

<body>
<div id="innerDiv"> </div>
</body>
</html>



