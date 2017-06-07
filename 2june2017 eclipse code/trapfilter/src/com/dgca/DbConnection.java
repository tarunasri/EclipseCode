package com.dgca;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {

	public Connection getdatabaseConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/dgcadbtest3", "master", "public");
			System.out.println("Connecting to a MYSQL database...");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	
	public String getName(String ipAddress, Connection conn) {
		// PreparedStatement pstmt = null;
		ResultSet rs = null;
		String  name = null;

		// String sql = "select * from DGCAMapping where ipaddress=" + "'" +
		// ipAddress + "'";
		String sql = "select IpAddress from  DGCAMapping where IpAddress=?";
		System.out.println("query" + sql);

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ipAddress);

			// String sql = "select * from DGCAMapping where
			// ipaddress=172.18.18.19";
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				name=rs.getString(2);
				System.out.println("fetching data from DGCAMapping");
			} 
			rs.close();
			pstmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}	
	
	
	public boolean checkrecordExists(String ipAddress, Connection conn) {
		// PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean status = false;

		// String sql = "select * from DGCAMapping where ipaddress=" + "'" +
		// ipAddress + "'";
		String sql = "select IpAddress from  DGCAMapping where IpAddress=?";
		System.out.println("query" + sql);

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ipAddress);

			// String sql = "select * from DGCAMapping where
			// ipaddress=172.18.18.19";
			rs = pstmt.executeQuery(sql);
			if (!rs.next()) {
				status = false;
				System.out.println("resultset does not data");
			} else {
				status = true;
			}
			rs.close();
			pstmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}		
	public  void insertRecord(String ipAddress,String name,String displayName,Connection conn)
	{

		try {
			System.out.println("IpAddress in insertion call" + ipAddress);
			String sqlInsert = "insert into DGCAMapping(IpAddress,NAME,DISPLAYNAME) values(?,?,?)";

			System.out.println("Insert Sql Query" + sqlInsert);

			PreparedStatement pstmt1 = conn.prepareStatement(sqlInsert);
			System.out.println("Prepared Statement" + pstmt1);
			// pstmt1.setInt(1, (Integer) null);
			pstmt1.setString(1, ipAddress);
			pstmt1.setString(2, name);
			pstmt1.setString(3, displayName);
			pstmt1.executeUpdate();
			System.out.println("after insertion " + pstmt1.executeUpdate());
			pstmt1.close();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

}
