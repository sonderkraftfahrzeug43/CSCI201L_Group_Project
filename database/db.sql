DROP DATABASE IF EXISTS schedulebuilder;
CREATE DATABASE schedulebuilder;
USE schedulebuilder;
/*CREATE MAJOR TABLE */
CREATE TABLE Major (
	MajorID INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    requirements VARCHAR(200) NOT NULL
);
/*INSERT MAJORS */
INSERT INTO Major
VALUES ('1', 'Accounting (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5149'),
('2', 'Aerospace Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5541'),
('3', 'American Studies and Ethnicity (African American Studies)(BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5190'),
('4', 'American Studies and Ethnicity (Asian American Studies)(BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5191'),
('5', 'American Studies and Ethnicity (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5189'),
('6','American Studies and Ethnicity (Chicano/Latino Studies) (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5192'),
('7', 'Animation and Digital Arts (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5155'),
('8', 'Anthropology (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5197'),
('9', 'Anthropology (Visual Anthropology) (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5198'),
('10','Applied and Computational Mathematics (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5355'),
('11', 'Applied and Computational Mathematics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5356'),
('12', 'Applied Mechanics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5580'),
('13', 'Architectural Studies (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5051'),
('14', 'Architecture (BArch)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5082'),
('15','Art (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5066'),
('16','Art History (BA)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5208'),
('17','Arts, Technology and the Business of Innovation (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5081'),
('18','Astronautical Engineering (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5551'),
('19','Astronomy (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5390'),
('20','Astronomy (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5387'),
('21', 'Biochemistry (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5219'),
('22', 'Biological Sciences (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5215'),
('23', 'Biological Sciences (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5216'),
('24', 'Biomedical Engineering (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5555'),
('25','Biomedical Engineering, Biochemical Engineering Emphasis, (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5556'),
('26', 'Biomedical Engineering, Electrical Engineering Emphasis, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5557'),
('27', 'Biomedical Engineering, Mechanical Engineering Emphasis, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5558'),
('28', 'Biophysics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5391'),
('29','Business Administration (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5086'),
('30', 'Business Administration (Cinematic Arts) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5087'),
('31', 'Business Administration (International Relations) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5088'),
('32', 'Business Administration (Real Estate Finance) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5089'),
('33', 'Business Administration (World Program) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5090'),
('34','Central European Studies (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5426'),
('35','Chemical Engineering (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5564'),
('36','Chemical Engineering, Biochemical Engineering Emphasis, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5565'),
('37','Chemical Engineering, Environmental Engineering Emphasis, (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5566'),
('38','Chemical Engineering, Nanotechnology Emphasis, (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5567'),
('39','Chemical Engineering, Petroleum Engineering Emphasis, (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5568'),
('40','Chemical Engineering, Polymer/Materials Science Emphasis, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5569'),
('41', 'Chemical Engineering, Sustainable Energy Emphasis (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6109'),
('42', 'Chemistry (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5236'),
('43', 'Chemistry (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5232'),
('44', 'Chemistry (Chemical Biology) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5235'),
('45','Chemistry (Chemical Nanoscience) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5234'),
('46','Chemistry (Research) (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5233'),
('47','Choral Music (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5755'),
('48','Cinema and Media Studies (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6079'),
('49','Cinematic Arts, Film and Television Production (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5160'),
('50','Cinematic Arts, Film and Television Production (BFA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5161'),
('51', 'Civil Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6110'),
('52', 'Civil Engineering, Building Science Emphasis (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6111'),
('53', 'Civil Engineering, Environmental Engineering Emphasis (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6112'),
('54', 'Civil Engineering, Structural Engineering Emphasis (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6113'),
('55','Classics (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5242'),
('56', 'Cognitive Science (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5411'),
('57', 'Communication (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5449'),
('58', 'Comparative Literature (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5246'),
('59','Composition (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5741'),
('60', 'Computational Neuroscience (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5372'),
('61', 'Computer Engineering and Computer Science (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5594'),
('62', 'Computer Science (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5597'),
('63', 'Computer Science (Games) (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5598'),
('64','Computer Science/Business Administration (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5599'),
('65','Contemporary Latino and Latin American Studies (BA)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6104'),
('66','Dance (BFA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5480'),
('67','Dental Hygiene (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5483'),
('68','Earth Sciences (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5257'),
('69','East Asian Area Studies (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5263'),
('70','East Asian Languages and Cultures (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5269'),
('71', 'Economics (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5274'),
('72', 'Economics/Mathematics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5277'),
('73', 'Electrical Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5614'),
('74', 'English (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5286'),
('75','Environmental Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6114'),
('76','Environmental Science and Health (BA)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5303'),
('77','Environmental Science and Health (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5304'),
('78','Environmental Studies, Climate, Earth and Environment Concentration (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5297'),
('79','Environmental Studies, Climate, Earth and Environment Concentration (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5301'),
('80','Environmental Studies, Environmental Public Policy Concentration (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5298'),
('81', 'Environmental Studies, Environmental Public Policy Concentration (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5302'),
('82', 'Environmental Studies, Oceans, Life and People Concentration (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5296'),
('83', 'Environmental Studies, Oceans, Life and People Concentration (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5300'),
('84', 'Environmental Studies, Sustainability, Energy and Society Concentration (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5295'),
('85','Environmental Studies, Sustainability, Energy and Society Concentration (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5299'),
('86', 'Fine Arts (BFA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5065'),
('87', 'French (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5308'),
('88', 'Gender Studies (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5312'),
('89','GeoDesign (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5441'),
('90', 'Geological Sciences (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5256'),
('91', 'Global Health Studies (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5722'),
('92', 'Global Studies (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5199'),
('93', 'Health and Humanity (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5317'),
('94','Health and the Human Sciences (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5326'),
('95','Health Promotion and Disease Prevention Studies (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5721'),
('96','History (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5318'),
('97','History and Social Science Education (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5319'),
('98','Human Biology (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5218'),
('99','Human Biology (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5217'),
('100','Human Development and Aging (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5654'),
('101', 'Human Development and Aging, Health Science Track, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5655'),
('102', 'Human Development and Aging, Honors Programs, (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5656'),
('103', 'Industrial and Systems Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5625'),
('104', 'Interactive Entertainment (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5163'),
('105','Interdisciplinary Archaeology (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5421'),
('106','International Relations (BA)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5329'),
('107','International Relations (Global Business) (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5330'),
('108','International Relations and the Global Economy (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5331'),
('109','Italian (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5310'),
('110','Jazz Studies (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5742'),
('111', 'Jewish Studies (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6105'),
('112', 'Journalism (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6126'),
('113', 'Judaic Studies Emphasis (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5420'),
('114', 'Law, History, and Culture (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5320'),
('115','Lifespan Health (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5657'),
('116', 'Linguistics (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5343'),
('117', 'Linguistics and Cognitive Science (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6080'),
('118', 'Linguistics and East Asian Languages and Cultures (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5345'),
('119','Linguistics and Philosophy (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5344'),
('120', 'Linguistics and Psychology (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5410'),
('121', 'Mathematics (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5353'),
('122', 'Mathematics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5354'),
('123', 'Mathematics/Economics (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5359'),
('124','Mechanical Engineering (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5545'),
('125','Mechanical Engineering, Petroleum Engineering, (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5546'),
('126','Media Arts and Practice (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5167'),
('127','Middle East Studies (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5367'),
('128','Music (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5754'),
('129','Music Industry (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5752'),
('130','Music Industry (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5753'),
('131', 'Music Production (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5743'),
('132', 'Narrative Studies (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5288'),
('133', 'Neuroscience (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5370'),
('134', 'Neuroscience (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5371'),
('135','Non-Governmental Organizations and Social Change (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5431'),
('136','Occupational Therapy (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5678'),
('137','Performance (Classical Guitar) (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5745'),
('138','Performance (Flute), (Oboe), (Clarinet), (Bassoon), (Saxophone), (French Horn), (Trumpet), (Trombone), (Tuba) or (Percussion) (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5750'),
('139','Performance (Organ) (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5747'),
('140','Performance (Piano) (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5746'),
('141', 'Performance (Popular Music) (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5751'),
('142', 'Performance (Studio Guitar) (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5744'),
('143', 'Performance (Violin), (Viola), (Violoncello), (Double Bass) or (Harp) (BM)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5748'),
('144', 'Performance (Vocal Arts) (BM)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5749'),
('145','Philosophy (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5376'),
('146', 'Philosophy, Politics and Law (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5377'),
('147', 'Physical Sciences (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5392'),
('148', 'Physical Sciences (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5258'),
('149','Physics (BA)', 'http://catalogue.usc.edu/content.php?catoid=6&navoid=1553'),
('150', 'Physics (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5386'),
('151', 'Physics/Computer Science (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5388'),
('152', 'Political Economy (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5275'),
('153', 'Political Science (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5399'),
('154','Psychology (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5408'),
('155','Public Policy (BS)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6072'),
('156','Public Relations (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5472'),
('157','Real Estate Development (BS)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5822'),
('158','Religion (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5419'),
('159','Russian (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5425'),
('160','Social Sciences, with an Emphasis in Economics (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5276'),
('161', 'Social Sciences, with an Emphasis in Psychology (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5409'),
('162', 'Sociology (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5430'),
('163', 'Spanish (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5438'),
('164', 'Theatre (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5504'),
('165','Theatre, Acting Emphasis, (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5505'),
('166','Theatre, Acting Emphasis, (BFA)' , 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5507'),
('167','Theatre, Design Emphasis, (BA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5506'),
('168','Theatre, Design Emphasis, (BFA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5508'),
('169','Theatre, Sound Design Emphasis, (BFA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5509'),
('170','Theatre, Stage Management Emphasis, (BFA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5510'),
('171', 'Theatre, Technical Direction Emphasis, (BFA)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5511'),
('172', 'Urban Studies and Planning (BS)', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=6073'),
('173', 'Visual and Performing Arts Studies (BA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5512'),
('174', 'Writing for Screen and Television (BFA)','http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5172'),
('175', 'Food Industry Management Program', 'http://catalogue.usc.edu/preview_program.php?catoid=6&poid=5091');

/*CREATE MINOR TABLE */
CREATE TABLE Minor (
	MinorID INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    requirements VARCHAR(200) NOT NULL
);
/*INSERT MINORS - MARK*/
INSERT INTO Minor /*REPLACE*/
VALUES('1','test','test');/*REPLACE*/

/*CREATE GRADYEAR TABLE */
CREATE TABLE GradYear (
	GradYID INT(11) PRIMARY KEY AUTO_INCREMENT,
    year int(11) NOT NULL
);
/*INSERT GRADYEARS */
INSERT INTO GradYear
VALUES('1','2019'),
('2','2020'),
('3','2021'),
('4','2022'),
('5','2023'),
('6','2024'),
('7','2025'),
('8','2026'),
('9','2027'),
('10','2028');

/*CREATE SCHEDULE TABLE - TODO */
/*INSERT INTO SCHEDULE - TODO */

/*CREATE USER TABLE */
CREATE TABLE User (
	UserID INT(11) PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(30) NOT NULL,
    pass VARCHAR(30) NOT NULL,
	majorID INT(11),
    minorID INT(11),
    gradYID INT(11),
    FOREIGN KEY fk1 (majorID) REFERENCES Major(MajorID),
    FOREIGN KEY fk2 (minorID) REFERENCES Minor(MinorID),
    FOREIGN KEY fk3 (gradYID) REFERENCES GradYear(GradYID)
    );
/*INSERT TEST USER TABLE */
INSERT INTO User
VALUES('1','USER','PASS','1','1','1'),
('2','USER2','PASS2','2','1','2'),
('3','USER3','PASS3','3','1','3'),
('4','USER4','PASS4','4','1','4');

/*CREATE FRIEND TABLE */
CREATE TABLE Friend (
	FriendID INT(11) PRIMARY KEY AUTO_INCREMENT,
    user1ID INT(11),
    user2ID INT(11),
    confirmed INT(11) NOT NULL,
    FOREIGN KEY fk1 (user1ID) REFERENCES User(UserID),
    FOREIGN KEY fk2 (user2ID) REFERENCES User(UserID)
);
/*INSERT INTO FRIEND */
INSERT INTO Friend
VALUES('1','1','2','0'), /*0 =  NOT CONFIRMED */
('2','1','2','1'); /*1 = CONFIRMED */

/*CREATE UPDATE TABLE */
CREATE TABLE Updates (
	UpdateID INT(11) PRIMARY KEY AUTO_INCREMENT,
    userID INT(11),
    date datetime,
    content VARCHAR(1000),
    FOREIGN KEY fk1 (userID) REFERENCES User(UserID)
);
/*INSERT INTO UPDATE */
INSERT INTO Updates
VALUES('1','1','2019-08-30 19:05:00','TEST UPDATE'), 
('2','3','2019-08-30 19:05:00','TEST UPDATE 2');

/*CREATE PREVIOUSCLASS TABLE */
CREATE TABLE PreviousClass (
	PrevCID INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    userID INT(11),
    FOREIGN KEY fk1 (userID) REFERENCES User(UserID)
);
/*INSERT INTO PREVIOUS CLASS */
INSERT INTO PreviousClass
VALUES('1','CSCI-201','1');

/*CREATE CURRENTCLASS TABLE */
CREATE TABLE CurrentClass (
	CurrCID INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    section VARCHAR(30),
    location VARCHAR(30),
    hrs VARCHAR(30),
    professor VARCHAR(30),
    userID INT(11),
    FOREIGN KEY fk1 (userID) REFERENCES User(UserID)
);
/*INSERT INTO CURRENT CLASS */
INSERT INTO CurrentClass
VALUES('2','CSCI-201','section1', 'location1','TTH:9:00-9:50', 'Professor1','1');
