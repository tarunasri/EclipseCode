<%-- $Id: JVMGraph.jsp,v 1.5 2007/10/12 06:22:57 sumitha Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%--<meta http-equiv="Refresh" content="<c:out value='${ChartRefreshInterval}'/>;  ">--%>
<script>
function zoom(imgName)
{        
        imgName = imgName.replace("\\","/");
        var strr = imgName.split("/");
        var tempStr = strr[5].split("_");
        var left = Math.floor( (screen.width - 650) / 2);
        var top = Math.floor( (screen.height - 500) / 2);
        var winParms = "top=" + top + ",left=" + left + ",height=500,width=650";
        window.open("/admin/MonitorSPR.do?rateType="+strr[4]+"&hostName="+tempStr[0]+"&snmpPort="+tempStr[1]+"&jvmType="+tempStr[2]+"&zoom=yes","WebNMSTaskManager",winParms);
}
</script>

<body style="background-color: #ECF1FF;">
<table border=0 cellspacing=0 cellpadding="2" width=5% style="width: 5%; text-align: center; margin-left: auto; margin-right: auto;">
<c:choose>
<c:when test="${ZoomMode=='yes'}">
<tr> <td  style="width: 550px; height: 230px; text-align: center;"><img STYLE="cursor: HAND" src="<c:out value='${imageName}'/>" width="540" height="220"></td>
</c:when>
<c:otherwise>
<tr> <td width="191" height="157"><img STYLE="cursor: HAND" src="<c:out value='${imageName}'/>" width="191" height="157"></td>
</c:otherwise>
</c:choose>
</TABLE>


