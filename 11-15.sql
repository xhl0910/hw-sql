-- 11. What is the average percentage markup of the MSRP on buyPrice?
select CONCAT(avg(MSRP/buyPrice-1)*100,'%') from products;

-- 12. How many distinct products does ClassicModels sell?
select count(distinct productCode) from products
where productLine = 'Classic Cars';

-- 13. Report the name and city of customers who don't have sales representatives?
select customerName, city from customers
WHERE salesRepEmployeeNumber is NULL;

-- 14. What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
 SELECT CONCAT(firstName,' ', lastName) Name, jobTitle    from employees
where jobTitle like '%VP%' OR jobTitle like '%Manager%';

-- 15. Which orders have a value greater than $5,000?
 SELECT * from orderdetails
where priceEach * quantityOrdered > 5000;


