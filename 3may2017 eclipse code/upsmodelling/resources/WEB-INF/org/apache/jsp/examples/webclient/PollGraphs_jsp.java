package org.apache.jsp.examples.webclient;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.awt.*;
import java.awt.image.*;
import java.text.*;
import com.adventnet.nms.poll.*;
import com.adventnet.nms.util.NmsUtil;
import com.adventnet.nms.util.PureUtils;
import com.adventnet.nms.util.GenericUtility;
import com.adventnet.nms.util.NmsLogMgr;
import com.adventnet.nms.jsp.GetImages;

public final class PollGraphs_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


	static String HELP_URL_KEY="HTMLUI_ViewGraph_BarTableLine";


    public static String queryString="";
    Vector toolbar;


    public int[] findRange(long lx[],String interval,String datedir)
    {
        
        int p=0;int q=0;
        
        if(!interval.equalsIgnoreCase("All"))//if not 'all' then parse and get interval.
        {
            p=Integer.parseInt(interval.substring(0,interval.indexOf('-')));
            q=Integer.parseInt(interval.substring(interval.indexOf('-')+1,interval.length()));
        }
        Date d1 = null;
        if(!(datedir.equals("current")))
        {
			StringTokenizer st = new StringTokenizer(datedir,"-");
			String mm = st.nextToken();
			String dd = st.nextToken();
			String yyyy = st.nextToken();
			String date = yyyy + "-" + mm + "-" + dd;
			d1 = java.sql.Date.valueOf(date);
		}
		else
		{
			d1=new Date();       
		}	
        Calendar c1=Calendar.getInstance();
        Calendar c2=Calendar.getInstance();
        c1.setTime(d1);
        c2.setTime(d1);
        c1.set(c1.HOUR_OF_DAY,p);
        c1.set(c1.MINUTE,0);
        c1.set(c1.SECOND,0);
        if(q!=0)
        {
            c2.set(c2.HOUR_OF_DAY,q);
            c2.set(c2.MINUTE,0);
            c2.set(c2.SECOND,0);
        }
        else
        {
            c2.set(c2.HOUR_OF_DAY,23);
            c2.set(c2.MINUTE,59);
            c2.set(c2.SECOND,55);
        }
        Date d2=c1.getTime();
        Date d3=c2.getTime();        
        long l1=d2.getTime();
        long l2=d3.getTime();
        int i,j;
        int a[]=new int[2];
        if(lx[lx.length-1]<l1)//incase the lx value is less then the intervel p.
        {
            a[0]=1;
            a[1]=0;
        }
        else
        {
            for(i=0;i<=lx.length&&lx[i]<l1;i++);
            for(j=i;j<lx.length-1&&lx[j]<=l2;j++);
            a[0]=i;
            if(j==lx.length-1)
                a[1]=j;
            else
                a[1]=j-1;            
        }
        return a;
        
    }




     String[] convertToTime(long lxa[],Hashtable ht)
    {
		
        //convert x to date.
        String dateString[]= new String[lxa.length];
        for (int count =0;count <lxa.length;count++)
        {
            Date d = new Date(lxa[count]);
            Calendar cal = Calendar.getInstance();
            cal.setTime(d);
            DateFormat formatter =DateFormat.getTimeInstance();

            dateString[count]=formatter.format(d);
            
        } //converted to time.
        
        //to send only the x values  which need to be exhibted if it is graph.
        if(ht.get("table")==null)
        {
            int noOfExhibit=7;
            if(lxa.length != 0 && lxa.length> noOfExhibit)
            {
                int plotPoint=lxa.length/(noOfExhibit-1);
                for(int i=2,count =1;i<lxa.length ;i++)
                {
                    if(plotPoint!=0 )
                    {
                        if(i != (plotPoint*count))
                            dateString[i] =" ";
                        else
                            count++;
                    }
                    
                }
            }
        }
        //to remove the seconds.
        for(int i=0;i<lxa.length;i++)
        {
            if(dateString[i].lastIndexOf(":")!= -1)
            {
                dateString[i]=dateString[i].substring(0,dateString[i].lastIndexOf(":"))+dateString[i].substring(dateString[i].lastIndexOf(":")+3,dateString[i].length());
            }
        }
        return dateString;
    }      
    
    //returns true if x value available




    boolean checkDataAvailable(String[] datePlotPoints)
    {
        if(!(datePlotPoints==null || datePlotPoints.equals("")||datePlotPoints.length<1))
            return true;
        else
            return false;
    }




    class Filt implements FilenameFilter
    {
        public boolean accept(File f,String s)
        {
            //String temp=s.substring(s.length()-3);
            if(s.endsWith("png"))
                return true;
            else
                return false;
        }
    }    




    public void setDefaultButtons()
    {
        toolbar = new Vector();
        Properties plotLineProps = new Properties();
        plotLineProps.setProperty("name","PlotLine");
        plotLineProps.setProperty("image","../images/tblinegraph.png");
        plotLineProps.setProperty("action_link","javascript:setType('PlotLine')");
        plotLineProps.setProperty("mouseoverimage","../images/tblinegraph1.png");
        plotLineProps.setProperty("tooltip",NmsUtil.GetString("PlotLine"));
        toolbar.addElement(plotLineProps);

        Properties plotTableProps = new Properties();
        plotTableProps.setProperty("name","PlotTable");
        plotTableProps.setProperty("image","../images/tbtabledata.png");
        plotTableProps.setProperty("action_link","javascript:setType('PlotTable')");
        plotTableProps.setProperty("mouseoverimage","../images/tbtabledata1.png");
        plotTableProps.setProperty("tooltip",NmsUtil.GetString("PlotTable"));
        toolbar.addElement(plotTableProps);

        Properties plotBarProps = new Properties();
        plotBarProps.setProperty("name","PlotBar");
        plotBarProps.setProperty("image","../images/tbbargraph.png");
        plotBarProps.setProperty("action_link","javascript:setType('PlotBar')");
        plotBarProps.setProperty("mouseoverimage","../images/tbbargraph1.png");
        plotBarProps.setProperty("tooltip",NmsUtil.GetString("PlotBar"));
        toolbar.addElement(plotBarProps);
    }

    public void displayMessage(JspWriter out, String msg)throws IOException
    {
        out.println("<br><center><b>"+ msg + "</b></center><br>");
    }

    public void addBackButton(JspWriter out)throws IOException
    {
        out.println("<center><A HREF='javascript:history.back()' OnMouseOut='window.status=\"\";return true' OnMouseOver=\"window.status='" + NmsUtil.GetString("Go Back to Previous") + "';return true\"><IMG SRC='../images/back.png' ALT='" + NmsUtil.GetString("Back") + "' BORDER='0'></A></center>");
    }

    public void addDummySetTypeFunction(JspWriter out, String msg)throws IOException
    {
        out.println("<script>function setType(actionVal){ alert('Cannot '+actionVal+'. "+ msg +"');}</script>");
    }

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

      out.write("\n<HTML>\n<HEAD>\n\n<TITLE>");
      out.print( NmsUtil.GetString("Poll Graphs") );
      out.write("</TITLE>\n<LINK REL=STYLESHEET TYPE=\"text/css\" HREF=\"../template/nmshtmlui.css\">\n<SCRIPT>\nfunction f1(url)\n{\n\tnewwindow = window.open (url,\"graphs\",\"titlebar=1,menubar=1,status=1,toolbar=1,dependent,scrollbars=1\");\n\tnewwindow.focus();\n}\n</SCRIPT>\n</HEAD>\n");
      out.write('\n');

	request.setAttribute("HELP_URL_KEY",HELP_URL_KEY);

      out.write("\n<BODY>\n\n\n\n\n\n\n\n\n\n\n\n");
      out.write('\n');

    if(toolbar==null)
    {
        setDefaultButtons();
    }
    request.setAttribute("toolbarVector",toolbar);

      out.write('\n');
      java.util.Hashtable table = null;
      synchronized (request) {
        table = (java.util.Hashtable) _jspx_page_context.getAttribute("table", PageContext.REQUEST_SCOPE);
        if (table == null){
          table = new java.util.Hashtable();
          _jspx_page_context.setAttribute("table", table, PageContext.REQUEST_SCOPE);
        }
      }
      out.write('\n');
 table.put("menuFileName","pollmenu"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/jsp/NmsMenu.jsp", out, true);
      out.write("\n<img src=\"../images/space.png\" height=21>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/jsp/Toolbar.jsp", out, true);
      out.write('\n');

        //the var to contain the x & y co -ordinates.
        double x[]=null;
        double y[]=null;
        long lx[]=null;
        long ly[]=null;
        
        //for the png drawing.
        String[] datePlotPoints=null;
        String title="";
        String st="";
        boolean dataAvailable=true;
		com.adventnet.nms.jsp.GetImages gi = null;        
        //get the parameters.
        Hashtable ht = new Hashtable();
        //////////////////////////////////////////ADDED BELOW
        if(request.getQueryString()!=null)
			queryString =request.getQueryString();
        for(Enumeration parameterNames = request.getParameterNames();
            parameterNames.hasMoreElements();)
        {
            String param = (String)parameterNames.nextElement();
            String value = (String)request.getParameter(param);
            if (param == null) param = "-";
            ht.put(param,value);
        }
        //writer to write back
        // PrintWriter p = response.getWriter(); 
        //check if multiple graph requested. We don't give multiple graph.
        String multiple = (String) ht.get("MULTIPLE");
        
        if (multiple == null) multiple ="no";
        //get the pollkey.
        String key2 = null, key3 =  (String) ht.get("TITLE");
        int numeric = 1;
        String pollkey = "";
        try
        {
            String key = (String) ht.get("name");
            if (key == null)
            {
                displayMessage(out, NmsUtil.GetString("Key for PolledData not available in request"));
                addDummySetTypeFunction(out, NmsUtil.GetString("Key for PolledData not available in request"));
                addBackButton(out);
                return;
            }
            pollkey = key;
            key2 = GenericUtility.replace(key, "__tab__", "\t");
            if (key3 == null) key3 = GenericUtility.replace(key, "__tab__", " ");
            title=key3;
            PollAPI obj = GenericUtility.getPollAPI();
            PolledData pd = obj.getPolledData(key2);
	    	MultiplePolledData mpd = null;
            if (pd == null)
            {
                displayMessage(out, NmsUtil.GetString("Error getting PolledData: ")+key2);
                addDummySetTypeFunction(out, NmsUtil.GetString("Error getting PolledData: ")+key2);
                addBackButton(out);
                return;
            }
            //get the date. presently it is for current only.
            String datedir = (String) ht.get("DATE");
            Date de = null;
            if(datedir == null) datedir = "current";
            if(datedir.equals("current")) 
	        de = new Date();
			else 
			{
				StringTokenizer str = new StringTokenizer(datedir,"-");
				String mm = str.nextToken();
				String dd = str.nextToken();
				String yyyy = str.nextToken();
				String date = yyyy + "-" + mm + "-" + dd;
				de = java.sql.Date.valueOf(date);
			}
            //get the vector -  values, for x and y co-or
            CollectedData values = null;
	    	Vector instances = null;
            try
			{
				if (pd.getIsMultiplePolledData()) 
				{
					try
					{
						mpd = (MultiplePolledData) pd;
					}
					catch(Exception exc)
					{
						mpd = new MultiplePolledData();
						mpd.setProperties(pd.getProperties());
						mpd.setId(pd.getId());
					}
					multiple = "yes";
					instances = obj.getInstances(mpd); 
					if((instances != null) && (instances.size() != 0))
						values = obj.getCollectedData((String)instances.elementAt(0),key2,de);
				}
				else
				{
					values = obj.getCollectedData(key2,de);
					
				}
				if (values == null) 
				{
					
      out.write('\n');

displayMessage(out, NmsUtil.GetString("Apparently No Data collected for ") + pollkey );
addDummySetTypeFunction(out, NmsUtil.GetString("Apparently No Data collected for ") + pollkey);
addBackButton(out);
return;
						}
					numeric = pd.getNumericType();
					
					if(numeric == 1)
						{
							
							//get the x values
							//long[]temp1=(long[])values.elementAt(0);
							
							//get the y values.
							//long[]temp2=(long[])values.elementAt(1);
							
							
							Long[] temp1=(Long[])values.getTimes();
							
							x=new double[temp1.length];
							lx=new long[temp1.length];
							for(int i=0;i<temp1.length;i++)
								{
									lx[i]=temp1[i].longValue();
									Long z=temp1[i];
									x[i]=z.doubleValue();
								}
							Long[] temp2=(Long[])values.getValues();
							y=new double[temp2.length];
							ly=new long[temp2.length];
							for(int i=0;i<temp2.length;i++)
								{
									ly[i]=temp2[i].longValue();
									Long z=temp2[i];
									y[i]=z.doubleValue();
								}
							
						}
					else
						{
							displayMessage(out, NmsUtil.GetString("Cannot plot graphs for non numeric type"));
							addDummySetTypeFunction(out, NmsUtil.GetString("Cannot plot for non numeric type"));
							addBackButton(out);
							return;
						}
					
					
				}
            catch (Exception ee )
				{
					NmsLogMgr.MISCERR.fail( NmsUtil.GetString("Exception in PollGraphs ") + ee.getMessage(),ee);            
					displayMessage(out, NmsUtil.GetString("Exception has occured in PollGraphs. Please refer logs for more details."));
					addDummySetTypeFunction(out, NmsUtil.GetString("Exception has occured in PollGraphs. Please refer logs for more details."));
					addBackButton(out);
					return;
				}
            
			{          
				
	    		Image img = null ;
                //to store the values  for the particular interval
                long lxa[];
                long lya[];
                double xa[];
                double ya[];
                //get the plot type Bargraph or line graph.
                String plotType = (String)ht.get("PlotType");
                //get the time interval for which we have to plot.
                String interval;
				String instance;
				
				if((ht.get("instance")) != null)
				{
		    		instance = (String)(ht.get("instance"));
		    		//int index = Integer.parseInt(instance);
		    		values = obj.getCollectedData(instance,key2,de);
                    Long[] temp1=(Long[])values.getTimes();
                    
                    x=new double[temp1.length];
                    lx=new long[temp1.length];
                    for(int i=0;i<temp1.length;i++)
                    {
                        lx[i]=temp1[i].longValue();
                        Long z=temp1[i];
                        x[i]=z.doubleValue();
                    }
                    Long[]temp2=(Long[])values.getValues();
                    y=new double[temp2.length];
                    ly=new long[temp2.length];
                    for(int i=0;i<temp2.length;i++)
                    {
                        ly[i]=temp2[i].longValue();
                        Long z=temp2[i];
                        y[i]=z.doubleValue();
                    }
                    
				}
                if((ht.get("interval")) != null)
                {
                    interval = (String)(ht.get("interval"));
                    
                }
                else
                {
                    interval = "all";
                }
                int a[] =findRange(lx,interval,datedir);
                xa=new double[a[1]-a[0]+1];
                lxa=new long[a[1]-a[0]+1];
                ya=new double[a[1]-a[0]+1];
                lya=new long[a[1]-a[0]+1];
                System.arraycopy(x,a[0],xa,0,a[1]-a[0]+1);
                System.arraycopy(lx,a[0],lxa,0,a[1]-a[0]+1);
                System.arraycopy(y,a[0],ya,0,a[1]-a[0]+1);
                System.arraycopy(ly,a[0],lya,0,a[1]-a[0]+1);
                //values of the interval alone picked up.
                //the values to be plotted got. The stage is set.
                
                // to convert the x values to appropriate time
                datePlotPoints= convertToTime(lxa,ht);
                dataAvailable=checkDataAvailable(datePlotPoints);
                
                //to give the table if clicked instead of the graphs.
                if(!plotType.equals("PlotTable"))
                {
			try
			{
				gi = new com.adventnet.nms.jsp.GetImages();
			}catch(Exception e)
			{
				out.println("<p> enter PollGraphs servlet  "+e);
			}
            //now using the builder graphs we can draw the graphs.
            if(dataAvailable)
            {
            if(plotType.equals("PlotLine"))// to display the Line graph
            {
                //to avoid ambiguity btn NMS and builder classes. We import the LineGraph here itself.
                try
	            {
					img = gi.getLineGraphImage(dataAvailable,lxa,lya,title);
                            
		        }

                catch(Exception e)
                {
                    NmsLogMgr.MISCERR.fail( NmsUtil.GetString("Exception in PollGraphs ") + e.getMessage(),e);            
                    displayMessage(out, NmsUtil.GetString("Exception has occurred in PollGraphs while drawing linegraph. Please refer logs for more details."));
                    addDummySetTypeFunction(out, NmsUtil.GetString("Exception has occurred in PollGraphs while drawing linegraph. Please refer logs for more details."));
                    addBackButton(out);
                    return;
                }
                        
			}
            else if (plotType.equals("PlotBar"))
            {
                try 
                {
					img = gi.getBarGraphImage(dataAvailable,lxa,lya,title);
                }

                catch(Exception ex)

                {
                    NmsLogMgr.MISCERR.fail( NmsUtil.GetString("Exception in PollGraphs ") + ex.getMessage(),ex);            
                    displayMessage(out, NmsUtil.GetString("Exception has occured in PollGraphs while drawing BarGraph. Please refer logs for more details."));
                    addDummySetTypeFunction(out, NmsUtil.GetString("Exception has occured in PollGraphs while drawing BarGraph. Please refer logs for more details."));
                    addBackButton(out);
                    return;
                }

            }
            }
            else
            {
                displayMessage(out, NmsUtil.GetString("No Data Available for this interval"));
                addDummySetTypeFunction(out, NmsUtil.GetString("No Data Available for this interval"));
                addBackButton(out);
                return;
            }
                    //get the file name . the file name is the time in long when it was generated.
                    Date dat=new Date();
                    String username = (String)session.getAttribute("userName");
                    
                    StringBuffer buf = new StringBuffer();
                    buf.append(PureUtils.rootDir+"users/");
                    buf.append(username);
                    buf.append("/");            
                    buf.append(String.valueOf(dat.getTime()));
                    buf.append(".png");
                    st=buf.toString();//st : file name.
                    //remove previous png graph file.
                    Filt filtobj=new Filt();
                    File f=new File(PureUtils.rootDir+"users/"+username);
                    File filarr[]=f.listFiles(filtobj);
                    for(int i=0;i<filarr.length;i++)
                    {
                       filarr[i].delete();
                    }    
                    try
                    {//convert the image got to jpeg format.
                        if(dataAvailable)
                        {
							gi.encodeImage(st,img);
                        }
                    }

                    catch(Exception e)
                    {
                        NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Exception in PollGraphs ") + e.getMessage(),e);            
                        displayMessage(out, NmsUtil.GetString("Exception has occurred in PollGraphs. Please refer logs for more details."));
                        addDummySetTypeFunction(out, NmsUtil.GetString("Exception has occurred in PollGraphs. Please refer logs for more details."));
                        addBackButton(out);
                        return;
                     }                            
                }
                out.println("<FORM ACTION=\"../jsp/PollGraphs.jsp\" METHOD=\"GET\">");
                out.println("<TABLE WIDTH=\"100%\" COLS=\"2\">");
                out.println("<TR><TD>");
                out.println(NmsUtil.GetString("Select absolute time interval "));
                out.println("<SELECT NAME=\"interval\">");
                int firstval;
                if(!interval.equalsIgnoreCase("All"))//if not 'all' then parse and get interval.
                {
					firstval=Integer.parseInt(interval.substring(0,interval.indexOf('-')));
					if ( firstval == 0)
						out.println("<OPTION SELECTED>0-4</OPTION>");
					else
						out.println("<OPTION>0-4</OPTION>");
					if ( firstval == 4)
						out.println("<OPTION SELECTED>4-8</OPTION>");
					else
						out.println("<OPTION>4-8</OPTION>");
					if ( firstval == 8)
						out.println("<OPTION SELECTED>8-12</OPTION>");
					else
						out.println("<OPTION>8-12</OPTION>");
					if ( firstval == 12)
						out.println("<OPTION SELECTED>12-16</OPTION>");
					else
						out.println("<OPTION>12-16</OPTION>");
					if ( firstval == 16)
						out.println("<OPTION SELECTED>16-20</OPTION>");
					else
						out.println("<OPTION>16-20</OPTION>");
					if ( firstval == 20)
						out.println("<OPTION SELECTED>20-0</OPTION>");
					else
						out.println("<OPTION>20-0</OPTION>");
					out.println("<OPTION>all</OPTION>");
				}
				else
				{
					out.println("<OPTION>0-4</OPTION>");
					out.println("<OPTION>4-8</OPTION>");
					out.println("<OPTION>8-12</OPTION>");
					out.println("<OPTION>12-16</OPTION>");
					out.println("<OPTION>16-20</OPTION>");
					out.println("<OPTION>20-0</OPTION>");
					out.println("<OPTION SELECTED>all</OPTION>");
				}
                out.println("</SELECT>");
                out.println(NmsUtil.GetString(" (Hours)"));
                out.println("\t");  
		if(pd.getIsMultiplePolledData())
		{
		    	String selectedInstance = (String)(ht.get("instance"));
				out.println(NmsUtil.GetString("Select the instance "));
                out.println("<SELECT NAME=\"instance\">");
                for(int len=0;len<instances.size();len++) 
                {
                    String ss = instances.elementAt(len).toString();
                    if(ss.equals(selectedInstance))
                    {
						out.println("<OPTION SELECTED>"+ ss +"</OPTION>");
                    }
                    else
                    {
						out.println("<OPTION>"+ss+"</OPTION>");
                    }
                }
 				out.println("</SELECT>"); 
		}

      out.write("\n<script>\n     function setType(actionVal)\n     { \n         document.forms[0].PlotType.value=actionVal;\n         document.forms[0].submit();\n     }\n</script>\n<input type=hidden name=\"PlotType\" value=\"PlotLine\">\n");

                if(plotType.equals("PlotTable"))
                {
                    out.println("<br><br><br>");
                    out.println("<CENTER><TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\">");

                    out.println("<TR><TD><FONT ID=\"cap\"><CENTER>"+ title + "</CENTER></FONT></TD></TR>");
                    Object mfArguments[] = {interval};
                    String tabMC = MessageFormat.format(NmsUtil.GetString("Interval : {0} hrs."),mfArguments);
                    out.println("<TR><TD><CENTER><H3>"+ tabMC +"</H3></CENTER></TD></TR>");

                    out.println("<TR><TD><CENTER>");
                    if(dataAvailable)
                    {
                        out.println("<TABLE BORDER=\"2\" CELLPADDING=\"0\" CELLSPACING=\"0\">");	
                        out.println("<TR ID=\"high\"><TH>" + NmsUtil.GetString("Time in hours.") + "</TH><TH>" + NmsUtil.GetString("Value in long.") + "</TH></TR>");
                        for(int i=0;i<lxa.length;i++)
                        {
                            out.println("<TR><TD>"+datePlotPoints[i]+"</TD><TD>"+lya[i]+"</TD></TR>");
                        }
                        out.println("</TABLE>");
                        
                    }

                    else
                    {
                        out.println("<H3>" + NmsUtil.GetString("No data Available") + "</H3><BR>");
                    }
                    out.println("</CENTER></TD></TR></TABLE>");
                }
                else
                {
                    if(dataAvailable)
                    {
						if(st.indexOf(PureUtils.rootDir) != -1){
							st=st.substring(PureUtils.rootDir.length());
						}
                        
                        out.println("<IMG SRC=\""+"../"+st+" \" BORDER=\"0\" ALT=\""+NmsUtil.GetString("Graph")+"\">");
                   }
                    else
                    {   
                        out.println("<H3><CENTER>" + NmsUtil.GetString("No data Available for the time interval ") + interval+"<BR>for <FONT ID=\"cap\"><CENTER>"+title+"</CENTER></FONT></CENTER></H3>");
                        
                    }
                }
        out.println("</TD>");
        out.println("</TR></TABLE>");
        ht.remove("interval");
        ht.remove("Plot");
        ht.remove("PlotType");//added by RRajkumar(3/july/2k)
        ht.remove("table");
        for(Enumeration en = ht.keys();en.hasMoreElements();)
        {
            String key1 = (String)en.nextElement();
            out.println("<INPUT TYPE=\"HIDDEN\" NAME=\"" + key1 + "\" VALUE=\"" + (String)ht.get(key1) + "\">");
        }
        out.println("</FORM>");
              
        out.println("</BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
	    }
             
        }
        
        catch (Exception e) 
        {
           NmsLogMgr.MISCERR.fail(NmsUtil.GetString("Remote exception: ") + e.getMessage(),e);            
           displayMessage(out, NmsUtil.GetString("Error in PollGraphs : ") + e.getMessage());
            addDummySetTypeFunction(out, NmsUtil.GetString("Error in PollGraphs : ") + e.getMessage());
            addBackButton(out);
            return;
        }

      out.write(' ');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write("\n\n<center>\n<A HREF=\"javascript:history.back()\" OnMouseOut=\"window.status=''; return true\" OnMouseOver=\"window.status='");
      out.print( NmsUtil.GetString("Go Back to Previous") );
      out.write("'; return true\"><IMG SRC=\"../images/back.png\" ALT=\"");
      out.print( NmsUtil.GetString("Back") );
      out.write("\" BORDER=\"0\"></A>\n</BODY>\n</HTML>\n");
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
