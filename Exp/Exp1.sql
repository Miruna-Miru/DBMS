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
