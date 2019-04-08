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
		<h1 class = center_p>Settings</h1>
		<form method="POST" action="Login">
            <center>
            <table class = table>
                <tbody>
                    <tr>
                        <td style="color: white; font-size: 30px">Change Major:</td>
                        <td ><input type="text" name="major" style="width:200px;" required/></td>
                    </tr>
                    	
                    <tr>
                        <td style="color: white; font-size: 30px">Change Minor:</td>
                        <td><input type="password" name="password" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                    	<td style="color: white; font-size: 30px">Change Password:</td>
                        <td ><input type="text" name="major" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input id="button1" type="submit" name="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input id="button2" type="submit" value="Delete Account" />
                        </td>                        
                    </tr>  
                                      
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>
