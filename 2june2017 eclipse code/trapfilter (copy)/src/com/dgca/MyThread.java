package com.dgca;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class MyThread implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		EventAddingTest eventAddingTest = new EventAddingTest();

		System.out.println("Concurrent thread started running.. ");

		FileReader fr = null;
		try {
			fr = new FileReader("pBXCRT1.txt");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		BufferedReader br = new BufferedReader(fr);
		String line;
		boolean data = false;
		StringBuilder builder = null;
		ArrayList l = new ArrayList();
		try {
			while ((line = br.readLine()) != null) {
				line = line.trim(); // remove leading and trailing whitespace
				if (!line.equals("")) // don't write out blank lines
				{

					if (data == true) {
						builder.append(line + ";");
					}
					if (line.equals("SPONTANEOUS PRINTOUT")) {
						data = true;
						builder = new StringBuilder();

					}

					if (line.equals("LOGGED OFF")) {
						data = false;
						System.out.println(builder.toString());
						
						l.add(builder.toString());
						eventAddingTest.mainHandler(builder.toString(), "1");
						builder = null;
					}

					// System.out.println(line);

				}

			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*for (Iterator iterator = l.iterator(); iterator.hasNext();) {
			String object = (String) iterator.next();
			System.out.println("Start of Parsing data");

			System.out.println(object);

			String sever = "1";
			String msg=object;
			
		
		}*/

		try {
			fr.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
