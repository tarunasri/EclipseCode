
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>Alarm ID</th>
			<th>AcknowledgementStatus</th>
			<th>AlarmFoundAt</th>
			<th>DeviceName</th>
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			String sql = "select alarmId, acknowledgementStatus, alarmFoundAt, deviceName from alarms_details";
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
					System.out.println("JSP Alarm ID" + rs.getInt("alarmId"));
					int alarmId = rs.getInt(1);
					String acknowledgementStatus = rs.getString("acknowledgementStatus");
					String alarmFoundAt = rs.getString("alarmFoundAt");
					String deviceName = rs.getString("deviceName");
		%>
		<tr>
			<td><%=alarmId%></td>
			<td><%=acknowledgementStatus%></td>
			<td><%=alarmFoundAt%></td>
			<td><%=deviceName%></td>


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
