-- Tutorial: Getting used to SQL is a very important step in landing a job or an internship in tech! 
-- Lets practise using adventureworks

-- Be sure to keep praticising!
-- Here are some questions to practise your skill using the Adventureworks db.

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q1: From the following table humanresources.employee write a query in SQL to retrieve all the rows and columns from the employee table in the Adventureworks database. 
-- Sort the result set in ascending order on jobtitle.
-- humanresources.employee table

--Answer
SELECT *
FROM humanresources.employee
ORDER BY jobtitle ASC;
-------------------------------------------------------------------------------------------------------------------------------------------

-- Q2: From the following table person.person write a query in SQL to return all rows and a subset of the columns (firstName, lastName, businessentityid) from the person table in the AdventureWorks database. 
-- The third column heading is renamed to employee_id. Arranged the output in ascending order by lastname.

--Answer
SELECT 
	firstName,
	lastName,
	businessentityid AS employee_id
FROM person.person
ORDER BY lastName ASC;
-------------------------------------------------------------------------------------------------------------------------------------------

-- Q3: From the following table write a query in SQL to return only the rows for product that have a sellstartdate that is not NULL and a productline of 'T'. 
-- Return productid, productnumber, and name. Change the name to productname. Arranged the output in ascending order on name.

-- production.product

--Answer
SELECT 
	productid,
	productnumber,
	name AS productname
FROM production.product
WHERE sellstartdate IS NOT NULL
AND productline = 'T'
ORDER BY name ASC;
-------------------------------------------------------------------------------------------------------------------------------------------

-- Q4:From the following table write a query in SQL to calculate the total freight paid by each customer. Return customerid and total freight. 
-- Sort the output in ascending order on customerid

-- sales.salesorderheader

--Answer
SELECT 
	customerid,
	SUM(freight) AS total_freight
FROM sales.salesorderheader
GROUP BY customerid 
ORDER BY customerid ASC;
-------------------------------------------------------------------------------------------------------------------------------------------

-- Q5:From the following table write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. 
-- Sort the result in ascending order on city.

-- person.businessentityaddress

--Answer
SELECT
	city,
	COUNT(businessentityid) AS number_of_employees
FROM person.businessentityaddress AS businessentityaddress
INNER JOIN person.address AS address
		ON businessentityaddress.addressid = address.addressid
GROUP BY city
ORDER BY city ASC;




-------------------------------------------------------------------------------------------------------------------------------------------

-- Q6: From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. 
-- Return BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.

-- person.businessentitycontact, person.contacttype, person.person

--Answer
SELECT 
	businessentitycontact.businessentityid,
	person.lastname,
	person.firstname,
	contacttype.name
FROM person.businessentitycontact AS businessentitycontact
LEFT JOIN person.contacttype AS contacttype
		ON businessentitycontact.contacttypeid = contacttype.contacttypeid
LEFT JOIN person.person AS person
		ON businessentitycontact.businessentityid = person.businessentityid
WHERE contacttype.name = 'Purchasing Manager'

ORDER BY lastname ASC, firstname ASC;

SELECT *
FROM person.person
(IT DOES NOT WORK)

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q7: From the following table sales.salesorderdetail  write a query in  SQL to retrieve the total cost of each salesorderID that exceeds 100000. 
-- Return SalesOrderID, total cost. Round to 2 decimal place and add the dollar sign at the front.

--Answer
SELECT salesorderid
FROM sales.salesorderdetail


SELECT
	salesorderid,
	ROUND(SUM(unitprice * orderqty), 2) AS total_cost
FROM sales.salesorderdetail
GROUP BY salesorderid
HAVING SUM(unitprice * orderqty) > 100000
ORDER BY SUM(unitprice * orderqty);

(HOW ADD $$$$)

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q8:From the following person.person table write a query in  SQL to retrieve those persons whose last name begins with letter 'R' and firstname end with 'n'. 
-- Return lastname, and firstname and display the result in ascending order on firstname and descending order on lastname columns.

--Answer
SELECT 
	lastname,
	firstname
FROM person.person
WHERE lastname LIKE 'R%'
AND firstname LIKE '%n'
ORDER BY firstname ASC, lastname DESC;
-------------------------------------------------------------------------------------------------------------------------------------------

-- Q9: From the following humanresources.department table write a query in  SQL to skip the first 5 rows and return the next 5 rows from the sorted result set.

--Answer
SELECT *
FROM humanresources.department
OFFSET 5 
LIMIT 5;

-------------------------------------------------------------------------------------------------------------------------------------------

-- Q10:From the following tables write a query in  SQL to find the persons whose last name starts with letter 'L'. 
-- Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.

-- person.person, person.personphone

--Answer
SELECT
	person.businessentityid,
	firstname,
	lastname,
	phonenumber
FROM person.person AS person
INNER JOIN person.personphone AS personphone
		ON person.businessentityid = personphone.businessentityid
WHERE lastname LIKE 'L%'
ORDER BY lastname, firstname;



-------------------------------------------------------------------------------------------------------------------------------------------