package com.dgca.discovery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {
	
public Connection getdatabaseConnection(){
	Connection conn=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/dgcadbtest3", "master",
				"public");
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
public String gethostName(String ipAddress, Connection conn){
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	String Name="";
	String DisplayName="";
	
	String sql = "select * from  DGCAMapping where ipaddress="+"'"+ipAddress+"'";
	System.out.println("query"+sql);
	
	try {
		pstmt = conn.prepareStatement(sql);
		

		//String sql = "select * from  DGCAMapping where ipaddress=172.18.18.19";
		 rs = pstmt.executeQuery(sql);
		
		while (rs.next()) {
			// Retrieve by column name
			Name = rs.getString("NAME");
			DisplayName= rs.getString("DISPLAYNAME");

			System.out.print(", NAME: " + Name);
			System.out.println(", DISPLAYNAME: " + DisplayName);
		}
		System.out.println("Name Length"+Name.length()		);
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
return Name;	
}

}
