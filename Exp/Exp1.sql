create table saleman22c075
(
  s_id int primary key,
  s_nam varchar(7) not null,
  city varchar(7) not null,
  commission int not null
  );

create table customer22c075
(
  c_id int primary key,
  c_nam varchar(7) not null,
  grade int ,
  city varchar(7) not null,
  s_id int foreign key references saleman22c075(s_id)
  );

create table orders22c075
(
  o_no int  not null,
  o_date date not null,
  p_amt int not null,
  s_id int foreign key references saleman22c075(s_id),
  c_id int foreign key references customer22c075(c_id)
  );

insert into saleman22c075 values(1111,'Elena','Paris',10000);

select * from saleman22c075;

insert into saleman22c075 values(1112,'Amber','Rome',11000);

insert into saleman22c075 values(1113,'Mira','Mdu',12000);

insert into customer22c075 values(111,'Shin',9,'Paris',1111);

select * from customer22c075;



--QUESTION [1] 
select c_id,c_nam, saleman22c075.s_id,s_nam,customer22c075.city
from customer22c075 , saleman22c075
where customer22c075.city=saleman22c075.city;


-- QUESTION [2]
select c_id,c_nam, saleman22c075.s_id,s_nam,customer22c075.city
from customer22c075 , saleman22c075
where customer22c075.city<>saleman22c075.city;


--QUESTION[3]
SELECT 
    c.c_nam AS Customer_Name,
    c.city AS Customer_City,
    s.s_nam AS Salesman_Name,
    s.city AS Salesman_City,
    s.commission AS Salesman_Commission
FROM 
    customer22c075 c
JOIN 
    saleman22c075 s ON c.s_id = s.s_id
WHERE 
    s.commission BETWEEN 0.12 AND 0.14;


--QUESTION [4]
select * from orders22c075 order by o_date ;

--QUESTION [5]
select * from customer22c075 order by c_id;

--QUESTION [6]
SELECT c_id, COUNT(*) AS o_no, MAX(p_amt) AS max_amt
FROM orders22c075
GROUP BY c_id
ORDER BY o_no DESC, max_amt DESC;

--QUESTION [7]
SELECT 
    o_date, SUM(p_amt) AS total_purchase_amount, SUM(p_amt * 0.15) AS total_commission
FROM 
    orders22c075
GROUP BY 
    o_date
ORDER BY 
    o_date DESC;



-- QUESTION [8]
select * from saleman22c075
where city='Rome' or city='Paris';


--QUESTION [9]

SELECT * FROM orders22c075
WHERE p_amt BETWEEN 500 AND 4000
AND p_amt NOT IN (948.50, 1983.43);


--QUESTION [10]
select * from saleman22c075 where s_nam like 'A%' or s_nam like 'L%';


--QUESTION [11]
select * from saleman22c075 where s_nam like 'N__l';


--QUESTION [12]
select * from customer22c075 where grade is not null;


--QUESTION [13]
select * from customer22c075 where city <> 'New York' and grade<100;


--QUESTION [14]
SELECT * FROM orders22c075
WHERE  p_amt < 1500 OR (o_date >='12-02-2024' AND c_id < 200);


--QUESTION [15]




--QUESTION [16]
select distinct s_id,o_no from orders22c075;
