---Project milestone 1
---By: Elh76 & Leo10


DROP TABLE Profiles CASCADE CONSTRAINTS;
DROP TABLE Friendships CASCADE CONSTRAINTS;
DROP TABLE Groups CASCADE CONSTRAINTS;
DROP TABLE Messages CASCADE CONSTRAINTS;

---Making the Profile table
CREATE TABLE Profiles
(	username 			varchar2(80),
    email   		varchar2(30),
	dob 			DATE,
	timeoflastlogin TIMESTAMP
);


---Making the Friendship table
CREATE TABLE Friendships
(	nameofuser 	varchar2(80),
	requestto varchar2(32),
	request number(1),
	status  varchar2(32),
	dateoffriendship    DATE
);

---Making the Group table
CREATE TABLE Groups
(	groupname 	 varchar2(32),
	description  varchar2(32),
	numofmembers INTEGER,
	CONSTRAINT memberlimit CHECK (numofmembers <= 100)
);


---Making the Messages table
CREATE TABLE Messages
(	subject 	varchar2(40),
	textmsg     varchar2(100),
	sender  	varchar2(32),
	dateofmsg 	DATE,
	groupmsg	number(1)
);


---Inserting into Profile table

INSERT INTO Profiles VALUES('Tom Hickory', 'tomh12@pitt.edu', DATE '1993-02-01', TIMESTAMP '2002-01-01 04:15:57');
INSERT INTO Profiles VALUES('Bridget Egler', 'bse12@pitt.edu', DATE '1993-09-30', TIMESTAMP '2007-02-02 05:15:57');
INSERT INTO Profiles VALUES('Sara Mills', 'smills01@pitt.edu', DATE '1993-03-09', TIMESTAMP '2007-01-09 02:15:57');
INSERT INTO Profiles VALUES('Janna Votodian', 'jmv34@pitt.edu', DATE '1993-03-27', TIMESTAMP '2002-02-07 02:15:55');
INSERT INTO Profiles VALUES('Hannah Barton', 'hmb43@pitt.edu', DATE '1993-07-23', TIMESTAMP '2006-03-03 06:15:57');	
INSERT INTO Profiles VALUES('Eric Egler', 'erice@pitt.edu', DATE '1992-08-23', TIMESTAMP '2003-05-11 07:15:57');
INSERT INTO Profiles VALUES('Jeff Egler', 'potatojeff@pitt.edu', DATE '1990-04-26', TIMESTAMP '2005-03-01 04:15:57');
INSERT INTO Profiles VALUES('Jeffrey Smolen', 'jeffy@pitt.edu', DATE '1996-01-14', TIMESTAMP '2003-06-02 04:15:57');
INSERT INTO Profiles VALUES('Oksana Ortmann', 'oko@pitt.edu', DATE '1989-06-03', TIMESTAMP '2001-02-09 04:15:57');
INSERT INTO Profiles VALUES('Peggy Ortmann', 'psue@pitt.edu', DATE '1980-04-02', TIMESTAMP '2011-01-09 08:15:57');
INSERT INTO Profiles VALUES('Mike Ortmann', 'meo1@pitt.edu', DATE '1979-02-01', TIMESTAMP '2012-05-10 07:15:57');
INSERT INTO Profiles VALUES('Diane Smolen', 'dianeds3@pitt.edu', DATE '1989-01-21', TIMESTAMP '2011-01-10 09:15:57');
INSERT INTO Profiles VALUES('Val Becker', 'vbecker@pitt.edu', DATE '1980-07-24', TIMESTAMP '2010-06-21 07:40:57');
INSERT INTO Profiles VALUES('Tommy Becker', 'tomtom42@pitt.edu', DATE '1995-07-21', TIMESTAMP '2009-02-21 05:15:57');
INSERT INTO Profiles VALUES('Elisha Becker', 'eliman@pitt.edu', DATE '1994-06-22', TIMESTAMP '2008-05-23 06:15:57');
INSERT INTO Profiles VALUES('Sasha Becker', 'snoshers@pitt.edu', DATE '1992-08-23', TIMESTAMP '2007-07-09 07:15:57');
INSERT INTO Profiles VALUES('Mike Becker', 'mbecker@pitt.edu', DATE '1980-01-22', TIMESTAMP '2011-07-23 08:12:57');
INSERT INTO Profiles VALUES('Daniel Robertson', 'danrob@pitt.edu', DATE '1980-07-14', TIMESTAMP '2011-01-09 01:45:57');
INSERT INTO Profiles VALUES('Carter Johnson', 'carterj@pitt.edu', DATE '1993-04-14', TIMESTAMP '2008-03-12 09:22:57');
INSERT INTO Profiles VALUES('Mary Lou', 'mmlou@pitt.edu', DATE '1973-06-29', TIMESTAMP '2011-07-15 08:32:57');
INSERT INTO Profiles VALUES('Mark Szfranski', 'mks100@pitt.edu', DATE '1993-07-03', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Tom Truchok', 'tomlit45@pitt.edu', DATE '1993-04-23', TIMESTAMP '2003-01-09 04:15:57');
INSERT INTO Profiles VALUES('Jared Niall', 'niall46@pitt.edu', DATE '1993-02-14', TIMESTAMP '2007-01-09 04:15:57');
INSERT INTO Profiles VALUES('Nick Calzone', 'creepynick@pitt.edu', DATE '1993-09-30', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Andrea Lang', 'anglang@pitt.edu', DATE '1993-12-01', TIMESTAMP '2009-01-09 04:15:57');
INSERT INTO Profiles VALUES('Josh Lang', 'jlang@pitt.edu', DATE '1993-10-01', TIMESTAMP '2010-01-09 04:15:57');
INSERT INTO Profiles VALUES('Jessie Smolen', 'jess678@pitt.edu', DATE '1993-10-10', TIMESTAMP '2001-01-09 04:15:57');
INSERT INTO Profiles VALUES('Carissa Lang', 'carissa23@pitt.edu', DATE '1990-11-11', TIMESTAMP '2000-11-11 11:11:11');
INSERT INTO Profiles VALUES('Laura Barton', 'lmorrisb@pitt.edu', DATE '1960-05-05', TIMESTAMP '2002-01-09 04:15:57');
INSERT INTO Profiles VALUES('Laura Smolen', 'lsmolen@pitt.edu', DATE '1989-07-01', TIMESTAMP '2014-01-09 04:15:57');
INSERT INTO Profiles VALUES('Matt Henry', 'coolmatt345@pitt.edu', DATE '1993-02-20', TIMESTAMP '2015-01-09 04:15:57');
INSERT INTO Profiles VALUES('Sunny Patel', 'sunnyday23@pitt.edu', DATE '1993-02-01', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Matt Francowic', 'baseballmatt@pitt.edu', DATE '1993-07-13', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Shawna Henkel', 'shenkel@pitt.edu', DATE '1993-07-23', TIMESTAMP '2004-04-09 08:23:57');
INSERT INTO Profiles VALUES('Don Toomey', 'DrT@pitt.edu', DATE '1993-02-01', TIMESTAMP '2008-07-23 04:15:57');
INSERT INTO Profiles VALUES('Kristin Baker', 'KB@pitt.edu', DATE '1993-02-01', TIMESTAMP '2005-05-13 04:15:57');
INSERT INTO Profiles VALUES('Jake Ballard', 'Bigballard@pitt.edu', DATE '1993-02-01', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Kenzie Duncan', 'kenzD@pitt.edu', DATE '1992-07-26', TIMESTAMP '2004-04-11 03:32:57');
INSERT INTO Profiles VALUES('Kyle Mathias', 'kyletheguy@pitt.edu', DATE '1993-11-16', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Kiel Gierlach', 'kiel34@pitt.edu', DATE '1993-12-24', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Keri Dinkel', 'kdink@pitt.edu', DATE '1993-02-21', TIMESTAMP '2008-04-11 04:15:57');
INSERT INTO Profiles VALUES('Liz Hallahan', 'liztheham@pitt.edu', DATE '1993-06-18', TIMESTAMP '2004-02-12 04:15:57');
INSERT INTO Profiles VALUES('Harry Styles', 'larry@pitt.edu', DATE '1993-10-19', TIMESTAMP '2003-06-14 04:15:57');
INSERT INTO Profiles VALUES('Naill Horan', 'nailll23@pitt.edu', DATE '1993-09-05', TIMESTAMP '2000-11-10 04:15:57');
INSERT INTO Profiles VALUES('Zayn Malik', 'zaynM@pitt.edu', DATE '1993-04-02', TIMESTAMP '2001-02-09 04:15:57');
INSERT INTO Profiles VALUES('Liam Payne', 'LiamP@pitt.edu', DATE '1993-08-02', TIMESTAMP '2007-12-12 04:15:57');
INSERT INTO Profiles VALUES('Louis Stylinson', 'stylinL@pitt.edu', DATE '1993-12-01', TIMESTAMP '2012-02-12 04:15:57');
INSERT INTO Profiles VALUES('Andrea Egler', 'AnnoE@pitt.edu', DATE '1993-11-23', TIMESTAMP '2005-04-23 04:15:57');
INSERT INTO Profiles VALUES('Roger Barton', 'Rogerdoger@pitt.edu', DATE '1993-10-03', TIMESTAMP '2012-08-21 04:15:57');
INSERT INTO Profiles VALUES('Tom Smith', 'Tsmith@pitt.edu', DATE '1993-08-04', TIMESTAMP '2014-02-12 04:15:57');
INSERT INTO Profiles VALUES('Lena Ortmann', 'leo10@pitt.edu', DATE '1993-02-27', TIMESTAMP '2012-05-05 04:34:57');
insert into Profiles values('Erin Higgins', 'elh76@pitt.edu', DATE '1995-04-02', TIMESTAMP '2016-01-09 04:14:23');
insert into Profiles values('Gabby Means', 'gbm26@nyu.edu', DATE '1995-03-19', TIMESTAMP '2001-01-04 09:14:56');
insert into Profiles values('Kalyn Sigg', 'ksiggie@pitt.edu', DATE '1995-09-05', TIMESTAMP '2010-08-05 15:45:34');
insert into Profiles values('Sophie Means', 'sm@gmail.com', DATE '1996-08-19', TIMESTAMP '2012-07-10 19:23:12');
insert into Profiles values('Penny Means', 'pmeans@aol.com', DATE '2000-07-12', TIMESTAMP '2014-09-09 14:12:12');
insert into Profiles values('Dominic Means','dmeans23@gmail.com', DATE '1998-08-08', TIMESTAMP '2015-12-12 12:12:12');
INSERT INTO Profiles VALUES('Bridget Devine', 'bridge@pitt.edu', DATE '1994-02-01', TIMESTAMP '2002-01-01 04:15:57');
INSERT INTO Profiles VALUES('Maggie Devine', 'mag@pitt.edu', DATE '1982-09-30', TIMESTAMP '2007-02-02 05:15:57');
INSERT INTO Profiles VALUES('Fiona Connelly', 'fion@pitt.edu', DATE '1965-03-09', TIMESTAMP '2007-01-09 02:15:57');
INSERT INTO Profiles VALUES('Andy Samberg', 'youngsandwich@pitt.edu', DATE '1945-03-27', TIMESTAMP '2002-02-07 02:15:55');
INSERT INTO Profiles VALUES('Jorma Taccone', 'jorm@pitt.edu', DATE '1978-07-23', TIMESTAMP '2006-03-03 06:15:57');	
INSERT INTO Profiles VALUES('Akiva Shaffer', 'kiv@pitt.edu', DATE '1985-08-23', TIMESTAMP '2003-05-11 07:15:57');
INSERT INTO Profiles VALUES('John Belushi', 'blues@pitt.edu', DATE '1946-04-26', TIMESTAMP '2005-03-01 04:15:57');
INSERT INTO Profiles VALUES('Bill Hader', 'stefan@pitt.edu', DATE '1996-01-14', TIMESTAMP '2003-06-02 04:15:57');
INSERT INTO Profiles VALUES('John Mulaney', 'jm@pitt.edu', DATE '1989-06-03', TIMESTAMP '2001-02-09 04:15:57');
INSERT INTO Profiles VALUES('David Spade', 'tommyboy@pitt.edu', DATE '1980-04-02', TIMESTAMP '2011-01-09 08:15:57');
INSERT INTO Profiles VALUES('Chris Farley', 'riverliver@pitt.edu', DATE '1979-02-01', TIMESTAMP '2012-05-10 07:15:57');
INSERT INTO Profiles VALUES('Chevey Chase', 'vaca@pitt.edu', DATE '1989-01-21', TIMESTAMP '2011-01-10 09:15:57');
INSERT INTO Profiles VALUES('Amy Adams', 'notisla@pitt.edu', DATE '1980-07-24', TIMESTAMP '2010-06-21 07:40:57');
INSERT INTO Profiles VALUES('Mark Zuckerberg', 'research42@pitt.edu', DATE '1995-07-21', TIMESTAMP '2009-02-21 05:15:57');
INSERT INTO Profiles VALUES('Will Forte', 'lastman@pitt.edu', DATE '1994-06-22', TIMESTAMP '2008-05-23 06:15:57');
INSERT INTO Profiles VALUES('Adam Sandler', 'lilnicky@pitt.edu', DATE '1992-08-23', TIMESTAMP '2007-07-09 07:15:57');
INSERT INTO Profiles VALUES('Will Ferrel', 'lion@pitt.edu', DATE '1980-01-22', TIMESTAMP '2011-07-23 08:12:57');
INSERT INTO Profiles VALUES('Kyle Mooney', 'betterthankanye@pitt.edu', DATE '1980-07-14', TIMESTAMP '2011-01-09 01:45:57');
INSERT INTO Profiles VALUES('Collin Jost', 'goodhair@pitt.edu', DATE '1993-04-14', TIMESTAMP '2008-03-12 09:22:57');
INSERT INTO Profiles VALUES('Pete Davidson', 'luvdavid@pitt.edu', DATE '1973-06-29', TIMESTAMP '2011-07-15 08:32:57');
INSERT INTO Profiles VALUES('Joe Lynch', 'jtl44@pitt.edu', DATE '1993-07-03', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Jason Sudekis', 'jls23@pitt.edu', DATE '1993-04-23', TIMESTAMP '2003-01-09 04:15:57');
INSERT INTO Profiles VALUES('Joanna Newsom', 'barf23@pitt.edu', DATE '1993-02-14', TIMESTAMP '2007-01-09 04:15:57');
INSERT INTO Profiles VALUES('Petunia Mulaney', 'frenchy12@pitt.edu', DATE '1993-09-30', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Austin Pegg', 'app23@pitt.edu', DATE '1993-12-01', TIMESTAMP '2009-01-09 04:15:57');
INSERT INTO Profiles VALUES('Michelle Holdney', 'meh34@pitt.edu', DATE '1993-10-01', TIMESTAMP '2010-01-09 04:15:57');
INSERT INTO Profiles VALUES('Nick Sullivan', 'njs12@pitt.edu', DATE '1993-10-10', TIMESTAMP '2001-01-09 04:15:57');
INSERT INTO Profiles VALUES('Mathew Perry', 'mtp34@pitt.edu', DATE '1990-11-11', TIMESTAMP '2000-11-11 11:11:11');
INSERT INTO Profiles VALUES('Gabe Freeman', 'gef44@pitt.edu', DATE '1960-05-05', TIMESTAMP '2002-01-09 04:15:57');
INSERT INTO Profiles VALUES('Joe Marriuzza', 'jrm34@pitt.edu', DATE '1989-07-01', TIMESTAMP '2014-01-09 04:15:57');
INSERT INTO Profiles VALUES('Jess Slain', 'jks22@pitt.edu', DATE '1993-02-20', TIMESTAMP '2015-01-09 04:15:57');
INSERT INTO Profiles VALUES('Aleena Yobbi', 'aey23@pitt.edu', DATE '1993-02-01', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Lou Marra', 'construct12@pitt.edu', DATE '1993-07-13', TIMESTAMP '2011-01-09 04:15:57');
INSERT INTO Profiles VALUES('Molly Schnider', 'mws56@pitt.edu', DATE '1993-07-23', TIMESTAMP '2004-04-09 08:23:57');
INSERT INTO Profiles VALUES('Katie Garrity', 'krg45@pitt.edu', DATE '1993-02-01', TIMESTAMP '2008-07-23 04:15:57');
INSERT INTO Profiles VALUES('Kristen Bell', 'KB@pitt.edu', DATE '1993-02-01', TIMESTAMP '2005-05-13 04:15:57');
INSERT INTO Profiles VALUES('Owen Wilson', 'sunglassesadvil@pitt.edu', DATE '1993-02-01', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Vince Vaughn', 'dive45@pitt.edu', DATE '1992-07-26', TIMESTAMP '2004-04-11 03:32:57');
INSERT INTO Profiles VALUES('Bill Murry', 'billtheguy@pitt.edu', DATE '1993-11-16', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Woody Harrelson', 'woody45@pitt.edu', DATE '1993-12-24', TIMESTAMP '2006-02-12 04:15:57');
INSERT INTO Profiles VALUES('Joe Pecci', 'clown@pitt.edu', DATE '1993-02-21', TIMESTAMP '2008-04-11 04:15:57');
INSERT INTO Profiles VALUES('Leslie Jones', 'ninja@pitt.edu', DATE '1993-06-18', TIMESTAMP '2004-02-12 04:15:57');
INSERT INTO Profiles VALUES('Keenan Thompson', 'whatup@pitt.edu', DATE '1993-10-19', TIMESTAMP '2003-06-14 04:15:57');
INSERT INTO Profiles VALUES('Kevin Bacon', 'numbers@pitt.edu', DATE '1993-09-05', TIMESTAMP '2000-11-10 04:15:57');





---Inserting into Friendships
INSERT INTO Friendships VALUES('Lena Ortmann','Bridget Egler',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Lena Ortmann','Dan Robertson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Lena Ortmann','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Lena Ortmann','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Lena Ortmann','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Lena Ortmann','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Dan Robertson','Bridget Egler',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Sara Mills','Bridget Egler',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Jake Ballard','Bridget Egler',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Tom Smith','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Harry Styles','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Lous stylinson','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Sara Mills','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Eli Becker','Bridget Egler',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Zayn Malik','Eli Becker',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Jake Ballard','Dan Robertson',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Jeffrey Smolen','Bridget Egler',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Carter Johnson','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Mark Zsfranski','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Jeff Egler','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Kristin Baker','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Roger Barton','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Nick Calzone','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Erin Higgins','John Mulaney',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Erin Higgins','Bill Hader',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Erin Higgins','Will Forte',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Erin Higgins','Andy Samberg',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Erin Higgins','Jorma Taccone',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Erin Higgins','Akiva Schaffer',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('John Mulaney','Bill Hader',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Bill Hader','Andy Samberg',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Will Forte','Bill Hader',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Akiva Schaffer','Andy Samberg',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Jorma Taccone','Akiva Schaffer',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Andy Samberg','Jorma Taccone',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Andy Samberg','Gabby Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Andy Samberg','Maggie Devine',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Andy Samberg','Kalyn Sigg',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Bridget Devine','Maggie Devine',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Sophie Means','Gabby Means',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Gabby Means','Dominic Means',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Gabby Means','Penny Means',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Gabby Means','Bridget Devine',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Gabby Means','Maggie Devine',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Andy Samberg',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Jorma Taccone',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Akiva Schaffer',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Kevin Bacon','John Mulaney',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Petunia Mulaney',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Joanna Newsom',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Kevin Bacon','Will Forte',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Kevin Bacon','Bill Hader',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Maggie Devine','Sophie Means',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Maggie Devine','Fiona Connelly',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Kalyn Sigg','Bridget Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Maggie Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Jim Beluish',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Bill Murry','Andy Samberg',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Amy Adams','Bill Hader',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Mark Zuckerberg','Andy Samberg',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Erin Higgins','Joe Lynch',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Erin Higgins','Gabby Means',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Penny Means','Gabby Means',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Penny Means','Sophie Means',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Penny Means','Dominic Means',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Penny Means','Bridget Devine',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Dominic Means','Bridget Devine',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Dominic Means','Maggie Devine',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Dominic Means','Andy Samberg',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Dominic Means','Erin Higgins',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('John Mulaney','Petunia Mulaney',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Jason Sudekis','Bill Hader',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Jason Sudekis','John Mulaney',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Mathew Perry','Mark Zuckerberg',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('John Belushi','David Spade',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('David Spade','Erin Higgins',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('David Spade','Chris Farley',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Adam Sandler','David Spade',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Adam Sandler','Andy Samberg',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Adam Sandler','Bill Hader',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Bill Hader','Sophie Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Joe Lynch','Gabby Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Joe Lynch','Kalyn Sigg',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Pete Davidson','Gabby Means',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Pete Davidson','Kalyn Sigg',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Pete Davidson','Erin Higgins',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Leslie Jones','Gabby Means',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Leslie Jones','Kalyn Sigg',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Leslie Jones','Erin Higgins',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Leslie Jones','Sophie Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Keenan Thompson','Gabby Means',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Keenan Thompson','Sophie Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kyle Mooney','Erin Higgins',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Kyle Mooney','Joe Lynch',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Kyle Mooney','Gabby Means',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Jess Slain','Erin Higgins',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Jess Slain','Kalyn Sigg',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Aleena Yobbi','Katie Garrity',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Aleena Yobbi','Joe Marriuzza',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Joe Marriuzza','Katie Garrity',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Joe Marriuzza','Gabby Means',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Lou Marra','Aleena Yobbi',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Lou Marra','Erin Higgins',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Katie Garrity','Molly Schnider',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Katie Garrity','Lou Marra',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Molly Schnider','Joe Marriuzza',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Molly Schnider','Lou Marra',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Owen Wilson','Vince Vaughn',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Owen Wilson','Bill Murray',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Owen Wilson','Bill Hader',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Vince Vaughn','Andy Samberg',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Vince Vaughn','Adam Sandler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Will Ferrel','Owen Wilson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Will Ferrel','Vince Vaughn',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Will Ferrel','Gabby Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Erin Higgins','Will Ferrel',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Erin Higgins','Owen Wilson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Erin Higgins','David Spade',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Erin Higgins','Chris Farley',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Erin Higgins','Fiona Connelly',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Kristen Bell','Owen Wilson',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Kristen Bell','Bill Hader',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Kristen Bell','Andy Samberg',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Joe Pecci','Andy Samberg',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Joe Pecci','Bill Hader',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Joe Pecci','John Mulaney',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Joe Pecci','Petunia Mulaney',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Joe Pecci','Gabby Means',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Woody Harrelson','Joe Pecci',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Woody Harrelson','John Mulaney',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Woody Harrelson','Erin Higgins',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Woody Harrelson','Bridget Devine',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Woody Harrelson','Maggie Devine',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Pete Davidson','Bridget Devine',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Pete Davidson','Maggie Devine',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Gabe Freeman','Nick Sullivan',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Gabe Freeman','Michelle Holdney',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Gabe Freeman','Joe Lynch',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Gabe Freeman','Austin Pegg',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Austin Pegg','Erin Higgins',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Austin Pegg','Joe Lynch',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Austin Pegg','Michelle Holdney',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Austin Pegg','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Michelle Holdney','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Michelle Holdney','Gabby Means',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Michelle Holdney','Bridget Devine',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Michelle Holdney','Kalyn Sigg',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Nick Sullivan','Erin Higgins',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Nick Sullivan','Joe Lynch',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Nick Sullivan','Kalyn Sigg',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Nick Sullivan','Will Forte',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Nick Sullivan','Akiva Schaffer',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Collin Jost','Andy Samberg',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Collin Jost','Bill Hader',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Collin Jost','John Mulaney',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Collin Jost','Leslie Jones',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Collin Jost','Keenan Thompson',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Erin Higgins','Keenan Thompson',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Erin Higgins','Petunia Mulaney',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Erin Higgins','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Erin Higgins','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Andy Samberg','Bridget Egler',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Andy Samberg','Dan Robertson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Andy Samberg','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Andy Samberg','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Joanna Newsom','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Joanna Newsom','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Joanna Newsom','Bridget Egler',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Petunia Mulaney','Bridget Egler',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Petunia Mulaney','Maggie Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Petunia Mulaney','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Petunia Mulaney','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Bridget Egler',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Petunia Mulaney','Eli Becker',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Dan Robertson',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Petunia Mulaney','Bridget Egler',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Kevin Bacon','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Kevin Bacon','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Kevin Bacon','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Amy Adams',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Kevin Bacon','Dan Robertson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Kevin Bacon','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Kevin Bacon','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Chris Farley','Gabby Means',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Chris Farley','Dominic Means',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Chris Farley','Bridget Egler',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Chris Farley','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Chris Farley','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Penny Means',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Chris Farley','Eli Becker',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Dan Robertson',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Erin Higgins','Bridget Egler',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Erin Higgins','Dan Robertson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Erin Higgins','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Erin Higgins','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Erin Higgins','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Erin Higgins','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Bridget Devine','Bridget Egler',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Gabby Means','Bridget Egler',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Sophie Means','Bridget Egler',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Dominic Means','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Penny Means','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Maggie Devine','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kalyn Sigg','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Joe Lynch','Bridget Egler',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Fiona Connelly','Eli Becker',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Kalyn Sigg','Dan Robertson',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Bridget Egler',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Kalyn Sigg','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Kalyn Sigg','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Kalyn Sigg','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Harry Styles','Erin Higgins',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Gabby Means','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Gabby Means','Lena Ortmann',1, 'Pending', NULL);
