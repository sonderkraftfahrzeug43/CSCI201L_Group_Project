<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
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
	function req(){
		document.require.submit();
	}
	function sett(){
		document.settings.submit();
	}
	function logout(){
		window.location.replace("login.jsp");
	}
	function prof(){
		document.profile.submit();
	}
	<%
		Vector<String> resultString = (Vector<String>)session.getAttribute("resultsArray");
		String friendName = (String)request.getAttribute("friendName");
		String friendMajor = (String)request.getAttribute("friendMajor");
		String friendMinor = (String)request.getAttribute("friendMinor");
		System.out.println(resultString.size());
	%>
 
</script>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="main.css" />
<link rel = "stylesheet" href = "assets/css/style.css">
<link rel = "stylesheet" href = "src/blockrain.css">
</head>
<body>
	<div class="background-img"></div>
	<section>
		<div id="sidenav" class="sidenav">
			<h2  style="text-color:white">Schedule Builder</h2>
			<form name = "profile" method = "POST" action="ProfileSearch">
				<div class="snlinks">
					<img src="Images/profile.png" alt="profile" style="width:50px; height: 50px;" onclick = "prof()">
				</div>
			</form>
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
			<input id="button3" type="button" name="submit" value="Logout" onclick = "logout()"/>
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
				<h6 style="text-color:white; font-size: 28px">Updates:</h6>
			</div>
		</div>
	</section>
		<div id="content">
			<h1 id="ac">Search Results</h1>
			<table id="nameasc" class="resultsTable">
				<tr class = "resultsTableElements">
					<th class = "resultsTableElements"><%= resultString.get(0) %></th>
				</tr>
				<%
				if(resultString.size() > 1) {
					for(String w : resultString) {
						out.println("<tr class='row' onclick='test(\"" + w + "\")'>");
						out.println("<td>" + w + "</td>");
						out.println("</tr>");
					}
				}
				%>
			</table>
		</div>

	<section>
  </section>
</body>
</html>
