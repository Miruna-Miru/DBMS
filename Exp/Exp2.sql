--QUESTION[1]
--Write a query to display all the orders for the salesman who belongs to the city NewYork.

select * from saleman22c075 where city = 'NewYork';


--QUESTION[2]
--Write a query to display the commission of all the salesmen servicing customers in Paris.

select s_id,s_nam,commission from saleman22c075 where city='Paris';
/*select s.s_id,s.s_nam,s.commission from saleman22c075 as s 
join customer22c075 as c on s.s_id=c.s_id
where s.city='Paris'; 
*/


--QUESTION[3]
--Write a query to find only those customers whose grade are, higher than every customer to the city New York.
select * from customer22c075
where grade >(select max(grade) from customer22c075 where city='NewYork');
