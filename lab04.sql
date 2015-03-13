----------------------------------------------------------------------------------------
-- Postgres create, load, and query script for CAP2.
--
-- SQL statements for the CAP2 database
-- 
-- Derived from the CAP examples in _Database Principles, Programming, and Performance_, 
--   Second Edition by Patrick O'Neil and Elizabeth O'Neil
-- 
-- Modified a few times by Alan G. Labouseur
-- 
-- Tested on Postgres 9.3.2    (For earlier versions, you may need
--   to remove the "if exists" clause from the DROP TABLE commands.)
----------------------------------------------------------------------------------------

-- Connect to your Postgres server and set the active database to CAP2.  Then . . .

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS agents;
DROP TABLE IF EXISTS products;


-- Customers --
CREATE TABLE customers (
  cid      char(4) not null,
  name     text,
  city     text,
  discount decimal(5,2),
 primary key(cid)
);


-- Agents --
CREATE TABLE agents (
  aid     char(3) not null,
  name    text,
  city    text,
  percent real,
 primary key(aid)
);        


-- Products --
CREATE TABLE products (
  pid      char(3) not null,
  name     text,
  city     text,
  quantity integer,
  priceUSD numeric(10,2),
 primary key(pid)
);


-- Orders -- 
CREATE TABLE orders (
  ordno   integer not null,
  mon     char(3),    
  cid     char(4) not null references customers(cid),
  aid     char(3) not null references agents(aid),
  pid     char(3) not null references products(pid),
  qty     integer,
  dollars numeric(12,2),
 primary key(ordno)
);



-- SQL statements for loading example data into the CAP2 database
-- Tested on Postgres 9.3.2
-- Connect to your Postgres server and set the active database to CAP2.  Then . . .

-- Customers --
INSERT INTO Customers( cid, name, city, discount )
  VALUES('c001', 'Tiptop', 'Duluth', 10.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c002', 'Basics', 'Dallas', 12.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c003', 'Allied', 'Dallas', 8.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c004' ,'ACME' ,'Duluth', 8.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c005' ,'Weyland-Yutani', 'Acheron', 0.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c006' ,'ACME' ,'Kyoto' ,0.00);


-- Agents --
INSERT INTO Agents( aid, name, city, percent )
  VALUES('a01', 'Smith', 'New York', 6 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a02', 'Jones', 'Newark', 6 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a03', 'Brown', 'Tokyo', 7 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a04', 'Gray', 'New York' ,6 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a05', 'Otasi', 'Duluth', 5 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a06', 'Smith', 'Dallas', 5 );

INSERT INTO Agents( aid, name, city, percent )
  VALUES('a08', 'Bond', 'London', 7 );


-- Products --
INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p01', 'comb', 'Dallas', 111400, 0.50 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p02', 'brush', 'Newark', 203000, 0.50 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p03', 'razor', 'Duluth', 150600, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p04', 'pen', 'Duluth', 125300, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p05', 'pencil', 'Dallas', 221400, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p06', 'folder','Dallas', 123100, 2.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p07', 'case', 'Newark', 100500, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p08', 'clip', 'Newark', 200600, 1.25 );


-- Orders --
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1011, 'jan', 'c001', 'a01', 'p01', 1000, 450.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1013, 'jan', 'c002', 'a03', 'p03', 1000, 880.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1015, 'jan', 'c003', 'a03', 'p05', 1200, 1104.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1016, 'jan', 'c006', 'a01', 'p01', 1000, 500.00);
  
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1017, 'feb', 'c001', 'a06', 'p03',  600, 540.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1018, 'feb', 'c001', 'a03', 'p04',  600, 540.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1019, 'feb', 'c001', 'a02', 'p02',  400, 180.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1020, 'feb', 'c006', 'a03', 'p07',  600, 600.00);
  
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1021, 'feb', 'c004', 'a06', 'p01', 1000, 460.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1022, 'mar', 'c001', 'a05', 'p06',  400, 720.00);
    
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1023, 'mar', 'c001', 'a04', 'p05',  500, 450.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1024, 'mar', 'c006', 'a06', 'p01',  800, 400.00);
  
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1025, 'apr', 'c001', 'a05', 'p07',  800, 720.00);

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1026, 'may', 'c002', 'a05', 'p03',  800, 740.00);


-- SQL statements for displaying example data into the CAP2 database
-- Connect to your Postgres server and set the active database to CAP2.  Then . . .

select *
from customers;

select *
from agents;

select *
from products;

select *
from orders;

--Question1: Get the citites of agents booking an order for a customer whose cid is 'c006'
--Agents ordering for a customer 'c006' is agent a01, a06, a03
--Cities of agents a01, a06, a03: NewYork, Dallas, Tokyo
select city
from agents
where agents.aid in 
	(select aid
	from orders
	where orders.cid = 'c006');


--Question2: Get the pids of products ordered through any agent who takes at least one order from a customer in Kyoto, sortder by pid form highest to lowest
--Agents with at least one order frm Kyoto: a01, a03, a06
--pids of products ordered through a01, a03, a06:  a01 = p01. a03 = p03, p05, p04, p07. a06 = p03, p01
--pids of products ordered through a01, a03, ao6 = p01 p03 p04 p05 p06 p07

select distinct pid
from orders
where aid in(

select aid 
from orders
where cid in (
	select cid
	from customers
	where city = 'Kyoto')
	

) order by pid desc




--Question3: Get the cids and names of customers who did not place an order through agent a03
--customers that did not place an order through agent a03 = c004. c005 never placed an order  

select name, cid
from customers
where cid in (
	select cid
	from orders 
	where cid NOT in(

		select cid
		from orders
		where aid = 'a03')
	     );



--Question 4: Get the cids of customers who ordered both p01 and p07
--customers that ordered p01 and p07 = c001, c006

select cid
from customers
where cid in
	(select cid
	from orders
	where pid = 'p01' or pid = 'p07');



--Question 5: Get the pids of products NOT ordered by any customers who placed any order through agent a05
--customers that used a05: c001, c002
--pid of products ordered by c001 and c002 = p06, p07, p03


select pid
from products
where pid not in (
	select pid
	from orders
	where aid = 'a05');



--Question 6: Get the name, discounts, and city for all customers who place orders through agents in dallas or new york
--aid of agents in new york or dalls = a01, a04, a06
--customers that placed orders through a01, a04, a06 = c001, c006, c004
--name of those customers = Acme, Tiptop, Acme
--city of those customers = Duluth, Duluth, Kyoto


select city, discount, name
from customers
where cid in (select cid
		from orders
		where aid = 'a01' OR aid = 'a04' OR aid = 'a06');

--Create it so these are all combined

--Question7: Get all cusomers who have the same discount as that of any customers in Dallas or London
--Dallas/London discount = 12.00/8.00

select cid
from customers
where discount in (

	select discount
	from customers
	where city = 'Dallas');

--How to exclude customers c002 and c003

--Question8:Check constraints

/*


Check constraints are used to limit certain values to be within a set range. They are good to make sure that no 'bad' data gets entered into a table, row, or column. 
One main reason to put these inside a database is to make sure that all data entered makes sense within its appropriate row. For example, if there was a table for Products,
and that table had a row to represent the value of each product. It would make sense to put a check restraint to ensure that each value entered for the price of each individual product
is > 0/1. Without that check restraint a user could enter a negative value, which makes no sense as the price of an item has to be some positive (in some cases 0) value. A bad example of a check restraint
would be that if you had a table for a product with a row that signified the price, to check to make sure that the price entered is an integer value. Since items won't always cost an exact integer value,
this would make a valid entry such as "12.50" invalid. 




*/





