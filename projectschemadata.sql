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
