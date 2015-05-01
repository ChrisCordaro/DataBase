
--Chris Cordaro
--
--Final Project
--
--Paintball Tournament Database

Drop table if exists people;
drop table if exists coaches;
drop table if exists players;
Drop table if exists staff;
drop table if exists teams;
drop table if exists accepted_companies;

drop table if exists accepted_sponsors;
Drop table if exists team_sponsors;
drop table if exists paint_sponsors;
drop table if exists event_paint_sponsors;



drop table if exists events;
drop table if exists event_teams;

drop table if exists event_sponsors;


drop table if exists accepted_vendors;
drop table if exists event_vendors;


drop table if exists venues;



--People--
create table people (
  pid        char(5) not null,
  firstName  text not null, 
  lastName   Text not null,
  primary key(pid)

);


--Teams--
create table teams(
   tid       char(4) Not Null,
   tName     text not null,
   division  text not null,
   country   text not null,
   
  
   primary key (tid)

);

--Coaches--
Create table coaches (
  pid         char(5) not null references people(pid),
  tid char(4) not null references teams(tid),
  primary key(pid)

);


--Players--
Create table players(
  pid        char(5) not null references people(pid),
  team       char(4) not null references teams(tid),
  
  primary key (pid)

);



--Staff--
create table staff(
  pid        char(5) not null references people(pid),
  jobTitle   text not null,
  primary key (pid)

);


--Postal Info--

create table postalInfo(
   postalCode char(5) not null,
   city       text not null,
   state      text not null,
   primary key(postalCode)

);
select*
from postalInfo;

--Companies--
Create table accepted_companies(
  cid          char(3) not null,
  cName        text not null,
  address      text not null, 
  postalCode   char(5) not null references postalInfo(postalCode),
  contactInfo  text not null,
  primary key (cid)
  
);


--Accepted Sponser--
create table accepted_sponsors(
   cid               CHAR(3) not null references accepted_companies(cid),
   sponsorProgram    text not null,
   primary key (cid)
);



--Team Sponsers--
Create table team_sponsors(
  tid        char(4) not null references teams(tid),
  cid        Char(3) not null references accepted_sponsors(cid),
  primary key (tid, cid)
);


--Paint Sponsors--
create table paint_sponsors(
   cid       char(3) not null references accepted_sponsors,
   paintName text not null,
   primary key (cid)

);

--Venues--
create table venues(
   vid       char(5) not null,
   vName     text not null,
   state     text not null,
   city      text not null,
   primary key (vid)
   
);


--Events--
create table events(
  eid          char(5) not null,
  eName        text not null,
  datePlayed   date not null,
  vid          char(5) not null references venues(vid) ,
  paintSponsor char(5) not null references paint_sponsors(cid),
  primary key (eid)
);



--Event Teams--
create table event_teams(
   eid       char(5) not null references events(eid),
   tid       char(4) not null references teams(tid),
   primary key (eid, tid)
);


--Accepted Vendors--
create table accepted_vendors(
    cid           char(3) not null references accepted_companies(cid),
    numOfTents    int,
    primary key (cid)
   
);



--Event Vendors--
create table event_vendors(
    eid      char(5) not null references events(eid),
    cid      char(3) not null references accepted_vendors(cid),
    primary key (eid, cid)
);





--Insert statements--




--People--
Insert into people(pid, firstName, lastName)
    Values('p1001', 'Dave', 'Bains');

Insert into people(pid, firstName, lastName)
    Values('p1002', 'Keith', 'Brown');

Insert into people(pid, firstName, lastName)
    Values('p1003', 'Chad', 'Busiere');

Insert into people(pid, firstName, lastName)
    Values('p1004', 'Nick', 'Leival');

Insert into people(pid, firstName, lastName)
    Values('p1005', 'Josh', 'Ouimet');

Insert into people(pid, firstName, lastName)
    Values('p1006', 'Justin', 'Rabackoff');

Insert into people(pid, firstName, lastName)
    Values('p1007', 'Raney', 'Stanczak');

