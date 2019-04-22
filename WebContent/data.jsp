<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.TimeZone" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data</title>
</head>
<body>
	<table class="updates" id="UpdatesTable" border="1">
						<tr>
           			    	<th style="color:white; font-size:28px;">Updates:</th>
           			    </tr>
           			    <%
							try
							{
								String userID = session.getAttribute("UserID").toString();
								Class.forName("com.mysql.cj.jdbc.Driver");
								String url="jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();;
								String username="b8c39ba9e35da7";
								String password="ebcfebb1";
								String query="SELECT * FROM Updates WHERE UserID="+userID+" ORDER By UpdateID ASC";
								Connection conn = DriverManager.getConnection(url,username,password);
								Statement st = conn.createStatement();
								ResultSet rs = st.executeQuery(query);
								while(rs.next())
								{

								%>
    								<tr><td style="color: white; " width="300" align="center"><%=rs.getString("content") %></td>
								   </tr>
        						<%

								}
							
						%>
    						</table>
    						<%
    						rs.close();
    						st.close();
    						conn.close();
    						}
						catch(Exception e)
						{
    						e.printStackTrace();
    						}

						%>
</body>
</html>