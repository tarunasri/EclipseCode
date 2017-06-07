package com.dgca.discovery;

import java.util.Properties;

import javax.transaction.*;

import com.adventnet.management.transaction.TransactionAPI;
import com.adventnet.management.transaction.UserTransactionException;
import com.adventnet.nms.store.NmsStorageException;
import com.adventnet.nms.topodb.FoundFilter;
import com.adventnet.nms.topodb.ManagedObject;
import com.adventnet.nms.topodb.SnmpNode;
import com.adventnet.nms.topodb.TopoAPI;
import com.adventnet.nms.topodb.TopoObject;
import com.adventnet.nms.util.NmsLogMgr;
import com.adventnet.nms.util.NmsUtil;
import com.adventnet.snmp.beans.SnmpTarget;
import com.adventnet.snmp.snmp2.SnmpOID;
import com.dgca.ac.ACDevices;
import com.dgca.cms.CMSDevice;
import com.dgca.servers.Servers;
import com.dgca.sns.SNSDevice;
import com.dgca.ups.UPSDevice;

/**
 * This class has sample code that demonstrates the following: 1. The skeleton
 * code to represent the structure of a simple discovery filter. 2. It contains
 * WebNMS transaction methods to demonstrate how transaction can be used while
 * adding/updating objects in the database. 3. It also contains code sample to
 * send SNMP queries to the device, this can be used as a guideline for
 * interacting with the device to retrieve its properties. 4. In addition it
 * outlines a basic business logic of how a discovered object is handled inside
 * the Discovery Filter before being added to the WebNMS database.
 * 
 * As this class is just a sample, the code implementation provided for the
 * filterObject(ManagedObject, TopoAPI) method can be changed as per user
 * requirement.
 * 
 * Please Note that the DiscoveryFilter has to implement the FounfFilter
 * interface and hence it is mandatory to implement the filterObject method.
 */

public class MyDiscoveryFilter implements FoundFilter {
	private TransactionAPI transactionAPI = null;

