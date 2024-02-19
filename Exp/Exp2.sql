--QUESTION[1]
--Write a query to display all the orders for the salesman who belongs to the city NewYork.

select * from orders22c075 o where o.s_id in (select s_id from saleman22c075 where city = 'NewYork');


--QUESTION[2]
--Write a query to display the commission of all the salesmen servicing customers in Paris.

select s.s_id,s.s_nam,s.commission from saleman22c075 as s 
join customer22c075 as c on s.s_id=c.s_id
where s.city='Paris'; 


--QUESTION[3]
--Write a query to find only those customers whose grade are, higher than every customer to the city New York.
select * from customer22c075
where grade >(select max(grade) from customer22c075 where city='NewYork');


--QUESTION[4]
--Write a query to find all grade for those customers who belongs to the city Rome.
SELECT grade FROM Customer WHERE city = 'Rome';


--QUESTION[5]
--Write a query to make a report of which salesman produce the largest and smallest orders on each date and arranged the ordes number in smallest to largest number.


--QUESTION[6]
--Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%.
select distinct c.c_id, c.c_nam
from  customer22c075 c JOIN orders22c075 o ON c.c_id = o.c_id
JOIN saleman22c075 s ON o.s_id = s.s_id
WHERE s.commission > 0.12;


--QUESTION[7]
--Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own.
select  c.c_id, c.c_nam from  customer22c075 c
left join saleman22c075 s on c.c_id = s.s_id
order by c.c_nam ;

--QUESTION[8]
--Write a SQL statement to find the highest purchase amount in a date &#39;2012-08-17&#39; for each salesman with their ID.
select s_id, MAX(p_amt) as h_amt from orders22c075
where o_date = '2012-08-17'
group by s_id;


--QUESTION[9]
--Write a SQL statement to find the total purchase amount of all orders.
select sum(p_amt) as total_amt from orders22c075;


--QUESTION[10]
--Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher
--purchase amount in a day is within the range 2000 and 6000.
select c_id,o_date, max(p_amt) AS h_amt
from orders22c075 where p_amt between 2000 AND  6000
group by c_id, o_date;


--QUESTION[11]
--Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.
select  c.c_id, c.c_nam from customer22c075 c
left join saleman22c075 s on c.c_id = s.s_id
where  c.grade < 300 OR s.s_id is not null
order by c.c_nam asc;


--QUESTION[12]
--Write a query to find all orders with amount smaller than any amount for a customer in London.
