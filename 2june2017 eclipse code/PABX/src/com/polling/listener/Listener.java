package com.polling.listener;

import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Listener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {

		ServletContext sc = arg0.getServletContext();

		Properties prop = new Properties();
		try {
			// prop.load(sc.getResourceAsStream("/WEB-INF/properties/config.properties"));
			System.out.println("My Polling Listener Class try Block");

			System.out.println("Servlet Context Path" + sc.getRealPath("/"));
			PabxThread pt = new PabxThread(sc);
			Thread t = new Thread(pt);
			t.start();
			//ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
			//executor.scheduleAtFixedRate(pt, 5, 120, TimeUnit.SECONDS);

		} catch (Exception e) {

			System.err.println("My Polling Listener Class Catch Block");
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

}