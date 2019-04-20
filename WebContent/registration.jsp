<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String utError = (String)request.getAttribute("utError");
	if(utError == null || utError.trim().length()==0) {
		utError = " ";
	}
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if(username == null || username.trim().length()==0)
	{
		username = " ";
	}
	if(password == null || password.trim().length()==0)
	{
		password = " ";
	}
	
%>
<!DOCTYPE html>
<html>

<!-- head -->
<head>

<meta charset="UTF-8">

<!-- title -->
<title>Registration</title>


<!-- linking CSS -->
<link rel="stylesheet" type="text/css" href="registration.css" />
</head>

<!-- body -->
<body>

	<!-- background image -->
	<div class="background-img"></div>

	<!-- City search -->
	<div class = nav>
			<h1 class = center_p>Schedule Builder</h1>
			<form method="POST" action="Register">

            <table class = table>
                <tbody>
                    <tr>
                        <td style="color: white; font-size: 30px">Username:</td>
                        <td ><input type="text" name="username" style="width:200px;" required/></td>
                    </tr>
                    	
                    <tr>
                        <td style="color: white; font-size: 30px;">Password:</td>
                        <td><input type="password" name="password" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                        <td style="color: white; font-size: 30px;">Confirm:</td>
                        <td><input type="password" name="password" style="width:200px;" required/></td>
                    </tr>
                    <tr>
					<td class = desc style="color: white; font-size: 30px; text-align: center">Major:</td>
                        <td ><select class = field name="major" style="width:200px; font-size: 15px; font-family: tableTitles">
                        		<option value=0>Select a major</option>
                        		<option value=1>Accounting (BS)</option>
                        		<option value=2>Aerospace Engineering (BS)</option>
                        		<option value=3>American Studies and Ethnicity (African American Studies)(BA)</option>
                        		<option value=4>American Studies and Ethnicity (Asian American Studies)(BA)</option>
                        		<option value=5>American Studies and Ethnicity (BS)</option>
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
                        		<option value=70>East Asian Languages and Cultures (BA)</option>
                        		<option value=71>Economics (BA)</option>
                        		<option value=72>Economics/Mathematics (BS)</option>
                        		<option value=73>Electrical Engineering (BS)</option>
                        		<option value=74>English (BA)</option>
                        		<option value=75>Environmental Engineering (BS)</option>
                        		<option value=76>Environmental Science and Health (BA)</option>
                        		<option value=77>Environmental Science and Health (BS)</option>
                        		<option value=78>Environmental Studies, Climate, Earth and Environment Concentration (BA)</option>
                        		<option value=79>Environmental Studies, Climate, Earth and Environment Concentration (BS)</option>
                        		<option value=80>Environmental Studies, Environmental Public Policy Concentration (BA)</option>
                        		<option value=81>Environmental Studies, Environmental Public Policy Concentration (BS)</option>
                        		<option value=82>Environmental Studies, Oceans, Life and People Concentration (BA)</option>
                        		<option value=83>Environmental Studies, Oceans, Life and People Concentration (BS)</option>
                        		<option value=84>Environmental Studies, Sustainability, Energy and Society Concentration (BA)</option>
                        		<option value=85>Environmental Studies, Sustainability, Energy and Society Concentration (BS)</option>
                        		<option value=86>Fine Arts (BFA)</option>
                        		<option value=87>French (BA)</option>
                        		<option value=88>Gender Studies (BA)</option>
                        		<option value=89>GeoDesign (BA)</option>
                        		<option value=90>Geological Sciences (BS)</option>
                        		<option value=91>Global Health Studies (BS)</option>
                        		<option value=92>Global Studies (BA)</option>
                        		<option value=93>Health and Humanity (BA)</option>
                        		<option value=94>Health and Human Sciences (BA)</option>
                        		<option value=95>Health Promotion and Disease Prevention Studies (BA)</option>
                        		<option value=96>History (BA)</option>
                        		<option value=97>History and Social Science Education (BA)</option>
                        		<option value=98>Human Biology (BA)</option>
                        		<option value=99>Human Biology (BS)</option>
                        		<option value=100>Human Development and Aging (BS)</option>
                        		<option value=101>Human Development and Aging, Health Science Track (BS)</option>
                        		<option value=102>Human Development and Aging, Honors Program (BS)</option>
                        		<option value=103>Industrial and Systems Engineering (BS)</option>
                        		<option value=104>Interactive Entertainment (BA)</option>
                        		<option value=105>Interdisiplinary Archaeology (BA)</option>
                        		<option value=106>International Relations (BA)</option>
                        		<option value=107>International Relations (Global Business) (BA)</option>
                        		<option value=108>International Relations and the Global Economy (BA)</option>
                        		<option value=109>Italian (BA)</option>
                        		<option value=110>Jazz Studies (BM)</option>
                        		<option value=111>Jewish Studies (BA)</option>
                        		<option value=112>Journalism (BA)</option>
                        		<option value=113>Judaic Studies Emphasis (BA)</option>
                        		<option value=114>Law, History, and Culture (BA)</option>
                        		<option value=115>Lifespan Health (BS)</option>
                        		<option value=116>Linguistics (BA)</option>
                        		<option value=117>Linguistics and Cognitive Science (BA)</option>
                        		<option value=118>Linguistics and East Asian Languages and Cultures (BA)</option>
                        		<option value=119>Linguistics and Philosophy (BA)</option>
                        		<option value=120>Linguistics and Psychology (BA)</option>
                        		<option value=121>Mathematics (BA)</option>
                        		<option value=122>Mathematics (BS)</option>
                        		<option value=123>Mathematics/Economics (BS)</option>
                        		<option value=124>Mechanical Engineering (BS)</option>
                        		<option value=125>Mechanical Engineering, Petroleum Engineering (BS)</option>
                        		<option value=126>Media, Arts and Practice (BA)</option>
                        		<option value=127>Middle East Stuidies (BA)</option>
                        		<option value=128>Music (BA)</option>
                        		<option value=129>Music Industry (BM)</option>
                        		<option value=130>Music Industry (BS)</option>
                        		<option value=131>Music Production (BM)</option>
                        		<option value=132>Narrative Studies (BA)</option>
                        		<option value=133>Neuroscience (BA)</option>
                        		<option value=134>Neuroscience (BS)</option>
                        		<option value=135>Non-Governmental Organizations and Social Change (BA)</option>
                        		<option value=136>Occupational Therapy (BS)</option>
                        		<option value=137>Performance (Classical Guitar)(BM)</option>
                        		<option value=138>Performance (Flute),(Oboe),(Clarinet),(Bassoon),(Saxophone),(French Horn),(Trumpet),(Trombone),(Tuba)or(Percussion)(BM)</option>
                        		<option value=139>Performance (Organ)(BM)</option>
                        		<option value=140>Performance (Piano)(BM)</option>
                        		<option value=141>Performance (Popular Music)(BM)</option>
                        		<option value=142>Performance (Studio Guitar)(BM)</option>
                        		<option value=143>Performance (Violin),(Viola),(Violoncello),(Double Bass) or (Harp)(BM)</option>
                        		<option value=144>Performance (Vocal Arts)(BM)</option>
                        		<option value=145>Philosophy (BA)</option>
                        		<option value=146>Philosophy, Politics and Law (BA)</option>
                        		<option value=147>Physical Sciences (BS)</option>
                        		<option value=148>Physical Sciences (BS)</option>
                        		<option value=149>Physics (BA)</option>
                        		<option value=150>Physics (BS)</option>
                        		<option value=151>Physics/Computer Science (BS)</option>
                        		<option value=152>Political Economy (BA)</option>
                        		<option value=153>Political Science (BA)</option>
                        		<option value=154>Psychology (BA)</option>
                        		<option value=155>Public Policy (BA)</option>
                        		<option value=156>Public Relations (BA)</option>
                        		<option value=157>Real Estate Development (BS)</option>
                        		<option value=158>Religion (BA)</option>
                        		<option value=159>Russian (BA)</option>
                        		<option value=160>Social Sciences,with and Emphasis in Economics (BA)</option>
                        		<option value=161>Social Sciences,with and Emphasis in Psychology (BA)</option>
                        		<option value=162>Sociology (BA)</option>
                        		<option value=163>Spanish (BA)</option>
                        		<option value=164>Theatre (BA)</option>
                        		<option value=165>Theatre, Acting Emphasis (BA)</option>
                        		<option value=166>Theatre, Acting Emphasis (BFA)</option>
                        		<option value=167>Theatre, Design Emphasis (BA)</option>
                        		<option value=168>Theatre, Design Emphasis (BFA)</option>
                        		<option value=169>Theatre, Sound Design Emphasis (BFA)</option>
                        		<option value=170>Theatre, Stage Management Emphasis (BFA)</option>
                        		<option value=171>Theatre, Technical Direction Emphasis (BFA)</option>
                        		<option value=172>Urban Studies and Planning (BS)</option>
                        		<option value=173>Visual and Performing Arts Studies (BA)</option>
                        		<option value=174>Writing for Screen and Television (BFA)</option>
                        		<option value=175>Food Industry Management Program</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: center; align: center">Minor:</td>
                        <td><select class = field name="minor" style="width:200px; font-size: 15px; font-family: tableTitles">
                        		<option value=0>Select a minor</option>
                        		<option value=1>2-D Art for Games Minor</option>
                        		<option value=2>3-D Animations in Cinematic Arts Minor</option>
                        		<option value=3>3-D Art for Games Minor </option>
                        		<option value=4>3-Dimensional Design Minor </option>
                        		<option value=5>3D Computer Graphics and Modeling </option>
                        		<option value=6>Accounting Minor </option>
                        		<option value=7>Advertising Minor </option>
                        		<option value=8>American Popular Culture Minor </option>
                        		<option value=9>American Studies and Ethnicity Minor </option>
                        		<option value=10>Animation and Digital Arts Minor </option>
                        		<option value=11>Applied Analytics Minor </option>
                        		<option value=12>Applied Computer Security Minor</option>
                        		<option value=13>Applied Theatre Arts Minor </option>
                        		<option value=14>Arabic and Middle East Studies Minor </option>
                        		<option value=15>Arabic Minor </option>
                        		<option value=16>Architecture Minor </option>
                        		<option value=17>Art History Minor </option>
                        		<option value=18>Astronautical Engineering Minor</option>
                        		<option value=19>Astronomy Minor </option>
                        		<option value=20>Behavioral Economics Minor </option>
                        		<option value=21>Biotechnology Minor </option>
                        		<option value=22>Business Economics Minor </option>
                        		<option value=23>Business Finance Minor</option>
                        		<option value=24>Business Law Minor</option>
                        		<option value=25>Business Minor</option>
                        		<option value=26>Business Technology Fusion Minor </option>
                        		<option value=27>Ceramics Minor </option>
                        		<option value=28>Chemistry Minor </option>
                        		<option value=29>Cinema-Television for the Health Professions Minor </option>
                        		<option value=30>Cinematic Arts Minor</option>
                        		<option value=31>Classical Perspectives Minor </option>
                        		<option value=32>Classics Minor</option>
                        		<option value=33>Comedy (Performance) Minor </option>
                        		<option value=34>Comedy Minor </option>
                        		<option value=35>Communication Design Minor </option>
                        		<option value=36>Communication Policy and Law Minor </option>
                        		<option value=37>Communication Technology Practices and Platforms Minor </option>
                        		<option value=38>Comparative Literature Minor </option>
                        		<option value=39>Computational Biology and Bioinformatics Minor </option>
                        		<option value=40>Computer and Digital Forensics Minor </option>
                        		<option value=41>Computer Programming Minor </option>
                        		<option value=42>Computer Science Minor </option>
                        		<option value=43>Construction Planning and Management Minor </option>
                        		<option value=44>Construction Planning and Management Minor (Public Policy) </option>
                        		<option value=45>Consumer Behavior Interdisciplinary Minor </option>
                        		<option value=46>Consumer Behavior Minor</option>
                        		<option value=47>Craniofacial and Dental Technology Minor </option>
                        		<option value=48>Critical Approaches to Leadership Minor </option>
                        		<option value=49>Cultural Anthropology Minor </option>
                        		<option value=50>Cultural Competence in Medicine Minor </option>
                        		<option value=51>Cultural Studies Minor </option>
                        		<option value=52>Culture, Media and Entertainment Minor </option>
                        		<option value=53>Cultures and Politics of the Pacific Rim Minor </option>
                        		<option value=54>Dance in Popular Culture: Hip-Hop, Urban and Social Dance Minor </option>
                        		<option value=55>Dance Minor </option>
                        		<option value=56>Digital Studies Minor </option>
                        		<option value=57>Drawing Minor </option>
                        		<option value=58>Early Modern Studies Interdisciplinary Minor </option>
                        		<option value=59>Earth Sciences Minor: Climate Change, Stewardship and Resiliency </option>
                        		<option value=60>East Asian Area Studies Minor </option>
                        		<option value=61>East Asian Languages and Cultures Minor </option>
                        		<option value=62>Economics Minor </option>
                        		<option value=63>Education and Society Minor </option>
                        		<option value=64>Engineering Management Minor </option>
                        		<option value=65>English Minor </option>
                        		<option value=66>Enterprise Information Systems Minor </option>
                        		<option value=67>Entertainment Industry Minor </option>
                        		<option value=68>Entrepreneurship Minor </option>
                        		<option value=69>Environmental Chemistry and Sustainability Minor </option>
                        		<option value=70>Environmental Engineering Minor </option>
                        		<option value=71>Environmental Health Minor </option>
                        		<option value=72>Environmental Studies Minor </option>
                        		<option value=73>Ethics and Moral Philosophy Minor </option>
                        		<option value=74>Folklore and Popular Culture Minor</option>
                        		<option value=75>Forensics and Criminality Minor </option>
                        		<option value=76>French Minor </option>
                        		<option value=77>Game Animation Minor </option>
                        		<option value=78>Game Audio Minor </option>
                        		<option value=79>Game Design Minor </option>
                        		<option value=80>Game Entrepreneurism Minor </option>
                        		<option value=81>Game Studies Minor </option>
                        		<option value=82>Game User Research Minor </option>
                        		<option value=83>Gender and Social Justice Minor </option>
                        		<option value=84>Gender Studies Minor </option>
                        		<option value=85>Geobiology Minor </option>
                        		<option value=86>Geohazards Minor </option>
                        		<option value=87>German Minor</option>
                        		<option value=88>Global Communication Minor </option>
                        		<option value=89>Global Health Minor </option>
                        		<option value=90>Health Administration Minor </option>
                        		<option value=91>Health Care Studies Minor </option>
                        		<option value=92>Health Communication Minor </option>
                        		<option value=93>Health Policy Minor </option>
                        		<option value=94>History and Culture of Business Minor </option>
                        		<option value=95>History Minor </option>
                        		<option value=96>Human Movement Sciences Minor</option>
                        		<option value=97>Human Resource Management Minor </option>
                        		<option value=98>Human Rights Minor </option>
                        		<option value=99>Human Security and Geospatial Intelligence Minor </option>
                        		<option value=100>Individuals, Societies and Aging Minor </option>
                        		<option value=101>Innovation: The Digital Entrepreneur Minor </option>
                        		<option value=102>Interdisciplinary Archaeology Minor </option>
                        		<option value=103>International Health, Development, and Social Justice Interdisciplinary Minor </option>
                        		<option value=104>International Policy and Management Minor </option>
                        		<option value=105>International Relations Minor </option>
                        		<option value=106>Iranian Studies Minor </option>
                        		<option value=107>Italian Minor </option>
                        		<option value=108>Jazz Studies Minor </option>
                        		<option value=109>Jewish American Studies Minor </option>
                        		<option value=110>Jewish Studies Minor </option>
                        		<option value=111>Judaic Studies Minor </option>
                        		<option value=112>Korean Studies Minor </option>
                        		<option value=113>Landscape Architecture Minor </option>
                        		<option value=114>Latin American Studies Minor </option>
                        		<option value=115>Law and Public Policy Minor </option>
                        		<option value=116>Law and Society Minor </option>
                        		<option value=117>LGBTQ Minor </option>
                        		<option value=118>Linguistics Minor </option>
                        		<option value=119>Luso-Brazilian Studies Minor </option>
                        		<option value=120>Management Consulting Minor  </option>
                        		<option value=121>Managing Human Relations Minor </option>
                        		<option value=122>Marketing Minor </option>
                        		<option value=123>Mathematical Finance Minor </option>
                        		<option value=124>Mathematics Minor </option>
                        		<option value=125>Media and Social Change Minor </option>
                        		<option value=126>Media Economics and Entrepreneurship Interdisciplinary Minor </option>
                        		<option value=127>Media Economics and Entrepreneurship Minor </option>
                        		<option value=128>Medical Anthropology Minor</option>
                        		<option value=129>Middle East Studies Minor </option>
                        		<option value=130>Mobile App Development Minor </option>
                        		<option value=131>Music Industry Minor </option>
                        		<option value=132>Music Production Minor  </option>
                        		<option value=133>Music Recording Minor </option>
                        		<option value=134>Musical Studies Minor </option>
                        		<option value=135>Musical Theatre Minor </option>
                        		<option value=136>Nanotechnology Minor </option>
                        		<option value=137>Narrative Structure Interdisciplinary Minor </option>
                        		<option value=138>Natural Science Minor </option>
                        		<option value=139>Neuroscience Minor </option>
                        		<option value=140>News Media and Society Minor </option>
                        		<option value=141>Nonprofits, Philanthropy and Volunteerism Minor </option>
                        		<option value=142>Nutrition and Health Promotion Minor </option>
                        		<option value=143>Occupational Science Minor </option>
                        		<option value=144>Operations and Supply Chain Management Minor </option>
                        		<option value=145>Organizational Leadership and Management Minor </option>
                        		<option value=146>Painting Minor  </option>
                        		<option value=147>Performance Science Minor </option>
                        		<option value=148>Performing Arts Studies Minor </option>
                        		<option value=149>Petroleum Engineering Minor  </option>
                        		<option value=150>Philosophy Minor </option>
                        		<option value=151>Photography and Social Change Minor </option>
                        		<option value=152>Photography Minor </option>
                        		<option value=153>Physics Minor </option>
                        		<option value=154>Playwriting Minor </option>
                        		<option value=155>Political Organizing in the Digital Age Minor </option>
                        		<option value=156>Political Science Minor </option>
                        		<option value=157>Popular Music Studies Minor </option>
                        		<option value=158>Professional and Managerial Communication Minor  </option>
                        		<option value=159>Psychology and Law Minor </option>
                        		<option value=160>Psychology Minor </option>
                        		<option value=161>Public Health Minor </option>
                        		<option value=162>Public Relations Minor </option>
                        		<option value=163>Race, Ethnicity and Politics Minor </option>
                        		<option value=164>Real Estate Development Minor</option>
                        		<option value=165>Real Estate Finance Minor </option>
                        		<option value=166>Religion Minor</option>
                        		<option value=167>Resistance to Genocide Interdisciplinary Minor </option>
                        		<option value=168>Russian Area Studies Minor </option>
                        		<option value=169>Russian Minor </option>
                        		<option value=170>Science and Management of Biomedical Therapeutics Minor</option>
                        		<option value=171>Science Visualization Minor </option>
                        		<option value=172>Science, Health and Aging Minor </option>
                        		<option value=173>Science, Technology, and Society Minor </option>
                        		<option value=174>Screenwriting Minor </option>
                        		<option value=175>Sculpture Minor</option>
                        		<option value=176>Social Entrepreneurship Minor </option>
                        		<option value=177>Sociology Minor</option>
                        		<option value=178>Songwriting Minor </option>
                        		<option value=179>Southeast Asia and its People Minor </option>
                        		<option value=180>Spanish Minor </option>
                        		<option value=181>Spatial Studies Minor</option>
                        		<option value=182>Sports Media Studies Minor </option>
                        		<option value=183>Statistics Minor </option>
                        		<option value=184>Substance Abuse Prevention Minor </option>
                        		<option value=185>Teaching English to Speakers of Other Languages (TESOL) Minor </option>
                        		<option value=186>Technology Commercialization Minor </option>
                        		<option value=187>The Dynamics of Early Childhood Minor </option>
                        		<option value=188>Theatre Minor </option>
                        		<option value=189>Thematic Approaches to Humanities and Society Minor </option>
                        		<option value=190>Themed Entertainment Minor </option>
                        		<option value=191>Theories of Art Minor </option>
                        		<option value=192>Two-Dimensional Studies Minor </option>
                        		<option value=193>Urban Sustainable Planning Minor </option>
                        		<option value=194>Video Game Design and Management Minor </option>
                        		<option value=195>Video Game Programming Minor </option>
                        		<option value=196>Visual Culture Minor </option>
                        		<option value=197>Web Technologies and Applications Minor  </option>
                        	</select>		
                    </tr>
                    <tr>
                             <td style="color:white; font-size:30px; text-align:left">Expected Graduation:</td>
                                  <td> <select class = field name="minor" style="width:200px; font-size: 15px; font-family: tableTitles">
                                         <option value=0>Select Expected Graduation </option>
                                          <option value=1>May 2019 </option>
                                          <option value=2>December 2019 </option>
                                          <option value=3>May 2020 </option>
                                          <option value=4>December 2020 </option>
                                          <option value=5>May 2021 </option>
                                          <option value=6>December 2021 </option>
                                          <option value=7>May 2022 </option>
                                          <option value=8>December 2022 </option>
                                          <option value=9>May 2023 </option>
                                          <option value=10>December 2023 </option>
                                          <option value=10>May 2024 </option>
                                   </select>
                             </td>
                       </tr>
                    <tr>
                        <td colspan="2" align="center"><input id="button2" type="submit" name="submit" value="Register" />
                            &nbsp;&nbsp;
                            <input id="button1" type="reset" value="Clear" />
                        </td>                        
                    </tr>  
                    <tr>
                        <td colspan="2" align="center">
                        	<a href="main.jsp" style="font-size: 20px">Or click here to continue anonymously!</a>
                        </td>                        
                    </tr>                   
                </tbody>
            </table>
        </form>
	</div>
</body>
</html>
