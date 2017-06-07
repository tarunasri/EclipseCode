
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>NbrAlarmedAPs</th>
			<th>NbrAlarmedClients</th>
			<th>NbrAlarmedDevices</th>
			<th>NbrAlarmedSites</th>
			<th>TotalAlarms</th>
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			String sql = "select nbrAlarmedAPs, nbrAlarmedClients, nbrAlarmedDevices, nbrAlarmedSites,totalAlarms from alarms_summary";
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
					
					String nbrAlarmedAPs = rs.getString("nbrAlarmedAPs");
					String nbrAlarmedClients = rs.getString("nbrAlarmedClients");
					String nbrAlarmedDevices = rs.getString("nbrAlarmedDevices");
					String nbrAlarmedSites = rs.getString("nbrAlarmedSites");
					String totalAlarms = rs.getString("totalAlarms");
		%>
		<tr>
			<td><%=nbrAlarmedAPs%></td>
			<td><%=nbrAlarmedClients%></td>
			<td><%=nbrAlarmedDevices%></td>
			<td><%=nbrAlarmedSites%></td>
			<td><%=totalAlarms%></td>


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
