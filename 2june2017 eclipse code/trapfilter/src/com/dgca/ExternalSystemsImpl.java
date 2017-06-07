package com.dgca;

import java.util.Date;
import java.util.Enumeration;
import java.util.StringTokenizer;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.snmp.snmp2.SnmpPDU;
import com.adventnet.snmp.snmp2.SnmpVarBind;

public class ExternalSystemsImpl implements ExternalSystems {

	@Override
	public Event getCiscoEvent(SnmpPDU pdu,Event events) {
		String displayName = null;
		
		System.err.println("varbs : " + pdu.printVarBinds());
		System.err.println("==============getVariableBindings==============");
		for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

			String input1 = ((SnmpVarBind) e.nextElement()).toTagString();
			System.out.println("Input : " + input1);
			
			
			/*if (input.contains(DgcaConstants.SIL_CISCO_HOSTNAME_ObjectID)) {
			
				hostName=input.substring(DgcaUtility.nthIndexOf(input, ":", 3)+1,input.length());

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
					severity = "3";
				if (severity.equals("6"))
					severity = "2";
				if (severity.equals("7"))
					severity = "1";

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
				
				System.out.println("Before add node"+reportingAddress+displayName);
				try {
					DgcaManagedObjetsOperations.AddObject(displayName);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
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
	}

	@Override
	public Event getCmsEvent(SnmpPDU pdu, Event event) {

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

		return event;
		
	
	}

	@Override
	public Event getCiscoPrimeProvisioningEvent(SnmpPDU pdu, Event event) {


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

				try {
					DgcaManagedObjetsOperations.AddObject(displayName);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
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
	
}
