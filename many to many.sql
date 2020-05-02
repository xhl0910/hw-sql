


-- 1.List products sold by order date.


Select p.productName, o.orderNumber, o.orderDate 
from products p join orderdetails od on od.productCode = p.productCode 
join orders o 
on o.orderNumber = od.orderNumber
order by 3 desc, 2 asc;



-- 2.List the order dates in descending order for orders for the 1940 Ford Pickup Truck. 
Select o.orderDate, o.OrderNumber from orders o
join orderdetails od on o.orderNumber = od. orderNumber
join products p 
using(productCode)
where p.productName = '1940 Ford Pickup Truck'
order by 1 desc;



-- 3.List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?
Select c.customerName, o.orderNumber, sum(od.priceEach * od.quantityOrdered) from customers c
join orders o
using(customerNumber) 
join orderdetails od
using(orderNumber) 
group by 1,2
having sum(od.priceEach * od.quantityOrdered) >25000
order by 1;

-- 4.Are there any products that appear on all orders?



-- 5.List the names of products sold at less than 80% of the MSRP.
SELECT distinct p.productName
FROM products p 
right join orderdetails
Using(productCode)
where priceEach > 0.8 * MSRP


-- 6.Reports those products that have been sold with a markup of 100% or more (i.e.,  the priceEach is at least twice the buyPrice)
-- 7.List the products ordered on a Monday.
Select od.productCode, p.productName from orderdetails od
join products p
using(productCode)
join orders o
using(orderNumber)
where DAYNAME(o.orderDate) = 'Monday';


-- 8.What is the quantity on hand for products listed on 'On Hold' orders?
select sum(od.quantityOrdered) as 'On Hold Quantity', od.orderNumber from orderdetails od
join orders
using(orderNumber)
where `status`= 'On Hold'
group by 2

