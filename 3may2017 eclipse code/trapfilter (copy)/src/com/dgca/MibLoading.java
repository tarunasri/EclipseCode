package com.dgca;

import com.adventnet.snmp.mibs.MibModule;
import com.adventnet.snmp.mibs.MibNode;
import com.adventnet.snmp.mibs.MibOperations;
import com.adventnet.snmp.snmp2.SnmpOID;

public class MibLoading {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MibOperations mibops = new MibOperations();

		try {

			//MibModule module = mibops.loadMibModule("/root/Desktop/UMS/infracentraltest/infracentral/mibs/RTUFIBER-VARIABLES-MIB");
			MibModule module = mibops.loadMibModule("/root/Desktop/UMS/infracentraltest/infracentral/mibs/RFC1213-MIB");
			System.out.println("Mib loaded : " + module);
			//SnmpOID oid = mibops.getSnmpOID("1.3.6.1.2.1.1.1");
			//System.out.println("Oid : " + oid);
			
			MibNode node = mibops.getMibNode("sysDescr");
			System.out.println("Node : " + node);
			
			MibNode node1 = mibops.getMibNode("1.3.6.1.2.1.1.3");
			System.out.println("Node1 : " + node1);
		}

		catch (Exception ex) {

			System.err.println("Error loading MIBs: " + ex);

		}
	}

}
