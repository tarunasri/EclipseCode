package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.List;
import java.text.MessageFormat;
import java.util.Properties;
import java.sql.Connection;
import com.adventnet.nms.db.util.DBXmlUpdate;
import com.adventnet.nms.startnms.NmsMainFE;
import com.adventnet.nms.util.PureServerUtilsFE;
import com.adventnet.nms.util.NmsUtil;
import com.adventnet.nms.util.RunProcessInterface;
import com.adventnet.nms.util.NmsLogMgr;
import com.adventnet.management.log.Log;
import com.adventnet.nms.jsp.JspUtility;
import com.adventnet.nms.commonfe.GenericFEAPIImpl;
import com.adventnet.security.authentication.AuthenticationException;
import com.adventnet.nms.jsp.SessionListener;

public final class ProcessLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n");

// Added by Shanmugam on 11/7/2002 for I18N
String Lang = (String)session.getAttribute("Language");
String Coun = (String)session.getAttribute("Country");
String contentType=  "text/html;charset="+JspUtility.getContentType(Lang,Coun);
response.setContentType(contentType);
// End of fix by Shanmugam
boolean isPasswordExpired = false;
boolean firstLogin = false;
String message = null;
String loginURL = "/jsp/Login.jsp?";
String uri = request.getRequestURI();
String queryStr =  null;
String requestMethod = request.getMethod();

// get the query string if the request method is "GET" 
if( requestMethod.equalsIgnoreCase("GET") ) {

	queryStr = request.getQueryString();

}
// form the query string in case of "POST" method
// if the amount of data is large, this may fail..
else if ( requestMethod.equalsIgnoreCase("POST") ) {
	boolean isSingleButton=false;
	if(request.getParameter("buttonCount")!=null)
	{
		isSingleButton=true;
	}
		

	Enumeration parameterNames = request.getParameterNames();
	StringBuffer temp = new StringBuffer();
	while ( parameterNames.hasMoreElements() ) {
		String paramName = (String) parameterNames.nextElement();
			if(!paramName.equals("userName") && !paramName.equals("password") && !paramName.equals("login") && !paramName.equals("requestfrom")  && !paramName.equals("javaui") && (  isSingleButton ||(!isSingleButton && !paramName.equals("htmlui")) )  ){
				String paramValue = request.getParameter(paramName);
				if(paramValue != null)
				{
					paramValue = URLEncoder.encode(paramValue);
				}
				temp = temp.append(paramName).append("=").append(paramValue).append("&");
			}
	}
	queryStr = temp.toString();

}
String requestfrom = request.getParameter("requestfrom");

