
---Project milestone 2
---By: Elh76 & Leo10


DROP TABLE Profiles CASCADE CONSTRAINTS;
DROP TABLE Friendships CASCADE CONSTRAINTS;
DROP TABLE Groups CASCADE CONSTRAINTS;
DROP TABLE Messages CASCADE CONSTRAINTS;

---Making the Profile table
-- Users must be unique 
CREATE TABLE Profiles
(	userID                  number(3),
        username 		varchar2(80) PRIMARY KEY,
        email   		varchar2(30),
	dob 			TIMESTAMP,
	timeoflastlogin TIMESTAMP,
	ingroup			varchar2(30)
);


---Making the Friendship table
-- Assumption: sender and recipient must be a user in the system - foreign key from nameofuser and requestto to Profile(username)
-- Assumption: there cannot be more than one friendship for the same two people - Primary key is nameofuser, requestto
CREATE TABLE Friendships
(	nameofuser 	    varchar2(80),
	requestto           varchar2(32),
	request             number(1),
	status              varchar2(32),
	dateoffriendship    DATE,
	FOREIGN KEY (nameofuser) REFERENCES Profiles(username),
	FOREIGN KEY (requestto) REFERENCES Profiles(username), 
	PRIMARY KEY (nameofuser, requestto)
);

---Making the Group table
CREATE TABLE Groups
(	groupname 	 varchar2(32),
	description      varchar2(32),
	numofmembers     INTEGER,
	membershiplimit  number(3)
);


---Making the Messages table
-- Assumption: the sender must have a Profile - foreign key sender to Profiles(username)
CREATE TABLE Messages
(	subject 	varchar2(40),
	textmsg         varchar2(100),
	sender  	varchar2(32),
	recipient       varchar2(32),
	dateofmsg 	DATE,
	groupmsg	varchar2(32)
);

-- Trigger to drop users from group if they are dropped from system
create or replace trigger dropusergroup
  before delete on Profiles for each row
  when (old.ingroup is not null)
  begin
  update Groups set numofmembers = numofmembers - 1 where groupname = :old.ingroup;
  end;
  /

-- Trigger to ensure membership limit  
create or replace trigger membershiplimit
  before update on Groups for each row
    begin
       if(:old.numofmembers = :old.membershiplimit)
       then
	   :new.numofmembers := :old.numofmembers;
       end if;
     end;
/

---Inserting into Profile table

