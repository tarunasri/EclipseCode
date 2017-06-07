<%-- $Id: support.jsp,v 1.5 2010/10/29 13:47:02 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>


    <html>
    <head>
    <script>
    
    
function supporttest(aElements)
{
    if(confirm('<fmt:message key='webclient.common.support.filecreation.confirmation'/>'))
    {
       var id = document.getElementById(aElements);
       var runid = document.getElementById('running');
    
       if (id.style.display == "none") 
       {
          if(runid !=null)
	  {
	     eval("runid.style.display = 'none';");
          }
          eval("id.style.display = 'block';");
       }
       window.open('/CreateSupportFile.do?userClassParser=false&issueType=Default','_top');
    }
  
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}


</script>
</head>
<body >

    
<!-- Holder table starts -->

    <!-- success message for support information file -->

	
	<!-- Div Starts -->
   
<table border=0 cellspacing=0 cellpadding=0 width=99%  align = "center" >
<tr>
<td>
	<div Id="Loading" style="display:none">
	<table border=0 cellspacing=0 cellpadding=0 width=100% align = "center" >
	<tr >
	<td class="text">
	<table border=0 cellspacing=0 cellpadding=3 width=100% align="center"  class="hTableBorder">
	<tr class="tableInternal">
	<td align=center valign=top ><img src="/webclient/common/images/info-success.gif" hspace=0></td>
	<td class="text" align=left > <font color=red><fmt:message key='webclient.common.support.statusmsg'/> </font></td>
	</tr>
	</table>
	</td>
	</tr>
	</table>
	</div>    	    	    	
	<! -- Div Ends Here -->

	<div Id="running" style="display:block">	  
	<c:if test="${!empty failure}" >
	     <c:out value='${failure}'/>
		 
	    <table border=0 cellspacing=0 cellpadding=5 width=100%>
	    <tr>
	    <td class="text">
	    <table border=0 cellspacing=0 cellpadding=5 width=100%>
	    <tr class="rowOdd">
	    <td align=center valign=top ><img src="/webclient/common/images/info-failure.gif" hspace=0></td>
	    <td class="text" align=left  valign=top> 
	
	    <c:out value='${failure}'/>
	    </td>
	    </tr>
	    </table>
	    </td>
	    </tr>
	    </table>
	 </c:if>


	<c:if test="${!empty supportGzipName}" >
	    <table border=0 cellspacing=0 cellpadding=5 width=100% align  "center" >
	    <tr >
	    <td class="text">
	    <table border=0 cellspacing=0 cellpadding=5 width=100% class="hTableBorder">
	    <tr class="tableInternal">
	    <td align=center valign=top ><img src="/webclient/common/images/info-success.gif" hspace=0></td>
	    <td class="text" align=left  valign=top> 

	    <fmt:message key='webclient.common.support.filemsg'/> <a href = "javascript:MM_openBrWindow('/instantFeedback.do?zipName=<c:out value='${supportGzipName}'/>','FileUpload','scrollbars=no,width=550,height=400')"><fmt:message key='webclient.common.support.emailfile'/></a>  (or)  <a href="/<c:out value='${supportGzipName}'/>"><fmt:message key='webclient.common.support.downloadlink'/> <%-- </a>  <fmt:message key='webclient.common.support.messagemail'/> --%>
	    <br> <br>(<fmt:message key='webclient.common.support.serverloc'/> : <c:out value='${supportAbsPath}'/>)

	    </td>
	    </tr>
	    </table>
	    </td>
	    </tr>
	    </table>
	</c:if>
	 </div>
	
 <! -- Div Ends -->
		   
	    </td>
	    </tr>
    <!-- Support information file Message Ends -->
    	<tr><td>
<%--
        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.common.support.latestdiscusssion'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