// when the user goes back to the login page and enters some junk values 
// for username and password and clicks HTML UI, he is allowed to see the client.
// this check is made to overcome that invalid input.
/*
if( requestfrom != null && requestfrom.equals("loginPage") ) {
	session.removeAttribute("userName");
	session.removeAttribute("password");
}
*/
if(session.getAttribute("userName") == null || ( requestfrom != null && requestfrom.equals("loginPage") )  ){


	String userName = request.getParameter("userName");
	if(userName == null || userName.equals("null") || userName.trim().equals("")){
		if(requestfrom == null){
			loginURL +="message="+URLEncoder.encode(NmsUtil.GetString("Please authenticate yourself"))+"&buttonCount=singleButton&uri="+uri;
		} else {
			loginURL +="message="+URLEncoder.encode(NmsUtil.GetString("Please enter user name"));
		}
		if(queryStr != null){
			loginURL += "&"+queryStr;
		}
		
		
      out.write("\n\t\t<script>\n\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t</script>\n\t\t");

		return;
	}
	String password=request.getParameter("password");
	if(password==null || password.equals("null") || password.trim().equals("")){
		if(requestfrom == null){
			loginURL +="message="+URLEncoder.encode(NmsUtil.GetString("Please authenticate yourself"))+"&buttonCount=singleButton&uri="+uri;
		} else {
			loginURL +="message="+URLEncoder.encode(NmsUtil.GetString("Please enter password"));
		}
		if(queryStr != null){
			loginURL += "&"+queryStr;
		}
		
      out.write("\n\t\t<script>\n\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t</script>\n\t\t");

		return;
	}
	String serverNotInitialized = new String("<HTML><HEAD><TITLE>Please try again...</TITLE><LINK HREF=../template/nmshtmlui.css rel=stylesheet></HEAD><BODY><I><B><FONT id='leftcap'>" + NmsUtil.GetString("AdventNet") + " " + NmsUtil.GetString("WebNMS Version x.x") + "</FONT></B></I><P>&nbsp;</P><P>&nbsp;</P><HR><P>&nbsp;</P>&nbsp;<P></P>&nbsp;<P></P>&nbsp;<P></P><FONT class='redFont'><CENTER>The server is not yet initialized. It will take a while to do so. Please try again...</CENTER></FONT></BODY></HTML>");
	if(!NmsUtil.webNMSModulesStarted) {
			out.println(serverNotInitialized);
			out.flush();
            out.close();
			return;
	}
	for(Enumeration e = NmsUtil.runProcessModules.keys();e.hasMoreElements();) {
		String key = (String)e.nextElement();
		RunProcessInterface rpi = (RunProcessInterface)NmsUtil.runProcessModules.get(key);
		if(!rpi.isInitialized()) {
			out.println(serverNotInitialized);
			System.err.println(key + NmsUtil.GetString(" module not initialized"));
			out.flush();
			out.close();
			return;
		}
	}

	if ( !com.adventnet.nms.startnms.NmsMainFE.isStarted ) {

		System.err.println(NmsUtil.GetString("FATAL : Front End Server is not yet started"));
		
      out.write("\n\t\t\t<HTML>\n\t\t\t<TITLE>\n                             ");
      out.print( NmsUtil.GetString("Front End Server is not Started/Initialized"));
      out.write("\n\t\t\t</TITLE>\n\t\t\t<LINK HREF=../template/nmshtmlui.css rel=stylesheet>\n\t\t\t<BODY>\n\t\t\t<I><B>\n\t\t\t<FONT id=leftcap>");
      out.print( NmsUtil.GetString("AdventNet") );
      out.write(' ');
      out.print( NmsUtil.GetString("WebNMS Version x.x") );
      out.write("</FONT>\n\t\t\t</B></I>\n\t\t\t<hr>\n\t\t\t<br><br><br><br><br><br>\n\t\t\t<center><font class=redFont>");
      out.print( NmsUtil.GetString("Front End Server is not yet started or initialized !!."));
      out.write("</font>\n\t\t\t</BODY>\n\t\t\t</HTML>\n\t\t");

		return;
	}
	// match the password with the that in the db.
	boolean resultOfVerification = false;

	// getting the remote host name for passing it
	// to the api. This will be used for logging.
	String remoteHost = request.getRemoteHost();

	// There are some problems in getRemoteHost with Tomcat 3.2 
	// It returns null in ajp13 and empty string in ajp12.
	if(remoteHost == null || remoteHost.trim().equals(""))
	{
		// In this case, we use IP Address.
		remoteHost = request.getRemoteAddr();
	}

	Properties userProps = new Properties();
	// the key should be hostname.
	userProps.setProperty("hostname", remoteHost);

	try{
                int maxSession = 0;
                String count = NmsUtil.getParameter("MAX_CLIENT_SESSIONS");
                if(count != null) 
                {  
                     try
                     {
                         maxSession = Integer.parseInt(count);
                     }
                     catch(Exception ee)
                     {
                         maxSession = 0;
                     }
                }
                List actualUsers = GenericFEAPIImpl.getAPI().getActualUsers();
                //Verify for null check.... of actualUsers
                if(maxSession > 0 && (actualUsers.size() >= maxSession))
                {
                    loginURL += "message="+URLEncoder.encode(NmsUtil.GetString("Maximum Client Session exceeds, unable to create new session")); 

                     
      out.write("\n                     <script>\n                     window.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n                     </script>\n                     ");

                     return;
                }

		// Passing the user properties to the API.
		resultOfVerification = PureServerUtilsFE.isPasswordCorrect(userName,password, userProps);
		//resultOfVerification = PureServerUtilsFE.isPasswordCorrect(userName,password);
	}
	catch(AuthenticationException e){
		int exceptionType = e.getExceptionType();
		if( exceptionType == AuthenticationException.PASSWORD_EXPIRED )
		{
			// setting the resultOfExpiration to true so that 
			// the userName is put in the session, 
			// which means he is authenticated.
			resultOfVerification = true;

			// setting isPasswordExpired to true so that 
			// the page is redirected to PasswordExpired.jsp 
			// for the user to change the password.
			isPasswordExpired = true;
		}
		else if( exceptionType == AuthenticationException.USER_EXPIRED )
		{
			message = NmsUtil.GetString("The User Account has EXPIRED. Please contact the Administrator.");
		}
		else if( exceptionType == AuthenticationException.LOGIN_FAILED )
		{
			message = NmsUtil.GetString("Maximum Login attempts reached. The User Account has been DISABLED. Please contact the Administrator.");
		}
		else if( exceptionType == AuthenticationException.USER_DISABLED )
		{
			message = "The User Account has been DISABLED. Please contact the Administrator.";
		}
		else if( exceptionType == AuthenticationException.USER_FORCED_OUT )
		{
		}
		else if( exceptionType == AuthenticationException.FIRST_LOGIN )
		{
			// setting the resultOfExpiration to true so that 
			// the userName is put in the session, 
			// which means he is authenticated.
			resultOfVerification = true;

			// setting firstLogin to true so that 
			// the page is redirected to PasswordExpired.jsp 
			// for the user to change the password.
			firstLogin = true;
		}
		else if( exceptionType == -1 )
		{
			message = e.getMessage();
		}
		if( message == null || message.trim().equals("") || message.trim().equals("null") )
		{
			message = NmsUtil.GetString("Login Failed. Please contact the Administrator"); 
		}
		if(!isPasswordExpired && !firstLogin)
		{
			loginURL += NmsUtil.GetString("message=")+URLEncoder.encode(message);

		
			
      out.write("\n\t\t\t<script>\n\t\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t\t</script>\n\t\t\t");

			return;
		}
	}

	if(resultOfVerification){
		session.setAttribute("userName",userName);
		session.setAttribute("password",password);
		// session timeout period 30 minutes
		session.setMaxInactiveInterval(1800);

		// printing the userName, time and the ipAddress while logging in
        String remoteaddr = request.getRemoteAddr();
        NmsLogMgr.MISCUSER.log(NmsUtil.GetString("User ")+userName+NmsUtil.GetString(" logged into the Browser Client at ")+ JspUtility.gettime() +NmsUtil.GetString("from ")+ remoteaddr,Log.SUMMARY);
     
	 // code moved from index.jsp for SP7
	 if (!NmsMainFE.singleJVM)
	 {
		 try
		 {
			 //this has to be the first executable after getting the username
			 NmsMainFE.downloadClientFilesFromBE(userName);
		 }
		 catch (Exception e)
		 {
			 NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception in downloading client related files from the BackEnd Server..."), e);
			 //we can also quit
		 }
	 } 
   //To Populate Database from Tree.xml for new user
	Connection con = null;
	try
	{
		con = NmsUtil.relapi.getConnection();
		DBXmlUpdate dbxmlupdate = new DBXmlUpdate(con);
		boolean ans =  dbxmlupdate.updateDB(userName,"Tree.xml");
		NmsLogMgr.MISCUSER.log(NmsUtil.GetString("Populated database for User ")+userName+" "+String.valueOf(ans)+" ",Log.SUMMARY);

	}
    catch (Exception e)
	{
		NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception in Populating the database for the user..."), e);
		out.println("<br><br><center>"+ e.getMessage()+"</center>");
		return;
	}
	// adding the user to active user list
	
	if(request.getParameter("htmlui")!=null)
	{
		GenericFEAPIImpl.getAPI().addActiveUser(userName);
	}

		Properties props = new Properties();
		props.setProperty("userName", userName);
		props.setProperty("hostname", remoteHost);
		SessionListener sessionListener = new SessionListener(props);
		session.setAttribute("sessionListener", sessionListener);

		// if the password is expired, the page is redirected to PasswordExpired.jsp
		// so that the user can change the password.
		if(isPasswordExpired){
			loginURL="/jsp/PasswordExpired.jsp";
			if(queryStr != null){
				queryStr = queryStr.replace(' ','+');
				loginURL += "?htmlui=&"+queryStr;
			}
			
      out.write("\n\t\t\t\t<script>\n\t\t\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t\t\t</script>\n\t\t\t");

		}
		if(firstLogin){
			loginURL="/jsp/PasswordExpired.jsp";
			if(queryStr != null){
				queryStr = queryStr.replace(' ','+');
				loginURL += "?htmlui=&firstLogin=true&"+queryStr;
			}
			
      out.write("\n\t\t\t\t<script>\n\t\t\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t\t\t</script>\n\t\t\t");

		}

	}else{
		loginURL+=NmsUtil.GetString("message=")+URLEncoder.encode(NmsUtil.GetString("Login Failed. Please verify your user name and password."));
		if(requestfrom == null){
			loginURL +="&buttonCount=singleButton&uri="+uri;
		}
		if(queryStr != null){
			loginURL += "&"+queryStr;
		}
		
      out.write("\n\t\t<script>\n\t\twindow.open(\"");
      out.print(loginURL);
      out.write("\",\"_top\");\n\t\t</script>\n\t\t");

		return;
	}
} 

      out.write('\n');
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
