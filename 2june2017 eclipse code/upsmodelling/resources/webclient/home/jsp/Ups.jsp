<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>

<table width="97%" cellspacing="0" cellpadding="3" border="0"
	align="center" style="margin-top: 7px; margin-bottom: 7px;">

	<tr>

		<td nowrap="" valign="middle" align="center" class="configParams"
			style="padding-left: 10px;">

			<div style="padding: 3px; text-align: center;">
				<body>
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(
									"jdbc:mysql://10.208.0.82:3306/WebNmsDB", "master",
									"public");
							PreparedStatement st = con
									.prepareStatement("select * from ManagedObject where TYPE='UPS'");
							ResultSet resultset = st.executeQuery();
					%>



					<TABLE BORDER="1">
						<TR>

							<TH>NAME</TH>
							<TH>TYPE</TH>
							
						</TR>

						<%
							while (resultset.next()) {
						%>

						<TR>

							<TD><%=resultset.getString(3)%></TD>
							<TD><%=resultset.getString(18)%></TD>
							

						</TR>
						<%
							}
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</TABLE>
					<BR>
				</html>