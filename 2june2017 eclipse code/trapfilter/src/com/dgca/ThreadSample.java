package com.dgca;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ThreadSample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("Thread class called");
		MyThread mt = new MyThread();
		Thread t = new Thread(mt);
		t.start();
		ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
		executor.scheduleAtFixedRate(mt, 5, 120, TimeUnit.SECONDS);
		System.out.println("Thread class ended");

	}

}
