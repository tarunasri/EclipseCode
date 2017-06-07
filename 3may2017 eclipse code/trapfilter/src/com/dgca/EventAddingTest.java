package com.dgca;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.EventAPI;
import com.adventnet.nms.fault.FaultException;
import com.adventnet.nms.store.NmsStorageException;

public class EventAddingTest {

	private String msg = null;
	private String sever = null;

	public EventAddingTest() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {

		String msg = "IDENTITY: KUWAIT-AIRPORT;VERSION: CXP1010101/4/TSWSP06/R7D;DATE: 20NOV16   TIME: 11:37:05;CLASS: 1;261  NO CONNECTION WITH OPERATOR CONSOLE;DATE     TIME      ALP  NOIF  EQU          BRDID  INF1;20NOV16  11:37:04  12   1     001-2-00-00  77     9;LOGGED OFF";

		String sever = "1";
		EventAddingTest eventAddingTest = new EventAddingTest();
		eventAddingTest.mainHandler(msg, sever);

	}

	public void mainHandler(String msg, String sever) {

		String categ = "Topology";
		String failObj = "10.131.128.100";
		String node="10.131.128.100";
		String source = "10.131.128.100";

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
		// System.out.println(eventAPI);

		// String severity="2";

		Event event = new Event();
		event.setCategory(categ);
		event.setText(msg);
		event.setSeverity(3);
		event.setEntity(failObj);
		event.setSource(source);
		event.setTime(System.currentTimeMillis());
		try {
			try {
				eventAPI.addEvent(event);
			} catch (RemoteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// eventAPI.addEvent(inputEvent);
		} catch (NmsStorageException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (FaultException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			int count = eventAPI.getTotalEventCount();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
