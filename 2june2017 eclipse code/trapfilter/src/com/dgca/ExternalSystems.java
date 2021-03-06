package com.dgca;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.snmp.snmp2.SnmpPDU;

public interface ExternalSystems {
	
	public Event getCiscoEvent(SnmpPDU pdu,Event event);
	public Event getCmsEvent(SnmpPDU pdu,Event event);
	public Event getCiscoPrimeProvisioningEvent(SnmpPDU pdu,Event event);


}
