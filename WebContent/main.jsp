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
	<script type="text/javascript">
		// displays and hides both types of search bars
		function myFunction() {
			// show Class search bar
			if (document.getElementById("Class").checked == true) {
				document.getElementById("showClassSearch").style.display = "block";
				document.getElementById("showFriendSearch").style.display = "none";
				document.getElementById("showProfessorSearch").style.display = "none";
			}
			// show Friend search bar
			else if (document.getElementById("Friend").checked == true) {
				document.getElementById("showClassSearch").style.display = "none";
				document.getElementById("showFriendSearch").style.display = "block";
				document.getElementById("showProfessorSearch").style.display = "none";
			}
			// show Professor search bar
		} 
		function logout(){
			window.location.replace("login.jsp");
		}
		function sett(){
			window.location.replace("settings.jsp");
		}
		function req(){
			window.location.replace("requirements.jsp");
		}
		function prof(){
			window.location.replace("prof.jsp");
		}
		function man(){
			window.location.replace("main.jsp");
		}
	 	function loadSchedule(){
	 		
	 	}
	 
	</script>
	<meta charset="UTF-8">
	<title>Schedule Builder</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="main.css" />
</head>
<body>
      <div id="background"></div>
      <div class="container-fluid">
        <div class="row">
           <div class="col-lg-3">
             <div id="sidenav">
               <h2>Schedule Builder</h2>
               <ul class="nav nav-pills flex-row" style="justify-content:space-between; align-items:center; padding-top:15px; padding-bottom:15px;">
                 <li class="nav-item">
                   <a class="nav-link" href="profile.jsp">
                     <img src="Images/profile.png" style="width:50px; height:50px" onclick= "prof()">
                   </a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-item" href="settings.jsp">
                       <img src="Images/setting.png" style="width:50px; height:50px" onclick="sett()">
                     </a>
                 </li>
                 <li class="nav-item">
                  <a class="nav-item" href="main.jsp">
                    <img src="Images/schedule.png" style="width:50px; height:50px">
                  </a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-item">
                       <img src="Images/requirements.png" style="width:50px; height:50px" onclick="req()">
                     </a>
                 </li>
               </ul>
               <div id="logout" style="text-align:center">
                 <input type="button" name="submit" id="logoutButton" value="Logout" onclick="logout()">
               </div>
               <form name = "rButton" method = "POST" action = "Results">
						<div id="showClassSearch" class="showClassSearch">
							<input type="text" name="classText" placeholder="Search Class....">
							<button type="submit" name="classSearch"></button>
						</div>
						<div id="showFriendSearch" class="showFriendSearch">
							<input type="text" name="friendText" placeholder="Search Friend...">
							<button type="submit" name="friendSearch"></button>
						</div>
						<div class="radio-button-div">
							<input type="radio" name="option" id="Class" value="Class" checked="checked" onclick="myFunction()">Class 
							<input type="radio" name="option" id="Friend" value="Friend" onclick="myFunction()">Friend 
						</div>
					</form>
               <div class="User" style="font-family:tableTitles; text-align:center">
                 <h3 style="color:white; font-size:28px;">Welcome <%= session.getAttribute("userName") %></h3>
               </div>
               <div class="MM" style="font-family:tableTitles; font-size:28px; color:white">
                 <table class="sidenavtable" align="center">
                   <tbody>
                     <tr>
                       <td>Major:</td>
                       <td><%= session.getAttribute("majorName") %></td>
                     </tr>
                     <tr>
                       <td>Minor:</td>
                       <td><%= session.getAttribute("minorName") %></td>
                     </tr>
                   </tbody>
                 </table>
               </div>
               <div class="Updates" style="font-family:tableTitles; text-align:center; margin-top: 25px;">
                 <h6 style="color:white; font-size:28px;">Updates:</h6>
               </div>
             </div>
           </div>
           <div class="col-lg-9">
           	<div id="nav">
           		<h1>Current Schedule</h1>
           		<form method="post">
           			<table class="schedule" border="1">
           				<tr>
           					<td align="center" valign="middle" width="80"><img src="Images/clock.png" alt="clock" height="50" width="50"></td>
							<td align="center" valign="middle" width="100" style="color: white; font-size: 30px">Monday</td>
							<td align="center" valign="middle" width="100" style="color: white; font-size: 30px">Tuesday</td>
							<td align="center" valign="middle" width="100" style="color: white; font-size: 30px">Wednesday</td>
							<td align="center" valign="middle" width="100" style="color: white; font-size: 30px">Thursday</td>
							<td align="center" valign="middle" width="100" style="color: white; font-size: 30px">Friday</td>
           				</tr>
           			    <%
							try
							{
								System.out.println(session.getAttribute("majorID"));
								String userID = session.getAttribute("UserID").toString();
								Class.forName("com.mysql.cj.jdbc.Driver");
								String url="jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();;
								String username="b8c39ba9e35da7";
								String password="ebcfebb1";
								String query="SELECT startTime, endTime, Monday, Tuesday, Wednesday, Thursday, Friday FROM ScheduleSlot WHERE userID="+userID+" ORDER By startTime ASC";
								Connection conn = DriverManager.getConnection(url,username,password);
								Statement st = conn.createStatement();
								ResultSet rs = st.executeQuery(query);
								while(rs.next())
								{
								String time = "";
								int start = rs.getInt("startTime");
								int end = rs.getInt("endTime");
								if (start < 800 ||end < 800){
									time = "Time not yet available";
								}
								else{
									String ampm = "";
									if (start > 1200){
										start = start - 1200;
									}
									if (end > 1200){
										end = end - 1200;
										ampm = "PM";
									}
									else{
										ampm = "AM";
									}
									String startTime = Integer.toString(start);
									String endTime = Integer.toString(end);
									String sTime = "";
									String eTime = "";
									if (startTime.length() == 3){
										sTime = startTime.substring(0,1) + ":" + startTime.substring(1,3);
									}
									else{
										sTime = startTime.substring(0,2) + ":" + startTime.substring(2,4);
									}
									if (endTime.length() == 3){
										eTime = endTime.substring(0,1) + ":" + endTime.substring(1,3);
									}
									else{
										eTime = endTime.substring(0,2) + ":" + endTime.substring(2,4);
									}
									time = sTime + "-" + eTime + " " + ampm;
								}
								
								%>
    								<tr><td style="color: white;"><%= time %></td>
								        <td style="color: white;"><%=rs.getString("Monday") %></td>
									    <td style="color: white;"><%=rs.getString("Tuesday") %></td>
									    <td style="color: white;"><%=rs.getString("Wednesday") %></td>
									    <td style="color: white;"><%=rs.getString("Thursday") %></td>
								        <td style="color: white;"><%=rs.getString("Friday") %></td>
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
           			
           		</form>
           	</div>
           </div>
        </div>
      </div>
    </body>
</html>
