<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		else if (document.getElementById("Professor").checked == true){
			document.getElementById("showClassSearch").style.display = "none";
			document.getElementById("showFriendSearch").style.display = "none";
			document.getElementById("showProfessorSearch").style.display = "block";
		}
	} 
 
</script>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="main.css" />
</head>
<body>
	<div class="background-img"></div>
	<div id="sidenav" class="sidenav">
		<h2  style="text-color:white">Schedule Builder</h2>
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
		<input id="button3" type="submit" name="submit" value="Logout" />
		<div id="showClassSearch" class="showClassSearch">
			<input type="text" name="class" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Class...">
			<button type="submit" name="classSearch"></button>
		</div>
		<div id="showFriendSearch" class="showFriendSearch">
			<input type="text" name="friend" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Friend...">
			<button type="submit" name="friendSearch"></button>
		</div>
		<div id="showProfessorSearch" class="showProfessorSearch">
			<input type="text" name="professor" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Professor...">
			<button type="submit" name="professorSearch"></button>
		</div>
		<div class="radio-button-div">
					<input type="radio" name="option" id="Class" value="Class"
						checked="checked" onclick="myFunction()">Class
					<input type="radio" name="option" id="Friend" value="Friend"
						onclick="myFunction()">Friend
					<input type="radio" name="option" id="Professor" value="Professor"
						onclick="myFunction()">Professor
		</div>
		<div class="User">
			<h3  style="text-color:white">Welcome Username</h3>
		</div>
		<div class="MM">
				<h4 style="text-color:white">Major: </h4>
				<h5 style="text-color:white">Minor: </h5>
		</div>
		<div class="Updates">
			<h6 style="text-color:white; font-size: 28px">Updates: </h6>
		</div>
	</div>
	<div class="nav">
		<h1 class = center_p>Current Schedule</h1>
		<table class="table" border="1">
			<tbody>
				<tr>
					<th align="center" valign="middle" width="80"><img src="Images/clock.png" alt="clock" height="50" width="50"></th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Monday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Tuesday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Wednesday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Thursday</th>
					<th align="center" valign="middle" width="100" style="color: white; font-size: 30px">Friday</th>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>