--%>



        <table border=0 cellspacing=0 cellpadding=0 width=100% >
	<tr> 
	<td height="30" valign="bottom" class="header1"><fmt:message key='webclient.common.support.header'/></td>
    	<td height="19" align="right" valign="bottom">
	</td>
	</tr>	
	<tr> 
	<td height="2" colspan="2" class="blueLine"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
	</tr>
	<tr><td height="10"></td>
	</tr>	
	</table>
	<tr>
        <td>

        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.common.support.tabletitle'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >

        <!-- Show table -->
        <table border=0 cellspacing=0 cellpadding=0 class="dbborder1" style="text-align: left; width: 100%;">
        <!--tr class="header2Bg">
                <td class = "header1" height = "25"><fmt:message key='webclient.common.support.tabletitle'/></td>
        </tr-->

        <tr>
        <td>
		<table border=0 cellspacing=0 cellpadding=0 width=100% align = "center" class="tableInternal">
		<tr  >
             <tr><td colspan=4><img src="/webclient/common/images/spacer.gif" width="10" height="12"></td></tr>
			<td  width=33% valign=top >
				<!-- Request support -->
				<table border=0 cellspacing=0 cellpadding=2 width=100% >
                <tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
				<tr >
				
            <td width=30% valign=top ><a href="#" onClick="MM_openBrWindow('/instantFeedback.do?type=issue','feedback','scrollbars=no,width=500,height=395')"><img  src="/webclient/common/images/support-form.gif" alt="Request Support" border=0></a></td>
					<td width=100% class="text" valign=top> <b><a href="#" onClick="MM_openBrWindow('/instantFeedback.do?type=issue','feedback','scrollbars=no,width=500,height=395')"><fmt:message key='webclient.common.support.request'/></a></b><br><br><fmt:message key='webclient.common.support.technical'/></td>

				</tr>
				</table>			
			</td>
			
            <td  width = 33% valign=top class="text">
							<!-- Create Support Information File-->
							<table border=0 cellspacing=0 cellpadding=2 width=100% >
                            <tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
							<tr>
							
							<td width=30% valign=top><a href="javascript:supporttest('Loading')"><img src="/webclient/common/images/support-createinf.gif" alt="Create Support Information File" border=0></a></td>
							<td width=70% class="text" valign=top><b><a href="javascript:supporttest('Loading')"><fmt:message key='webclient.common.support.infoheader'/></a></b></a><br><br><fmt:message key='webclient.common.support.createfile'/></td>
							</tr>
							</table>						
						
			</td>

			<td width=33%  valign=top class="txtGlobal">
				<!-- Knowledge Base-->
				<table border=0 cellspacing=0 cellpadding=2 width=100%>
				<tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
				<tr>
					<td width=30% valign=top><a href="http://search.manageengine.com/kbasesearch.jsp?url_val=kbase%2FWeb_NMS" target="WebNMSSupport"><img src="/webclient/common/images/support-kbase.gif" alt="Knowledge base" border=0></a></td>
					<td width=70% class="txtGlobal" valign=top> <a href="http://search.manageengine.com/kbasesearch.jsp?url_val=kbase%2FWeb_NMS" target="WebNMSSupport"><b><fmt:message key='webclient.common.support.kbase'/></b></a><br><br><fmt:message key='webclient.common.support.kbasesoln'/></td>
				</tr>
				</table>			
			</td>

		 </tr>

		 <tr class="tableInternal">
         <tr><td colspan=4><img src="/webclient/common/images/spacer.gif" width="10" height="12"></td></tr>
			
        <td width=33%  valign=top class="txtGlobal">
				<!-- Technical Documentation -->
				<table border=0 cellspacing=0 cellpadding=2 width=100%>
				<tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
				<tr>
					<td width=30% valign=top><a href="http://www.webnms.com/webnms/documentation.html" target="WebNMSSupport"><img src="/webclient/common/images/support-doc.gif" alt="Knowledge base" border=0></a></td>
					<td width=70% class="txtGlobal" valign=top> <a href="http://www.webnms.com/webnms/documentation.html" target="WebNMSSupport"><b><fmt:message key='webclient.common.support.documention'/></b></a><br><br><fmt:message key='webclient.common.support.dochelp'/> </td>
				</tr>
				</table>			
			</td>
			
            <td  width = 33% valign=top class="text">
				<!-- User forums -->
				<table border=0 cellspacing=0 cellpadding=2 width=100% >
                <tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
				<tr>
							
	<td width=30% valign=top><a href= "http://forums.manageengine.com/oems-developers/web-nms" target="WebNMSSupport"><img src="/webclient/common/images/support-forums.gif" alt="User Forums" border=0></a></td>
					<td width=70% class="text" valign=top> <a href= "http://forums.manageengine.com/oems-developers/web-nms" target="WebNMSSupport"><b><fmt:message key='webclient.common.support.userforums'/></b></a><br><br><fmt:message key='webclient.common.support.forumsdiscuss'/></td>
				</tr>
				</table>						
			</td>
			
			<td  width = 33% valign=top class="text">
				<!-- Post New Forum Topic -->
				<table border=0 cellspacing=0 cellpadding=2 width=100% >
                <tr><td colspan=2><img src="/webclient/common/images/support-topstrip.gif"></td></tr>
				<tr>
					<td width=30% valign=top><a href= "http://forums.manageengine.com/oems-developers/web-nms/newtopic" target="WebNMSSupport"><img src="/webclient/common/images/newpost.gif" alt="Forums" border=0></a></td>
					<td width=70% class="text" valign=top><a href= "http://forums.manageengine.com/oems-developers/web-nms/newtopic" target="WebNMSSupport"> <b><fmt:message key='webclient.common.support.newpost'/></b></a><br><br><fmt:message key='webclient.common.support.addpost'/></td>
				</tr>
				</table>
						
			</td>
			</tr>
			
			
 <tr class="tableInternal">

 <tr><td colspan=4><img src="/webclient/common/images/spacer.gif" width="10" height="12"></td></tr>
			

</table>

</table>

<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>

</td>
</tr>



<%--tr><td>
	<table border =0  width=100% cellpadding=1 cellspacing=2 border=0 class="text" align = "center"> 
	<tr><td valign=top>
	<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.common.support.latestdiscusssion'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
		<table align="center" cellpadding=0 cellspacing=0 border=0 class="dbborder1" style="text-align:left; width:100%;">
     				<tr>
				    <td ><script  language="JavaScript" type="text/javascript" src="http://forums.adventnet.com/products_topicsanywhere.php?mode=show&f=2&n=10&jlp=y&r=y&a=y&s=y&l=y&m=y&h='a\'s\'m\'p\'l\&so=d&b=non&lpb=0&lpd=0&lpi=y"></script>
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
		</td>
	</tr>
</table>
</td></tr--%>
</table>
</body>
</html>
