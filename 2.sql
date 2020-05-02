-- One to many relationship
-- 1.Report the account representative for each customer.
 SELECT customerName, customerNumber, salesRepEmployeeNumber, lastName, firstName from customers
left join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

-- 2.Report total payments for Atelier graphique.
 SELECT sum(amount) from payments
left join customers
on payments.customerNumber = customers.customerNumber
where customerName = 'Atelier graphique';

-- 3.Report the total payments by date
Select sum(amount), paymentDate from payments
group by paymentDate
order by paymentDate;

-- 4.Report the products that have not been sold.
select * from products
where productCode not in 
-- (SELECT distinct o.productCode from orderdetails o join products p on o.productCode=p.productCode);
(SELECT distinct productCode from orderdetails);


-- 5.List the amount paid by each customer.
select p.customerNumber, c.customerName, sum(amount) from payments p 
left join customers c
on c.customerNumber = p.customerNumber
group by p.customerNumber;

-- 6.How many orders have been placed by Herkku Gifts?
select count(1) from orders o 
join customers c
on o.customerNumber = c.customerNumber
where c.customerName = 'Herkku Gifts'
-- having customerName='Herkku Gifts'


-- 7.Who are the employees in Boston?
select CONCAT(firstName,' ', lastName) name from employees e
join offices o 
on e.officeCode = o.officeCode
where city = 'Boston';

-- 8.Report those payments greater than $100,000. Sort the report so the customer who made the highest payment appears first.
select p.amount, p.customerNumber, c.customerName from payments p
join customers c 
on p.customerNumber = c.customerNumber
where amount > 100000
order by p.amount desc

-- 9.List the value of 'On Hold' orders.
select priceEach * quantityOrdered as Value from orderdetails o1
join orders o2
on o1.rderNumber = o2.orderNumber 
where status = 'On Hold';


-- 10.Report the number of orders 'On Hold' for each customer.
select count(*), customerNumber from orders 
where status = 'On Hold'
group by customerNumber; 

