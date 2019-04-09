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
                        		<option value=0>Select a major</option>
                        		<option value=1>Accounting (BS)</option>
                        		<option value=2>Aerospace Engineering (BS)</option>
                        		<option value=3>American Studies and Ethnicity (BS)</option>
                        		<option value=4>American Studies and Ethnicity (African American Studies)(BA)</option>
                        		<option value=5>American Studies and Ethnicity (Asian American Studies)(BA)</option>
                        		<option value=6>American Studies and Ethnicity (Chicano/Latino American Studies)(BA)</option>
                        		<option value=7>Animation and Digital Arts (BA)</option>
                        		<option value=8>Anthropology (BA)</option>
                        		<option value=9>Anthropology (Visual Anthropology)(BA)</option>
                        		<option value=10>Applied and Computational Mathematics (BA)</option>
                        		<option value=11>Applied and Computational Mathematics (BS)</option>
                        		<option value=12>Applied Mechanics (BS)</option>
                        		<option value=13>Architectural Studies (BS)</option>
                        		<option value=14>Architecture (BArch)</option>
                        		<option value=15>Art (BA)</option>
                        		<option value=16>Art History (BA)</option>
                        		<option value=17>Arts, Technology and the Business of Innovation (BA)</option>
                        		<option value=18>Astronautical Engineering (BA)</option>
                        		<option value=19>Astronomy (BA)</option>
                        		<option value=20>Astronomy (BS)</option>
                        		<option value=21>Biochemistry (BS)</option>
                        		<option value=22>Biological Sciences (BA)</option>
                        		<option value=23>Biological Sciences (BS)</option>
                        		<option value=24>Biomedical Engineering (BS)</option>
                        		<option value=25>Biological Sciences, Biochemical Engineering Emphasis,(BS)</option>
                        		<option value=26>Biological Sciences, Electrical Engineering Emphasis,(BS)</option>
                        		<option value=27>Biological Sciences, Mechanical Engineering Emphasis,(BS)</option>
                        		<option value=28>Biophysics (BS)</option>
                        		<option value=29>Business Administration (BS)</option>
                        		<option value=30>Business Administration (Cinematic Arts)(BS)</option>
                        		<option value=31>Business Administration (International Relations)(BS)</option>
                        		<option value=32>Business Administration (Real Estate Finance)(BS)</option>
                        		<option value=33>Business Administration (World Program)(BS)</option>
                        		<option value=34>Central European Studies (BA)</option>
                        		<option value=35>Chemical Engineering (BS)</option>
                        		<option value=36>Chemical Engineering, Biochemical Engineering Emphasis,(BS)</option>
                        		<option value=37>Chemical Engineering, Environmental Engineering Emphasis,(BS)</option>
                        		<option value=38>Chemical Engineering, Nanotechnology Emphasis,(BS)</option>
                        		<option value=39>Chemical Engineering, Petroleum Engineering Emphasis,(BS)</option>
                        		<option value=40>Chemical Engineering, Polymer/Materials Science Emphasis,(BS)</option>
                        		<option value=41>Chemical Engineering, Sustainable Energy Emphasis,(BS)</option>
                        		<option value=42>Chemistry (BA)</option>
                        		<option value=43>Chemistry (BS)</option>
                        		<option value=44>Chemistry (Chemical Biology)(BS)</option>
                        		<option value=45>Chemistry (Chemical Nanoscience)(BS)</option>
                        		<option value=46>Chemistry (Research)(BS)</option>
                        		<option value=47>Choral Music (BA)</option>
                        		<option value=48>Cinema and Media (BA)</option>
                        		<option value=49>Cinematic Arts, Filmt and Television Production (BA)</option>
                        		<option value=50>Cinematic Arts, Filmt and Television Production (BFA)</option>
                        		<option value=51>Civil Engineering (BS)</option>
                        		<option value=52>Civil Engineering, Building Science Emphasis (BS)</option>
                        		<option value=53>Civil Engineering, Environmental Engineering Emphasis (BS)</option>
                        		<option value=54>Civil Engineering, Structural Engineering Emphasis (BS)</option>
                        		<option value=55>Classics (BA)</option>
                        		<option value=56>Cognitive Science (BA)</option>
                        		<option value=57>Communication (BA)</option>
                        		<option value=58>Comparative Literature (BA)</option>
                        		<option value=59>Composition (BM)</option>
                        		<option value=60>Computational Neuroscience (BS)</option>
                        		<option value=61>Computer Engineering and Computer Science (BS)</option>
                        		<option value=62>Computer Science (BA)</option>
                        		<option value=63>Computer Science (Games)(BS)</option>
                        		<option value=64>Computer Science/Business Administration (BS)</option>
                        		<option value=65>Contemporary Latino and Latin American Studies (Games)(BA)</option>
                        		<option value=66>Dance (BFA)</option>
                        		<option value=67>Dental Hygiene (BS)</option>
                        		<option value=68>Earth Sciences (BA)</option>
                        		<option value=69>East Asian Area Studies (BA)</option>
                        		<option value=70>Economics (BA)</option>
                        		<option value=71>Economics/Mathematics (BS)</option>
                        		<option value=72>Electrical Engineering (BS)</option>
                        		<option value=73>English (BA)</option>
                        		<option value=74>Environmental Engineering (BS)</option>
                        		<option value=75>Environmental Science and Health (BA)</option>
                        		<option value=76>Environmental Science and Health (BS)</option>
                        		<option value=77>Environmental Studies, Climate, Earth and Environment Concentration (BA)</option>
                        		<option value=78>Environmental Studies, Climate, Earth and Environment Concentration (BS)</option>
                        		<option value=79>Environmental Studies, Environmental Public Policy Concentration (BA)</option>
                        		<option value=80>Environmental Studies, Environmental Public Policy Concentration (BS)</option>
                        		<option value=81>Environmental Studies, Oceans, Life and People Concentration (BA)</option>
                        		<option value=82>Environmental Studies, Oceans, Life and People Concentration (BS)</option>
                        		<option value=83>Environmental Studies, Sustainability, Energy and Society Concentration (BA)</option>
                        		<option value=84>Environmental Studies, Sustainability, Energy and Society Concentration (BS)</option>
                        		<option value=85>Fine Arts (BFA)</option>
                        		<option value=86>French (BA)</option>
                        		<option value=87>Gender Studies (BA)</option>
                        		<option value=88>GeoDesign (BA)</option>
                        		<option value=89>Geological Sciences (BS)</option>
                        		<option value=90>Global Health Studies (BS)</option>
                        		<option value=91>Global Studies (BA)</option>
                        		<option value=92>Health and Humanity (BA)</option>
                        		<option value=93>Health and Human Sciences (BA)</option>
                        		<option value=94>Health Promotion and Disease Prevention Studies (BA)</option>
                        		<option value=95>History (BA)</option>
                        		<option value=96>History and Social Science Education (BA)</option>
                        		<option value=97>Human Biology (BA)</option>
                        		<option value=98>Human Biology (BS)</option>
                        		<option value=99>Human Development and Aging (BS)</option>
                        		<option value=100>Human Development and Aging, Health Science Track (BS)</option>
                        		<option value=101>Human Development and Aging, Honors Program (BS)</option>
                        		<option value=102>Industrial and Systems Engineering (BS)</option>
                        		<option value=103>Interactive Entertainment (BA)</option>
                        		<option value=104>Interdisiplinary Archaeology (BA)</option>
                        		<option value=105>International Relations (BA)</option>
                        		<option value=106>International Relations (Global Business) (BA)</option>
                        		<option value=107>International Relations and the Global Economy (BA)</option>
                        		<option value=108>Italian (BA)</option>
                        		<option value=109>Jazz Studies (BM)</option>
                        		<option value=110>Jewish Studies (BA)</option>
                        		<option value=111>Journalism (BA)</option>
                        		<option value=112>Judaic Studies Emphasis (BA)</option>
                        		<option value=113>Law, History, and Culture (BA)</option>
                        		<option value=114>Lifespan Health (BS)</option>
                        		<option value=115>Linguistics (BA)</option>
                        		<option value=116>Linguistics and Cognitive Science (BA)</option>
                        		<option value=117>Linguistics and East Asian Languages and Cultures (BA)</option>
                        		<option value=118>Linguistics and Philosophy (BA)</option>
                        		<option value=119>Linguistics and Psychology (BA)</option>
                        		<option value=120>Mathematics (BA)</option>
                        		<option value=121>Mathematics (BS)</option>
                        		<option value=122>Mathematics/Economics (BS)</option>
                        		<option value=123>Mechanical Engineering (BS)</option>
                        		<option value=124>Mechanical Engineering, Petroleum Engineering (BS)</option>
                        		<option value=125>Media, Arts and Practice (BA)</option>
                        		<option value=126>Middle East Stuidies (BA)</option>
                        		<option value=127>Music (BA)</option>
                        		<option value=128>Music Industry (BM)</option>
                        		<option value=129>Music Industry (BS)</option>
                        		<option value=130>Music Production (BM)</option>
                        		<option value=131>Narrative Studies (BA)</option>
                        		<option value=132>Neuroscience (BA)</option>
                        		<option value=133>Neuroscience (BS)</option>
                        		<option value=134>Non-Governmental Organizations and Social Change (BA)</option>
                        		<option value=135>Occupational Therapy (BS)</option>
                        		<option value=136>Performance (Classical Guitar)(BM)</option>
                        		<option value=137>Performance (Flute),(Oboe),(Clarinet),(Bassoon),(Saxophone),(French Horn),(Trumpet),(Trombone),(Tuba)or(Percussion)(BM)</option>
                        		<option value=138>Performance (Organ)(BM)</option>
                        		<option value=139>Performance (Piano)(BM)</option>
                        		<option value=140>Performance (Popular Music)(BM)</option>
                        		<option value=141>Performance (Studio Guitar)(BM)</option>
                        		<option value=142>Performance (Violin),(Viola),(Violoncello),(Double Bass) or (Harp)(BM)</option>
                        		<option value=143>Performance (Vocal Arts)(BM)</option>
                        		<option value=144>Philosophy (BA)</option>
                        		<option value=145>Philosophy, Politics and Law (BA)</option>
                        		<option value=146>Physical Sciences (BA)</option>
                        		<option value=147>Physical Sciences (BS)</option>
                        		<option value=148>Physics (BA)</option>
                        		<option value=149>Physics (BS)</option>
                        		<option value=150>Physics/Computer Science (BS)</option>
                        		<option value=151>Political Economy (BA)</option>
                        		<option value=152>Political Science (BA)</option>
                        		<option value=153>Psychology (BA)</option>
                        		<option value=154>Public Policy (BA)</option>
                        		<option value=155>Public Relations (BA)</option>
                        		<option value=156>Real Estate Development (BS)</option>
                        		<option value=157>Religion (BA)</option>
                        		<option value=158>Russian (BA)</option>
                        		<option value=159>Social Sciences,with and Emphasis in Economics (BA)</option>
                        		<option value=160>Social Sciences,with and Emphasis in Psychology (BA)</option>
                        		<option value=161>Sociology (BA)</option>
                        		<option value=162>Spanish (BA)</option>
                        		<option value=163>Theatre (BA)</option>
                        		<option value=164>Theatre, Acting Emphasis (BA)</option>
                        		<option value=165>Theatre, Acting Emphasis (BFA)</option>
                        		<option value=166>Theatre, Design Emphasis (BA)</option>
                        		<option value=167>Theatre, Design Emphasis (BFA)</option>
                        		<option value=168>Theatre, Sound Design Emphasis (BFA)</option>
                        		<option value=169>Theatre, Stage Management Emphasis (BFA)</option>
                        		<option value=170>Theatre, Technical Direction Emphasis (BFA)</option>
                        		<option value=171>Urban Studies and Planning (BS)</option>
                        		<option value=172>Visual and Performing Arts Studies (BA)</option>
                        		<option value=173>Food Industry Management Program</option>
                        </td>
                    </tr>
                    	
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right; align: right">Minor:</td>
                        <td><select class = field name="major" style="width:820px; font-size: 15px; font-family: tableTitles">
                        		<option value="NULL">Select a minor</option>
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