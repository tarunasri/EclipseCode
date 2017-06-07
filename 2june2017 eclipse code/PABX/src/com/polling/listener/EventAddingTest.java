package com.polling.listener;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;

public class EventAddingTest {

	private String msg = null;
	private String sever = null;

	public EventAddingTest() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * public static void main(String[] args) {
	 * 
	 * String msg =
	 * "IDENTITY: KUWAIT-AIRPORT;VERSION: CXP1010101/4/TSWSP06/R7D;DATE: 20NOV16   TIME: 11:37:05;CLASS: 1;261  NO CONNECTION WITH OPERATOR CONSOLE;DATE     TIME      ALP  NOIF  EQU          BRDID  INF1;20NOV16  11:37:04  12   1     001-2-00-00  77     9;LOGGED OFF"
	 * ;
	 * 
	 * String sever = "1"; EventAddingTest eventAddingTest = new
	 * EventAddingTest(); eventAddingTest.mainHandler(msg, sever);
	 * 
	 * }
	 */

	public void mainHandler(String msg, Connection con) {

		StringTokenizer st = new StringTokenizer(msg, ";");
		if (st.hasMoreTokens()) {

			String one = st.nextToken();
			String two = st.nextToken();
			String three = st.nextToken();
			String classSeverity = st.nextToken();
			String description = st.nextToken();
			String rows = st.nextToken();
			String rowValues = st.nextToken();
			String date = "";
			String time = "";
			String alp = "";
			String noIf = "";
			String EQU = "";
			String unit = "";

			// System.out.println(one);
			// System.out.println(two);
			// System.out.println(three);
			System.out.println(classSeverity);
			System.out.println(description);

			System.out.println(rows.replaceAll("\\s{2,}", " ").trim());
			System.out.println(rowValues.replaceAll("\\s{2,}", " ").trim());
			String[] rowsArray = rows.replaceAll("\\s{2,}", " ").trim().split("\\ ");
			String[] rowsValuesArray = rowValues.replaceAll("\\s{2,}", " ").trim().split("\\ ");

			if (rowsArray[4].equals("UNIT")) {

				for (int i = 0; i < rowsArray.length; i++) {
					// System.out.println("Columns" + rowsArray[i]);
					if (rowsArray[i].equals("DATE")) {
						date = rowsValuesArray[0];

					}
					if (rowsArray[i].equals("TIME")) {
						time = rowsValuesArray[1];

					}
					if (rowsArray[i].equals("ALP")) {
						alp = rowsValuesArray[2];

					}
					if (rowsArray[i].equals("NOIF")) {
						noIf = rowsValuesArray[3];

					}
					if (rowsArray[i].equals("UNIT")) {
						unit = rowsValuesArray[4];

					}
					if (rowsArray[i].equals("EQU")) {
						EQU = rowsValuesArray[5];

					}

				}
				System.out.println("DATE:" + date);
				System.out.println("TIME:" + time);
				System.out.println("ALP:" + alp);
				System.out.println("NOIF:" + noIf);
				System.out.println("UNIT:" + unit);
				System.out.println("EQU:" + EQU);

				PreparedStatement stmt;
				try {
					stmt = con.prepareStatement("insert into pabx_alarms(class_type,description,pabx_date,pabx_time,alp,noif,equ,unit) values(?,?,?,?,?,?,?,?)");
					stmt.setString(1, classSeverity);
					stmt.setString(2, description);
					stmt.setString(3, date);
					stmt.setString(4, time);
					stmt.setString(5, alp);
					stmt.setString(6, noIf);
					stmt.setString(7, EQU);
					stmt.setString(8, unit);

					int i = stmt.executeUpdate();
					System.out.println(i + " records inserted");

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			} else {
				for (int i = 0; i < rowsArray.length; i++) {
					// System.out.println("Columns" + rowsArray[i]);
					if (rowsArray[i].equals("DATE")) {
						date = rowsValuesArray[0];

					}
					if (rowsArray[i].equals("TIME")) {
						time = rowsValuesArray[1];

					}
					if (rowsArray[i].equals("ALP")) {
						alp = rowsValuesArray[2];

					}
					if (rowsArray[i].equals("NOIF")) {
						noIf = rowsValuesArray[3];

					}
					if (rowsArray[i].equals("EQU")) {
						EQU = rowsValuesArray[4];

					}

				}
				System.out.println("DATE:" + date);
				System.out.println("TIME:" + time);
				System.out.println("ALP:" + alp);
				System.out.println("NOIF:" + noIf);
				System.out.println("EQU:" + EQU);
				PreparedStatement stmt;
				try {
					stmt = con.prepareStatement("insert into pabx_alarms(class_type,description,pabx_date,pabx_time,alp,noif,equ,unit) values(?,?,?,?,?,?,?,?)");
					stmt.setString(1, classSeverity);
					stmt.setString(2, description);
					stmt.setString(3, date);
					stmt.setString(4, time);
					stmt.setString(5, alp);
					stmt.setString(6, noIf);
					stmt.setString(7, EQU);
					stmt.setString(8, "");


					int i = stmt.executeUpdate();
					System.out.println(i + " records inserted");

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}

		}

	}

}
