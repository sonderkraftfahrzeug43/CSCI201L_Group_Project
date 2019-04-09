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
                        		<option value="NULL">Select a major</option>
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
                        		<option value="CHBI">Chemistry (Chemical Biology)(BS)</option>
                        		<option value="CHNA">Chemistry (Chemical Nanoscience)(BS)</option>
                        		<option value="CHRE">Chemistry (Research)(BS)</option>
                        		<option value="COMU">Choral Music (BA)</option>
                        		<option value="CIME">Cinema and Media (BA)</option>
                        		<option value="CAFT">Cinematic Arts, Filmt and Television Production (BA)</option>
                        		<option value="CAFF">Cinematic Arts, Filmt and Television Production (BFA)</option>
                        		<option value="CIEN">Civil Engineering (BS)</option>
                        		<option value="CIBS">Civil Engineering, Building Science Emphasis (BS)</option>
                        		<option value="CIEE">Civil Engineering, Environmental Engineering Emphasis (BS)</option>
                        		<option value="CIBS">Civil Engineering, Structural Engineering Emphasis (BS)</option>
                        		<option value="CLAS">Classics (BA)</option>
                        		<option value="COSI">Cognitive Science (BA)</option>
                        		<option value="COMM">Communication (BA)</option>
                        		<option value="COLI">Comparative Literature (BA)</option>
                        		<option value="COMP">Composition (BM)</option>
                        		<option value="CMNS">Computational Neuroscience (BS)</option>
                        		<option value="CSCE">Computer Engineering and Computer Science (BS)</option>
                        		<option value="CSCI">Computer Science (BA)</option>
                        		<option value="CSCG">Computer Science (Games)(BS)</option>
                        		<option value="CSBA">Computer Science/Business Administration (BS)</option>
                        		<option value="COLA">Contemporary Latino and Latin American Studies (Games)(BA)</option>
                        		<option value="DANC">Dance (BFA)</option>
                        		<option value="DEHY">Dental Hygiene (BS)</option>
                        		<option value="EART">Earth Sciences (BA)</option>
                        		<option value="EAAS">East Asian Area Studies (BA)</option>
                        		<option value="ECON">Economics (BA)</option>
                        		<option value="ECMA">Economics/Mathematics (BS)</option>
                        		<option value="EEEN">Electrical Engineering (BS)</option>
                        		<option value="ENGL">English (BA)</option>
                        		<option value="ENEN">Environmental Engineering (BS)</option>
                        		<option value="ENHA">Environmental Science and Health (BA)</option>
                        		<option value="ENHS">Environmental Science and Health (BS)</option>
                        		<option value="ECEA">Environmental Studies, Climate, Earth and Environment Concentration (BA)</option>
                        		<option value="ECES">Environmental Studies, Climate, Earth and Environment Concentration (BS)</option>
                        		<option value="EEPA">Environmental Studies, Environmental Public Policy Concentration (BA)</option>
                        		<option value="EEPS">Environmental Studies, Environmental Public Policy Concentration (BS)</option>
                        		<option value="EOLA">Environmental Studies, Oceans, Life and People Concentration (BA)</option>
                        		<option value="EOLS">Environmental Studies, Oceans, Life and People Concentration (BS)</option>
                        		<option value="ESEA">Environmental Studies, Sustainability, Energy and Society Concentration (BA)</option>
                        		<option value="ESES">Environmental Studies, Sustainability, Energy and Society Concentration (BS)</option>
                        		<option value="FIAR">Fine Arts (BFA)</option>
                        		<option value="FREN">French (BA)</option>
                        		<option value="GEST">Gender Studies (BA)</option>
                        		<option value="GEDE">GeoDesign (BA)</option>
                        		<option value="GEOS">Geological Sciences (BS)</option>
                        		<option value="GHES">Global Health Studies (BS)</option>
                        		<option value="GLOB">Global Studies (BA)</option>
                        		<option value="HEHU">Health and Humanity (BA)</option>
                        		<option value="HEHS">Health and Human Sciences (BA)</option>
                        		<option value="HEPD">Health Promotion and Disease Prevention Studies (BA)</option>
                        		<option value="HIST">History (BA)</option>
                        		<option value="HISS">History and Social Science Education (BA)</option>
                        		<option value="HUBA">Human Biology (BA)</option>
                        		<option value="HUBS">Human Biology (BS)</option>
                        		<option value="HUDA">Human Development and Aging (BS)</option>
                        		<option value="HAHS">Human Development and Aging, Health Science Track (BS)</option>
                        		<option value="HUDH">Human Development and Aging, Honors Program (BS)</option>
                        		<option value="INSE">Industrial and Systems Engineering (BS)</option>
                        		<option value="INAC">Interactive Entertainment (BA)</option>
                        		<option value="IARC">Interdisiplinary Archaeology (BA)</option>
                        		<option value="INRA">International Relations (BA)</option>
                        		<option value="IRGB">International Relations (Global Business) (BA)</option>
                        		<option value="IRGE">International Relations and the Global Economy (BA)</option>
                        		<option value="ITAL">Italian (BA)</option>
                        		<option value="JAZZ">Jazz Studies (BM)</option>
                        		<option value="JEST">Jewish Studies (BA)</option>
                        		<option value="JOUR">Journalism (BA)</option>
                        		<option value="JSTE">Judaic Studies Emphasis (BA)</option>
                        		<option value="LHCU">Law, History, and Culture (BA)</option>
                        		<option value="LIHE">Lifespan Health (BS)</option>
                        		<option value="LING">Linguistics (BA)</option>
                        		<option value="LICS">Linguistics and Cognitive Science (BA)</option>
                        		<option value="LIEA">Linguistics and East Asian Languages and Cultures (BA)</option>
                        		<option value="LIPH">Linguistics and Philosophy (BA)</option>
                        		<option value="LING">Linguistics and Psychology (BA)</option>
                        		<option value="MATA">Mathematics (BA)</option>
                        		<option value="MATS">Mathematics (BS)</option>
                        		<option value="MTEC">Mathematics/Economics (BS)</option>
                        		<option value="MECH">Mechanical Engineering (BS)</option>
                        		<option value="MEPE">Mechanical Engineering, Petroleum Engineering (BS)</option>
                        		<option value="MEAP">Media, Arts and Practice (BA)</option>
                        		<option value="MIDS">Middle East Stuidies (BA)</option>
                        		<option value="MUSI">Music (BA)</option>
                        		<option value="MUIM">Music Industry (BM)</option>
                        		<option value="MUIS">Music Industry (BS)</option>
                        		<option value="MUPR">Music Production (BM)</option>
                        		<option value="NARS">Narrative Studies (BA)</option>
                        		<option value="NEUA">Neuroscience (BA)</option>
                        		<option value="NEUS">Neuroscience (BS)</option>
                        		<option value="NGOS">Non-Governmental Organizations and Social Change (BA)</option>
                        		<option value="OCTH">Occupational Therapy (BS)</option>
                        		<option value="PRCG">Performance (Classical Guitar)(BM)</option>
                        		<option value="PRAL">Performance (Flute),(Oboe),(Clarinet),(Bassoon),(Saxophone),(French Horn),(Trumpet),(Trombone),(Tuba)or(Percussion)(BM)</option>
                        		<option value="PROR">Performance (Organ)(BM)</option>
                        		<option value="PRPI">Performance (Piano)(BM)</option>
                        		<option value="PRPM">Performance (Popular Music)(BM)</option>
                        		<option value="PRSG">Performance (Studio Guitar)(BM)</option>
                        		<option value="PRVI">Performance (Violin),(Viola),(Violoncello),(Double Bass) or (Harp)(BM)</option>
                        		<option value="PRVO">Performance (Vocal Arts)(BM)</option>
                        		<option value="PHIL">Philosophy (BA)</option>
                        		<option value="PHIL">Philosophy, Politics and Law (BA)</option>
                        		<option value="PHSA">Physical Sciences (BA)</option>
                        		<option value="PHSS">Physical Sciences (BS)</option>
                        		<option value="PHYA">Physics (BA)</option>
                        		<option value="PHYS">Physics (BS)</option>
                        		<option value="PYCS">Physics/Computer Science (BS)</option>
                        		<option value="POLE">Political Economy (BA)</option>
                        		<option value="POLS">Political Science (BA)</option>
                        		<option value="PSYC">Psychology (BA)</option>
                        		<option value="PUPO">Public Policy (BA)</option>
                        		<option value="PORE">Public Relations (BA)</option>
                        		<option value="REAL">Real Estate Development (BS)</option>
                        		<option value="RELG">Religion (BA)</option>
                        		<option value="RUSS">Russian (BA)</option>
                        		<option value="SCEE">Social Sciences,with and Emphasis in Economics (BA)</option>
                        		<option value="SCEP">Social Sciences,with and Emphasis in Psychology (BA)</option>
                        		<option value="SOCI">Sociology (BA)</option>
                        		<option value="SPAN">Spanish (BA)</option>
                        		<option value="THEA">Theatre (BA)</option>
                        		<option value="THAE">Theatre, Acting Emphasis (BA)</option>
                        		<option value="THAF">Theatre, Acting Emphasis (BFA)</option>
                        		<option value="THDE">Theatre, Design Emphasis (BA)</option>
                        		<option value="THDF">Theatre, Design Emphasis (BFA)</option>
                        		<option value="THSE">Theatre, Sound Design Emphasis (BFA)</option>
                        		<option value="THSM">Theatre, Stage Management Emphasis (BFA)</option>
                        		<option value="THTD">Theatre, Technical Direction Emphasis (BFA)</option>
                        		<option value="URBN">Urban Studies and Planning (BS)</option>
                        		<option value="VPAS">Visual and Performing Arts Studies (BA)</option>
                        		<option value="FOMP">Food Industry Management Program</option>
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