INSERT INTO Profiles VALUES(1, 'Tom Hickory', 'tomh12@pitt.edu', DATE '1993-02-01', TIMESTAMP '2002-01-01 04:15:57','NULL');
INSERT INTO Profiles VALUES(2, 'Bridget Egler', 'bse12@pitt.edu', DATE '1993-09-30', TIMESTAMP '2007-02-02 05:15:57', 'NULL');
INSERT INTO Profiles VALUES(3,'Sara Mills', 'smills01@pitt.edu', DATE '1993-03-09', TIMESTAMP '2007-01-09 02:15:57','NULL');
INSERT INTO Profiles VALUES(4,'Janna Votodian', 'jmv34@pitt.edu', DATE '1993-03-27', TIMESTAMP '2002-02-07 02:15:55','NULL');
INSERT INTO Profiles VALUES(5,'Hannah Barton', 'hmb43@pitt.edu', DATE '1993-07-23', TIMESTAMP '2006-03-03 06:15:57','NULL');	
INSERT INTO Profiles VALUES(6,'Eric Egler', 'erice@pitt.edu', DATE '1992-08-23', TIMESTAMP '2003-05-11 07:15:57','NULL');
INSERT INTO Profiles VALUES(7,'Jeff Egler', 'potatojeff@pitt.edu', DATE '1990-04-26', TIMESTAMP '2005-03-01 04:15:57', 'NULL');
INSERT INTO Profiles VALUES(8,'Jeffrey Smolen', 'jeffy@pitt.edu', DATE '1996-01-14', TIMESTAMP '2003-06-02 04:15:57','NULL');
INSERT INTO Profiles VALUES(9,'Oksana Ortmann', 'oko@pitt.edu', DATE '1989-06-03', TIMESTAMP '2001-02-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(10,'Peggy Ortmann', 'psue@pitt.edu', DATE '1980-04-02', TIMESTAMP '2011-01-09 08:15:57','NULL');
INSERT INTO Profiles VALUES(11,'Mike Ortmann', 'meo1@pitt.edu', DATE '1979-02-01', TIMESTAMP '2012-05-10 07:15:57','NULL');
INSERT INTO Profiles VALUES(12,'Diane Smolen', 'dianeds3@pitt.edu', DATE '1989-01-21', TIMESTAMP '2011-01-10 09:15:57','NULL');
INSERT INTO Profiles VALUES(13,'Val Becker', 'vbecker@pitt.edu', DATE '1980-07-24', TIMESTAMP '2010-06-21 07:40:57','NULL');
INSERT INTO Profiles VALUES(14,'Tommy Becker', 'tomtom42@pitt.edu', DATE '1995-07-21', TIMESTAMP '2009-02-21 05:15:57','NULL');
INSERT INTO Profiles VALUES(15,'Elisha Becker', 'eliman@pitt.edu', DATE '1994-06-22', TIMESTAMP '2008-05-23 06:15:57','NULL');
INSERT INTO Profiles VALUES(16,'Sasha Becker', 'snoshers@pitt.edu', DATE '1992-08-23', TIMESTAMP '2007-07-09 07:15:57','NULL');
INSERT INTO Profiles VALUES(17,'Mike Becker', 'mbecker@pitt.edu', DATE '1980-01-22', TIMESTAMP '2011-07-23 08:12:57','NULL');
INSERT INTO Profiles VALUES(18,'Daniel Robertson', 'danrob@pitt.edu', DATE '1980-07-14', TIMESTAMP '2011-01-09 01:45:57','NULL');
INSERT INTO Profiles VALUES(19,'Carter Johnson', 'carterj@pitt.edu', DATE '1993-04-14', TIMESTAMP '2008-03-12 09:22:57','NULL');
INSERT INTO Profiles VALUES(20,'Mary Lou', 'mmlou@pitt.edu', DATE '1973-06-29', TIMESTAMP '2011-07-15 08:32:57','NULL');
INSERT INTO Profiles VALUES(21,'Mark Szfranski', 'mks100@pitt.edu', DATE '1993-07-03', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(22,'Tom Truchok', 'tomlit45@pitt.edu', DATE '1993-04-23', TIMESTAMP '2003-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(23,'Jared Niall', 'niall46@pitt.edu', DATE '1993-02-14', TIMESTAMP '2007-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(24,'Nick Calzone', 'creepynick@pitt.edu', DATE '1993-09-30', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(25,'Andrea Lang', 'anglang@pitt.edu', DATE '1993-12-01', TIMESTAMP '2009-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(26,'Josh Lang', 'jlang@pitt.edu', DATE '1993-10-01', TIMESTAMP '2010-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(27,'Jessie Smolen', 'jess678@pitt.edu', DATE '1993-10-10', TIMESTAMP '2001-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(28,'Carissa Lang', 'carissa23@pitt.edu', DATE '1990-11-11', TIMESTAMP '2000-11-11 11:11:11','NULL');
INSERT INTO Profiles VALUES(29,'Laura Barton', 'lmorrisb@pitt.edu', DATE '1960-05-05', TIMESTAMP '2002-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(30,'Laura Smolen', 'lsmolen@pitt.edu', DATE '1989-07-01', TIMESTAMP '2014-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(31,'Matt Henry', 'coolmatt345@pitt.edu', DATE '1993-02-20', TIMESTAMP '2015-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(32,'Sunny Patel', 'sunnyday23@pitt.edu', DATE '1993-02-01', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(33,'Matt Francowic', 'baseballmatt@pitt.edu', DATE '1993-07-13', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(34,'Shawna Henkel', 'shenkel@pitt.edu', DATE '1993-07-23', TIMESTAMP '2004-04-09 08:23:57','NULL');
INSERT INTO Profiles VALUES(35,'Don Toomey', 'DrT@pitt.edu', DATE '1993-02-01', TIMESTAMP '2008-07-23 04:15:57','NULL');
INSERT INTO Profiles VALUES(36,'Kristin Baker', 'KB@pitt.edu', DATE '1993-02-01', TIMESTAMP '2005-05-13 04:15:57','NULL');
INSERT INTO Profiles VALUES(37,'Jake Ballard', 'Bigballard@pitt.edu', DATE '1993-02-01', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(38,'Kenzie Duncan', 'kenzD@pitt.edu', DATE '1992-07-26', TIMESTAMP '2004-04-11 03:32:57','NULL');
INSERT INTO Profiles VALUES(39,'Kyle Mathias', 'kyletheguy@pitt.edu', DATE '1993-11-16', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(40,'Kiel Gierlach', 'kiel34@pitt.edu', DATE '1993-12-24', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(41,'Keri Dinkel', 'kdink@pitt.edu', DATE '1993-02-21', TIMESTAMP '2008-04-11 04:15:57','NULL');
INSERT INTO Profiles VALUES(42,'Liz Hallahan', 'liztheham@pitt.edu', DATE '1993-06-18', TIMESTAMP '2004-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(43,'Harry Styles', 'larry@pitt.edu', DATE '1993-10-19', TIMESTAMP '2003-06-14 04:15:57','NULL');
INSERT INTO Profiles VALUES(44,'Niall Horan', 'nailll23@pitt.edu', DATE '1993-09-05', TIMESTAMP '2000-11-10 04:15:57','NULL');
INSERT INTO Profiles VALUES(45,'Zayn Malik', 'zaynM@pitt.edu', DATE '1993-04-02', TIMESTAMP '2001-02-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(46,'Liam Payne', 'LiamP@pitt.edu', DATE '1993-08-02', TIMESTAMP '2007-12-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(47,'Louis Stylinson', 'stylinL@pitt.edu', DATE '1993-12-01', TIMESTAMP '2012-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(48,'Andrea Egler', 'AnnoE@pitt.edu', DATE '1993-11-23', TIMESTAMP '2005-04-23 04:15:57','NULL');
INSERT INTO Profiles VALUES(49,'Roger Barton', 'Rogerdoger@pitt.edu', DATE '1993-10-03', TIMESTAMP '2012-08-21 04:15:57','NULL');
INSERT INTO Profiles VALUES(50,'Tom Smith', 'Tsmith@pitt.edu', DATE '1993-08-04', TIMESTAMP '2014-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(51,'Lena Ortmann', 'leo10@pitt.edu', DATE '1993-02-27', TIMESTAMP '2012-05-05 04:34:57','NULL');
insert into Profiles values(52,'Erin Higgins', 'elh76@pitt.edu', DATE '1995-04-02', TIMESTAMP '2016-01-09 04:14:23','NULL');
insert into Profiles values(53,'Gabby Means', 'gbm26@nyu.edu', DATE '1995-03-19', TIMESTAMP '2006-10-10 09:14:56','NULL');
insert into Profiles values(54,'Kalyn Sigg', 'ksiggie@pitt.edu', DATE '1995-09-05', TIMESTAMP '2010-08-05 15:45:34','NULL');
insert into Profiles values(55,'Sophie Means', 'sm@gmail.com', DATE '1996-08-19', TIMESTAMP '2012-07-10 19:23:12','NULL');
insert into Profiles values(56,'Penny Means', 'pmeans@aol.com', DATE '2000-07-12', TIMESTAMP '2014-09-09 14:12:12','NULL');
insert into Profiles values(57,'Dominic Means','dmeans23@gmail.com', DATE '1998-08-08', TIMESTAMP '2015-12-12 12:12:12','NULL');
INSERT INTO Profiles VALUES(58,'Bridget Devine', 'bridge@pitt.edu', DATE '1994-02-01', TIMESTAMP '2002-01-01 04:15:57','NULL');
INSERT INTO Profiles VALUES(59,'Maggie Devine', 'mag@pitt.edu', DATE '1982-09-30', TIMESTAMP '2007-02-02 05:15:57','NULL');
INSERT INTO Profiles VALUES(60,'Fiona Connelly', 'fion@pitt.edu', DATE '1965-03-09', TIMESTAMP '2007-01-09 02:15:57','NULL');
INSERT INTO Profiles VALUES(70,'Andy Samberg', 'youngsandwich@pitt.edu', DATE '1945-03-27', TIMESTAMP '2002-02-07 02:15:55','NULL');
INSERT INTO Profiles VALUES(71,'Jorma Taccone', 'jorm@pitt.edu', DATE '1978-07-23', TIMESTAMP '2006-03-03 06:15:57','NULL');	
INSERT INTO Profiles VALUES(72,'Akiva Shaffer', 'kiv@pitt.edu', DATE '1985-08-23', TIMESTAMP '2003-05-11 07:15:57','NULL');
INSERT INTO Profiles VALUES(73,'John Belushi', 'blues@pitt.edu', DATE '1946-04-26', TIMESTAMP '2005-03-01 04:15:57','NULL');
INSERT INTO Profiles VALUES(74,'Bill Hader', 'stefan@pitt.edu', DATE '1996-01-14', TIMESTAMP '2003-06-02 04:15:57','NULL');
INSERT INTO Profiles VALUES(75,'John Mulaney', 'jm@pitt.edu', DATE '1989-06-03', TIMESTAMP '2001-02-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(76,'David Spade', 'tommyboy@pitt.edu', DATE '1980-04-02', TIMESTAMP '2011-01-09 08:15:57','NULL');
INSERT INTO Profiles VALUES(77,'Chris Farley', 'riverliver@pitt.edu', DATE '1979-02-01', TIMESTAMP '2012-05-10 07:15:57','NULL');
INSERT INTO Profiles VALUES(78,'Chevey Chase', 'vaca@pitt.edu', DATE '1989-01-21', TIMESTAMP '2011-01-10 09:15:57','NULL');
INSERT INTO Profiles VALUES(79,'Amy Adams', 'notisla@pitt.edu', DATE '1980-07-24', TIMESTAMP '2010-06-21 07:40:57','NULL');
INSERT INTO Profiles VALUES(80,'Mark Zuckerberg', 'research42@pitt.edu', DATE '1995-07-21', TIMESTAMP '2009-02-21 05:15:57','NULL');
INSERT INTO Profiles VALUES(81,'Will Forte', 'lastman@pitt.edu', DATE '1994-06-22', TIMESTAMP '2008-05-23 06:15:57','NULL');
INSERT INTO Profiles VALUES(82,'Adam Sandler', 'lilnicky@pitt.edu', DATE '1992-08-23', TIMESTAMP '2007-07-09 07:15:57','NULL');
INSERT INTO Profiles VALUES(83,'Will Ferrel', 'lion@pitt.edu', DATE '1980-01-22', TIMESTAMP '2011-07-23 08:12:57','NULL');
INSERT INTO Profiles VALUES(84,'Kyle Mooney', 'betterthankanye@pitt.edu', DATE '1980-07-14', TIMESTAMP '2011-01-09 01:45:57','NULL');
INSERT INTO Profiles VALUES(85,'Collin Jost', 'goodhair@pitt.edu', DATE '1993-04-14', TIMESTAMP '2008-03-12 09:22:57','NULL');
INSERT INTO Profiles VALUES(86,'Pete Davidson', 'luvdavid@pitt.edu', DATE '1973-06-29', TIMESTAMP '2011-07-15 08:32:57','NULL');
INSERT INTO Profiles VALUES(87,'Joe Lynch', 'jtl44@pitt.edu', DATE '1993-07-03', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(88,'Jason Sudekis', 'jls23@pitt.edu', DATE '1993-04-23', TIMESTAMP '2003-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(89,'Joanna Newsom', 'barf23@pitt.edu', DATE '1993-02-14', TIMESTAMP '2007-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(90,'Petunia Mulaney', 'frenchy12@pitt.edu', DATE '1993-09-30', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(91,'Austin Pegg', 'app23@pitt.edu', DATE '1993-12-01', TIMESTAMP '2009-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(92,'Michelle Holdney', 'meh34@pitt.edu', DATE '1993-10-01', TIMESTAMP '2010-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(93,'Nick Sullivan', 'njs12@pitt.edu', DATE '1993-10-10', TIMESTAMP '2001-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(94,'Mathew Perry', 'mtp34@pitt.edu', DATE '1990-11-11', TIMESTAMP '2000-11-11 11:11:11','NULL');
INSERT INTO Profiles VALUES(95,'Gabe Freeman', 'gef44@pitt.edu', DATE '1960-05-05', TIMESTAMP '2002-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(96,'Joe Marriuzza', 'jrm34@pitt.edu', DATE '1989-07-01', TIMESTAMP '2014-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(97,'Jess Slain', 'jks22@pitt.edu', DATE '1993-02-20', TIMESTAMP '2015-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(98,'Aleena Yobbi', 'aey23@pitt.edu', DATE '1993-02-01', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(99,'Lou Marra', 'construct12@pitt.edu', DATE '1993-07-13', TIMESTAMP '2011-01-09 04:15:57','NULL');
INSERT INTO Profiles VALUES(100,'Molly Schnider', 'mws56@pitt.edu', DATE '1993-07-23', TIMESTAMP '2004-04-09 08:23:57','NULL');
INSERT INTO Profiles VALUES(101,'Katie Garrity', 'krg45@pitt.edu', DATE '1993-02-01', TIMESTAMP '2008-07-23 04:15:57','NULL');
INSERT INTO Profiles VALUES(102,'Kristen Bell', 'KB@pitt.edu', DATE '1993-02-01', TIMESTAMP '2005-05-13 04:15:57','NULL');
INSERT INTO Profiles VALUES(103,'Owen Wilson', 'sunglassesadvil@pitt.edu', DATE '1993-02-01', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(104,'Vince Vaughn', 'dive45@pitt.edu', DATE '1992-07-26', TIMESTAMP '2004-04-11 03:32:57','NULL');
INSERT INTO Profiles VALUES(105,'Bill Murry', 'billtheguy@pitt.edu', DATE '1993-11-16', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(106,'Woody Harrelson', 'woody45@pitt.edu', DATE '1993-12-24', TIMESTAMP '2006-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(107,'Joe Pecci', 'clown@pitt.edu', DATE '1993-02-21', TIMESTAMP '2008-04-11 04:15:57','NULL');
INSERT INTO Profiles VALUES(108,'Leslie Jones', 'ninja@pitt.edu', DATE '1993-06-18', TIMESTAMP '2004-02-12 04:15:57','NULL');
INSERT INTO Profiles VALUES(109,'Keenan Thompson', 'whatup@pitt.edu', DATE '1993-10-19', TIMESTAMP '2003-06-14 04:15:57','NULL');
INSERT INTO Profiles VALUES(110,'Kevin Bacon', 'numbers@pitt.edu', DATE '1993-09-05', TIMESTAMP '2000-11-10 04:15:57','NULL');





---Inserting into Friendships
INSERT INTO Friendships VALUES('Lena Ortmann','Bridget Egler',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Lena Ortmann','Daniel Robertson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Lena Ortmann','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Lena Ortmann','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Lena Ortmann','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Lena Ortmann','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Daniel Robertson','Bridget Egler',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Sara Mills','Bridget Egler',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Jake Ballard','Bridget Egler',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Tom Smith','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Harry Styles','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Louis Stylinson','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Sara Mills','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Eric Egler','Bridget Egler',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Zayn Malik','Akiva Shaffer',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Jake Ballard','Daniel Robertson',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Jeffrey Smolen','Bridget Egler',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Carter Johnson','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Bill Murry','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Jeff Egler','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Kristin Baker','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Roger Barton','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Nick Calzone','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Erin Higgins','John Mulaney',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Erin Higgins','Bill Hader',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Erin Higgins','Will Forte',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Erin Higgins','Andy Samberg',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Erin Higgins','Jorma Taccone',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Erin Higgins','Akiva Shaffer',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('John Mulaney','Bill Hader',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Bill Hader','Andy Samberg',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Will Forte','Bill Hader',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Akiva Shaffer','Andy Samberg',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Jorma Taccone','Akiva Shaffer',1, 'Pending', NULL);
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
INSERT INTO Friendships VALUES('Kevin Bacon','Akiva Shaffer',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Kevin Bacon','John Mulaney',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Petunia Mulaney',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Joanna Newsom',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Kevin Bacon','Will Forte',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Kevin Bacon','Bill Hader',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Maggie Devine','Sophie Means',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Maggie Devine','Fiona Connelly',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Kalyn Sigg','Bridget Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Maggie Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Bill Murry',1, 'Pending', NULL);
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
INSERT INTO Friendships VALUES('Owen Wilson','Molly Schnider',0, 'Friends', DATE '2011-06-11');
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
INSERT INTO Friendships VALUES('Nick Sullivan','Collin Jost',0, 'Friends', DATE '2012-04-03');
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
INSERT INTO Friendships VALUES('Andy Samberg','Keenan Thompson',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Andy Samberg','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Andy Samberg','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Joanna Newsom','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Joanna Newsom','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Joanna Newsom','Bridget Egler',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Petunia Mulaney','Joanna Newsom',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Petunia Mulaney','Maggie Devine',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Petunia Mulaney','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Petunia Mulaney','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Jorma Taccone',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Petunia Mulaney','Fiona Connelly',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Petunia Mulaney','Harry Styles',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Petunia Mulaney','Amy Adams',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Kevin Bacon','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Kevin Bacon','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Kevin Bacon','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Kevin Bacon','Amy Adams',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Kevin Bacon','Fiona Connelly',0, 'Friends', DATE '2013-09-01');
INSERT INTO Friendships VALUES('Kevin Bacon','Sara Mills',0, 'Friends', DATE '2012-09-11');
INSERT INTO Friendships VALUES('Kevin Bacon','Hannah Barton',0, 'Friends', DATE '2012-08-05');
INSERT INTO Friendships VALUES('Kevin Bacon','Janna Votodian',0, 'Friends', DATE '2012-08-14');
INSERT INTO Friendships VALUES('Kevin Bacon','Tommy Becker',0, 'Friends', DATE '2012-11-11');
INSERT INTO Friendships VALUES('Chris Farley','Gabby Means',0, 'Friends', DATE '2013-08-12');
INSERT INTO Friendships VALUES('Chris Farley','Dominic Means',0, 'Friends', DATE '2012-08-02');
INSERT INTO Friendships VALUES('Chris Farley','Joanna Newsom',0, 'Friends', DATE '2015-02-23');
INSERT INTO Friendships VALUES('Chris Farley','Sasha Becker',0, 'Friends', DATE '2013-02-13');
INSERT INTO Friendships VALUES('Chris Farley','Bridget Egler',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Lena Ortmann',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Louis Stylinson',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Penny Means',0, 'Friends', DATE '2012-04-03');
INSERT INTO Friendships VALUES('Chris Farley','Fiona Connelly',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Chris Farley','Harry Styles',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Erin Higgins','Bridget Egler',0, 'Friends', DATE '2012-08-04');
INSERT INTO Friendships VALUES('Erin Higgins','Harry Styles',0, 'Friends', DATE '2013-09-01');
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
INSERT INTO Friendships VALUES('Fiona Connelly','Harry Styles',1, 'pending', NULL);
INSERT INTO Friendships VALUES('Kalyn Sigg','Harry Styles',0, 'Friends', DATE '2008-01-23');
INSERT INTO Friendships VALUES('Kalyn Sigg','Bridget Egler',0, 'Friends', DATE '2011-06-11');
INSERT INTO Friendships VALUES('Kalyn Sigg','Jared Niall',0, 'Friends', DATE '2012-08-29');
INSERT INTO Friendships VALUES('Kalyn Sigg','Tom Truchok',0, 'Friends', DATE '2007-04-02');
INSERT INTO Friendships VALUES('Kalyn Sigg','Eric Egler',0, 'Friends', DATE '2002-01-25');
INSERT INTO Friendships VALUES('Harry Styles','Erin Higgins',1, 'Pending', NULL);
INSERT INTO Friendships VALUES('Gabby Means','Laura Barton',0, 'Friends', DATE '2000-01-01');
INSERT INTO Friendships VALUES('Gabby Means','Lena Ortmann',1, 'Pending', NULL);

---Inserting into Groups
INSERT INTO Groups VALUES('SNL Alums', 'Ex-Members of SNL', 0, NULL);
INSERT INTO Groups VALUES('SNL Futures', 'People who will be on SNL', 0, NULL);
INSERT INTO Groups VALUES('Pitt Students', 'People who go to Pitt', 0, NULL);
INSERT INTO Groups VALUES('High School Pals', 'People from high school', 0, NULL);
INSERT INTO Groups VALUES('One Direction Fan Club', 'Those who love One Direction', 0, NULL);
INSERT INTO Groups VALUES('Film Lovers', 'People who love movies!', 0, NULL);
INSERT INTO Groups VALUES('Harry Potter Fan Club', 'People who love specifically HP', 0, NULL);
INSERT INTO Groups VALUES('Twin Peaks Fan Club', 'For lovers of David Lynch!', 0, NULL);
INSERT INTO Groups VALUES('Silicon Valley Fan Club', 'Thomas forever', 0, NULL);
INSERT INTO Groups VALUES('Hot Rod Fan Club', 'Stunts forever', 0, NULL);

---Inserting into Messages
INSERT INTO Messages VALUES ('Movie Idea', 'Hey I have a great idea for a film. Messages me back!', 'Andy Samberg', 'Harry Styles', DATE '2012-02-01', 0);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Erin Higgins', DATE '2014-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Gabby Means',DATE '2013-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Kalyn Sigg',DATE '2015-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Austin Pegg', DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Lena Ortmann', DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Kevin Bacon', DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Weekend Plans', 'Lets go to the cabin this weekend!', 'Bridget Devine', 'Sara Mills', DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Harry Styles', DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Zayn Malik', DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Louis Stylinson',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Liam Payne',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Niall Horan',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Bridget Egler',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Jake Ballard',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Daniel Robertson',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Amy Adams',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Will Ferrel',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Mark Zuckerberg',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'David Spade',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Adam Sandler',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Kyle Mooney',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Owen Wilson',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Bill Murry',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Leslie Jones',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Kevin Bacon',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Kristen Bell',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Keenan Thompson',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Party', 'Friday at 9pm at my apartment!', 'Andy Samberg', 'Joe Pecci',DATE '2016-05-05', 1);
INSERT INTO Messages VALUES ('Missing You', 'Cannot wait for you to get home!', 'Lena Ortmann','Carter Johnson',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Favorite Film', 'I love Reservoir Dogs!', 'Lena Ortmann','Hannah Barton',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New Restaurant', 'We should check out that new Chinese place', 'Lena Ortmann', 'Tom Truchok',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Date Night', 'We should ride go carts for date night!', 'Lena Ortmann','Matt Henry',DATE '2010-02-01', 0);
INSERT INTO Messages VALUES ('Cedar Point', 'Did you want to go to cedar point with me this weekend?', 'Lena Ortmann', 'Bridget Egler',DATE '2009-02-01', 0);
INSERT INTO Messages VALUES ('Ice Skating', 'We should go ice skating on Friday', 'Lena Ortmann', 'Josh Lang',DATE '2008-02-01', 0);
INSERT INTO Messages VALUES ('Pasta Recipe', 'Can you send me that recipe?', 'Daniel Robertson','Bridget Egler',DATE '2007-02-01', 0);
INSERT INTO Messages VALUES ('Work', 'I got a new job! We should meet up and discuss it!', 'Sara Mills','Liz Hallahan',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Zoho Creator', 'I cannot generate the right reports, can you help me?', 'Jake Ballard', 'Kristin Baker',DATE '2005-02-01', 0);
INSERT INTO Messages VALUES ('Coming in Late', 'I have a doctors appointment tomorrow morning and will be late.', 'Tom Smith', 'Laura Barton',DATE '2004-02-01', 0);
INSERT INTO Messages VALUES ('New friend', 'Hey I am so glad we could connect on here', 'Harry Styles', 'Louis Stylinson',DATE '2003-02-01', 0);
INSERT INTO Messages VALUES ('Trip to Cali', 'I will be out of town in California that weekend!', 'Gabby Means', 'Erin Higgins',DATE '2002-02-01', 0);
INSERT INTO Messages VALUES ('Study Abroad', 'I am going to Singapore for an internship this summer', 'Sara Mills', 'Roger Barton',DATE '2001-02-01', 0);
INSERT INTO Messages VALUES ('France', 'That is cool, I will be in France', 'Maggie Devine', 'Mary Lou',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Treat Yo Self', 'Pedicures and a massage this weekend?', 'Zayn Malik', 'Harry Styles',DATE '2015-02-01', 0);
INSERT INTO Messages VALUES ('Beyonce', 'Did you see that Beyonce documentary?', 'Jake Ballard', 'Sunny Patel',DATE '2014-02-01', 0);
INSERT INTO Messages VALUES ('Pixar', 'I applied for a job and I hope I get it!', 'Jeffrey Smolen','Carissa Lang',DATE '2013-02-01', 0);
INSERT INTO Messages VALUES ('Chris Pratt', 'He is really blowing up recently!', 'Erin Higgins','Matt Francowic', DATE '2012-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins','Andrea Egler', DATE '2010-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins','Shawna Henkel', DATE '2012-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins','Keri Dinkel', DATE '2011-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins','Jared Niall', DATE '2009-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins', 'Nick Calzone',DATE '2008-02-01', 0);
INSERT INTO Messages VALUES ('Tea Time', 'We should get tea on Sunday morning!', 'Erin Higgins', 'Don Toomey',DATE '2007-02-01', 0);
INSERT INTO Messages VALUES ('New dog', 'How would you feel about getting another dog?', 'Carter Johnson','Kenzie Duncan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Oscar Party', 'Come over for the Oscars', 'Erin Higgins', 'Mark Szfranski',DATE '2005-02-01', 0);
INSERT INTO Messages VALUES ('Popstar', 'This film was so good, I wish more people would see it!', 'Jeff Egler', 'Eric Egler',DATE '2004-02-01', 0);
INSERT INTO Messages VALUES ('Coffee', 'What did you want again?', 'Kristin Baker', 'Tom Hickory',DATE '2004-02-01', 0);
INSERT INTO Messages VALUES ('Movie Marathon', 'We should watch every Mike Meyers film in order', 'Roger Barton','Laura Barton',DATE '2012-02-01', 0);
INSERT INTO Messages VALUES ('Practice Session', 'Did you still want to practice your speech with me?', 'Nick Calzone', 'Sasha Becker',DATE '2012-02-01', 0);
INSERT INTO Messages VALUES ('Early 90s', 'Best music for sure', 'Erin Higgins','Tommy Becker',DATE '2014-02-01', 0);
INSERT INTO Messages VALUES ('Skating', 'We should go roller skating sometime', 'Erin Higgins', 'Elisha Becker',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Calzones', 'They are my favorite food!', 'Erin Higgins', 'Mike Ortmann',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Criss Cross', 'Such a great artist', 'Erin Higgins','Janna Votodian',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Babyface', 'An even greater artist!', 'Erin Higgins','Jeffrey Smolen',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Baseball Tickets', 'I have tickets for Friday, want to come?', 'Erin Higgins', 'Peggy Ortmann',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Doctors without boarders', 'I will be gone for several months', 'John Mulaney','Diane Smolen',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Arcade', 'Did you hear about that new arcade in South Side?', 'Bill Hader','Mike Becker',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Val Becker',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Bill Hader',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Amy Adams',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Dominic Means',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Fiona Connelly',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Akiva Shaffer',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Chris Farley',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Chevey Chase',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Penny Means',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Tom Smith',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Lena Ortmann',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Erin Higgins',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Pete Davidson',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Starbucks order', 'Respond with your order', 'Andy Samberg', 'Bill Hader',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Loser', 'They lost the game', 'Will Forte','Joe Lynch',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Skyzone', 'They have an american ninja warrior course here!', 'Akiva Shaffer','Bridget Devine',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Brilliant', 'Such great news!', 'Jorma Taccone','Maggie Devine',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Working', 'I am at work, text you later', 'Andy Samberg','Will Ferrel',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Friends', 'Can my friends come over later?', 'Andy Samberg','Joe Lynch',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('New script', 'Let me know what you think of this!', 'Andy Samberg','Mark Zuckerberg',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Meetings', 'I will be in meetings all day, we can talk over lunch', 'Andy Samberg','Adam Sandler',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Travel Plans', 'I will be back on the 17th', 'Bridget Devine','Joe Lynch',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Rollerskating', 'I am terrified of rollerskating', 'Sophie Means','Molly Schnider',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Yield', 'The yield sign is obstructed', 'Gabby Means','Owen Wilson',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Marriage', 'We should get married', 'Gabby Means','Vince Vaughn',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('New cat', 'I just got a new cat', 'Gabby Means', 'Woody Harrelson',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('New fish', 'I just got a new fish', 'Gabby Means','Leslie Jones',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Short film', 'I just made a short film', 'Kevin Bacon','Nick Sullivan',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Peanut allergy', 'Make sure everything is okay for me to eat!', 'Kevin Bacon','Mathew Perry',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Beach', 'Did you book a house yet?', 'Kevin Bacon','Gabe Freeman',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('San Fransisco' , 'I am moving there in 2017', 'Kevin Bacon','Jason Sudekis',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('NBC', 'They just approved our show!', 'Kevin Bacon', 'Nick Sullivan',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Lorne', 'He says he misses you!', 'Kevin Bacon', 'Oksana Ortmann',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Tommy Becker',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Eric Egler',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Jeffrey Smolen',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Bridget Egler',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Lena Ortmann',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Harry Styles',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Friday Night', 'Want to see that new movie?', 'Gabby Means',  'Kristin Baker',DATE '2016-02-01', 1);
INSERT INTO Messages VALUES ('Drive in', 'This would be great for date night!', 'Kevin Bacon', 'Nick Calzone',DATE '2016-02-01', 0);
INSERT INTO Messages VALUES ('Chairs', 'Did you move those chairs yet?', 'Kevin Bacon', 'Don Toomey',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Couch', 'Did you move that couch yet?', 'Maggie Devine','Kiel Gierlach', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Movie', 'I just saw that movie, it was great', 'Maggie Devine','Kyle Mathias',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Paint colors', 'Blue or red?', 'Kalyn Sigg','Liam Payne', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Doctors appointment', 'I cannot find any times to go to the doctor!', 'Kalyn Sigg','Zayn Malik', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('So fresh so clean', 'I cleaned the living room', 'Kalyn Sigg', 'Roger Barton',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Skeeball', 'I won 15 tickets', 'Bill Murry', 'Lena Ortmann',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Slow Motion', 'I shot the scene in slow motion', 'Amy Adams', 'Adam Sandler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Scrubs', 'I do not want any', 'Mark Zuckerberg', 'Tom Smith',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Snitches get stiches', 'I cannot believe you told them', 'Erin Higgins','Mathew Perry',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Pirates', 'I hope they win this year', 'Erin Higgins', 'Aleena Yobbi',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Jason Bay', 'Such an All Star', 'Penny Means', 'Joe Marriuzza',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Best Friend', 'You are my best friend', 'Penny Means', 'Gabe Freeman',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Literally so exciting', 'I cannot believe you got the job!', 'Penny Means','Collin Jost', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Stools', 'Did you get those stools, yet?', 'Penny Means','Jorma Taccone', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Hot rod', 'Did you see Hot Rod?', 'Dominic Means', 'Adam Sandler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Sunflowers', 'I bought some for the back yard', 'Dominic Means', 'Chevey Chase',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Games', 'Is corn hole enough?', 'Dominic Means', 'Will Forte',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fresh ideas', 'We should have a writing session', 'Dominic Means', 'Joanna Newsom',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Machine', 'It is not functioning properly', 'John Mulaney', 'Kyle Mooney',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New Computer', 'Just bought myself a mac! I love it!', 'Jason Sudekis','Dominic Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Jerky', 'I made that deer into jerky, come get some', 'Jason Sudekis', 'Penny Means',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('London', 'I will be spending my summer in London', 'Mathew Perry', 'Lena Ortmann',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Boston Calling', 'This concert was great!', 'John Belushi', 'Sara Mills',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('The Flash', 'This show is great', 'David Spade', 'Bridget Egler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New in town', 'We should meet up!', 'David Spade','Eric Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Come back kid', 'I need a second chance', 'Adam Sandler','Jeff Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('VHS', 'What should I do with these VHS movies?', 'Adam Sandler','Andrea Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Remember me', 'Too sad of a movie', 'Adam Sandler','Elisha Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Neck pain', 'I need to get my neck adjusted', 'Bill Hader', 'Sasha Becker',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New glasses', 'My vision has gotten much worse', 'Joe Lynch', 'Tommy Becker',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fresh prince', 'Uncle Phil is my dream man', 'Joe Lynch','Erin Higgins', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Heat', 'The air conditioning is broken', 'Pete Davidson','Mary Lou', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Electric bill', 'Stop leaving the lights on', 'Pete Davidson', 'Peggy Ortmann',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Reservoir dogs', 'My favorite movie!', 'Pete Davidson','Mike Ortmann', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Birthday cake', 'Pick up that cake, please', 'Leslie Jones','Hannah Barton', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Congratulations', 'So proud of all of your achievements!', 'Leslie Jones','Janna Votodian', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Thank you', 'You are too kind to me', 'Leslie Jones', 'Andrea Lang',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Youre welcome', 'Do not mention it.', 'Leslie Jones', 'Josh Lang',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Cat issues', 'I do not have anyone to watch the cat while on vacation', 'Keenan Thompson', 'Adam Sandler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fireplace', 'The fireplace needs clean, marry poppins style', 'Keenan Thompson', 'Jessie Smolen',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Smores', 'The union grille has TABLE SMORES', 'Kyle Mooney', 'Kyle Mathias',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Cut the grass', 'Cut the grass before I get home', 'Kyle Mooney','Jake Ballard', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Camping', 'We should go camping this weekend', 'Kyle Mooney', 'Keri Dinkel',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Harry Styles', DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Louis Stylinson',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Lena Ortmann',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Erin Higgins',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Daniel Robertson',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Sara Mills',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Hannah Barton',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Jake Ballard',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Eric Egler',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Jeff Egler',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Elisha Becker',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Tommy Becker',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Sasha Becker',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Adam Sandler',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Amy Adams',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Mark Zuckerberg',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Will Ferrel',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Writers Retreat', 'Bring your mind and a great attitude!', 'Andy Samberg',  'Andrea Egler',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Pals', 'So glad we are friends', 'Jess Slain','Niall Horan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Plans', 'We should hang out soon', 'Jess Slain', 'Zayn Malik',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('French bulldog', 'Cutest dogs forever', 'Aleena Yobbi','Bridget Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Puppies', 'I met some puppies today', 'Aleena Yobbi', 'Matt Francowic',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Saturday', 'We should grab brunch Saturday', 'Joe Marriuzza','Tom Smith', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Databases', 'This class is interesting', 'Joe Marriuzza', 'Erin Higgins',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Stats', 'This class is so boring', 'Lou Marra', 'Shawna Henkel',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('GSWS', 'This class makes me think about things in a new way', 'Lou Marra','Mary Lou', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Genres', 'I hate Rom. Coms. ', 'Katie Garrity', 'Kristin Baker',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Soderbergh', 'Such a great director', 'Katie Garrity', 'Matt Henry',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Oceans 11', 'One of my favorite films', 'Molly Schnider','Sunny Patel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Ghostbusters', 'I think the new one looks so funny!', 'Molly Schnider','Roger Barton', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Suicide Squad', 'I think this movie looks great!', 'Owen Wilson','Adam Sandler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Olympics', 'USA!!!!!!', 'Owen Wilson','Mathew Perry', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Swimming', 'Leah Smith qualified!', 'Owen Wilson','Amy Adams', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Trials', 'My friend is running in he trials today', 'Vince Vaughn','Will Ferrel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Running', 'We should go for a run in an hour','Vince Vaughn', 'Molly Schnider',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Steeple Chase', 'Such an interesting event', 'Will Ferrel','Lou Marra', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('iMovie', 'Can you teach me how to use this?', 'Will Ferrel','Katie Garrity', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('iTunes', 'Can you teach me how to use this?', 'Will Ferrel','Jess Slain', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Editing', 'Edit that film for me please', 'Erin Higgins', 'Gabe Freeman',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Flash memory', 'So unreliable', 'Erin Higgins', 'Will Ferrel',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('DRAM', 'That new paper was intersting', 'Erin Higgins', 'Lena Ortmann',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Potato skins', 'I have a good recipe for the superbowl party', 'Erin Higgins', 'Daniel Robertson',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Animal control', 'They were called for that wild pig', 'Erin Higgins', 'Harry Styles',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fetty wap', 'Is so bad live. ', 'Kristen Bell', 'Harry Styles',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('You are awesome', 'Thanks for all the help', 'Kristen Bell', 'Andy Samberg',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Blender', 'I got a new blender', 'Kristen Bell', 'Lena Ortmann',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Nutrabullet', 'I got a new nutrabullet', 'Joe Pecci', 'Sara Mills',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Democracy', 'I am glad we can vote', 'Joe Pecci', 'Will Forte',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Gas bill', 'The bill was very high!', 'Joe Pecci','Owen Wilson',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Voting', 'Is a right', 'Joe Pecci', 'Leslie Jones',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Quarters', 'How many quarters are in football, though?', 'Joe Pecci', 'Kevin Bacon',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fresh salad', 'I made you a salad for lunch', 'Woody Harrelson','Vince Vaughn', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Hospital visit', 'I am visiting grandpa later, you should come.', 'Woody Harrelson','Kevin Bacon', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Choir trip', 'We are going to Italy', 'Woody Harrelson', 'Niall Horan',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Love and hate', 'Love this movie', 'Woody Harrelson', 'Zayn Malik',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Love and death', 'Love this movie', 'Woody Harrelson', 'Louis Stylinson',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Love you like a brother', 'Just not one of mine', 'Andy Samberg', 'Harry Styles', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Baby!', 'Did you have your baby, yet?', 'Pete Davidson','Nick Sullivan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Punching bag', 'Just bought one', 'Pete Davidson', 'Austin Pegg',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('The Lonely Island', 'Love you guys', 'Gabe Freeman','Joe Lynch', DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('The Lonely Island', 'Love you guys', 'Gabe Freeman', 'Mathew Perry',DATE '2006-02-01', 1);
INSERT INTO Messages VALUES ('Thinking about you', 'I have not seen you in awhile', 'Gabe Freeman', 'Amy Adams',DATE '2006-02-01', 0);
---this is good 
INSERT INTO Messages VALUES ('Lost wallet', 'Have you seen my wallet?', 'Gabe Freeman', 'Nick Sullivan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Noodlehead', 'I hate that place', 'Austin Pegg', 'Collin Jost', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Break', 'Where are you going over break?', 'Austin Pegg', 'Michelle Holdney', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Voting rights act', 'Such an important moment in history!', 'Andy Samberg', 'Eric Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('You are frustrating', 'Please try harder to get things done on time', 'Andy Samberg', 'Jeff Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fixing the sink', 'You still have not done that', 'Andy Samberg', 'Sara Mills', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Goat cheese', 'I do not know how I feel about that cheese', 'Andy Samberg', 'Adam Sandler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Ghosts', 'Ghosts are real for sure', 'Andy Samberg', 'Lena Ortmann', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New carpet', 'I think we need to replace the carpets', 'Andy Samberg', 'Liam Payne',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Jimmy Fallon', 'He should be in this movie too', 'Andy Samberg',  'Harry Styles', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Movie', 'I love making movies with you', 'Andy Samberg','Hannah Barton', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Lebron James', 'Such an easy to please city, Clevland!', 'Andy Samberg', 'Bridget Egler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Do not worry', 'I will find your wallet', 'Andy Samberg', 'Erin Higgins',  DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Friday meeting', 'Does 9am work for you?', 'Andy Samberg', 'Austin Pegg', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New relationship', 'I just starting seeing someone new, lets talk about it','Austin Pegg','Andy Samberg', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Ohio', 'Is the worst state for sure.', 'Austin Pegg', 'Louis Stylinson', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Brown', 'I think brown couch would look the best', 'Michelle Holdney','Nick Calzone', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Goat', 'Tom Brady is not the GOAT', 'Michelle Holdney','Andrea Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Jason Bourne', 'I would like to see that new movie', 'Michelle Holdney','Amy Adams', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Matt Damon', 'He is an okay actor', 'Michelle Holdney','Matt Henry', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Blankets', 'I left all my blankets in your car', 'Nick Sullivan','Zayn Malik', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Milk', 'Pick up milk on the way home.', 'Nick Sullivan', 'Tom Smith', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Birthday', 'When is your birthday again?', 'Nick Sullivan','Gabe Freeman', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Family time', 'We are missing you for family game night', 'Nick Sullivan', 'Erin Higgins',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Florida', 'I am going there in August', 'Nick Sullivan','Shawna Henkel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Harry Potter World', 'I am so excited to see Harry Potter world!', 'Collin Jost','Shawna Henkel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Berkeley', 'I am looking for apartments, can you help?', 'Collin Jost','Tommy Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('UCLA', 'We are racing them on Friday!', 'Collin Jost', 'Elisha Becker',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fun idea', 'We should get ice cream and pizza and then go to the park', 'Collin Jost','Daniel Robertson', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Trip ideas', 'What about New Jersey?', 'Collin Jost','Hannah Barton', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Cool socks', 'Do you know about the King of Socks?', 'Erin Higgins', 'Sara Mills', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Baby', 'Have you met the new baby yet? So cute. ', 'Erin Higgins','Val Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Drill', 'My drill broke, can I borrow yours?', 'Andy Samberg', 'Mike Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Notes', 'Can you send me a copy of your notes from today?', 'Erin Higgins', 'Laura Barton', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Meeting recap', 'I sent out the meeting recap to everyone.', 'Erin Higgins', 'Roger Barton',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Best buy', 'Do you need anything while I am here?', 'Andy Samberg', 'Mike Ortmann', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Season 2', 'I got season 2 of the Sopranos from Best Buy', 'Andy Samberg','Carissa Lang', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Tom', 'He moved to Atlanta last week!', 'Andy Samberg','Sasha Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Making memories', 'I made a scrap book of all our picture from vaca!', 'Andy Samberg','Janna Votodian', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Africa trip', 'This is going to be life changing, for sure. ', 'Joanna Newsom', 'Carter Johnson',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Cleaning time', 'We have to clean before we move out.', 'Joanna Newsom','Kristin Baker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Do not be mad', 'But I bought a puppy', 'Joanna Newsom', 'Gabby Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Waffles', 'Probably my favorite food', 'Petunia Mulaney','Sophie Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Potato salad', 'Did grandma make her potato salad?', 'Petunia Mulaney','Niall Horan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Jeff Bridges', 'Is a great comedic actor, I wish we were friends.', 'Petunia Mulaney', 'Harry Styles',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('RIPD', 'Not a great movie, but deserved better than it got!', 'Petunia Mulaney','Lena Ortmann', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Found dog', 'Is this your dog?', 'Petunia Mulaney', 'Liz Hallahan', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Independence day', 'Why did they make a sequel?','Petunia Mulaney', 'Kyle Mathias', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New justice', 'Did you finish that paper?', 'Petunia Mulaney','Kiel Gierlach', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('One direction', 'I wish they would get back together.', 'Petunia Mulaney', 'Keri Dinkel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New deal', 'If I do the laundry you have to wash the dishes', 'Petunia Mulaney', 'Jessie Smolen',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Austin Powers', 'Mike Meyers is pretty good looking', 'Petunia Mulaney','Josh Lang', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Ryan Reynolds', 'Ryan Reynolds is so funny, why is he married to Blake?', 'Kevin Bacon','Bill Hader', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Why?', 'Are you going there?', 'Kevin Bacon','Chris Farley', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('What?', 'Are you doing there?', 'Kevin Bacon','Mark Zuckerberg', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Who?', 'Are you going with?', 'Kevin Bacon','Will Forte', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('When?', 'Will you be back?', 'Kevin Bacon', 'Adam Sandler',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('How?', 'Are you getting there?', 'Kevin Bacon','Will Ferrel', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Dead end', 'My street is a dead end', 'Kevin Bacon', 'Collin Jost',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Directions', 'Please send directions to your house so I do not get lost', 'Kevin Bacon','David Spade', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('New charger', 'I need a new charger, my other one is broken', 'Kevin Bacon','Joe Lynch', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Medals', 'We got first! Coming home with bling!', 'Kevin Bacon','Vince Vaughn', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Display case', 'Can you build me a display case for my medals?', 'Kevin Bacon','Owen Wilson', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Date', 'Hey, would you want to go on a date sometime?', 'Kevin Bacon','Bill Murry', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Groceries', 'Need anything from the store?', 'Chris Farley','Leslie Jones', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Dinner', 'What do you want for dinner?', 'Chris Farley','Kevin Bacon', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Garden', 'What should we plant in the garden?', 'Chris Farley','Harry Styles', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Home depot', 'Need anything from home depot?', 'Chris Farley', 'Liam Payne',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Orange juice', 'I think we should sell some fresh OJ on the street.', 'Chris Farley','Lou Marra', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Birds', 'They love the new feeder!', 'Chris Farley','Jess Slain', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Mailbox', 'Someone knocked over our mailbox today', 'Chris Farley','Kyle Mooney', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Money', 'Can you pay me for rent soon?', 'Chris Farley','Will Forte', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Bangkok Balcony', 'Want to meet for lunch?', 'Chris Farley','Kristen Bell', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Computer desk', 'I need a new desk for my computer', 'Chris Farley','Leslie Jones', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Desk', 'I found a new desk for my computer', 'Erin Higgins','Lena Ortmann', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('I am good', 'Sorry I have not been keeping in touch', 'Erin Higgins','Tommy Becker', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Sad', 'Sorry to hear that, get better soon!', 'Erin Higgins','Harry Styles', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Found that movie', 'Found that DVD you were looking for', 'Erin Higgins','Gabe Freeman', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Fresh', 'We should go to the farmers market on Friday', 'Erin Higgins','Bridget Egler', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Workout plan', 'I have been following a plan and it is really tough', 'Erin Higgins','Sara Mills', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Gloves', 'I love these new gloves, thanks', 'Bridget Devine','Daniel Robertson', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Winter', 'Its too cold I hate it', 'Gabby Means', 'Sophie Means',DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Friendship', 'I am so glad you are in my life!', 'Sophie Means', 'Gabby Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Let us catch up', 'We should chat soon!', 'Dominic Means','Sophie Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Kevin Bacon', 'Why is he in every movie?', 'Penny Means','Dominic Means', DATE '2006-02-01', 0);
INSERT INTO Messages VALUES ('Gross', 'I am grossed out by the texture of peaches', 'Andy Samberg','Harry Styles', DATE '2006-02-01', 0);
