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
		<h1 class = center_p>Profile Settings</h1>
		<form method="POST" action="Login">
            <center>
            <table class = table>
                <tbody>
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right">Major:</td>
                        <td ><select class = field name="major" style="width:820px; font-size: 15px; font-family: tableTitles">
                        		<option value="ACCT">Accounting (BS)</option>
                        		<option value="AESE">Aerospace Engineering (BS)</option>
                        		<option value="AMST">American Studies and Ethnicity (BS)</option>
                        		<option value="AMSF">American Studies and Ethnicity (African American Studies)(BA)</option>
                        		<option value="AMSS">American Studies and Ethnicity (Asian American Studies)(BA)</option>
                        		<option value="AMSC">American Studies and Ethnicity (Chicano/Latino American Studies)(BA)</option>
                        		<option value="ANDA">Animation and Digital Arts (BA)</option>
                        		<option value="ANTH">Anthropology (BA)</option>
                        		<option value="ANVA">Anthropology (Visual Anthropology)(BA)</option>
                        		<option value="ACMA">Applied and Computational Mathematics (BA)</option>
                        		<option value="ACMS">Applied and Computational Mathematics (BS)</option>
                        		<option value="APME">Applied Mechanics (BS)</option>
                        		<option value="ARST">Architectural Studies (BS)</option>
                        		<option value="ARCH">Architecture (BArch)</option>
                        		<option value="ART">Art (BA)</option>
                        		<option value="ARTH">Art History (BA)</option>
                        		<option value="ATBI">Arts, Technology and the Business of Innovation (BA)</option>
                        		<option value="ASTE">Astronautical Engineering (BA)</option>
                        		<option value="ASTA">Astronomy (BA)</option>
                        		<option value="ASTS">Astronomy (BS)</option>
                        		<option value="BICH">Biochemistry (BS)</option>
                        		<option value="BISA">Biological Sciences (BA)</option>
                        		<option value="BISS">Biological Sciences (BS)</option>
                        		<option value="BIME">Biomedival Engineering (BS)</option>
                        		<option value="BIMB">Biological Sciences, Biochemical Engineering Emphasis,(BS)</option>
                        		<option value="BIME">Biological Sciences, Electrical Engineering Emphasis,(BS)</option>
                        		<option value="BIMM">Biological Sciences, Mechanical Engineering Emphasis,(BS)</option>
                        		<option value="BIPH">Biophysics (BS)</option>
                        		<option value="BUAD">Business Administration (BS)</option>
                        		<option value="BUCA">Business Administration (Cinematic Arts)(BS)</option>
                        		<option value="BUIR">Business Administration (International Relations)(BS)</option>
                        		<option value="BURE">Business Administration (Real Estate Finance)(BS)</option>
                        		<option value="BUWP">Business Administration (World Program)(BS)</option>
                        		<option value="CEST">Central European Studies (BA)</option>
                        		<option value="CHEN">Chemical Engineering (BS)</option>
                        		<option value="CHBE">Chemical Engineering, Biochemical Engineering Emphasis,(BS)</option>
                        		<option value="CHEE">Chemical Engineering, Environmental Engineering Emphasis,(BS)</option>
                        		<option value="CHNT">Chemical Engineering, Nanotechnology Emphasis,(BS)</option>
                        		<option value="CHPE">Chemical Engineering, Petroleum Engineering Emphasis,(BS)</option>
                        		<option value="CHPM">Chemical Engineering, Polymer/Materials Science Emphasis,(BS)</option>
                        		<option value="CHSE">Chemical Engineering, Sustainable Energy Emphasis,(BS)</option>
                        		<option value="CHEM">Chemistry (BA)</option>
                        		<option value="CHEM">Chemistry (BS)</option>
                        </td>
                    </tr>
                    	
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right; align: right">Minor:</td>
                        <td><select class = field name="major" style="width:820px; font-size: 15px; font-family: tableTitles">
                        		<option value="TDAG">2-D Art for Games Minor</option>
                        		<option value="ACCT">3-D Animations in Cinematic Arts Minor</option>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Password:</td>
                        <td ><input class = field type="text" name="password" style="width:820px;"/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Previous Class:</td>
                        <td ><input class = field type="text" name="class" style="width:820px;"/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Expected Grad.:</td>
                        <td ><input class = field type="text" name="class" style="width:820px;"/></td>
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