package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.adventnet.nms.util.JnlpFileUpdater;

public final class WebStart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n\n\n<html>\n<head> \n<title>\n    Checking the presence of Java Web Start in the Local Machine \n</title>\n<LINK REL=STYLESHEET TYPE=\"text/css\" HREF=\"../template/nmshtmlui.css\">\n</head>\n\n<body>\n\n\n");

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
			
      out.write("\n<!---- to download page - start ---->\n<table border=0 width=100%><tr><td width=99%>\n<!-- text start -->\n<b> <font color=\"red\"> <i>Java Web Start is not installed in this machine. Please download Web Start. </i></font> </b>\n<!-- text End -->\n</td><td>\n<a href=\"http://java.sun.com/cgi-bin/javawebstart-platform.sh?\"><img src=\"../images/dl-javawebstart3.jpg\" border=0 hspace=20></a>\n</td></tr></table>\n\n<BR>\n<hr size=-1>\n<BR>\n\n<center>\n<img src=\"../images/jws-wordsonly.gif\">\n</center>\n<p align=justify>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Java(TM) Web Start, 'A new client application-deployment technology'  that gives you the power to launch full-featured applications with a single click from your Web browser. You can now download and launch applications, without going through complicated installation procedures. </P>\n\n<p align=justify>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Now 'Web NMS Application Client' is Web Start Enabled. You can launch it by just clicking on a Web page link. If the Application Client is not installed in your computer, Java Web Start automatically downloads all the necessary files. It then caches the files on your computer so that the client is always ready to be launched whenever you want -- either from an icon on your desktop or from the browser link. No matter how and when you launch, Web Start ensures that you always work in the latest version of the Application Client, available for access.  </P>\n");
      out.write("\n<!---- to download page - end ---->\n\t\t\t");

			return;
		}
	}
	else
	{
		
      out.write("\n\t\t\tSorry, required parameters missing\n\t\t");

	}

      out.write("\n</body>\n</html>\n\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
