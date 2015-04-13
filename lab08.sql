
drop table if exists orders;

drop table if exists clothesForSale;

drop table if exists suppliers;

drop table if exists SKUinfo;

drop table if exists postalinfo;



create table clothesForSale(
   SKUnumber text  primary key not null,
   description text,
   priceUSD numeric(10,2),
   quantity int
   
);



create table orders(
   orderNum  text primary key not null,
   supplierID text,
   SKUnumber text,
   quantity int,
   --SKUpriceUSD numeric(10,2),
   commenttext text,
   purchaseDate Date 
   

);

Create table suppliers( 
   id text primary key not null,
   name text,
   address text,
   postalCode int,
   contactInfo text,
   paymentTerms text

);

create table SKUinfo(
   SKUnumber text primary key not null,
   price numeric(10,2)
);

create table postalInfo(
   postalcode text primary key not null,
   city text,
   state text
);

--Clothes---

insert into clothesForSale(SKUnumber, description, priceUSD, quantity)
  VALUES ('111', 'The First Item', 2.20, 100);

insert into clothesForSale(SKUnumber, description, priceUSD, quantity)
  VALUES ('222', 'The Second Item', 2.50, 150);

insert into clothesForSale(SKUnumber, description, priceUSD, quantity)
  VALUES ('333', 'The Third Item', 2.75, 200);

insert into clothesForSale(SKUnumber, description, priceUSD, quantity)
  VALUES ('444', 'The Fourth Item', 3.00, 250);

insert into clothesForSale(SKUnumber, description, priceUSD, quantity)
  VALUES ('555', 'The Fifth Item', 3.25, 275);
  

--Orders--
insert into orders(orderNum, supplierId, SKUnumber, quantity, commenttext, purchaseDate)
   Values ('1', '1001', '111', 200, 'Some Comments', '06-12-2014');

insert into orders(orderNum, supplierId, SKUnumber, quantity, commenttext, purchaseDate)
   Values ('2', '2002', '222', 300, 'Some Comments', '07-15-2014');

insert into orders(orderNum, supplierId, SKUnumber, quantity, commenttext, purchaseDate)
   Values ('3', '3003', '333', 350, 'Some Comments', '08-14-2014'); 
     
insert into orders(orderNum, supplierId, SKUnumber, quantity, commenttext, purchaseDate)
   Values ('4', '4004', '333', 375, 'Some Comments', '08-22-2014');

insert into orders(orderNum, supplierId, SKUnumber, quantity, commenttext, purchaseDate)
   Values ('5', '5005', '444', 200, 'Some Comments', '09-18-2014');

--Suppliers--
insert into suppliers(id, name, address,  postalCode, contactInfo, paymentTerms)
   values('1001', 'Big Supplier', 'supplier road',  '1010101', 'supplier1@sup.com', 'credit');

insert into suppliers(id, name, address, postalCode, contactInfo, paymentTerms)
   values('2002', 'Medium Supplier', 'Some Road',  '2020202', 'supplier2@sup.com', 'credit');

insert into suppliers(id, name, address, postalCode, contactInfo, paymentTerms)
   values('3003', 'Small Supplier', 'Small Road Way',  '3030303', 'supplier3@sup.com', 'credit');

insert into suppliers(id, name, address, postalCode, contactInfo, paymentTerms)
   values('4004', 'Super Supplier', 'Super Road Way',  '4040404', 'supplier4sup.com', 'credit');

insert into suppliers(id, name, address,  postalCode, contactInfo, paymentTerms)
   values('5005', 'Baby Supplier', 'Baby Road Way',  '5050505', 'supplier5@sup.com', 'credit');


--SKUInfo--
Insert into SKUinfo(id, price)
  values ('111', 1.20);

Insert into SKUinfo(id, price)
  values ('222', 1.50);

Insert into SKUinfo(id, price)
  values ('333', 1.75);

Insert into SKUinfo(id, price)
  values ('444', 2.00);

Insert into SKUinfo(id, price)
  values ('555', 2.25);

Insert into SKUinfo(id, price)
  values ('666', 2.50);


---PostalInfo
insert into postalInfo(postalCode, city, state)
  values ('1010101', 'New York', 'New York');

insert into postalInfo(postalCode, city, state)
  values ('2020202', 'Detroit', 'Chicago');

insert into postalInfo(postalCode, city, state)
  values ('3030303', 'Buffalo', 'New York');

insert into postalInfo(postalCode, city, state)
  values ('4040404', 'Rochester', 'New York');

insert into postalInfo(postalCode, city, state)
  values ('5050505', 'Albany', 'New York');

insert into postalInfo(postalCode, city, state)
  values ('6060606', 'Kingston', 'New York');



select quantity
from clothesForSale
where SKUnumber = '111';

Select quantity
from orders
where SKUnumber = '111';







select *
from suppliers;

select *
from clothesForSale;

select *
from orders;

select *
from SKUinfo;

select*
from postalInfo;


select sum(a.quantity + b.quantity) 
from orders as a, clothesForSale as b 
where a.SKUnumber='111' 
and b.SKUnumber='111';