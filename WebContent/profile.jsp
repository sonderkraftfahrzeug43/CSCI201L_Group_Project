<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// displays and hides both types of search bars
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
	function logout(){
		window.location.replace("login.jsp");
	}
	function req(){
		document.require.submit();
	}
	function sett(){
		document.settings.submit();
	}
 
</script>
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
		<form name = "settings" method = "POST" action = "Settings">
			<div class="snlinks1">
			<img src="Images/setting.png" alt="settings" style="width:50px; height: 50px;" onclick = "sett()">
			</div>
		</form>
		<a href="main.jsp" class="snlinks2">
			<img src="Images/schedule.png" alt="schedule" style="width:50px; height: 50px;">
		</a>
		<form name = "require" method = "POST" action="RequirementsSearch">
			<div class="snlinks3">
			<img src="Images/requirements.png" alt="requirements" style="width:50px; height: 50px;" onclick ="req()">
			</div>
		</form>
		<form name = "rButton" method = "POST" action = "Results">
			<input id="button3" type="button" name="submit" value="Logout" onclick = "logout()"/>
			<div id="showClassSearch" class="showClassSearch">
				<input type="text" name="classText" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Class...">
				<button type="submit" name="classSearch"></button>
			</div>
			<div id="showFriendSearch" class="showFriendSearch">
				<input type="text" name="friendText" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Friend...">
				<button type="submit" name="friendSearch"></button>
			</div>
			<div id="showProfessorSearch" class="showProfessorSearch">
				<input type="text" name="professorText" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Professor...">
				<button type="submit" name="professorSearch"></button>
			</div>
			<div class="radio-button-div" name = "radioButton" id = "radioButton">
					<input type="radio" name="option" id="Class" value="Class" checked="checked" onclick="myFunction()">Class
					<input type="radio" name="option" id="Friend" value="Friend" onclick="myFunction()">Friend
					<input type="radio" name="option" id="Professor" value="Professor"onclick="myFunction()">Professor		
			</div>
		</form> 
		<div class="User">
			<h3  style="text-color:white; font-size: 28px">Welcome <%= session.getAttribute("userName") %></h3>
		</div>
		<div class="MM">
				<table class="sidenavtable">
					<tbody>
                    	<tr>
                        	<td style="color: white; font-size: 28px; text-align: left; padding-bottom: 10px; padding-top: 25px;">Major:</td>
                        	<td ><%= session.getAttribute("majorName") %></td>
                    	</tr>
                    	<tr>
                        	<td style="color: white; font-size: 28px; text-align: left">Minor:</td>
                        	<td ><%= session.getAttribute("minorName") %></td>
                    	</tr>
                	</tbody>
                </table>
		</div>
		<div class="Updates">
			<h6 style="text-color:white; font-size: 28px">Updates: </h6>
		</div>
	</div>
	<div class="nav">
		<h1 class = center_p>User Profile</h1>
		<table class="table">
				<tbody>
                    <tr>
                        <td style="color: white; font-size: 30px; text-align: left">Major:</td>
                        <td ><%= session.getAttribute("majorName") %></td>
                    </tr>
                    <tr>
                        <td style="color: white; font-size: 30px; text-align: left">Minor:</td>
                        <td ><%= session.getAttribute("minorName") %></td>
                    </tr>
                    <tr>
                        <td style="color: white; font-size: 30px; text-align: left">Expected Graduation:</td>
                        <td ><!-- output user minor --></td>
                    </tr>
                    <tr>
                        <td style="color: white; font-size: 30px; text-align: left">Current Courses:</td>
                        <td ><!-- output user current courses --></td>
                    </tr>
                    <tr>
                        <td style="color: white; font-size: 30px; text-align: left">Previous Courses:</td>
                        <td ><!-- output user previous courses --></td>
                    </tr>
                </tbody>
       </table>
		</div>
	</div>
	<div class="friendnav" id="friendnav">
		<h4 class="friendbar">Friend List</h4>
	</div>
         <div>
            <table class = "friends" rules = "rows" align="right"style= "width:100%;">
               <tr style="color:white;align:middle">
                  <th><strong>Friends</strong></th>
               </tr>
               <%
               String parse = String.valueOf(session.getAttribute("friends"));
     		   int parser = 0;
      		   for(int index = 0; index < parse.length(); index++) {
	     	      if (parse.charAt(index)=='|') {
	     	    	 System.out.println(parser + " " + index);
	                 String chunk = parse.substring(parser, index);
	                 %>
	                 <tr> 
	                    <td align="center"><text id = <%=chunk %> ><%= chunk %></text></td>
	                 </tr>
	                 <%
	                 parser = index+1;
	                 }      
	               	 
	             }	
             %>
          </table>
        </div>
        <!-- <input type="hidden" name="cityName" id = "CityName" /> -->
</body>
</html>
