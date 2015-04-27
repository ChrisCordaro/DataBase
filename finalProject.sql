
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
drop table if exists accepted_sponsors;
Drop table if exists team_sponsors;
drop table if exists events;
drop table if exists event_teams;
drop table if exists event_sponsors;
drop table if exists vendors;
drop table if exists venues;
drop table if exists paint_sponsors;
drop table if exists event_paint_sponsors;
--People--
create table people (
  pid        char(4) not null,
  firstName  text, 
  lastName   Text,
  primary key(pid)

);


--Coaches--
Create table coaches (
  pid         char(4) not null references people(pid),
  teamCoached text --references teams(tid)--
  ,
  primary key(pid)

);


--Players--
Create table players(
  pid        char(4) not null references people(pid),
  team       text references teams(tid),
  
  primary key (pid)

);

--Staff--
create table staff(
  pid        char(4) not null references people(pid),
  jobTitle   text,
  primary key (pid)

);

--Teams--
create table teams(
   tid       char(3) Not Null,
   tName     text,
   division  text,
   country   text,
   coach     CHar(4) not null references coaches(pid),
   primary key (tid)

);


--Accepted Sponser--
create table accepted_sponsors(
   sid       CHAR(5) not null,
   sName     text,
   primary key (sid)
);


--Team Sponsers--
Create table team_sponsors(
  tid        char(3) not null references teams(tid),
  sid        Char(5) not null references accepted_sponsors(sid),
  primary key (tid, sid)
);

--Events--
create table events(
  eid          char(5) not null,
  eName        text,
  datePlayed   date,
  vid          char(5) not null references venues(vid) ,
  paintSponsor char(5) not null references paint_sponsors(sid),
  primary key (eid)
);

--Venues--
create table venues(
   vid       char(5) not null,
   vName     text,
   state     text,
   city      text,
   primary key (vid)
   
);

--Event Teams--
create table event_teams(
   eid       char(5) not null references events(eid),
   tid       char(3) not null references teams(tid),
   primary key (eid, tid)
);

--Paint Sponsors--
create table paint_sponsors(
   sid       char(5) not null references accepted_sponsors,
   paintName text,
   primary key (sid)

);



--Insert statements


--People--
Insert into people(pid, firstName, lastName)
    Values('1001', 'Dave', 'Bains');

Insert into people(pid, firstName, lastName)
    Values('1002', 'Keith', 'Brown');

Insert into people(pid, firstName, lastName)
    Values('1003', 'Chad', 'Busiere');

Insert into people(pid, firstName, lastName)
    Values('1004', 'Nick', 'Leival');

Insert into people(pid, firstName, lastName)
    Values('1005', 'Josh', 'Ouimet');

Insert into people(pid, firstName, lastName)
    Values('1006', 'Justin', 'Rabackoff');

Insert into people(pid, firstName, lastName)
    Values('1007', 'Raney', 'Stanczak');

