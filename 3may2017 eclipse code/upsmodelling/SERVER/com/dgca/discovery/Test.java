package com.dgca.discovery;

import com.adventnet.snmp.beans.SnmpTarget;
import com.adventnet.snmp.snmp2.SnmpOID;

public class Test {

	public static void main(String[] args) {

		// TODO Auto-generated method stub

		SnmpTarget target = new SnmpTarget();
		target.setTargetHost("10.131.134.164");
		//target.setTargetHost("10.192.18.11");
		target.setTargetPort(161);

		target.setCommunity("kcmcsnmp");

		SnmpOID oid1 = new SnmpOID(".1.3.6.1.2.1.33.1.2.2.0");
		target.setSnmpOID(oid1);
		String errorMsg = null;
		String result = target.snmpGet();
		System.out.println("result" + result);
		if (result == null || result.equalsIgnoreCase("null")) // This means
																// error
		{ // occurred
			// in
			// retrieving
			// the
			// property
			// from the
			// device
			errorMsg = target.getErrorString();
			System.out.println(errorMsg);// print or log this error
		} // message as required.
		else {

			System.out.println("result of snmp query " + result);

		}
	}
}
