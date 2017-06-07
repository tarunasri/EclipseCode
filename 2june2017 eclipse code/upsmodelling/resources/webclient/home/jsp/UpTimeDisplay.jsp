
<html>

<head>
<meta http-equiv="refresh" content="300">
<title>Enter to database</title>
</head>


<body>
	<table>
		<tr>
			<th>ApplicationUptime</th>
			<th>defaultGateway</th>
			<th>domainName</th>
			<th>hostName</th>
			<th>serverUptime</th>
		</tr>
		<%@ page import="java.util.*"%>
		<%@ page import="javax.sql.*"%>
		<%
			java.sql.Connection con = null;
			java.sql.Statement s = null;
			java.sql.ResultSet rs = null;

			// Remember to change the next line with your own environment
			String sql = "select applicationUptime, defaultGateway, domainName, hostName, serverUptime from applicationinfo_uptime";
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
					
					String applicationUptime = rs.getString("applicationUptime");
					String defaultGateway = rs.getString("defaultGateway");
					String domainName = rs.getString("domainName");
					String hostName = rs.getString("hostName");
					String serverUptime = rs.getString("serverUptime");
		%>
		<tr>
			<td><%=applicationUptime%></td>
			<td><%=defaultGateway%></td>
			<td><%=domainName%></td>
			<td><%=hostName%></td>
			<td><%=serverUptime%></td>


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
