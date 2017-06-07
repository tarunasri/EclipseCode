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
		
			
			
		} catch (Exception e) {

			System.err.println("Errror : Configuration Properties File Not Found");
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

}