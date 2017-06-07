<%-- $Id: WebStart.jsp,v 1.2 2007/07/12 06:46:55 srajeswari Exp $ --%>
<%@ page import="com.adventnet.nms.util.JnlpFileUpdater" %>

<html>
<head> 
<title>
    Checking the presence of Java Web Start in the Local Machine 
</title>
<LINK REL=STYLESHEET TYPE="text/css" HREF="../template/nmshtmlui.css">
</head>

<body>


<%
	String webstart = request.getParameter("webstart");
	if(webstart != null)
	{
               // Added by Balan for SSL 
	         String	strProtocol   = request.getScheme();
                        strProtocol   = strProtocol.trim(); 
		   //Add Ends
		String hostName =   request.getServerName();
if(webstart.equals("installed"))
		{
                  //Added by Balan for SSL 
                  /* JnlpFileUpdater parser = new JnlpFileUpdater(null);*/
		      JnlpFileUpdater parser = new JnlpFileUpdater(null,strProtocol,hostName);
			  //Add Ends
                  response.sendRedirect("../conf/WebNMS.jnlp");
		}
		else if(webstart.equals("notinstalled"))
		{
			%>
<!---- to download page - start ---->
<table border=0 width=100%><tr><td width=99%>
<!-- text start -->
<b> <font color="red"> <i>Java Web Start is not installed in this machine. Please download Web Start. </i></font> </b>
<!-- text End -->
</td><td>
<a href="http://java.sun.com/cgi-bin/javawebstart-platform.sh?"><img src="../images/dl-javawebstart3.jpg" border=0 hspace=20></a>
</td></tr></table>

<BR>
<hr size=-1>
<BR>

<center>
<img src="../images/jws-wordsonly.gif">
</center>
<p align=justify>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Java(TM) Web Start, 'A new client application-deployment technology'  that gives you the power to launch full-featured applications with a single click from your Web browser. You can now download and launch applications, without going through complicated installation procedures. </P>

<p align=justify>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Now 'Web NMS Application Client' is Web Start Enabled. You can launch it by just clicking on a Web page link. If the Application Client is not installed in your computer, Java Web Start automatically downloads all the necessary files. It then caches the files on your computer so that the client is always ready to be launched whenever you want -- either from an icon on your desktop or from the browser link. No matter how and when you launch, Web Start ensures that you always work in the latest version of the Application Client, available for access.  </P>

<!---- to download page - end ---->
			<%
			return;
		}
	}
	else
	{
		%>
			Sorry, required parameters missing
		<%
	}
%>
</body>
</html>

