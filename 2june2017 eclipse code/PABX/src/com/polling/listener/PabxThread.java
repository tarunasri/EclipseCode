package com.polling.listener;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import jcifs.smb.SmbException;
import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileInputStream;

public class PabxThread implements Runnable {

	private ServletContext sc = null;
	Connection con = null;

	public PabxThread(ServletContext sc) {

		this.sc = sc;

	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		EventAddingTest eventAddingTest = new EventAddingTest();

		System.out.println("Concurrent thread started running.. ");
		// System.out.println("Servlet Context Path" + sc.getContextPath());
		StringBuilder builder = new StringBuilder();
		// System.out.println("Servlet Context Path" + sc.getRealPath("/"));

		FileReader fr = null;
		File file=new File(sc.getRealPath("/") + "pBXCRT1.txt");
		try {
			fr = new FileReader(file);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		BufferedReader br = new BufferedReader(fr);
		String line;
		boolean data = false;
		// StringBuilder builder = null;
		ArrayList l = new ArrayList();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infracentraldb", "root", "MyNewPass4!");
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

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

						// l.add(builder.toString());
						eventAddingTest.mainHandler(builder.toString(), con);
						builder = null;
					}

					// System.out.println(line);

				}

			}

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			file.delete();
			file.createNewFile();
			fr.close();
			con.close();

			// pabx delete file

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static void readFileContent(SmbFile sFile, StringBuilder builder) {
		BufferedReader reader = null;
		boolean data = false;
		try {
			reader = new BufferedReader(new InputStreamReader(new SmbFileInputStream(sFile)));
		} catch (SmbException ex) {
			Logger.getLogger(PabxThread.class.getName()).log(Level.SEVERE, null, ex);
		} catch (MalformedURLException ex) {
			Logger.getLogger(PabxThread.class.getName()).log(Level.SEVERE, null, ex);
		} catch (UnknownHostException ex) {
			Logger.getLogger(PabxThread.class.getName()).log(Level.SEVERE, null, ex);
		}
		String lineReader = null;
		{
			try {
				while ((lineReader = reader.readLine()) != null) {

					lineReader = lineReader.trim(); // remove leading and
													// trailing whitespace

					if (!lineReader.equals("")) // don't write out blank lines
					{

						if (data == true) {
							builder.append(lineReader + ";");
						}
						if (lineReader.equals("SPONTANEOUS PRINTOUT")) {
							data = true;
							builder = new StringBuilder();

						}

						if (lineReader.equals("LOGGED OFF")) {
							data = false;
							System.out.println(builder.toString());

							// l.add(builder.toString());
							EventAddingTest eventAddingTest = new EventAddingTest();
							eventAddingTest.mainHandler(builder.toString(), null);
							builder = null;
						}

					}

				}
			} catch (IOException exception) {
				exception.printStackTrace();
			} finally {
				try {
					reader.close();
				} catch (IOException ex) {
					Logger.getLogger(PabxThread.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
		}

	}

	public ServletContext getSc() {
		return sc;
	}

	public void setSc(ServletContext sc) {
		this.sc = sc;
	}

}