Insert into people(pid, firstName, lastName)
    Values('1008', 'Zane', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('1009', 'Zachary', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('1010', 'Bart', 'Yachimec');

Insert into people(pid, firstName, lastName)
    Values('2001', 'AJ', 'Lawhead');

Insert into people(pid, firstName, lastName)
    Values('2002', 'Kirk', 'Wozny');

Insert into people(pid, firstName, lastName)
    Values('2003', 'Rob', 'Velez');

Insert into people(pid, firstName, lastName)
    Values('2004', 'Brian', 'McKenna');

Insert into people(pid, firstName, lastName)
    Values('2005', 'Chris', 'Sosine');

Insert into people(pid, firstName, lastName)
    Values('2006', 'Cliff', 'Ginter');

Insert into people(pid, firstName, lastName)
    Values('2007', 'Carl', 'Markowski');

Insert into people(pid, firstName, lastName)
    Values('2008', 'Aaron', 'Tholey');

Insert into people(pid, firstName, lastName)
    Values('2009', 'Mike', 'Bruno');

Insert into people(pid, firstName, lastName)
    Values('5005', 'Matty', 'Marshall');

Insert into people(pid, firstName, lastName)
    Values('5006', 'Todd', 'Martinez');

Insert into people(pid, firstName, lastName)
    Values('5007', 'Chris', 'Lasoya');

Insert into people(pid, firstName, lastName)
    Values('5008', 'Lauren', 'Kelly');


--Coaches--
Insert into coaches(pid, teamCoached)
    Values('1010', 'Edmonton Impact');

Insert into coaches(pid, teamCoached)
    Values('2009', 'Chicago AfterShock');

--Players--
insert into players(pid, team)
    values('1001', '111');

insert into players(pid, team)
    values('1002', '111');

insert into players(pid, team)
    values('1003', '111');

insert into players(pid, team)
    values('1004', '111');

insert into players(pid, team)
    values('1005', '111');

insert into players(pid, team)
    values('1006', '111');

insert into players(pid, team)
    values('1007', '111');

insert into players(pid, team)
    values('1008', '111');

insert into players(pid, team)
    values('1009', '111');

insert into players(pid, team)
    values('2001', '222');

insert into players(pid, team)
    values('2002', '222');

insert into players(pid, team)
    values('2003', '222');

insert into players(pid, team)
    values('2004', '222');

insert into players(pid, team)
    values('2005', '222');

insert into players(pid, team)
    values('2006', '222');

insert into players(pid, team)
    values('2007', '222');

insert into players(pid, team)
    values('2008', '222');



--Professional Staff--
insert into staff(pid, jobTitle)
    Values ('5006', 'Commentator');

insert into staff(pid, jobTitle)
    Values ('5007', 'Commentator');

insert into staff(pid, jobTitle)
    Values ('5008', 'On feild reporter');

--Teams--
insert into teams(tid, tName, division, country, coach)
    Values('111', 'Edmonton Impact', 'Champions', 'Canada', '1010');

insert into teams(tid, tName, division, country, coach)
    Values('222', 'Chicago Aftershock', 'Champions', 'USA', '2009');


--Sponsers--
insert into accepted_sponsors(sid, sName)
    values('10101', 'Kee-Action Sports(Empire)');

insert into accepted_sponsors(sid, sName)
    values('20202', 'Planet Eclipse');

insert into accepted_sponsors(sid, sName)
    values('30303', 'Dye');

insert into accepted_sponsors(sid, sName)
    values('40404', 'Macdev');
    
insert into accepted_sponsors(sid, sName)
    values('50505', 'Virtue Sports');

insert into accepted_sponsors(sid, sName)
    values('60606', 'GI Sports');

insert into accepted_sponsors(sid, sName)
    values('70707', 'Hk Army');


--Team Sponsors--
insert into team_sponsors(tid, sid)
    VALUES('111', '60606');

insert into team_sponsors(tid, sid)
    VALUES('111', '50505');

insert into team_sponsors(tid, sid)
    VALUES('111', '20202');

insert into team_sponsors(tid, sid)
    VALUES('222', '60606');

insert into team_sponsors(tid, sid)
    VALUES('222', '10101');

insert into team_sponsors(tid, sid)
    VALUES('222', '20202');

--Events--
insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('12345', 'Dallas Open', '2015-01-10', '11111', '10101');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('56789', 'Mid Atlantic Open', '2015-05-10', '22222', '10101');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('54321', 'Chicago Open', '2015-06-10', '33333', '30303');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('98765', 'West Coast Open', '2015-09-10', '44444', '70707');

insert into events(eid, eName, datePlayed, vid, paintSponsor)
   values('10101', 'World Cup', '2015-09-10', '55555', '60606');
    
    
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

--Event Teams--
insert into event_teams(eid, tid)
   values('12345', '111');

insert into event_teams(eid, tid)
   values('12345', '222');

insert into event_teams(eid, tid)
   values('56789', '111');

insert into event_teams(eid, tid)
   values('56789', '222');

insert into event_teams(eid, tid)
   values('54321', '111');

insert into event_teams(eid, tid)
   values('54321', '222');

insert into event_teams(eid, tid)
   values('98765', '111');

insert into event_teams(eid, tid)
   values('98765', '222');

insert into event_teams(eid, tid)
   values('10101', '111');

insert into event_teams(eid, tid)
   values('10101', '222');


--Paint Sponsors--
insert into paint_sponsors(sid, paintName)
   values('10101', 'RPS PREMIUM');
   
insert into paint_sponsors(sid, paintName)
   values('20202', 'PE GOLD');

insert into paint_sponsors(sid, paintName)
   values('30303', 'DYE CG');

insert into paint_sponsors(sid, paintName)
   values('40404', 'Macdeb Prime');

insert into paint_sponsors(sid, paintName)
   values('60606', 'GI 5 Star');

insert into paint_sponsors(sid, paintName)
   values('70707', 'Hk Supreme');







Select *
from people;

select *
from coaches;
    
Select *
from staff;

select *
from teams;

select*
from players;

select*
from accepted_sponsors;

select*
from team_sponsors;



select*
from venues;
s
select*
from event_teams;

select*
from paint_sponsors;

--Lists each sponsor of each team
--Many teams can have many sponsors
select tname, accepted_sponsors.sname
from teams, team_sponsors, accepted_sponsors
where teams.tid = team_sponsors.tid 
and team_sponsors.sid = accepted_sponsors.sid;
