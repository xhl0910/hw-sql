
-- Single Entity

-- 1.Prepare a list of offices sorted by country, state, city.
Select * from offices
order by country, state, city;

-- 2.How many employees are there in the company?
select count(distinct employees.employeeNumber) from employees;

-- 3.What is the total of payments received?
select SUM(amount) from payments;

-- 4.List the product lines that contain 'Cars'.
select productline from products
where productLine like '%car%' ;

-- 5.Report total payments for October 28, 2004.
select sum(amount) from payments
where paymentDate='2004-10-28' ;

-- 6.Report those payments greater than $100,000.
select amount from payments
where amount > 100000;

-- 7.List the products in each product line.
select * from products
order by productLine;

-- 8.How many products in each product line?
select count(productCode), productLine from products
 group by productLine;

-- 9.What is the minimum payment received?
select min(amount) from payments;

-- 10. List all payments greater than twice the average payment.
select * from payments
where amount > 2*(select avg(amount) from payments);

