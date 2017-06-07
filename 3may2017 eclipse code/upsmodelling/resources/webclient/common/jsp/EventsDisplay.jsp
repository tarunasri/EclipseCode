
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>Event ID</th>
			<th>Correlated</th>
			<th>DeviceName</th>
			<th>EventFoundAt</th>
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			String sql = "select eventId, correlated, deviceName, eventFoundAt from events_details";
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
					System.out.println("JSP Alarm ID" + rs.getInt("eventId"));
					int eventId = rs.getInt(1);
					String correlated = rs.getString("correlated");
					String deviceName = rs.getString("deviceName");
					String eventFoundAt = rs.getString("eventFoundAt");
		%>
		<tr>
			<td><%=eventId%></td>
			<td><%=correlated%></td>
			<td><%=deviceName%></td>
			<td><%=eventFoundAt%></td>


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
