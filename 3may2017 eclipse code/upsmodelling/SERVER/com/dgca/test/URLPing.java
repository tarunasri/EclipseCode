package com.dgca.test;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.Properties;

import com.adventnet.nms.alertdb.Alert;
import com.adventnet.nms.alertdb.AlertAPI;
import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.EventAPI;
import com.adventnet.nms.jmxagent.AlarmEntry;
import com.adventnet.nms.netwatch.UserTester;
import com.adventnet.nms.severity.SeverityInfo;
import com.adventnet.nms.severity.SeverityIterator;
import com.adventnet.nms.topodb.ManagedObject;
import com.adventnet.nms.topodb.TopoAPI;
import com.adventnet.nms.topodb.TopoObject;
import com.adventnet.nms.util.NmsLogMgr;
import com.adventnet.snmp.beans.SnmpTarget;
import com.adventnet.snmp.snmp2.SnmpOID;
import com.dgca.discovery.MyDiscoveryFilter;

public class URLPing implements UserTester {
	String urlString = null;
	int port;
	URL url = null;
	String ipAddress = null;
	static int counter = 1;

	public int test(String moname, Properties prop, TopoAPI api) {
		SeverityIterator iterator = SeverityInfo.getInstance().getIterator();
		ManagedObject obj = null;

		System.err.println("We are in URLPing class");

		Event event =null;
		
		try {
			obj = api.getByName(moname);
			System.out.println("moname"+moname);

		} catch (Exception ex) {
			NmsLogMgr.TOPOERR.fail("Exception in getting the object  " + obj.getName(), ex); // no
																								// i18n
		}
		if (obj instanceof TopoObject) {

			System.err.println("obj instanceof TopoObject");
			System.out.println("URLPING DEVICE" +obj.getName());

			try {

				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(((TopoObject) obj).getIpAddress());
				//target.setTargetHost("10.192.24.12");
				target.setTargetPort(161);

				target.setCommunity("kcmcsnmp");
				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.33.1.2.2.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				
				System.out.println("taget host"+target.getTargetHost());
				System.out.println("snmpget by oid1"+target.snmpGet(oid1));
			    System.out.println("name"+obj.getName()+"display name"+obj.getDisplayName());
			    
			    		    
			    
			    
				System.out.println(((TopoObject) obj).getIpAddress());
				
				System.out.println("Result of Get request:" + result);
				
				EventAPI eventAPI = null;
				try {
					eventAPI = (EventAPI) Naming.lookup("//localhost/EventAPI");
				} catch (MalformedURLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (RemoteException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (NotBoundException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				
				if (result == null || result.equalsIgnoreCase("null")){
					errorMsg = target.getErrorString(); // print or log this
														// error
				// message as required.
				}
				else {

					if (Integer.parseInt(result) != 0) {

						System.err.println("Running in ups battery mode");
						
						//ae.setAlarmSeverity(1);
						
						event.setTime((new Date()).getTime());
						event.setSource(((TopoObject) obj).getIpAddress());
						event.setEntity(((TopoObject) obj).getIpAddress());
						event.setText("Running in ups battery mode");
						event.setCategory("Topology");
						event.setSeverity(1);
						//event.setSeverity(2);
						//event.setSeverity(3);
						//event.setSeverity(4);
						
						try{
						eventAPI.addEvent(event);
						System.out.println("event Created Successfully" +event.getSeverity());


						}
						catch(Exception e){
							System.out.println("Exception block of ups battery mode");
							
						}
						
						

					} else {
						System.out.println("Running in power mode");
						//ae.setAlarmSeverity(5);
						event = new Event();
						event.setTime((new Date()).getTime());
						event.setSource(((TopoObject) obj).getIpAddress());
						event.setEntity(((TopoObject) obj).getIpAddress());
						event.setText("Running in power mode");
						event.setCategory("Topology");
						event.setSeverity(5);
						try{
							eventAPI.addEvent(event);
							System.out.println("event Created Successfully" +event.getSeverity());
							}
							catch(Exception e){
								System.out.println("Exception block of ups power mode");
								
							}
							
						
					}

				}
				
				
				/*else {

					if (Integer.parseInt(result) != 0) {

						System.err.println("Running in ups battery mode");
						
						//ae.setAlarmSeverity(1);
						
						event.setTime((new Date()).getTime());
						event.setSource(((TopoObject) obj).getIpAddress());
						event.setEntity(((TopoObject) obj).getIpAddress());
						event.setText("Running in ups battery mode");
						event.setCategory("Topology");
						//event.setSeverity(1);
						event.setSeverity(2);
						//event.setSeverity(3);
						//event.setSeverity(4);
						
						try{
						eventAPI.addEvent(event);
						System.out.println("event Created Successfully" +event.getSeverity());


						}
						catch(Exception e){
							System.out.println("Exception block of ups battery mode");
							
						}
						
						

					} else {
						System.out.println("Running in power mode");
						//ae.setAlarmSeverity(5);
						event = new Event();
						event.setTime((new Date()).getTime());
						event.setSource(((TopoObject) obj).getIpAddress());
						event.setEntity(((TopoObject) obj).getIpAddress());
						event.setText("Running in power mode");
						event.setCategory("Topology");
						event.setSeverity(5);
						try{
							eventAPI.addEvent(event);
							System.out.println("event Created Successfully" +event.getSeverity());
							}
							catch(Exception e){
								System.out.println("Exception block of ups power mode");
								
							}
							
						
					}

				}*/
				
				/*counter += 1;
				int status = counter % 5;
				System.err.println("STATUS before if"+status);
				if (status == 0) {
					status = 5;
				}
				System.err.println("status value is : " + status);
				return status;*/

			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("Exception in getting status. returning 1");
				return 1;
			}

		}
		return 5;
	}
}