	@SuppressWarnings("unused")
	public ManagedObject filterObject(ManagedObject mo, TopoAPI topoApi)
			throws NmsStorageException, UserTransactionException {
		System.out.println("Filter class called" + mo.getType());
		
/*if((mo.getType().equals("Compaq")) || (mo.getType().equals("HP"))){
			
			System.out.println("we are in Compaq/HP  Server Block");

			Servers servers = new Servers();
			SnmpTarget target = new SnmpTarget();
			target.setTargetHost(mo.getName()); // setting the hostname of
												// the
												// device to query
			target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																	// the
																	// snmpport
																	// to
																	// which
																	// queries
																	// will
																	// be
																	// sent
			target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																	// the
																	// community

			// code snippet for querying the device

			SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
			target.setSnmpOID(oid1);
			String errorMsg = null;
			String result = target.snmpGet();
			if (result == null || result.equalsIgnoreCase("null")) // This
																	// means
																	// error
																	// occurred
																	// in
																	// retrieving
																	// the
																	// property
																	// from
																	// the
																	// device
				errorMsg = target.getErrorString(); // print or log this
													// error
													// message as required.
			else {

				servers.setDisplayName(result + "_Servers");

				System.out.println("result of snmp query " + result);

				// If we get here, the query was successful in retrieving
				// the
				// property from the device
				// so we need to set it to the switchObj.
				// upsDevice.setTestProperty(result); //say the name of the
				// property is TestProperty.
			}

			servers.setProperties(mo.getProperties());
			servers.setName(result + "_Servers");

			servers.setClassname("com.dgca.servers.Servers");
			servers.setType("Servers");
			servers.setStatusPollEnabled(true);
			servers.setTester("usertest");
			servers.setPollInterval(10);
			servers.setUClass("com.dgca.test.URLPing");
			servers.setLocation("kuwait");

			System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

			Properties props = mo.getProperties();

			// TODO Fourth Step: Query the device for any additional
			// properties
			// Below code shows sample for querying an SNMP Device.

			// TODO Fifth Step: Return the custom object instance so it can
			// be
			// added to the database by WebNMS framework
			// or do the process of adding the MO yourself using TopoAPI
			// say we choose to add the MO to DB here inside the filter
			// itself,
			// then we need to do it in transaction.
			if (transactionAPI == null) {
				initTransactionAPI();
			}
			beginTransaction();

			try {
				boolean checkMO = topoApi.isManagedObjectPresent(servers.getName());
				System.err.println("result of checkMo: ====" + checkMO);

				if (!checkMO) // This implies an object with this name is
								// not
								// already present in DB hence we can add
								// this
								// object
				{
					System.err.println("servers properties: ====" + servers.getProperties());
					boolean result2 = topoApi.addObject(servers);

					// boolean result2 = topoApi.addObject(servers);
					System.err.println("sanServers added. result is  " + result2);
					// NOTE: as we have added the object to database we must
					// return null
				} else {
					// TODO log an error saying object with same name
					// already
					// exists.
				}
				commitTransaction();
				System.err.println("After commitTransaction: ====");
			} catch (java.rmi.RemoteException re) {
				// NmsLogMgr is the default logging framework for WebNMS,
				// its
				// use here is optional.
				// You can use some other logging framework instead.
				NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
				rollbackTransaction(re);
			} catch (com.adventnet.nms.store.NmsStorageException nse) {
				NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
				rollbackTransaction(nse);
			} catch (com.adventnet.management.transaction.UserTransactionException ute) {
				NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
				rollbackTransaction(ute);
			} catch (Exception e) {
				e.printStackTrace();
				NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
				rollbackTransaction(e);
			}
		
			
			return mo;
		}*/
		

		// TODO First Step: Check if the ManagedObject satisfies
		// the criteria that you want to process
		if (mo == null)
			return null;
		

		if (!(mo instanceof SnmpNode)) {
			// As our requirement is to handle only SnmpNodes let us return the
			// MO as is if it is not an instance of SnmpNode.
			// Please note returning the MOs that you aren't interested in
			// handling is very important
			// as these MOs will be passed on to other discovery filters
			// configured in the discovery.filters conf file.
			return mo;
		} else if (((SnmpNode) mo).getType().equals("snmp-node")) {
			
			if ((mo.getName().equals("10.192.0.11")) || (mo.getName().equals("10.192.2.11"))
					|| (mo.getName().equals("10.192.5.11")) || (mo.getName().equals("10.192.6.11"))
					|| (mo.getName().equals("10.192.8.11")) || (mo.getName().equals("10.192.12.11"))
					|| (mo.getName().equals("10.192.14.11")) || (mo.getName().equals("10.192.16.11"))
					|| (mo.getName().equals("10.192.17.11")) || (mo.getName().equals("10.192.22.11"))
					|| (mo.getName().equals("10.192.24.12")) || (mo.getName().equals("10.192.27.11"))
					|| (mo.getName().equals("10.192.28.21")) || (mo.getName().equals("10.192.18.11"))
					|| (mo.getName().equals("10.131.128.4")) || (mo.getName().equals("10.131.128.36"))
					|| (mo.getName().equals("10.131.128.68")) || (mo.getName().equals("10.131.128.100"))
					|| (mo.getName().equals("10.131.128.132")) || (mo.getName().equals("10.131.128.164"))
					|| (mo.getName().equals("10.131.128.196")) || (mo.getName().equals("10.131.128.228"))
					|| (mo.getName().equals("10.131.134.164")) || (mo.getName().equals("10.131.134.196"))
					|| (mo.getName().equals("10.131.129.4")) || (mo.getName().equals("10.131.129.36"))
					|| (mo.getName().equals("10.131.129.68")) || (mo.getName().equals("10.131.129.100"))
					|| (mo.getName().equals("10.131.129.132")) || (mo.getName().equals("10.131.129.164"))
					|| (mo.getName().equals("10.131.129.196")) || (mo.getName().equals("10.131.129.228"))
					|| (mo.getName().equals("10.131.130.4")) || (mo.getName().equals("10.131.130.36"))
					|| (mo.getName().equals("10.131.130.68")) || (mo.getName().equals("10.131.130.100"))
					|| (mo.getName().equals("10.131.130.132")) || (mo.getName().equals("10.131.130.164"))
					|| (mo.getName().equals("10.131.130.196")) || (mo.getName().equals("10.131.130.228"))
					|| (mo.getName().equals("10.131.131.4")) || (mo.getName().equals("10.131.131.36"))
					|| (mo.getName().equals("10.131.131.68")) || (mo.getName().equals("10.131.131.100"))
					|| (mo.getName().equals("10.131.131.132")) || (mo.getName().equals("10.131.131.164"))
					|| (mo.getName().equals("10.131.131.196")) || (mo.getName().equals("10.131.131.228"))
					|| (mo.getName().equals("10.131.132.4")) || (mo.getName().equals("10.131.132.36"))
					|| (mo.getName().equals("10.131.132.68")) || (mo.getName().equals("10.131.132.100"))
					|| (mo.getName().equals("10.131.132.132")) || (mo.getName().equals("10.131.132.164"))
					|| (mo.getName().equals("10.131.132.196")) || (mo.getName().equals("10.131.132.228"))
					|| (mo.getName().equals("10.131.133.4")) || (mo.getName().equals("10.131.133.36"))
					|| (mo.getName().equals("10.131.133.68")) || (mo.getName().equals("10.131.133.100"))
					|| (mo.getName().equals("10.131.133.132")) || (mo.getName().equals("10.131.133.164"))
					|| (mo.getName().equals("10.131.133.196")) || (mo.getName().equals("10.131.133.228"))
					|| (mo.getName().equals("10.131.134.4")) || (mo.getName().equals("10.131.134.36"))
					|| (mo.getName().equals("10.131.134.68")) || (mo.getName().equals("10.131.134.100"))
					|| (mo.getName().equals("10.131.134.132")) || (mo.getName().equals("10.192.4.11"))) {

				// TODO Second step: Here you can create an instance of your
				// modeled
				// object
				// Please make sure that the below line is replaced by your
				// extended
				// managed object.
				System.err.println("I am in if condition of UPS ====" + mo.getDisplayName());

				UPSDevice upsDevice = new UPSDevice();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					upsDevice.setDisplayName(result + "_UPS");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				upsDevice.setProperties(mo.getProperties());
				
				if (mo.getName().equals("10.131.128.36")) {
					upsDevice.setName(result + "_UPS_TBLDGSITA");
					System.out.println("ups 10.131.128.36");
				} else if (mo.getName().equals("10.131.128.100")) {
					upsDevice.setName(result + "_UPS_METOBG02");
					System.out.println("ups 10.131.128.100");
				} else if (mo.getName().equals("10.131.128.164")) {
					upsDevice.setName(result + "_UPS_ATCT10ER");
					System.out.println("ups 10.131.128.164");
				} else if (mo.getName().equals("10.131.134.164")) {
					upsDevice.setName(result + "_UPS_KCMCG21");
					System.out.println("ups 10.131.134.164");
				} else if (mo.getName().equals("10.131.134.196")) {
					upsDevice.setName(result + "_UPS_KCMCT10");
					System.out.println("ups 10.131.134.196");
				} else if (mo.getName().equals("10.131.129.4")) {
					upsDevice.setName(result + "_UPS_SS-M02GER");
					System.out.println("ups 10.131.129.4");
				} else if (mo.getName().equals("10.131.129.36")) {
					upsDevice.setName(result + "_UPS_SS-M01GER");
					System.out.println("ups 10.131.129.36");
				} else if (mo.getName().equals("10.131.129.68")) {
					upsDevice.setName(result + "_UPS_TBLDBM196");
					System.out.println("ups 10.131.129.68");
				} else if (mo.getName().equals("10.131.129.100")) {
					upsDevice.setName(result + "_UPS_SPBFCOM");
					System.out.println("ups 10.131.129.100");
				} else if (mo.getName().equals("10.131.129.132")) {
					upsDevice.setName(result + "_UPS_SS-P02GER");
					System.out.println("ups 10.131.129.132");
				} else if (mo.getName().equals("10.131.129.164")) {
					upsDevice.setName(result + "_UPS_METGPBX");
					System.out.println("ups 10.131.129.164");
				} else if (mo.getName().equals("10.131.129.196")) {
					upsDevice.setName(result + "_UPS_PROJGSR");
					System.out.println("ups 10.131.129.196");
				} else if (mo.getName().equals("10.131.129.228")) {
					upsDevice.setName(result + "_UPS_PBX-N5GMEET");
					System.out.println("ups 10.131.129.228");
				} else if (mo.getName().equals("10.131.130.4")) {
					upsDevice.setName(result + "_UPS_SS-BGLT");
					System.out.println("ups 10.131.130.4");
				} else if (mo.getName().equals("10.131.130.36")) {
					upsDevice.setName(result + "_UPS_SS-P01GER");
					System.out.println("ups 10.131.130.36");
				} else if (mo.getName().equals("10.131.130.68")) {
					upsDevice.setName(result + "_UPS_SS-AFA1");
					System.out.println("ups 10.131.130.36");
				} else if (mo.getName().equals("10.131.130.100")) {
					upsDevice.setName(result + "_UPS_SS-FGHT");
					System.out.println("ups 10.131.130.100");
				} else if (mo.getName().equals("10.131.130.132")) {
					upsDevice.setName(result + "_UPS_SS-KGHT");
					System.out.println("ups 10.131.130.132");
				} else if (mo.getName().equals("10.131.130.164")) {
					upsDevice.setName(result + "_UPS_SS-RGHT");
					System.out.println("ups 10.131.130.164");
				} else if (mo.getName().equals("10.131.130.196")) {
					upsDevice.setName(result + "_UPS_SS-TGHT");
					System.out.println("ups 10.131.130.196");
				} else if (mo.getName().equals("10.131.130.228")) {
					upsDevice.setName(result + "_UPS_GP33LG02");
					System.out.println("ups 10.131.130.228");
				} else if (mo.getName().equals("10.131.131.4")) {
					upsDevice.setName(result + "_UPS_TBLDG413");
					System.out.println("ups 10.131.131.4");
				} else if (mo.getName().equals("10.131.131.36")) {
					upsDevice.setName(result + "_UPS_LLZ15RG03");
					System.out.println("ups 10.131.131.36");
				} else if (mo.getName().equals("10.131.131.68")) {
					upsDevice.setName(result + "_UPS_TBLDGT921");
					System.out.println("ups 10.131.131.68");
				} else if (mo.getName().equals("10.131.131.100")) {
					upsDevice.setName(result + "_UPS_SS-EGLT");
					System.out.println("ups 10.131.131.100");
				} else if (mo.getName().equals("10.131.131.164")) {
					upsDevice.setName(result + "_UPS_F-RMFER");
					System.out.println("ups 10.131.131.164");
				} else if (mo.getName().equals("10.131.131.196")) {
					upsDevice.setName(result + "_UPS_GP33RG02");
					System.out.println("ups 10.131.131.196");
				} else if (mo.getName().equals("10.131.131.228")) {
					upsDevice.setName(result + "_UPS_LLZ33RG04");
					System.out.println("ups 10.131.131.228");
				} else if (mo.getName().equals("10.131.132.4")) {
					upsDevice.setName(result + "_UPS_SS-Y00GHT");
					System.out.println("ups 10.131.132.4");
				} else if (mo.getName().equals("10.131.132.36")) {
					upsDevice.setName(result + "_UPS_SS-GGLT");
					System.out.println("ups 10.131.132.36");
				} else if (mo.getName().equals("10.131.132.68")) {
					upsDevice.setName(result + "_UPS_ADMINB1MCR");
					System.out.println("ups 10.131.132.68");
				} else if (mo.getName().equals("10.131.132.100")) {
					upsDevice.setName(result + "_UPS_F-RCGPBX");
					System.out.println("ups 10.131.132.100");
				} else if (mo.getName().equals("10.131.132.132")) {
					upsDevice.setName(result + "_UPS_SS-CGHT");
					System.out.println("ups 10.131.132.132");
				} else if (mo.getName().equals("10.131.132.164")) {
					upsDevice.setName(result + "_UPS_SS-DGHT");
					System.out.println("ups 10.131.132.164");
				} else if (mo.getName().equals("10.131.132.196")) {
					upsDevice.setName(result + "_UPS_SS-KAGHT");
					System.out.println("ups 10.131.132.196");
				} else if (mo.getName().equals("10.131.132.228")) {
					upsDevice.setName(result + "_UPS_SS-NGHT");
					System.out.println("ups 10.131.132.228");
				} else if (mo.getName().equals("10.131.133.4")) {
					upsDevice.setName(result + "_UPS_GP15RG02");
					System.out.println("ups 10.131.133.4");
				} else if (mo.getName().equals("10.131.133.36")) {
					upsDevice.setName(result + "_UPS_LLZ33LG02");
					System.out.println("ups 10.131.133.36");
				} else if (mo.getName().equals("10.131.133.68")) {
					upsDevice.setName(result + "_UPS_DVORG06");
					System.out.println("ups 10.131.133.68");
				} else if (mo.getName().equals("10.131.133.100")) {
					upsDevice.setName(result + "_UPS_SS-VGHT");
					System.out.println("ups 10.131.133.100");
				} else if (mo.getName().equals("10.131.133.132")) {
					upsDevice.setName(result + "_UPS_SS-YGLT");
					System.out.println("ups 10.131.133.132");
				} else if (mo.getName().equals("10.131.133.164")) {
					upsDevice.setName(result + "_UPS_GP15LG02");
					System.out.println("ups 10.131.133.164");
				} else if (mo.getName().equals("10.131.133.196")) {
					upsDevice.setName(result + "_UPS_LLZ15LG05");
					System.out.println("ups 10.131.133.196");
				} else if (mo.getName().equals("10.131.134.4")) {
					upsDevice.setName(result + "_UPS_ARBGRAD");
					System.out.println("ups 10.131.134.4");
				} else if (mo.getName().equals("10.131.134.36")) {
					upsDevice.setName(result + "_UPS_SS-LGHT");
					System.out.println("ups 10.131.134.36");
				} else if (mo.getName().equals("10.131.134.68")) {
					upsDevice.setName(result + "_UPS_ASRGER");
					System.out.println("ups 10.131.134.68");
				} else if (mo.getName().equals("10.131.134.100")) {
					upsDevice.setName(result + "_UPS_F-RWGPBX");
					System.out.println("ups 10.131.134.100");
				} else if (mo.getName().equals("10.131.134.132")) {
					upsDevice.setName(result + "_UPS_F-RINSER");
					System.out.println("ups 10.131.134.132");
				} 
				else {
				upsDevice.setName(result + "_UPS");
				}

				upsDevice.setClassname("com.dgca.ups.UPSDevice");
				upsDevice.setType("UPS");
				upsDevice.setStatusPollEnabled(true);
				upsDevice.setTester("usertest");
				upsDevice.setPollInterval(120);
				upsDevice.setUClass("com.dgca.test.URLPing");
				upsDevice.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(upsDevice.getName());
					System.err.println("result of checkMo: ====" + checkMO  + "UPSNAME" +upsDevice.getName() );

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("upsDevice properties: ====" + upsDevice.getProperties());
						//boolean result2 = topoApi.addObject(upsDevice);

						 boolean result2 = topoApi.addObject(upsDevice);
						 System.err.println("upsDevice added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} else if ((mo.getName().equals("10.208.33.20")) || (mo.getName().equals("10.208.33.36"))
					|| (mo.getName().equals("10.208.33.38")) || (mo.getName().equals("10.208.33.40"))
					|| (mo.getName().equals("10.208.33.42")) || (mo.getName().equals("10.208.33.44"))
					|| (mo.getName().equals("10.208.33.46")) || (mo.getName().equals("10.208.33.48"))
					|| (mo.getName().equals("10.208.33.50")) || (mo.getName().equals("10.208.33.52"))
					|| (mo.getName().equals("10.208.33.54")) || (mo.getName().equals("10.208.33.56"))
					|| (mo.getName().equals("10.208.33.58")) || (mo.getName().equals("10.208.33.60"))
					|| (mo.getName().equals("10.208.33.32")) || (mo.getName().equals("10.208.33.34"))
					|| (mo.getName().equals("10.208.33.72")) || (mo.getName().equals("10.208.33.74"))
					|| (mo.getName().equals("10.208.33.62")) || (mo.getName().equals("10.208.33.64"))
					|| (mo.getName().equals("10.208.33.68")) || (mo.getName().equals("10.208.33.73"))
					|| (mo.getName().equals("10.208.33.75")) || (mo.getName().equals("10.208.33.63"))
					|| (mo.getName().equals("10.208.33.65")) || (mo.getName().equals("10.208.33.69"))) {
				// TODO Second step: Here you can create an instance of your
				// modeled
				// object
				// Please make sure that the below line is replaced by your
				// extended
				// managed object.
				System.err.println("I am in if condition of Servers ====" + mo.getDisplayName());

				Servers servers = new Servers();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					servers.setDisplayName(result + "_Servers");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				servers.setProperties(mo.getProperties());
				servers.setName(result + "_Servers");

				servers.setClassname("com.dgca.servers.Servers");
				servers.setType("Servers");
				servers.setStatusPollEnabled(true);
				servers.setTester("usertest");
				servers.setPollInterval(10);
				servers.setUClass("com.dgca.test.URLPing");
				servers.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(servers.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("servers properties: ====" + servers.getProperties());
						boolean result2 = topoApi.addObject(servers);

						// boolean result2 = topoApi.addObject(servers);
						System.err.println("sanServers added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} 
			else if ((mo.getName().equals("10.131.128.11")) || (mo.getName().equals("10.131.128.12"))
					|| (mo.getName().equals("10.131.128.13")) || (mo.getName().equals("10.131.128.14"))
					|| (mo.getName().equals("10.131.128.71")) || (mo.getName().equals("10.131.128.72"))
					|| (mo.getName().equals("10.131.128.73")) || (mo.getName().equals("10.131.128.74"))) {

				System.err.println("I am in if condition of AC ====" + mo.getDisplayName());

				ACDevices acDevices = new ACDevices();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					acDevices.setDisplayName(result + "_AC");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				acDevices.setProperties(mo.getProperties());
				acDevices.setName(result + "_AC");

				acDevices.setClassname("com.dgca.ac.ACdevices");
				acDevices.setType("AC");
				acDevices.setStatusPollEnabled(true);
				acDevices.setTester("usertest");
				acDevices.setPollInterval(10);
				//acDevices.setUClass("com.dgca.test.URLPing");
				acDevices.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(acDevices.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("acDevices properties: ====" + acDevices.getProperties());
						boolean result2 = topoApi.addObject(acDevices);

						// boolean result2 = topoApi.addObject(upsDevice);
						System.err.println("acDevices added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} else if ((mo.getName().equals("172.18.62.67")) || (mo.getName().equals("172.18.62.68"))
					|| (mo.getName().equals("172.18.62.72")) || (mo.getName().equals("172.18.62.73"))
					|| (mo.getName().equals("172.18.62.74")) || (mo.getName().equals("172.18.62.75"))
					|| (mo.getName().equals("172.18.62.76")) || (mo.getName().equals("172.18.62.77"))
					|| (mo.getName().equals("172.18.62.4")) || (mo.getName().equals("172.18.62.5"))
					|| (mo.getName().equals("172.18.62.6")) || (mo.getName().equals("172.18.62.7"))
					|| (mo.getName().equals("172.18.62.70")) || (mo.getName().equals("172.18.62.71"))
					|| (mo.getName().equals("172.18.62.19")) || (mo.getName().equals("172.18.62.20"))
					|| (mo.getName().equals("172.18.62.2")) || (mo.getName().equals("172.18.62.1"))
					|| (mo.getName().equals("172.18.62.3")) || (mo.getName().equals("172.18.62.21"))
					|| (mo.getName().equals("172.18.62.22")) || (mo.getName().equals("172.18.62.69"))
					|| (mo.getName().equals("172.18.62.20")) || (mo.getName().equals("172.18.62.22"))) {

				// TODO Second step: Here you can create an instance of your
				// modeled
				// object
				// Please make sure that the below line is replaced by your
				// extended
				// managed object.
				
			
			    System.err.println("I am in if condition of SNS ====" + mo.getDisplayName());

				SNSDevice snsDevice = new SNSDevice();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					snsDevice.setDisplayName(result + "_SNS");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				snsDevice.setProperties(mo.getProperties());
				snsDevice.setName(result + "_SNS");

				snsDevice.setClassname("com.dgca.sns.SNSDevice");
				snsDevice.setType("SNS");
				snsDevice.setStatusPollEnabled(true);
				snsDevice.setTester("usertest");
				snsDevice.setPollInterval(10);
				snsDevice.setUClass("com.dgca.test.URLPing");
				snsDevice.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(snsDevice.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("snsDevice properties: ====" + snsDevice.getProperties());
						//boolean result2 = topoApi.addObject(upsDevice);

						 boolean result2 = topoApi.addObject(snsDevice);
						 System.err.println("snsDevice added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} 
			
			/*else if ((mo.getName().equals("10.208.33.72")) || (mo.getName().equals("10.208.33.74"))
					|| (mo.getName().equals("10.208.33.62")) || (mo.getName().equals("10.208.33.64"))
					|| (mo.getName().equals("10.208.33.68")) || (mo.getName().equals("10.208.33.73"))
					|| (mo.getName().equals("10.208.33.75")) || (mo.getName().equals("10.208.33.63"))
					|| (mo.getName().equals("10.208.33.65")) || (mo.getName().equals("10.208.33.69"))) {

				// TODO Second step: Here you can create an instance of your
				// modeled
				// object
				// Please make sure that the below line is replaced by your
				// extended
				// managed object.
				System.err.println("I am in if condition of SAN ====" + mo.getDisplayName());

				SANServers sanServers = new SANServers();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					sanServers.setDisplayName(result + "_SAN");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				sanServers.setProperties(mo.getProperties());
				sanServers.setName(result + "_SAN");

				sanServers.setClassname("com.dgca.san.SANServers");
				sanServers.setType("SAN");
				sanServers.setStatusPollEnabled(true);
				sanServers.setTester("usertest");
				sanServers.setPollInterval(10);
				sanServers.setUClass("com.dgca.test.URLPing");
				sanServers.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(sanServers.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("sanServers properties: ====" + sanServers.getProperties());
						boolean result2 = topoApi.addObject(sanServers);

						// boolean result2 = topoApi.addObject(upsDevice);
						System.err.println("sanServers added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} */
			    /*else if ((mo.getName().equals("10.131.128.5")) || (mo.getName().equals("10.131.128.69"))
					|| (mo.getName().equals("10.131.134.229")) || (mo.getName().equals("10.131.135.5"))) {

				// TODO Second step: Here you can create an instance of your
				// modeled
				// object
				// Please make sure that the below line is replaced by your
				// extended
				// managed object.
				System.err.println("I am in if condition of CMS ====" + mo.getDisplayName());

				CMSDevice cmsDevice = new CMSDevice();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					cmsDevice.setDisplayName(result + "_CMS");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				cmsDevice.setProperties(mo.getProperties());
				cmsDevice.setName(result + "_CMS");

				cmsDevice.setClassname("com.dgca.cms.CMSDevice");
				cmsDevice.setType("CMS");
				cmsDevice.setStatusPollEnabled(true);
				cmsDevice.setTester("usertest");
				cmsDevice.setPollInterval(10);
				cmsDevice.setUClass("com.dgca.test.URLPing");
				cmsDevice.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(cmsDevice.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("CMSDevice properties: ====" + cmsDevice.getProperties());
						boolean result2 = topoApi.addObject(cmsDevice);

						// boolean result2 = topoApi.addObject(upsDevice);
						System.err.println("CMSDevice added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} */
		} /*else if (((SnmpNode) mo).getType().equals("APC")) { 
			System.out.println("We are in AC block");
			 if ((mo.getName().equals("10.131.128.11")) || (mo.getName().equals("10.131.128.12"))
					|| (mo.getName().equals("10.131.128.13")) || (mo.getName().equals("10.131.128.14"))
					|| (mo.getName().equals("10.131.128.71")) || (mo.getName().equals("10.131.128.72"))
					|| (mo.getName().equals("10.131.128.73")) || (mo.getName().equals("10.131.128.74"))) {
					System.out.println("We are in AC block if method");
				System.err.println("I am in if condition of AC ====" + mo.getDisplayName());

				ACDevices acDevices = new ACDevices();
				SnmpTarget target = new SnmpTarget();
				target.setTargetHost(mo.getName()); // setting the hostname of
													// the
													// device to query
				target.setTargetPort(((SnmpNode) mo).getSnmpport()); // setting
																		// the
																		// snmpport
																		// to
																		// which
																		// queries
																		// will
																		// be
																		// sent
				target.setCommunity(((TopoObject) mo).getCommunity()); // setting
																		// the
																		// community

				// code snippet for querying the device

				SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.1.5.0");
				target.setSnmpOID(oid1);
				String errorMsg = null;
				String result = target.snmpGet();
				if (result == null || result.equalsIgnoreCase("null")) // This
																		// means
																		// error
																		// occurred
																		// in
																		// retrieving
																		// the
																		// property
																		// from
																		// the
																		// device
					errorMsg = target.getErrorString(); // print or log this
														// error
														// message as required.
				else {

					acDevices.setDisplayName(result + "_AC");

					System.out.println("result of snmp query " + result);

					// If we get here, the query was successful in retrieving
					// the
					// property from the device
					// so we need to set it to the switchObj.
					// upsDevice.setTestProperty(result); //say the name of the
					// property is TestProperty.
				}

				acDevices.setProperties(mo.getProperties());
				acDevices.setName(result + "_AC");

				acDevices.setClassname("com.dgca.ac.ACdevices");
				acDevices.setType("AC");
				acDevices.setStatusPollEnabled(true);
				acDevices.setTester("usertest");
				acDevices.setPollInterval(10);
				//acDevices.setUClass("com.dgca.test.URLPing");
				acDevices.setLocation("kuwait");

				System.err.println("NEW_DEBUG: ####################After setting usertester and poll interval");

				Properties props = mo.getProperties();

				// TODO Fourth Step: Query the device for any additional
				// properties
				// Below code shows sample for querying an SNMP Device.

				// TODO Fifth Step: Return the custom object instance so it can
				// be
				// added to the database by WebNMS framework
				// or do the process of adding the MO yourself using TopoAPI
				// say we choose to add the MO to DB here inside the filter
				// itself,
				// then we need to do it in transaction.
				if (transactionAPI == null) {
					initTransactionAPI();
				}
				beginTransaction();

				try {
					boolean checkMO = topoApi.isManagedObjectPresent(acDevices.getName());
					System.err.println("result of checkMo: ====" + checkMO);

					if (!checkMO) // This implies an object with this name is
									// not
									// already present in DB hence we can add
									// this
									// object
					{
						System.err.println("acDevices properties: ====" + acDevices.getProperties());
						boolean result2 = topoApi.addObject(acDevices);

						// boolean result2 = topoApi.addObject(upsDevice);
						System.err.println("acDevices added. result is  " + result2);
						// NOTE: as we have added the object to database we must
						// return null
					} else {
						// TODO log an error saying object with same name
						// already
						// exists.
					}
					commitTransaction();
					System.err.println("After commitTransaction: ====");
				} catch (java.rmi.RemoteException re) {
					// NmsLogMgr is the default logging framework for WebNMS,
					// its
					// use here is optional.
					// You can use some other logging framework instead.
					NmsLogMgr.TOPOERR.fail(" RemoteException while adding/updating the object ", re);
					rollbackTransaction(re);
				} catch (com.adventnet.nms.store.NmsStorageException nse) {
					NmsLogMgr.TOPOERR.fail(" NmsStorageException while adding/updating the object ", nse);
					rollbackTransaction(nse);
				} catch (com.adventnet.management.transaction.UserTransactionException ute) {
					NmsLogMgr.TOPOERR.fail(" UserTransactionException while adding/updating the object  ", ute);
					rollbackTransaction(ute);
				} catch (Exception e) {
					e.printStackTrace();
					NmsLogMgr.TOPOERR.fail(" Exception while adding/updating the object  ", e);
					rollbackTransaction(e);
				}
			} 
		}*/
		
		
		return mo;
	}

	private void initTransactionAPI() {
		try {
			transactionAPI = NmsUtil.relapi.getTransactionAPI();
		} catch (Exception ex) {
			NmsLogMgr.TOPOERR.fail("Exception in getting the handle of TransactionAPI ", ex);
		}
	}

	private void beginTransaction() {
		try {
			transactionAPI.begin();
		} catch (javax.transaction.NotSupportedException nse) {
		} catch (Exception ex) {
			NmsLogMgr.TOPOERR.fail("Exception in beginning the transaction ", ex);
		}
	}

	private void commitTransaction() {
		try {
			transactionAPI.commit();
		} catch (Exception ex) {
			NmsLogMgr.TOPOERR.fail("Exception in committing the transaction ", ex);
		}
	}

	private void rollbackTransaction(Exception exception) {
		try {
			transactionAPI.rollback(exception.getMessage());
		} catch (Exception ex) {
			NmsLogMgr.TOPOERR.fail("Exception in rolling back the transaction ", ex);
		}
	}

}
