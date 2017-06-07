package org.apache.jsp.examples.webclient.perf;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class DailyWeeklyReports_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n<!-- $Id: DailyWeeklyReports.jsp,v 1.1 2007/06/14 13:56:19 venkatramanan Exp $ -->\n\n\n<html>\n<head>\n<title>AdventNet Web NMS 4</title>\n<script>\n  function reloadPage(treeUrl, rightPgUrl)\n\t{\n\t\ttop.leftFrame.location.href=\"/Tree.do?\"+treeUrl;\n\t\twindow.location.href=\"/perf/ReportViewAction.do?\"+rightPgUrl;\n\t}\n</script>\n</head>\n<body class=\"bgNone\">\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n \n \n   <td align=\"center\" valign=\"top\"><table width=\"270\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\">\n<tr>\n   <td align=\"center\" valign=\"top\">&nbsp;</td>\n   <td align=\"center\" valign=\"top\">&nbsp;</td>\n   <td align=\"center\">&nbsp;</td>\n   <td align=\"center\">&nbsp;</td>\n </tr>\n<tr>\n      <td><img src=\"/webclient/common/images/trans.gif\" width=\"1\" height=\"1\"></td>\n         <td><table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"2\" cellspacing=\"1\">\n             <tr align=\"center\">\n               <td colspan=\"2\" class=\"header2Bg\"><b><a HREF=\"../jsp/DirectoryListing.jsp?directoryName=reports/daily\"> ");
      out.print("Daily Reports" );
      out.write("</a></b></td>\n       </tr>\n<tr><td class=\"text\" height=\"75\">\n<p >");
      out.print("Users can collect the daily statistics for devices discovered in the network with specific / all match criteria." );
      out.write("</p></td>\n       </td>\n             </tr>\n           </table>\n</td>\n\n </tr>\n<tr>\n   <td align=\"center\" valign=\"top\">&nbsp;</td>\n   <td align=\"center\" valign=\"top\">&nbsp;</td>\n   <td align=\"center\">&nbsp;</td>\n   <td align=\"center\">&nbsp;</td>\n </tr>\n\n<tr>\n      <td><img src=\"/webclient/common/images/trans.gif\" width=\"1\" height=\"1\"></td>\n         <td><table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"2\" cellspacing=\"1\">\n             <tr align=\"center\">\n               <td colspan=\"2\" class=\"header2Bg\"><b><a HREF=\"../jsp/DirectoryListing.jsp?directoryName=reports/weekly\"> ");
      out.print("Weekly Reports" );
      out.write("</a></b></td>\n       </tr>\n<tr><td class=\"text\" height=\"75\">\n<p >");
      out.print("This Option can be used to collect statistical information for all/specific match criteria on a weekly basis." );
      out.write("</p></td>\n       </td>\n             </tr>\n           </table>\n</td>\n\n </tr>\n      \n       <tr>\n         <td height=\"2\" colspan=\"3\" class=\"symbolBorder\"><img src=\"/webclient/common/images/trans.gif\" width=\"1\" height=\"1\"></td>\n       </tr>\n     </table></td>\n   <td align=\"center\">\n</td>\n   <td>&nbsp;</td>\n </tr>\n</table>\n</body>\n</html>\n");
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
