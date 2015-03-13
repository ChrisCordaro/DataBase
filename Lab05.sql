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


--Lab 05


--Question 1: Show the citites of agents booking an order for a customer whose pid is 'c006' Use joins.
--Agents booking an order for a customer c006: a01, a03, a06
--Citites of agents a01, a03, a06: New York, Toyko, Dallas



select city, agents.aid
from agents, orders
where agents.aid = orders.aid
and orders.cid = 'c006';



--Question 2: Show the pids of products ordered through any agent who makes at least one order
--for a customer in Kyoto, sorted by pid from highest to lowest. Use joins
--Agents that make at least one order for a customer in kyoto: a01, a03, a06
--a01 orders p01: a03 orders p03, p05, p04, p07: a06 orders p03, p01
--pids of these products: p01, p03, p04, p05, p07



select distinct pid
from orders
where orders.aid in (

select aid
from orders, customers
where orders.cid = customers.cid
and customers.city = 'Kyoto'
order by orders.pid desc

);

select distinct ord1.pid
	from orders as ord1, orders as ord2, agents, customers
	where agents.aid = ord1.aid
	and agents.aid = ord2.aid
	and ord2.cid = customers.cid
	and customers.city = 'Kyoto'
	order by pid desc


 

--Question 3: Show the names of customers who have never placed an order. Use a subquery
--Customers that never placed an order = c005

select name
from customers
where customers.cid NOT IN (
	select cid
	from orders
)


--Question 4: Show the names of customers who have never placecd an order: Use an outer join
--Customers that never placed an order Weyland-Yutani
select name
from customers
left outer join orders
on customers.cid = orders.cid
where orders.cid is null;



--Question 5: Show the names of customers who placed at least one order through an agent in 
--their own city, along with those agents names
--C004 and a05: no orders
--C001 and a05: two orders
--C003 and a06: no orders
--C002 and a06: no orders



select customers.cid, agents.aid, agents.name
	from customers, agents, orders
	where customers.city = agents.city
	and orders.cid = customers.cid
	and orders.aid = agents.aid


--Question 6: Show the names of customers and agents living in the same city, along with the names
--of the shared city, regardless of whether or not a customer has ever placed an order with that agents

select customers.name, agents.name, agents.city
from customers, agents
where customers.city = agents.city



--Question 7: Show the name and city of customers who live in the city that makes the fewest kinds
--of products
--City that makes the fewest kinds of products:
--Dallas makes p05, p06, p01
--Newark makes p02, p08, p07
--Duluth makes p03, p04
--Duluth makes the fewest kinds of products




Select name, city
from customers 
where customers.city in(
	select city
	From(
		select products.city, count(products.pid) as sum
		from products
		group by products.city
		order by sum asc
		limit 1)
		as alias);