Insert into people(pid, firstName, lastName)
    Values('p1008', 'Zane', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('p1009', 'Zachary', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('p1010', 'Bart', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('p2001', 'AJ', 'Lawhead');

Insert into people(pid, firstName, lastName)
    Values('p2002', 'Kirk', 'Wozny');

Insert into people(pid, firstName, lastName)
    Values('p2003', 'Rob', 'Velez');

Insert into people(pid, firstName, lastName)
    Values('p2004', 'Brian', 'McKenna');

Insert into people(pid, firstName, lastName)
    Values('p2005', 'Chris', 'Sosine');

Insert into people(pid, firstName, lastName)
    Values('p2006', 'Cliff', 'Ginter');

Insert into people(pid, firstName, lastName)
    Values('p2007', 'Carl', 'Markowski');

Insert into people(pid, firstName, lastName)
    Values('p2008', 'Aaron', 'Tholey');

Insert into people(pid, firstName, lastName)
    Values('p2009', 'Mike', 'Bruno');

Insert into people(pid, firstName, lastName)
    Values('p3001', 'Alex', 'Fraige');

Insert into people(pid, firstName, lastName)
    Values('p3002', 'Ryan', 'Greenspan');

Insert into people(pid, firstName, lastName)
    Values('p3003', 'Yosh', 'Rau');

Insert into people(pid, firstName, lastName)
    Values('p3004', 'Glenn', 'Takemoto');

Insert into people(pid, firstName, lastName)
    Values('p3005', 'Blake', 'Yarber');

Insert into people(pid, firstName, lastName)
    Values('p3006', 'Brandon', 'Short');

Insert into people(pid, firstName, lastName)
    Values('p3007', 'Dalton', 'Vanderbyl');

Insert into people(pid, firstName, lastName)
    Values('p3008', 'Rusty', 'Glaze');
    
Insert into people(pid, firstName, lastName)
    Values('p5005', 'Matty', 'Marshall');

Insert into people(pid, firstName, lastName)
    Values('p5006', 'Todd', 'Martinez');

Insert into people(pid, firstName, lastName)
    Values('p5007', 'Chris', 'Lasoya');

Insert into people(pid, firstName, lastName)
    Values('p5008', 'Lauren', 'Kelly');


--Teams--
insert into teams(tid, tName, division, country)
    Values('1001', 'Edmonton Impact', 'Champions', 'Canada');

insert into teams(tid, tName, division, country)
    Values('2002', 'Chicago Aftershock', 'Champions', 'USA');

insert into teams(tid, tName, division, country)
    values('3003', 'San Diego Dynasty', 'Champions', 'USA');



--Coaches--
Insert into coaches(pid, tid)
    Values('p1010', '1001');

Insert into coaches(pid, tid)
    Values('p2009', '2002');

insert into coaches(pid, tid)
    values('p3008', '3003');


--Players--
insert into players(pid, team)
    values('p1001', '1001');

insert into players(pid, team)
    values('p1002', '1001');

insert into players(pid, team)
    values('p1003', '1001');

insert into players(pid, team)
    values('p1004', '1001');

insert into players(pid, team)
    values('p1005', '1001');

insert into players(pid, team)
    values('p1006', '1001');

insert into players(pid, team)
    values('p1007', '1001');

insert into players(pid, team)
    values('p1008', '1001');

insert into players(pid, team)
    values('p1009', '1001');

insert into players(pid, team)
    values('p2001', '2002');

insert into players(pid, team)
    values('p2002', '2002');

insert into players(pid, team)
    values('p2003', '2002');

insert into players(pid, team)
    values('p2004', '2002');

insert into players(pid, team)
    values('p2005', '2002');

insert into players(pid, team)
    values('p2006', '2002');

insert into players(pid, team)
    values('p2007', '2002');

insert into players(pid, team)
    values('p2008', '2002');


--Professional Staff--
insert into staff(pid, jobTitle)
    Values ('p5006', 'Commentator');

insert into staff(pid, jobTitle)
    Values ('p5007', 'Commentator');

insert into staff(pid, jobTitle)
    Values ('p5008', 'On feild reporter');


--Postal Info--
insert into postalInfo(postalCode, city, state)
   values('90210', 'San Diego', 'California');

insert into postalInfo(postalCode, city, state)
   values('10505', 'Springfield', 'Massachussets');

insert into postalInfo(postalCode, city, state)
   values('12345', 'Springfield', 'Illinois');

insert into postalInfo(postalCode, city, state)
   values('22134', 'New York', 'New York');

insert into postalInfo(postalCode, city, state)
   values('10589', 'Tampa', 'Florida');

insert into postalInfo(postalCode, city, state)
   values('82654', 'Poughkeepsie', 'New York');
   
insert into postalInfo(postalCode, city, state)
   values('80808', 'Newport', 'Rhode Island');



--Accepted Companies--
insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('111', 'Planet Eclipse', 'PE Road', '90210', 'PlanetEclipsePaintball@PE.com' );
    
insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('112', 'DYE Percision', 'DYE Sports Way', '10505', 'DYEPaintball@dyeproducts.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('113', 'KEE Action Sports', 'KEY Paintball Drive', '12345', 'KEE-ACTION@keeaction.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('114', 'MacDev Paintball', 'BackRoad Drive', '22134', 'MacDevSupport@MacDev.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('115', 'Virtue Paintball', 'BackRoad Drive', '22134', 'MacDevSupport@PE.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('116', 'GI Sports', 'GI Sports Lane', '10589', 'GIproducts@gisports.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('117', 'HK Army', 'Hustle-Kids Lane', '82654', 'Info@HKarmy.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('118', 'BNKER Kings', '118 Central Drive', '10505', 'BNKERInfo@BNKER.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('119', 'Bob Long', '118 Central Drive', '10505', 'BobSupport@boblong.com' );

insert into accepted_companies(cid, cName, address, postalCode, contactInfo)
    values('120', 'Invert Paintball', 'Invert Drive', '80808', 'KEE-ACTION@keeaction.com' );





--Sponsers--
insert into accepted_sponsors(cid, sponsorProgram)
    values('113', 'Full');

insert into accepted_sponsors(cid, sponsorProgram)
    values('111', 'Full');

insert into accepted_sponsors(cid, sponsorProgram)
    values('112', 'Full');

insert into accepted_sponsors(cid, sponsorProgram)
    values('114', 'Full');
    
insert into accepted_sponsors(cid, sponsorProgram)
    values('115', 'Partial');

insert into accepted_sponsors(cid, sponsorProgram)
    values('116', 'Partial');

insert into accepted_sponsors(cid, sponsorProgram)
    values('117', 'Partial');


--Team Sponsors--
insert into team_sponsors(tid, cid)
    VALUES('1001', '113');

insert into team_sponsors(tid, cid)
    VALUES('1001', '111');

insert into team_sponsors(tid, cid)
    VALUES('1001', '117');

Insert into team_sponsors(tid, cid)
    values('1001', '116');

insert into team_sponsors(tid, cid)
    VALUES('2002', '112');

insert into team_sponsors(tid, cid)
    VALUES('2002', '114');

insert into team_sponsors(tid, cid)
    VALUES('2002', '116');

 

--Paint Sponsors--
insert into paint_sponsors(cid, paintName)
   values('113', 'RPS PREMIUM');
   
insert into paint_sponsors(cid, paintName)
   values('111', 'PE GOLD');

insert into paint_sponsors(cid, paintName)
   values('112', 'DYE CG');

insert into paint_sponsors(cid, paintName)
   values('114', 'Macdev Prime');

insert into paint_sponsors(cid, paintName)
   values('116', 'GI 5 Star');

insert into paint_sponsors(cid, paintName)
   values('117', 'Hk Supreme');

--Venues--
insert into venues(vid, vName, state, city)
    values('11111', 'Cousins Paintball', 'Texas', 'Forney');

insert into venues(vid, vName, state, city)
    values('22222', 'OXCC Paintball', 'Maryland', 'Chesapeake');

insert into venues(vid, vName, state, city)
    values('33333', 'CPX Sports', 'Illinois', 'Joliet');

insert into venues(vid, vName, state, city)
    values('44444', 'Cousins Paintball', 'California', 'Los Angeles');

insert into venues(vid, vName, state, city)
    values('55555', 'Fantasy of Flight', 'Florida', 'Polk City');

  
--Events--
insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('12345', 'Dallas Open', '2015-01-10', '11111', '113');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('56789', 'Mid Atlantic Open', '2015-05-10', '22222', '113');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('54321', 'Chicago Open', '2015-06-10', '33333', '112');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('98765', 'West Coast Open', '2015-09-10', '44444', '116');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('10101', 'World Cup', '2015-09-10', '55555', '117');






    

--Event Teams--
insert into event_teams(eid, tid)
   values('12345', '1001');

insert into event_teams(eid, tid)
   values('12345', '2002');

insert into event_teams(eid, tid)
   values('56789', '1001');

insert into event_teams(eid, tid)
   values('56789', '2002');

insert into event_teams(eid, tid)
   values('54321', '1001');

insert into event_teams(eid, tid)
   values('54321', '2002');

insert into event_teams(eid, tid)
   values('98765', '1001');

insert into event_teams(eid, tid)
   values('98765', '2002');

insert into event_teams(eid, tid)
   values('10101', '1001');

insert into event_teams(eid, tid)
   values('10101', '2002');





--Accepted vendors--
insert into accepted_vendors(cid, numOfTents)
   values('119', 2);

insert into accepted_vendors(cid, numOfTents)
   values('111', 5);

insert into accepted_vendors(cid, numOfTents)
   values('118', 1);
   
insert into accepted_vendors(cid, numOfTents)
   values('120', 2);

insert into accepted_vendors(cid, numOfTents)
   values('112', 1);

insert into accepted_vendors(cid, numOfTents)
   values('113', 3);

insert into accepted_vendors(cid, numOfTents)
   values('114', 5);

insert into accepted_vendors(cid, numOfTents)
   values('115', 2);



--Event Vendors---
insert into event_vendors(eid, cid)
   values('10101', '119');

insert into event_vendors(eid, cid)
   values('10101', '111');

insert into event_vendors(eid, cid)
   values('10101', '112');

insert into event_vendors(eid, cid)
   values('10101', '113');

insert into event_vendors(eid, cid)
   values('10101', '114');
   
insert into event_vendors(eid, cid)
   values('12345', '119');
   
insert into event_vendors(eid, cid)
   values('12345', '111');

insert into event_vendors(eid, cid)
   values('98765', '112');

insert into event_vendors(eid, cid)
   values('98765', '120');

insert into event_vendors(eid, cid)
   values('54321', '120');

insert into event_vendors(eid, cid)
   values('54321', '115');





--Lists each sponsor of each team
--Many teams can have many sponsors

create view teamSponsors as
select tname, teams.tid, accepted_companies.cname--THIS HAS BEEN EDITED, UPDATE IT IN PRESENTATION--
from teams, team_sponsors, accepted_companies, accepted_sponsors
where teams.tid = team_sponsors.tid 
and team_sponsors.cid = accepted_sponsors.cid
and accepted_sponsors.cid  = accepted_companies.cid
order by tname desc;

select *
from teamSponsors;



--Lists the specific companies that are vendors and the event(s) they are present at
create view eventVendors as
select accepted_companies.cName, event_vendors.eid, accepted_vendors.numOfTents
from accepted_companies, accepted_vendors, event_vendors
where accepted_companies.cid = accepted_vendors.cid
and accepted_vendors.cid = event_vendors.cid;

select*
from eventVendors


--Lists what teams are playing which events
create view teamsPlayingEvents as
select teams.tid, teams.tName, events.eid, events.eName
from teams, event_teams, events
where teams.tid = event_teams.tid
and event_teams.eid = events.eid
order by teams.tName desc;

select*
from teamsPlayingEvents





--stored procedures--
create or replace function get_paint_sponsor(char(3), refcursor) returns refcursor as
$$
declare 
  paintCompany char(3)      := $1;
  resultset    REFCURSOR := $2;

begin
open resultset for
   select eid, eName
   from events
   where paintSponsor = paintCompany;
 return resultset;
end;
$$
language plpgsql;

select get_paint_sponsor('113', 'results');
fetch all from results;





create or replace function get_team_sponsor(char(4), REFCURSOR) returns refcursor as
$$
declare
  teamInQuestion char(4) := $1;
  resultset    REFCURSOR := $2;
begin
open resultset for
  select team_sponsors.cid, accepted_companies.cName
  from team_sponsors, accepted_companies, accepted_sponsors
  where team_sponsors.tid = teamInQuestion
  and team_sponsors.cid = accepted_sponsors.cid
  and accepted_sponsors.cid = accepted_companies.cid;
 return resultset;
end;
$$
language plpgsql;

select get_team_sponsor('1001', 'results');
fetch all from results;


--Query1--
select(
select count(people.pid)
from people
) as num_of_people,
(
select count(players.pid)
from players
)as num_of_players
from people
limit 1


--Query2--
select accepted_companies.cid, cName, address, postalInfo.postalCode, postalInfo.state, postalInfo.city, contactInfo
from accepted_companies, postalInfo, accepted_sponsors
where accepted_companies.cid = accepted_sponsors.cid
and accepted_companies.postalCode = postalInfo.postalCode

--Query3--
select count(players.pid) as num_of_players, players.team
from players, teams
where players.team = teams.tid
group by players.team



--SECURITIES--
create role database_admin

grant select, insert, update, delete
on all tables in schema public
to database_admin


create role event_coordinator

grant select, insert, update
on venues, events, event_teams, paint_sponsors, event_vendors
to event_coordinator


create role nxl_recruiter

grant select, insert, update
on people, staff, players, coaches, teams, accepted_companies, accepted_sponsors,
   postal_info, team_sponsors, accepted_vendors
to nxl_recruiter

