
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>Device ID</th>
			<th>ClearedAlarms</th>
			<th>CriticalAlarms</th>
			<th>DeviceName</th>
			<th>DeviceType</th>
			<th>IpAddress</th>
			
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			String sql = "select deviceId, clearedAlarms, criticalAlarms, deviceName, deviceType, ipAddress from devices_details";
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
					System.out.println("JSP Alarm ID" + rs.getInt("deviceId"));
					int deviceId = rs.getInt(1);
					String clearedAlarms = rs.getString("clearedAlarms");
					String criticalAlarms = rs.getString("criticalAlarms");
					String deviceName = rs.getString("deviceName");
					String deviceType = rs.getString("deviceType");
					String ipAddress = rs.getString("ipAddress");
		%>
		<tr>
			<td><%=deviceId%></td>
			<td><%=clearedAlarms%></td>
			<td><%=criticalAlarms%></td>
			<td><%=deviceName%></td>
			<td><%=deviceType%></td>
			<td><%=ipAddress%></td>


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
