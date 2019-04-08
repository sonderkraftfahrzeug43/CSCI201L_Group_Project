<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// displays and hides both types of search bars
	function parseJSON() {
		
	}
	function myFunction() {
		// show City search bar
		if (document.getElementById("Class").checked == true) {
			document.getElementById("showClassSearch").style.display = "block";
			document.getElementById("showFriendSearch").style.display = "none";
		}
		// show Location search bar
		else {
			document.getElementById("showClassSearch").style.display = "none";
			document.getElementById("showFriendSearch").style.display = "block";
		}

	} 
 
</script>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="settings.css" />
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
			<input type="text" name="class" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Friend...">
			<button type="submit" name="friendSearch"></button>
		</div>
		<div class="radio-button-div">
					<input type="radio" name="option" id="Class" value="Class"
						checked="checked" onclick="myFunction()">Class
					<input type="radio" name="option" id="Friend" value="Friend"
						onclick="myFunction()">Friend
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
		<h1 class = center_p>Profile Settings</h1>
		<form method="POST" action="Login">
            <center>
            <table class = table>
                <tbody>
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right">Major:</td>
                        <td ><input class = field type="text" name="major" style="width:820px;" required/></td>
                    </tr>
                    	
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right; align: right">Minor:</td>
                        <td><input class = field type="password" name="minor" style="width:820px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Password:</td>
                        <td ><input class = field type="text" name="password" style="width:820px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Previous Class:</td>
                        <td ><input class = field type="text" name="class" style="width:820px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Expected Grad.:</td>
                        <td ><input class = field type="text" name="class" style="width:820px;" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input id="button1" type="submit" name="submit" value="Save changes" />
                            &nbsp;&nbsp;<input id="button2" type="submit" name="submit" value="Clear Current Schedule" />
                            &nbsp;&nbsp;
                            <input id="button1" type="submit" value="Delete Account" />
                        </td>                        
                    </tr>  
                                      
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>