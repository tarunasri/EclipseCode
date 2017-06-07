
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>Device ID</th>
			<th>Ciscoidentitycapable</th>
			<th>Contact</th>
			<th>Devicename</th>
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			
			
			String sql = "select inv.deviceId, su.su_ciscoidentitycapable, su.su_contact, su.su_devicename from inventory_details inv,summary su  where inv.deviceId=su.deviceId";
			
			String url = "jdbc:mysql://localhost:3306/infracentraldb";
			String id = "root";
			String pass = "root";
			try {

				Class.forName("com.mysql.jdbc.Driver");
				con = java.sql.DriverManager.getConnection(url, id, pass);

			} catch (ClassNotFoundException cnfex) {
				cnfex.printStackTrace();

			}

			try {
				s = con.createStatement();
				rs = s.executeQuery(sql);
				while (rs.next()) {
					System.out.println("JSP Device ID" + rs.getInt("deviceId"));
					int deviceId = rs.getInt(1);
					String ciscoidentitycapable = rs.getString("su_ciscoidentitycapable");
					String contact = rs.getString("su_contact");
					String devicename = rs.getString("su_devicename");
		%>
		<tr>
			<td><%=deviceId%></td>
			<td><%=ciscoidentitycapable%></td>
			<td><%=contact%></td>
			<td><%=devicename%></td>


		</tr>
		<%
			}
		%>

		<%
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					rs.close();
				if (s != null)
					s.close();
				if (con != null)
					con.close();
			}
		%>
	
</body>
</html>
