<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="Scraping.*" %>
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
    function logout(){
      window.location.replace("login.jsp");
    }
</script>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="profile.css">
</head>
<body>
	<div id="background"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3">
				<div id="sidenav" style="overflow-y:scroll">
					<h2>Schedule Builder</h2>
					<ul class="nav nav-pills flex-row"
						style="justify-content: space-between; align-items: center; padding-top: 15px; padding-bottom: 15px;">
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
                    <img src="Images/schedule.png" style="width:50px; height:50px" onclick = "man()">
                  </a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-item">
                       <img src="Images/requirements.png" style="width:50px; height:50px" onclick="req()">
                     </a>
                 </li>
					</ul>
					<div id="logout" style="text-align: center">
						<input type="button" name="submit" id="logoutButton"
							value="Logout" onclick="logout()">
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
					<div class="User"
						style="font-family: tableTitles; text-align: center">
						<h3 style="color: white; font-size: 20px;">
							Welcome
							<%=session.getAttribute("userName")%></h3>
					</div>
					<div class="MM"
						style="font-family: tableTitles; font-size: 20px; color: white">
						<table class="sidenavtable" align="center">
							<tbody>
								<tr>
									<td>Major:</td>
									<td><%=session.getAttribute("majorName")%></td>
								</tr>
								<tr>
									<td>Minor:</td>
									<td><%=session.getAttribute("minorName")%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2 style="font-size:20px; font-family:tableTitles; text-align:center">Updates:</h2>
					<div class="Updates" id="updates" style="font-size: 20px; font-family:tableTitles; text-align:center; margin-top: 25px;">
               	 		<script type="text/javascript" src = "assets/js/jquery-1.11.1.min.js"></script>
               	 		<script type="text/javascript">
    					$(document).ready(function() {
    						setInterval(function() {
    							$("#updates").load('data.jsp #UpdatesTable')
    						}, 3000);
    					});
	  			 </script>
                  
               </div>
				</div>
			</div>
			<div class="col-lg-6">
				<div id="nav">
					<h1 style="font-size: 45px">User Profile</h1>
					<table class="table" style="font-family: tableTitles"
						align="center">
						<tr>
							<td style="color: white; font-size: 30px; text-align: left">Major:</td>
							<td style="color: white; font-size: 30px;"><%=session.getAttribute("majorName")%></td>
						</tr>
						<tr>
							<td style="color: white; font-size: 30px; text-align: left">Minor:</td>
							<td style="color: white; font-size: 30px;"><%=session.getAttribute("minorName")%></td>
						</tr>
						<tr>
							<td style="color: white; font-size: 30px; text-align: left">Expected
								Graduation:</td>
							<td style="color: white; font-size: 30px;"><%=session.getAttribute("gradYear")%></td>
						</tr>
						<tr>
							<td style="color: white; font-size: 30px; text-align: left">Current Courses:</td>
							<%
							Vector<Section> vecCur = (Vector<Section>)session.getAttribute("currClasses");
							System.out.println(vecCur);
							if (vecCur.size() == 0){
							%>
								<td style="color: white; font-size: 30px; text-align: left">NO CURRENT CLASSES</td>
							<%
							}
							else  {
								for (int index = 0; index < vecCur.size();index++){
							%>
									<td style="color: white; font-size: 30px; text-align: left"><%= vecCur.get(index) %></td>
							<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="color: white; font-size: 30px; text-align: left">Previous Courses:</td>
							<%
							Vector<Section> vecPrev = (Vector<Section>)session.getAttribute("prevClasses");
							if (vecPrev.size()==0){
							%>
								<td style="color: white; font-size: 30px; text-align: left">NO CURRENT CLASSES</td>
							<%
							}
							else  {
								for (int index = 0; index < vecPrev.size();index++){
							%>
									<td style="color: white; font-size: 30px; text-align: left"><%= vecPrev.get(index).getInfo() %></td>
							<%
								}
							}
							%>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-lg-3">
				<div id="friendnav">
					<h2>Friend List</h2>
					<table class="friends" rules="rows" align="right">
						<tr style="color: white; align-self: center;">
							<%
								Vector<String> friends = (Vector<String>)session.getAttribute("friends");
								for (int index = 0; index < friends.size(); index++) {
							%>
						
						<tr>
							<td style="color:white; align="center"><text id=<%=friends.get(index)%>><%=friends.get(index)%></text></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
