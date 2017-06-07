package com.dgca;

import com.adventnet.nms.alertdb.Alert;
import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.FilterClient;

public class EventFilterSample implements FilterClient {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Event filter(Event event) {
		// TODO Auto-generated method stub
		System.out.println("Event Severity" + event.getSeverity());
		// if (event.getSeverity() < 0) {
		// System.out.println("Event SNMPPDU" +
		// event.getSnmpPDU().getRemoteHost());
		// event.setSeverity(1);
		// event.setText("Text Critical Message " + event.getSource());
		/*
		 * try { System.out.println("Event Agent Addre:" +
		 * event.getSnmpPDU().getAgentAddr()); } catch (Exception e) {
		 * System.out.println("My Event Filter Exception" + e.getMessage()); }
		 */

		// }
		/*
		 * if (event.getText() == null || event.getText().trim().equals("")) {
		 * event.setText("Text Critical Message " + event.getSource()); }
		 */
		event.setSeverity(event.getSeverity());
		event.setText(event.getText());
		System.out.println("Message: " + event.getText());
		return event;
	}

	@Override
	public Alert filter(Alert alert) {
		// TODO Auto-generated method stub
		System.out.println("Alert Filter Called " + alert.getSeverity());
		System.err.println("Alert's properties: " + alert.getProperties());
		return alert;
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

}
