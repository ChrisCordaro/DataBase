﻿----------------------------------------------------------------------------------------
-- Courses and Prerequisites
-- by Alan G. Labouseur
-- Tested on Postgres 9.3.2
----------------------------------------------------------------------------------------

--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;


--
-- An example stored procedure ("function")
--
create or replace function get_courses_by_credits(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from   courses
       where  credits >= num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select get_courses_by_credits(0, 'results');
Fetch all from results;



--
--
--
create or replace function prereqsfor(int, REFCURSOR) returns refcursor as
$$
DECLARE 
   course_num int := $1;
   resultset REFCURSOR :=$2;
begin
  open resultset for
  select prereqnum
  from  Prerequisites
  
     where course_num = coursenum
     order by prereqnum desc
     limit 1;
     
  
   return resultset;
    
end;
$$
language plpgsql;

select prereqsfor(308, 'results');
Fetch all from results;




create or replace function isPreReqFor(int, REFCURSOR) returns refcursor as
$$
declare 
  course_num int :=$1;
  resultset REFCURSOR :=$2;
begin
  open resultset for
  select coursenum
  from Prerequisites
    where course_num = prereqnum;
    return resultset;
END;
$$
Language plpgsql;

select isPreReqFor(120, 'results');
fetch all from results;


select *
from Prerequisites
order by courseNum DESC;
   