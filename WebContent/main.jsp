<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="main.css" />
</head>
<body>
	<div class="background-img"></div>
	<div id="sidenav" class="sidenav">
		<h2>Schedule Builder</h2>
		<a href="profile.jsp" class="snlinks">
			<img src="Images/profile.png" alt="profile" style="width:50px; height: 50px;">
		</a>
		<a href="settings.jsp" class="snlinks1">
			<img src="Images/setting.png" alt="settings" style="width:50px; height: 50px;">
		</a>
		<a href="main.jsp" class="snlinks2">
			<img src="Images/schedule.png" alt="schedule" style="width:50px; height: 50px;">
		</a>
		<a href="requirements.jsp" class="snlinks3">
			<img src="Images/requirements.png" alt="requirements" style="width:50px; height: 50px;">
		</a>
	</div>
	<div class="nav">
		<h1 class = center_p>Current Schedule</h1>
		<table class="table" border="1">
			<tbody>
				<tr>
					<th align="center" valign="middle" width="80" style="background-color: white;"><img src="Images/clockface.jpg" alt="clock" height="50" width="42"></th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Sunday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Monday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Tuesday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Wednesday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Thursday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Friday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Saturday</th>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>