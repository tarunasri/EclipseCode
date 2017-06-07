package com.dgca;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.TrapFilter;
import com.adventnet.nms.topodb.ManagedObject;
import com.adventnet.snmp.snmp2.SnmpAPI;
import com.adventnet.snmp.snmp2.SnmpPDU;

public class TrapSamplebak implements TrapFilter {

//172.18.18.12:KCMCT27R9-KLSTCKAS01.dgca.gov.kw	    KCMCT27R9-KLSTCKAS01.dgca.gov.kw
	/**
	 * serialVersionUID 
	 */
	private static final long serialVersionUID = 1L;
	Event event = null;
	ManagedObject obj = null;
	ExternalSystemsImpl externalSystemsImpl=new ExternalSystemsImpl();

	@Override
	public Object applyTrapFilter(SnmpPDU pdu) {
		
		
	    String remoteHostAdress=pdu.getRemoteHost();
	
		try {
			if (pdu.getVersion() == SnmpAPI.SNMP_VERSION_2 || pdu.getVersion() == SnmpAPI.SNMP_VERSION_2C
					|| pdu.getVersion() == SnmpAPI.SNMP_VERSION_3) {

				if (remoteHostAdress == null) {
					return pdu;
				}
				if (remoteHostAdress.equals(DgcaConstants.SIL_SNS1) || remoteHostAdress.equals(DgcaConstants.SIL_SNS2)
						|| remoteHostAdress.equals(DgcaConstants.SIL_SNS3)
						|| remoteHostAdress.equals(DgcaConstants.SIL_SNS4)
						|| remoteHostAdress.equals(DgcaConstants.SIL_SNS5)
						|| remoteHostAdress.equals(DgcaConstants.SIL_SNS6)
						|| remoteHostAdress.equals(DgcaConstants.SIL_SNS7)) {
					System.out.println("SNS Firewalls Block Invoked in TrapSample Class" + remoteHostAdress);

					return null;

				} else if (remoteHostAdress.equals(DgcaConstants.SIL_CISCO_PRIME)) {
					Event eventReturned = externalSystemsImpl.getCiscoEvent(pdu, event);
					return eventReturned;

				} else if (remoteHostAdress.equals(DgcaConstants.SIL_TBLDBE207_KMMGMTCP01_CMS)
						|| remoteHostAdress.equals(DgcaConstants.SIL_TBLDBM112_KMMGMTCP01_CMS)
						|| remoteHostAdress.equals(DgcaConstants.SIL_KCMCG08_KMMGMTCP01_CMS)
						|| remoteHostAdress.equals(DgcaConstants.SIL_KCMCG68_KMMGMTCP01_CMS)) {
					Event eventReturned = externalSystemsImpl.getCmsEvent(pdu, event);
					return eventReturned;

				} else if (remoteHostAdress.equals(DgcaConstants.SIL_CISCO_PRIME_PRO1)
						|| remoteHostAdress.equals(DgcaConstants.SIL_CISCO_PRIME_PRO2)) {
					Event eventReturned = externalSystemsImpl.getCiscoPrimeProvisioningEvent(pdu, event);
					return eventReturned;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return pdu;
	}
}
