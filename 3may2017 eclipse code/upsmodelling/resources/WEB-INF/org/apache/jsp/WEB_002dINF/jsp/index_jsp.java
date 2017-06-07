package org.apache.jsp.WEB_002dINF.jsp;

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
import java.io.*;
import java.util.*;
import java.rmi.*;
import java.net.URLEncoder;
import com.adventnet.nms.startnms.NmsMainFE;
import com.adventnet.nms.util.NmsUtil;
import com.adventnet.nms.util.NmsLogMgr;
import com.adventnet.nms.util.ClientParameters;
import com.adventnet.nms.util.PureServerUtilsFE;
import com.adventnet.nms.commonbe.BEServerContext;
import com.adventnet.nms.util.GenericUtility;
import java.sql.Connection;
import java.sql.SQLException;
import com.adventnet.nms.db.util.DBXmlUpdate;
import com.adventnet.nms.authentication.UserConfigAPI;
import com.adventnet.management.log.Log;
import com.adventnet.nms.topodb.TopoAPI;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import com.adventnet.nms.db.util.TreeAPI;
import com.adventnet.nms.jsp.JspUtility;
import com.adventnet.security.AuthUtil;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    String nodesToOpen=null;
	//SP7 this configurable parameter will decide whether to show page in framed/nonframed version
	String htmlui_frames="false";
    private String nmsArcJar = null; 	
	private String userPassword = null;

	
   private String getRealmString(String realm) {
        realm = realm.substring(1,realm.length()-1);
        StringBuffer buff = new StringBuffer();
        StringTokenizer toks = new StringTokenizer(realm,",",true);
        while(toks.hasMoreTokens()) {
            buff.append(toks.nextToken().trim());
        }
       return buff.toString();
    }
        
    Hashtable paramList = new Hashtable(50);

    public void readClientParameters() {
        readClientParameters(null);
    }
	/** To get the values for the parameters list.
	 */
	public void readClientParameters(String userName) {
		paramList.clear();
		String s = NmsMainFE.proto;
		ClientParameters clientParams = new ClientParameters();
		clientParams.readClientParameters(paramList);
		if(userName !=null)
		{
			ClientParameters userSpecificClientParams = new ClientParameters(userName);
			Hashtable userSpecificParams = new Hashtable(20);
			userSpecificClientParams.readClientParameters(userSpecificParams);
			paramList.putAll(userSpecificParams);
		}
            //Commented by Balan on 21/03/03 for Issue Reported by Hettaras NetWork Both Archive and NMSArchive is loaded in
            //ARHIVE Tag
		// nmsArcJar = (String)paramList.get("ARCHIVE");
            //Comment Ends 
            //Added by Balan on 21/03/03 for Issue Reported by Hettaras NetWork Both Archive and NMSArchive is loaded in
            //ARHIVE Tag
              nmsArcJar = (String)paramList.get("cache_archive");
              if(nmsArcJar != null)
              {
                  String arcJar = (String)paramList.get("ARCHIVE");
                  arcJar = arcJar.substring(nmsArcJar.length()+1);
                  paramList.put("ARCHIVE",arcJar);
              }
            //Add Ends
		nodesToOpen=(String)paramList.get("INIT_PANEL");
		//added for SP7
		if(paramList.get("SHOW_SINGLE_PAGE_IN_FRAMES")!=null)
			htmlui_frames=(String)paramList.get("SHOW_SINGLE_PAGE_IN_FRAMES");
		if (nodesToOpen==null)
		{
			/*
			 * If no INIT_PANEL has been specified in the clientparameters.conf file, we are
			 * providing the localnetwork map as the default one to be selected.
			 */
			nodesToOpen = "ipnet.netmap";
			try
			{
				TopoAPI topoapi = GenericUtility.getTopoAPI();
				nodesToOpen = topoapi.getLocalNetworkAddrs()+".netmap";
			}
			catch(Exception ex)
			{
				System.err.println("Exception while obtaining the LocalNetworkAddr from the Server.");
				nodesToOpen = "ipnet.netmap";	
			}
			paramList.put("INIT_PANEL",nodesToOpen);
		}
		paramList.put("CLIENT_SERVER",s);
		String clientClassName = PureServerUtilsFE.getClientTransportClassName();
		paramList.put("CLIENT_CLASS_NAME",clientClassName);
		paramList.put("KEEPALIVE_WINDOW_SIZE", new Integer(NmsUtil.keepalive_window_size).toString());
		String feTimeZoneID = TimeZone.getDefault().getID();

		BEServerContext svrCntxt=PureServerUtilsFE.getBEServerContext();
		Properties prop=svrCntxt.getProperties();
		String beTimeZoneID=(String)prop.get("TimeZoneID");

		paramList.put("BE_TIMEZONE_ID",beTimeZoneID );
		paramList.put("FE_TIMEZONE_ID",feTimeZoneID );

		String cryptoClass = NmsUtil.CRYPTO_CLASS;
	
		if (cryptoClass != null)
		{
			paramList.put("CRYPTO_CLASS", cryptoClass);
		}
	}
	

    public String getNodeToOpen(String name,Element element)throws IOException
	{
        String request=null;
        if(element==null)
        {
            return null;
        }
		String url="";
		if(element.getAttribute("URL")!=null)
		url=element.getAttribute("URL");

		if(url.equals(name))
		{
		return element.getAttribute("NODEID");
		}
		NodeList nodeList =element.getChildNodes();
        if(nodeList==null)
        {
            return null;
        }
        int size = nodeList.getLength();
        for( int i=0;i<size;i++)
        {
            Element child = (Element)nodeList.item(i);
            if(child==null)
            {
                continue;
            }
			request= getNodeToOpen(name,child); 
			if(request!=null)
			return request;
        }
        return request; 
	}
	
    public Element searchForElement(String name,Element element, JspWriter out)throws IOException
    {
        String menuid = element.getAttribute("ID");
        if(element==null)
        {
            return null;
        }
        if (menuid.equals(name))
        {
            return element;
        }
        NodeList nodeList =element.getChildNodes();
        if(nodeList==null)
        {
            return null;
        }
        int size = nodeList.getLength();
        for( int i=0;i<size;i++)
        {
            Element request=null;
            Element child = (Element)nodeList.item(i);
            if(child==null)
            {
                continue;
            }
            request= searchForElement(name,child,out); 
            if (request!=null)
                return request;
        }
        return null; 
    }


	/*
		Method for getting the first leaf node for the given node, if the INIT_PANEL in ClientParameters.conf contains 
		invaild map name
	*/
	private Element getLeafNode(Element node)
	{
		Element leafNode = null;
		NodeList children = node.getChildNodes();
		int length = children.getLength();
		for(int i=0; i<length; i++)
		{
			Element childNode = (Element) children.item(i);
			if (childNode.getNodeType() != Node.ELEMENT_NODE) continue;
			NodeList childList = childNode.getChildNodes();
			int childCount = childList.getLength();

			// for checking whether the childNode is the leaf or not 
			Element firstChild = null;
			for(int j=0;j<childCount;j++)
			{	
				Node cNode = childList.item(j);
				if (cNode.getNodeType() == Node.ELEMENT_NODE)
				{
					firstChild = (Element) cNode;
					break;
				}
			}
			if (firstChild == null)
				return childNode;
			else 
				return getLeafNode(childNode);
		}
		return null;
	}

    private String getReqString(Element node)
    {
        if(node==null)
        {
            return "../jsp/ShowImage.jsp?imageName=../images/screen.png";
        }
        String menuid=node.getAttribute("ID");
        if(menuid!=null)
	{
            menuid=java.net.URLEncoder.encode(menuid);
        }
        String menuTreeName=node.getAttribute("TREE-NAME");
        String menuFileName= node.getAttribute("MENU-FILE-NAME");
        StringBuffer buffer = new StringBuffer(node.getAttribute("URL"));
        if(buffer == null || buffer.length()==0)
        {
            buffer = new StringBuffer();
            buffer.append("jsp/ShowImage.jsp?imageName=../images/screen.png");
        }
        if(buffer.toString().indexOf(":") == -1)
        {
            buffer.insert(0,"../");
            if(buffer.toString().indexOf("?") == -1)
            {
                buffer.append("?");
            }
            else
            {
                buffer.append("&");
            }
            buffer.append("type=").append(menuid);
            buffer.append("&displayName=").append(java.net.URLEncoder.encode(menuTreeName));
            buffer.append("&menuFileName=").append(menuFileName);
        }
        return buffer.toString();
    }

    private boolean isSAServerRunning()
    {
          return   com.adventnet.nms.fe.sas.NmsSAServerFE.isSAServerRunning();
    }


  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/jsp/ProcessLogin.jsp");
  }

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

      out.write('\n');
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
      out.write("\n\n\n\n\n\n\n\n\n\n                \n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      out.write('\n');
      out.write('	');

		String queryString = "?";

		response.setStatus( HttpServletResponse.SC_OK );
        Hashtable ht = new Hashtable(50);
        for(Enumeration parameterNames = request.getParameterNames();
            parameterNames.hasMoreElements();) {
            String param = (String)parameterNames.nextElement();
            String value = (String)request.getParameter(param);

			// to pass all the request parameters ( except userName and password )
			// to the file which is requested from the application client. ( fromAppClient )
			// previously we used request.getQuerySting(), which fails in case of POST
			if(!param.equals("userName") && !param.equals("password"))
			{
				queryString += param + "="+ java.net.URLEncoder.encode(value) + "&";
			}

			if (param == null) param = "-";
			if( (value!=null) && (value.indexOf("(")!=-1) ) {
				StringTokenizer str=new StringTokenizer(value,"(");
				value=str.nextToken();
			}
			ht.put(param,value);
        }
		//get the Country and put it in the session
		if(session.getAttribute("Country") == null) {
            if(ht.get("Country")==null) ht.put("Country","null");
            session.setAttribute("Country",((String)ht.get("Country")).trim());
	    //NmsJspUtil.country=(String)ht.get("Country");
        }
		//get the Language and put it in the session
		if(session.getAttribute("Language") == null) {
            if(ht.get("Language")==null) ht.put("Language","null");
            session.setAttribute("Language",((String)ht.get("Language")).trim());
	    //NmsJspUtil.language=(String)ht.get("Language");
        }
		// The below two lines are commented and the functionality is moved to
		// ProcessLogin.jsp by Shanmugam.PL on   11/7/2002
		//String contentType=  "text/html;charset="+JspUtility.getContentType((String)session.getAttribute("Language"),(String)session.getAttribute("Country")) ;
        //response.setContentType(contentType);
		PrintWriter p= response.getWriter();
        String remotehost = request.getRemoteHost();
        String requested_document = request.getPathTranslated();
        String userName = (String)session.getAttribute("userName");
/*
        if (!NmsMainFE.singleJVM)
        {
            try
                {
                    NmsMainFE.downloadClientFilesFromBE(userName);
                }
            catch (Exception e)
                {
                    NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception in downloading client related files from the BackEnd Server..."), e);
                }
        } 

*/
      //To Populate Database from Tree.xml for new user

       //Connection con = null;
	   /*
       try{
        con = NmsUtil.relapi.getConnection();
        DBXmlUpdate dbxmlupdate = new DBXmlUpdate(con);
       boolean ans =  dbxmlupdate.updateDB(userName,"Tree.xml");
        NmsLogMgr.MISCUSER.log(NmsUtil.GetString("Populated database for User ")+userName+" "+String.valueOf(ans)+" ",Log.SUMMARY);
       
         }
   catch (Exception e)
                {
                    NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception in Populating the database for the user..."), e);

                }

		*/

        String mode;
        UserConfigAPI userConfigAPI = (UserConfigAPI)NmsUtil.getAPI("UserConfigAPI");
        String realms = null;
     	if(userConfigAPI != null)
		{
			Vector realm = userConfigAPI.getAllGroupNames(userName);
			if(realm != null)
			{
				realms = getRealmString(realm.toString().trim());
			}
		}
		readClientParameters(userName);
// For htmlui alone we also provide INIT_NODE to be given as a request parameter (nodeToOpen). 
// If given this parameter will override the value of INIT_NODE which is given in clientparameters.conf.
        nodesToOpen = request.getParameter("nodeToOpen")==null?nodesToOpen : request.getParameter("nodeToOpen");
        if(session.getAttribute("increments") == null) {
            session.setAttribute("increments",GenericUtility.populateIncrementsVector(userName));
        }
        NmsUtil.current_keys.addElement(request.getRemoteAddr());

        String commonFilterAction = NmsUtil.getParameter("COMMON_NOTIFICATION");
        if(commonFilterAction != null && commonFilterAction.trim().equalsIgnoreCase("false"))
        {
            commonFilterAction = "false";
        }
        else
        {
            commonFilterAction = "true";
        }
        String passwordLength = NmsUtil.getParameter("PASSWD_MAX_LENGTH");
              if(passwordLength == null || passwordLength.trim().equals(""))
              {
	            passwordLength ="8" ;
              }
        String isDeviceView = NmsUtil.getParameter("DEVICE_VIEW");
              if(isDeviceView != null && isDeviceView.trim().equals("true"))
              {
	            isDeviceView ="true" ;
              }

      out.write("\n<HTML><HEAD>\n<meta http-equiv=\"Content-Type\" content=\"");
      out.print(contentType);
      out.write("\">\n<TITLE>");
      out.print(NmsUtil.GetString("AdventNet")+" " + NmsUtil.GetString("WebNMS Version x.x") );
      out.write("</TITLE></HEAD>\n");

		String jsessionid = request.getRequestedSessionId();
		if(jsessionid != null && request.getParameter("requestfrom") == null && request.getParameter("login") == null && ( ht.containsKey("htmlui") ||ht.containsKey("fromAppClient") )) 
{
	Cookie cook=new Cookie("JSESSIONID",jsessionid);
	cook.setPath("/");
	response.addCookie(cook);
}
if(ht.containsKey("javaui")) 
{
	if(ht.containsKey("showapplet")) {
		
      out.write("\n\t\t\t<!-- Added by Ramar for issue 1535012 -->\n\t\t\t<!-- codebase=\"http://java.sun.com/products/plugin/1.2/jinstall-12-win32.cab#Version=1,1,0,0\">-->\n\t\t\t<OBJECT classid=\"clsid:8AD9C840-044E-11D1-B3E9-00805F499D93\"\n\t\t\tWIDTH=\"1\" HEIGHT=\"1\" ALIGN=\"baseline\"\n\t\t\tcodebase=\"http://java.sun.com/products/plugin/1.3.1/jinstall-131-win32.cab#Version=1,3,1,0\">\n\n\t\t\t<!-- for applet caching -->\n\t\t\t");

			if( nmsArcJar != null )
			{
				
      out.write("\n                        <!-- Commented by Balan on 21/03/03 for Issue Reported by Hettaras NetWork Both Archive and \n\t\t\t\t     NMSArchive is loaded in ARHIVE Tag\n\t\t\t\t\t<PARAM NAME=\"cache_archive\" VALUE= \"");
      out.print( nmsArcJar );
      out.write("\" >\n                         -->\n\t\t\t\t\t<PARAM NAME=\"cache_option\" VALUE=\"Plugin\">\n\t\t\t\t\t");

			}
		
      out.write("\n\n\t\t\t<PARAM NAME=\"jsessionid\" VALUE=\"");
      out.print( session.getId() );
      out.write("\">\n\t\t\t<PARAM NAME=\"code\" VALUE=\"com.adventnet.nms.startclient.NmsMainApplet.class\">\n\t\t\t<PARAM NAME=\"type\" VALUE=\"application/x-java-applet;version=1.2\">\n\t\t\t<PARAM name=MAP_FILE value=ipnet.netmap>\n\t\t\t<PARAM name=SHOW_BUTTONS value=false>\n\t\t\t<PARAM name=PASSWORD_KEY value=\"");
      out.print(userName);
      out.write("\">\n\t\t\t<PARAM name=HANDLE value=\"");
      out.print(userName);
      out.write("\">\n\t\t\t<PARAM name=USE_MAS value=true>\n\t\t\t<PARAM name=USER_NAME value=\"");
      out.print(userName);
      out.write("\">\n\t\t\t<PARAM name=LANGUAGE value=\"");
      out.print((String)ht.get("Language"));
      out.write("\">\n\t\t\t<PARAM name=COUNTRY value=\"");
      out.print((String)ht.get("Country"));
      out.write("\">  \n\t\t\t<PARAM name=NMS_FE_SECONDARY_PORT value=\"");
      out.print( PureServerUtilsFE.nms_fe_secondary_port);
      out.write("\">\n\t\t\t<PARAM name=NMS_FE_SECONDARY_PORT_DIR value=\"");
      out.print( PureServerUtilsFE.nms_fe_secondary_port_dir);
      out.write("\">\n            <PARAM name=COMMON_NOTIFICATION value=\"");
      out.print(commonFilterAction);
      out.write("\">\n\t\t\t<PARAM name=PASSWD_MAX_LENGTH value=\"");
      out.print(passwordLength);
      out.write("\">\n\t\t\t<PARAM name=DEVICE_VIEW value=\"");
      out.print(isDeviceView);
      out.write('"');
      out.write('>');
      out.write('\n');

        if(paramList.get("EXPOSE_PASSWORD") != null)
        {
                String val = paramList.get("EXPOSE_PASSWORD").toString();
                if("true".equals(val))
                {
					String temp = "RtoPUX";
                    String temp_password = (String)session.getAttribute("password");
					String encryptpass = AuthUtil.encryptString(temp_password,temp);
					userPassword = URLEncoder.encode(encryptpass);

      out.write("\n                    <PARAM name=PASSWORD value=\"");
      out.print( userPassword);
      out.write('"');
      out.write('>');
      out.write('\n');
              }
        } 

      out.write("\n\n\n\t\t\t\n\t\t\t");

			if(!isSAServerRunning())
			{
				
      out.write("\n\t\t\t\t\t<PARAM name=\"TRANSPORT_PROVIDER\" value=\"com.adventnet.nms.client.sas.SASClientTransporter\" >\n\t\t\t\t\t");

			}
		
      out.write("\n\t\t\t");

			if(realms != null) {
				
      out.write("\n\t\t\t\t\t<PARAM name=REALMS value=\"");
      out.print( realms );
      out.write("\" >\n\t\t\t\t\t");

			}

		// To pass the BE_HOST_NAME to the client!!. Actually such a thing is not required at the
		// Client side b'cos anyway the Clients' cannot contact the BE at all (Applet Security 
		// restrictions). But this is being sent JFI on the Client side.
		String be_hostName = PureServerUtilsFE.be_host;
		if(be_hostName.equals("localhost"))
		{
			try
			{
				be_hostName = java.net.InetAddress.getLocalHost().getHostName();
			}
			catch(Exception e)
			{
			}
		}
              //Added by Balan on 18/03/03 to get IPAddress of BE
             String be_address = PureServerUtilsFE.be_host;
                if(be_address.equals("localhost"))
                {
                      try
                      {
                           be_address = java.net.InetAddress.getLocalHost().getHostAddress();
                      }
                      catch(Exception e)
                      {
                      }
                }
                else
                {
                     be_address = java.net.InetAddress.getByName(be_address).getHostAddress();
                }
              //Add Ends
		
      out.write("\n\t\t\t<PARAM name=BE_HOST_NAME value=\"");
      out.print(be_hostName);
      out.write("\">\n                  <PARAM name=BE_HOST_ADDRESS value=\"");
      out.print(be_address);
      out.write("\">\n\t\t\t");

			int regPort = NmsUtil.getRegistryPort();
		//Need to do this b'cos the NmsUtil.getRegistryPort() returns -1 incase of RMI_REGISTRY_PORT not specified in the ServerParameters.conf !!
		if(regPort == -1)
		{
			regPort = 1099;
		}
		
      out.write("\n\t\t\t<PARAM name=RMI_REG_PORT value=\"");
      out.print(regPort);
      out.write("\">\n\n\t\t\t");

			Calendar cal = Calendar.getInstance();
		cal.set(1998,0,1,0,0,0);
		Date d = cal.getTime();
		String s=String.valueOf(TimeZone.getDefault().getRawOffset());
		
      out.write("\n\t\t\t<PARAM name=jan1_98 value=\"");
      out.print( d.getTime() );
      out.write("\">\n\t\t\t<PARAM name=TIME_ZONE value=\"");
      out.print( s );
      out.write("\">\n\t\t\t<PARAM name=CHECK value=\"");
      out.print( request.getHeader("Authorization") );
      out.write("\">\n\t\t\t<PARAM name=osname value=\"");
      out.print( System.getProperty("os.name") );
      out.write("\">\n\t\t\t");

			for(Enumeration e = paramList.keys();e.hasMoreElements();) {
				String key = (String)e.nextElement();
				
      out.write("\n\t\t\t\t\t<PARAM name=\"");
      out.print(key);
      out.write("\" value='");
      out.print((String)paramList.get(key));
      out.write("'>\n\t\t\t\t\t");

			}
		
      out.write("\n\t\t\t<COMMENT>\n\t\t\t<EMBED type=\"application/x-java-applet\"\n\t\t\twidth=\"1\" height=\"1\"\n\t\t\tcode=\"com.adventnet.nms.startclient.NmsMainApplet.class\"\n\t\t\tpluginspage=\"http://java.sun.com/products/plugin/1.3.1/\"\n\t\t\tMAP_FILE=\"ipnet.netmap\"\n\t\t\tSHOW_BUTTONS=\"false\"\n\t\t\tPASSWORD_KEY='");
      out.print(userName );
      out.write("'\n\t\t\tHANDLE='");
      out.print( userName );
      out.write("'\n\t\t\tUSE_MAS=true\n\t\t\tUSER_NAME='");
      out.print(userName);
      out.write("'\n\t\t\tjan1_98='");
      out.print( d.getTime() );
      out.write("'\n\t\t\tLANGUAGE='");
      out.print(ht.get("Language"));
      out.write("'\n\t\t\tCOUNTRY='");
      out.print(ht.get("Country"));
      out.write("'\n\t\t\tNMS_FE_SECONDARY_PORT='");
      out.print( PureServerUtilsFE.nms_fe_secondary_port);
      out.write("'\n\t\t\tNMS_FE_SECONDARY_PORT_DIR='");
      out.print( PureServerUtilsFE.nms_fe_secondary_port_dir);
      out.write("'\n\t\t\tPASSWORD='");
      out.print( userPassword);
      out.write("'\n\t\t\t\n\t\t\t");

			if(!isSAServerRunning())
			{
				
      out.write("\n\t\t\t\t\tTRANSPORT_PROVIDER=\"com.adventnet.nms.client.sas.SASClientTransporter\"\n\t\t\t\t\t");

			}
		
      out.write("\n\n\n\t\t\tBE_HOST_NAME='");
      out.print(be_hostName );
      out.write("'\n                  BE_HOST_ADDRESS='");
      out.print(be_address );
      out.write("'  \n\t\t\tRMI_REG_PORT='");
      out.print(regPort);
      out.write("'\n\t\t\tPASSWD_MAX_LENGTH='");
      out.print(passwordLength);
      out.write("'\n\t\t\tDEVICE_VIEW='");
      out.print(isDeviceView);
      out.write("'\n\t\t\t\n\t\t\tTIME_ZONE='");
      out.print( s );
      out.write("'\n\t\t\tCHECK='");
      out.print(request.getHeader("Authorization") );
      out.write("'\n\t\t\tosname='");
      out.print( System.getProperty("os.name") );
      out.write("'\n\t\t\t");

			if(realms != null) {
				
      out.write("\n\t\t\t\t\tREALMS='");
      out.print( realms );
      out.write("'\n\t\t\t\t\t");

			}
		for(Enumeration e = paramList.keys();e.hasMoreElements();) {
			String key = (String)e.nextElement();
			
      out.write("\n\t\t\t\t");
      out.print( key.replace('"',' ') );
      out.write('=');
      out.write('\'');
      out.print( paramList.get(key) );
      out.write("'\n\t\t\t\t");

		}
		
      out.write("\n\t\t\tjsessionid='");
      out.print( session.getId() );
      out.write("'\n\t\t\t>\n\n\t\t\t<!-- for applet caching -->\n\t\t\t");

			if( nmsArcJar != null )
			{
				
      out.write("\n                            <!-- Commented by Balan on 21/03/03 for Issue Reported by Hettaras NetWork Both Archive and \n\t\t\t\t     NMSArchive is loaded in ARHIVE Tag\n\t\t\t\t\t <PARAM NAME=\"cache_archive\" VALUE= \"");
      out.print( nmsArcJar );
      out.write("\" >\n                              --> \n\t\t\t\t\t<PARAM NAME=\"cache_option\" VALUE=\"Plugin\">\n\t\t\t\t\t");

			}
		
      out.write("\n\n\n\n\t\t\t</EMBED>\n\t\t\t</COMMENT>\n\t\t\t</OBJECT>\n\t\t\t</BODY>\n\t\t\t");

	} else {
		/*
		   To avoid problems caused by netscape due to spaces 
		   in the Strings passed  
		 */
		String tempCountry=(String)session.getAttribute("Country");
		tempCountry=GenericUtility.replace(tempCountry," ","+");
		tempCountry=GenericUtility.replace(tempCountry,"(","%28");
		tempCountry=GenericUtility.replace(tempCountry,")","%29");

		String tempLang=(String)session.getAttribute("Language");
		tempLang=GenericUtility.replace(tempLang," ","+");
		tempLang=GenericUtility.replace(tempLang,"(","%28");
		tempLang=GenericUtility.replace(tempLang,")","%29");
		
      out.write("\t\t\n\t\t\t<FRAMESET ROWS=\"100%,*\" BORDER=\"0\" FRAMEBORDER=\"NO\">\n\t\t\t<FRAME NAME=\"Main Page\" FRAMEBORDER=\"NO\" MARGINHEIGHT=\"0\" MARGINWIDTH=\"0\" SRC=\"../html/splash.html\">\n\t\t\t<FRAME NAME=\"contents\" FRAMEBORDER=\"NO\" MARGINHEIGHT=\"0\" MARGINWIDTH=\"0\" SRC=\"index.jsp?javaui=&showapplet=&Country=");
      out.print(tempCountry);
      out.write("&Language=");
      out.print(tempLang);
      out.write("\" SCROLLING=\"NO\" NORESIZE >\n\t\t\t</FRAMESET>\n\t\t\t");

	}
}

        out.flush();

      out.write('\n');
      out.write('\n');
      out.write('\n');
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
