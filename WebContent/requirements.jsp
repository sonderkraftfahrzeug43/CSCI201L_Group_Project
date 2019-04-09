<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="requirements.css" />
</head>
<script type="text/javascript">
	//displays and hides both types of search bars
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
	function checkMinor(){
		if (1 == 1){
			var minorObject = document.createElement("object");
			minorObject.setAttribute('data', 'https://www.cs.usc.edu/academic-programs/undergrad/computer-science/');
			minorObject.setAttribute("width","1100px");
			minorObject.setAttribute("height","300px");
			minorObject.setAttribute("style","overflow:auto;");
			var h = document.createElement("H1")                
			var t = document.createTextNode("Minor Requirements");  
			h.setAttribute("style","color:white;text-align:center;right:13.5%;")
			h.appendChild(t); 
			document.getElementById("webpageMinor").append(h);
			document.getElementById("webpageMinor").append(minorObject);
			document.getElementByID("objWebpage").setAttribute("height","10px");
		}
		else{
			document.getElementByID("webpageMinor").setAttribute("style","display:hidden");
		}
	}
	
</script>
<body onload = "checkMinor()">
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
		<input id="button3" type="button" name="submit" value="Logout" onclick = "logout()"/>
		<div id="showClassSearch" class="showClassSearch">
			<input type="text" name="class" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Class...">
			<button type="submit" name="classSearch"></button>
		</div>
		<div id="showFriendSearch" class="showFriendSearch">
			<input type="text" name="class" style="width:335px; font-family:tableTitles; font-size:20px; padding-top: 10px; padding-bottom: 10px" placeholder="Search Friend...">
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
				<table class="sidenavtable">
					<tbody>
                    	<tr>
                        	<td style="color: white; font-size: 28px; text-align: left">Major:</td>
                        	<td ><!-- output user major --></td>
                    	</tr>
                    	<tr>
                        	<td style="color: white; font-size: 28px; text-align: left">Minor:</td>
                        	<td ><!-- output user minor --></td>
                    	</tr>
                	</tbody>
                </table>
		</div>
		<div class="Updates">
			<h6 style="text-color:white; font-size: 28px">Updates: </h6>
		</div>
	</div>
	<div class="nav">
		<h1 class = "center_p">Major Requirements</h1>
		 <div id = "webpage" class = "webpage"> 
    		<object id = "objWebpage" type="text/html" data="https://www.cs.usc.edu/academic-programs/undergrad/computer-science/" width="1100px" height="600px" style="overflow:auto;">
    		</object>
 		</div>
 		<div id = "webpageMinor" class = "webpageMinor">
 		`	
 		</div>
   </div>
</body>
</html>
