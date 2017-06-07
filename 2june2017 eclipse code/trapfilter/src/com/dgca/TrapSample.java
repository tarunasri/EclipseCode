package com.dgca;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Enumeration;
import java.util.StringTokenizer;

import javax.jnlp.ExtensionInstallerService;
import javax.management.Query;
import javax.security.auth.login.Configuration;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.TrapFilter;
import com.adventnet.nms.topodb.IpAddress;
import com.adventnet.nms.topodb.ManagedObject;
import com.adventnet.snmp.snmp2.SnmpAPI;
import com.adventnet.snmp.snmp2.SnmpPDU;
import com.adventnet.snmp.snmp2.SnmpVarBind;

public class TrapSample implements TrapFilter {

	
	/**
	 * serialVersionUID 
	 */
	private static final long serialVersionUID = 1L;
	//Added Database Connection 
	
	public static Connection conn=null;
	public static DbConnection dbconn=null;
	
	public TrapSample() {
		System.out.println("Inside Constructor");
		dbconn = new DbConnection();
		conn = dbconn.getdatabaseConnection();

	}
	

	@Override
	public Object applyTrapFilter(SnmpPDU pdu) {
		
		System.out.println("Inside trap filter applyTrapFilter");
		
		Event event = null;
//		Connection conn = null;
		PreparedStatement pstmt = null;
	
		ResultSet rs = null;
		String Name="";
		String DisplayName="";
		/*try {

			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to a selected database...");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/dgcadbtest1", "master",
					"public");
			System.out.println("Connected database successfully...");

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			String ipa="172.18.18.19";
			String sql = "select * from  DGCAMapping where ipaddress="+"'"+ipa+"'";
			System.out.println("query"+sql);
			pstmt = conn.prepareStatement(sql);

			//String sql = "select * from  DGCAMapping where ipaddress=172.18.18.19";
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				// Retrieve by column name
				Name = rs.getString("NAME");
				DisplayName= rs.getString("DISPLAYNAME");

				// Display values
//				System.out.print(", IpAddress: " + IpAddress);
				System.out.print(", NAME: " + Name);
				System.out.println(", DISPLAYNAME: " + DisplayName);

				System.out.println("ip address value:" + rs.getString("IpAddress"));
				if (rs.getString("IpAddress").equals(reportingAddress)) {
					System.out.println("Node already exists in DGCAMapping" + obj.getName() + ","
							+ obj.getDisplayName());
				} else {
					System.out.println("Node not exist in DGCAMapping" + obj.getName() + ","
							+ obj.getDisplayName());

				}
			}
			System.out.println("Name Length"+Name);
			if(Name!="" && Name.length()<0){
				System.out.println("IPAddress Doesnot exists hence adding the ip, hostname, displayname ");
				//Insert query
			}else{
				System.out.println("IPAddress exists");
			}
			
			
			// STEP 5: Extract data from result set
//			System.out.println("rs value" + rs.getFetchSize());
			if(rs.getFetchSize()>0){
				
				System.out.println("node already exist");
			}
			else{
				System.out.println();
				
			}
			
			while (rs.next()) {
				// Retrieve by column name
				int MOID = rs.getInt("MOID");
				String IpAddress = rs.getString("IpAddress");
				String NAME = rs.getString("NAME");
				String DISPLAYNAME = rs.getString("DISPLAYNAME");

				// Display values
				System.out.print("MOID: " + MOID);
				System.out.print(", IpAddress: " + IpAddress);
				System.out.print(", NAME: " + NAME);
				System.out.println(", DISPLAYNAME: " + DISPLAYNAME);

				System.out.println("ip address value:" + rs.getString("IpAddress"));

			}
		//	rs.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception ex) {
			// Handle errors for Class.forName
			ex.printStackTrace();
		}*/ /*finally {
			// finally block used to close resources
			try {
				conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			

		}*/
		try {
			if (pdu.getVersion() == SnmpAPI.SNMP_VERSION_2 || pdu.getVersion() == SnmpAPI.SNMP_VERSION_2C
					|| pdu.getVersion() == SnmpAPI.SNMP_VERSION_3) {

				if (pdu.getRemoteHost() == null) {
					return pdu;
				}
				if (pdu.getRemoteHost().equals("172.18.62.68")){;// from

					/*
					 * event = new Event(); event.setTime((new
					 * Date()).getTime()); event.setSource("172.18.62.76");
					 * event.setEntity("172.18.62.76");
					 * event.setText("FireWallsAlrt");
					 * event.setCategory("Topology");
					 * event.setSeverity(Integer.parseInt("1"));
					 * System.out.println("event object creation"); return event
					 */
					return null;

				} else if (pdu.getRemoteHost().equals("10.208.0.11")) {
					Event events = null;
					ManagedObject obj = null;
					
					System.err.println("varbs : " + pdu.printVarBinds());
					System.err.println("==============getVariableBindings==============");
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input1 = ((SnmpVarBind) e.nextElement()).toTagString();
						System.out.println("Input1 : " + input1);
						String displayName = null;
						String description1 = null;
						
						/*if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.712.1.1.2.1.9.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will
																	// print the
																	// first
																	// part
																	// before :
								String s1 = stTokenizer.nextToken();
								//String s2 = stTokenizer.nextToken();
								displayName = stTokenizer.nextToken();// it will
																		// print
																		// after
																		// :
								System.out.println("Display Name:"+displayName);

							}

						}*/
						
						
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.712.1.1.2.1.12.0")) {

							String reportingAddress = input1.substring(
									input1.indexOf("reportingEntityAddress=") + "reportingEntityAddress=".length(),
									input1.indexOf("reportingEntityAddress=") + "reportingEntityAddress=".length()
											+ 12);
							if (reportingAddress.contains(",")) {

								String str[] = reportingAddress.split("\\,");
								reportingAddress = str[0];
								System.out.println("After Splitting:" + reportingAddress);

							}
							/*String description = input1.substring(
									input1.indexOf("description=") + "description=".length(),
									input1.indexOf("applicationSpecificAlarmID"));*/
							
							String description = input1.substring(
									input1.indexOf("description=") + "description=".length(),
									input1.lastIndexOf(".,"));
							System.out.println("Description at 12.0" +description);
							
							//System.out.println("Description:"+input1.substring(description.length()));
							
							/*displayName = input1.substring(
									input1.indexOf("displayName=") + "displayName=".length(),
									input1.indexOf(","));
							System.out.println("DisplayName: " +displayName);*/
							
							if((input1.contains("isArchived=false, authEntityClass"))==true){
								displayName = input1.substring(
										input1.indexOf("displayName=") + "displayName=".length(),
										input1.lastIndexOf(", isArchived=false"));
								System.out.println("DisplayName at 12.0:" + displayName);
								
							} else if((input1.contains("isArchived=false, rrmGroupEventReceiveTimeRrm"))==true){
								displayName = input1.substring(
										input1.indexOf("displayName=") + "displayName=".length(),
										input1.lastIndexOf(", Interface 802.11"));

								System.out.println("DisplayName at 12.0:" + displayName);
								
							} else if(input1.contains("Interface 802.11")==true ){
								displayName = input1.substring(
										input1.indexOf("displayName=") + "displayName=".length(),
										input1.lastIndexOf(", Interface 802.11"));

								System.out.println("DisplayName at 12.0:" + displayName);
								
							} else {
								displayName = input1.substring(
										input1.indexOf("displayName=") + "displayName=".length(),
										input1.lastIndexOf(", authEntityClass"));

								System.out.println("DisplayName at 12.0:" + displayName);
								
							}

							String severity = input1.substring(input1.indexOf("severity=") + "severity=".length(),
									input1.indexOf("severity=") + "severity=".length() + 1);

							System.out.println("Severity of Cisco" + severity);
							if (severity.equals("0"))
								severity = "1";
							if (severity.equals("1"))
								severity = "1";
							if (severity.equals("2"))
								severity = "2";
							if (severity.equals("3"))
								severity = "3";
							if (severity.equals("4"))
								severity = "4";
							if (severity.equals("5"))
								severity = "5";
							if (severity.equals("6"))
								severity = "6";
							if (severity.equals("7"))
								severity = "6";

							reportingAddress = reportingAddress.trim();
							System.out.println("reportingAddress : " + reportingAddress);

							/*
							 * pdu.setAgentAddr(reportingAddress);
							 * 
							 * try { InetAddress address =
							 * InetAddress.getByName(reportingAddress);
							 * pdu.setAgentAddress(address); } catch (Exception
							 * e1) { e1.printStackTrace(); } UDPProtocolOptions
							 * opt = new UDPProtocolOptions();
							 * System.out.println("Remote Host cisco pi: " +
							 * reportingAddress);
							 * opt.setRemoteHost(reportingAddress);
							 * opt.setRemotePort(161);
							 * 
							 * pdu.setProtocolOptions(opt); System.err.println(
							 * "Trap Receiver : Agent ADDR : " +
							 * pdu.getAgentAddr()); System.err.println(
							 * "Trap Receiver : Remote Host : " +
							 * pdu.getRemoteHost()); System.out.println(
							 * "My Message: " + description);
							 */
							
							/*if(obj.getName().indexOf("172.18.32.2")==0){
								System.out.println("interface result inside"+displayName);
								obj.setName("IF-"+displayName);
								System.out.println("Interface name as displayname" +obj.getName() );
								
								obj.setDisplayName("IF-"+displayName);
								System.out.println("Interface name as displayname" +obj.getDisplayName() );
							}*/
							
							System.out.println("Before add node" + reportingAddress + displayName);
							// insert ipaddress, hostname into the table --
							// whenever we are adding any node
							System.out.println("Before insertion calling");
							boolean status=dbconn.checkrecordExists(reportingAddress,conn);//boolean status false then goto if
							if(!status){
								dbconn.insertRecord(reportingAddress, displayName, displayName, conn);
								System.out.println("insertion invoked");
							}
								
							
							DgcaManagedObjetsOperations.AddNode(reportingAddress, displayName);
							System.out.println("Displayname displayed");

							System.out.println("In Cisco  PI  Testing" + severity);

							/*events = new Event();
							events.setTime((new Date()).getTime());
							events.setSource(((TopoObject) obj).getDisplayName());
							System.out.println("Displayname:"+((TopoObject) obj).getDisplayName());
							//events.setSource(displayName);
							events.setEntity(((TopoObject) obj).getDisplayName());
							events.setText(description);// events.set("cisco
														// alaram")
							events.setCategory("Topology");
							events.setSeverity(Integer.parseInt(severity));// events.setSeverity("1");*/							
							
							
							events = new Event();
							events.setTime((new Date()).getTime());
							events.setSource(displayName);
							//events.setSource(displayName);
							events.setEntity(displayName);
							events.setText(description);// events.set("cisco
														// alaram")
							events.setCategory("Topology");
							events.setSeverity(Integer.parseInt(severity));// events.setSeverity("1");
						}
					}
					System.err.println("==============getVariableBindings End=========");
					System.err.println("event properties : "+events.getProperties() );
					return events;
				} else if (pdu.getRemoteHost().equals("10.131.128.5") || pdu.getRemoteHost().equals("10.131.128.69")
						|| pdu.getRemoteHost().equals("10.131.134.229") || pdu.getRemoteHost().equals("10.131.135.5")) {
					StringBuilder stBuilder = new StringBuilder();

					System.err.println("CMS varbs : " + pdu.printVarBinds());
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input = ((SnmpVarBind) e.nextElement()).toTagString();
						if (input.contains("Object ID: .1.3.6.1.4.1.6718.3.3.1.2.12.0")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "rtuComputerName:" + parse1;
							stBuilder.append(op + ",");
							System.out.println("DisplayName at 12.0" + op);
							DgcaManagedObjetsOperations.AddObject(op);

						}
						if (input.contains("Object ID: .1.3.6.1.4.1.6718.3.3.1.2.1.0")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "FaultType:" + parse1;
							stBuilder.append(op + ",");

						}

						System.out.println("CMS Input : " + input);
					}
					
					
					event = new Event();
					event.setTime((new Date()).getTime());
					String op = null;
					event.setSource(op);
					event.setEntity(op);
					event.setText(stBuilder.toString());
					event.setCategory("Topology");
					event.setSeverity(1);
					System.out.println("I am in CMS block");

					/*event = new Event();
					event.setTime((new Date()).getTime());
					event.setSource(pdu.getRemoteHost());
					event.setEntity(pdu.getRemoteHost());
					event.setText(stBuilder.toString());
					event.setCategory("Topology");
					event.setSeverity(1);
					System.out.println("I am in CMS block");*/
					return event;
					
				} else if (pdu.getRemoteHost().equals("10.208.0.21")|| pdu.getRemoteHost().equals("10.208.0.22")) {

					System.err.println("varbs : " + pdu.printVarBinds());
					System.err.println("==============getVariableBindings==============");
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input1 = ((SnmpVarBind) e.nextElement()).toTagString();
						System.out.println("Input1 : " + input1);
						String managedObjectName = null;
						String displayName = null;
						String description = null;
						String severity = null;
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.15.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before : managedObjectName =
								stTokenizer.nextToken();// it // will // print
														// // after
								System.out.println("CPP managed object" + managedObjectName);
							}

						}

						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.13.0")) {

							// Node=PROJGSR-KMMGMTCP01:
							StringTokenizer st = new StringTokenizer(input1, ":");
							if (st.hasMoreTokens()) {
								String s1 = st.nextToken();
								String s2 = st.nextToken();
								StringTokenizer st1 = new StringTokenizer(s2, "=");
								if (st1.hasMoreTokens()) {
									String s3 = st1.nextToken();
									displayName = st1.nextToken();
								}
								System.out.println("DisplayName at 13.0 CPP:" + displayName);
							}

						}
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.16.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before : description =
								description = stTokenizer.nextToken();// it will // print //
														// after // :
								System.out.println("Description at 16.0" + description);

							}

						}
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.7.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before :
								severity = stTokenizer.nextToken();// it will //
																	// print //
																	// after
								if (severity.equals("NodeUnreachable")) {
									severity = "2";

								} else if (severity.equals("RebootDetected")) {
									severity = "2";

								} else {

									severity = "6";
								}

							}

							DgcaManagedObjetsOperations.AddObject(displayName);
							System.out.println("Displayname displayed");

							event = new Event();
							event.setTime((new Date()).getTime());
							event.setSource(displayName);
							event.setEntity(displayName);
							event.setText(description);
							event.setCategory("Topology");
							event.setSeverity(Integer.parseInt(severity));
							
						}
					}
					System.err.println("==============getVariableBindings End=========");
					return event;
				}
				
				else if (pdu.getRemoteHost().equals("172.18.62.68") || pdu.getRemoteHost().equals("172.18.62.70")
						|| pdu.getRemoteHost().equals("172.18.62.71") || pdu.getRemoteHost().equals("172.18.62.72")
						|| pdu.getRemoteHost().equals("172.18.62.76") || pdu.getRemoteHost().equals("172.18.62.77")) {
					StringBuilder stBuilder = new StringBuilder();

					System.err.println("SNS(Firewalls) varbs : " + pdu.printVarBinds());
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input = ((SnmpVarBind) e.nextElement()).toTagString();
						
						if (input.contains("Object ID: .1.3.6.1.4.1.9.9.637.1.2.1.3")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "cscRdrDestInetAddress:" + parse1;
							stBuilder.append(op + ",");

						}
						if (input.contains("Object ID: .1.3.6.1.4.1.9.9.637.1.2.1.4")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "cscRdrDestPort:" + parse1;
							stBuilder.append(op + ",");

						}

						System.out.println("SNS(Firewalls) Input : " + input);
					}

					event = new Event();
					event.setTime((new Date()).getTime());
					event.setSource(pdu.getRemoteHost());
					event.setEntity(pdu.getRemoteHost());
					event.setText(stBuilder.toString());
					event.setCategory("Topology");
					event.setSeverity(6);
					System.out.println("I am in SNS(Firewalls) block");
					return event;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}/*finally {
			// finally block used to close resources
			try {
				rs.close();
				pstmt.close();
				//conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			

		}
*/
		return pdu;
	}
}
