USE Learning;

/*
1. Which shippers do we have?
We have a table called Shippers. Return all the fields
from all the shippers
*/

-- Answer

SELECT * FROM Shippers;


/*
2. Certain fields from Categories
In the Categories table, selecting all the fields using
this SQL:
Select * from Categories
…will return 4 columns. We only want to see two
columns, CategoryName and Description.
*/

-- Answer
SELECT CategoryName, Description FROM Categories;

/*
3. Sales Representatives
We’d like to see just the FirstName, LastName, and
HireDate of all the employees with the Title of Sales
Representative. Write a SQL statement that returns
only those employees.
*/

-- Answer

SELECT FirstName, LastName, HireDate FROM Employees WHERE Title='Sales Representative';

/*
4. Sales Representatives in the United
States
Now we’d like to see the same columns as above, but
only for those employees that both have the title of
Sales Representative, and also are in the United
States.
*/
-- SELECT * FROM Employees;
SELECT FirstName, LastName, HireDate FROM Employees WHERE Title='Sales Representative' AND Country='USA';

/*
5. Orders placed by specific EmployeeID
Show all the orders placed by a specific employee.
The EmployeeID for this Employee (Steven
Buchanan) is 5.
*/
-- Note: Find Employee who has EmployeeID of 5.
SELECT * FROM Employees WHERE EmployeeID=5;
-- Note: Count the number of orders that have Employee EmployeeID of 5.
SELECT OrderID, OrderDate FROM Orders WHERE EmployeeID=5;


/*
6. Suppliers and ContactTitles
In the Suppliers table, show the SupplierID,
ContactName, and ContactTitle for those Suppliers
whose ContactTitle is not Marketing Manager.
*/

SELECT SupplierId, ContactName, ContactTitle FROM Suppliers WHERE  NOT ContactTitle = 'Marketing Manager';

/*
7. Products with “queso” in ProductName
In the products table, we’d like to see the ProductID
and ProductName for those products where the
ProductName includes the string “queso”. 
*/

note:https://learn.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver17#:~:text=WHERE%20title%20LIKE%20%27-,%25computer%25%27,-finds%20all%20book

SELECT ProductID, ProductName
  FROM Products WHERE ProductName LIKE '%queso%';

/*
8. Orders shipping to France or Belgium
Looking at the Orders table, there’s a field called
ShipCountry. Write a query that shows the OrderID,
CustomerID, and ShipCountry for the orders where
the ShipCountry is either France or Belgium.
*/ 
-- SELECT *FROM Orders WHERE ShipCountry = 'Belgium';
-- Try different countries such USA, Germany, Canada, ect. 
SELECT OrderID,CustomerID, ShipCountry  FROM Orders
WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium';
-- Note also use IN instead of OR. 
-- WHERE ShipCountry IN ('France','Belgium');
/*
9. Orders shipping to any country in Latin
America
Now, instead of just wanting to return all the orders
from France of Belgium, we want to show all the
orders from any Latin American country. But we
don’t have a list of Latin American countries in a
table in the Northwind database. So, we’re going to
just use this list of Latin American countries that
happen to be in the Orders table:
Brazil
Mexico
Argentina
Venezuela
It doesn’t make sense to use multiple Or statements
anymore, it would get too convoluted. Use the In
statement.
*/

SELECT OrderID,CustomerID, ShipCountry  FROM Orders
WHERE ShipCountry IN ( 'Brazil','Mexico','Argentina', 'Venezuela');

/*
10. Employees, in order of age
For all the employees in the Employees table, show
the FirstName, LastName, Title, and BirthDate.
Order the results by BirthDate, so we have the oldest
employees first.
*/

SELECT FirstName, LastName, Title,BirthDate FROM Employees ORDER BY BirthDate;

/*
11. Showing only the Date with a
DateTime field
In the output of the query above, showing the
Employees in order of BirthDate, we see the time of
the BirthDate field, which we don’t want. Show only
the date portion of the BirthDate field.
*/
--note https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver17#:~:text=I.%20Convert%20date%20and%20time%20data%20types

SELECT FirstName, LastName, Title,CAST(BirthDate AS Date ) AS BirthDate FROM Employees ORDER BY BirthDate ASC;
-- or
SELECT FirstName, LastName, Title,BirthDate = convert(date,BirthDate) FROM Employees ORDER BY BirthDate ASC;

/*
12. Employees full name
Show the FirstName and LastName columns from
the Employees table, and then create a new column
called FullName, showing FirstName and LastName
joined together in one column, with a space inbetween.
*/

-- https://learn.microsoft.com/en-us/sql/t-sql/functions/concat-transact-sql?view=sql-server-ver17#:~:text=To%20add%20a%20separating%20value%20during%20concatenation%2C%20use%20CONCAT_WS.


-- SELECT FirstName + ' ' + LastName as FullName FROM Employees;
-- SELECT FirstName + LastName as FullName FROM Employees;

SELECT CONCAT_WS(' ', FirstName , LastName) as FullName FROM Employees;
-- OR 
SELECT [Full name] = concat(FirstName, ' ', LastName) FROM  Employees;
/*
13. OrderDetails amount per line item
In the OrderDetails table, we have the fields
UnitPrice and Quantity. Create a new field,
TotalPrice, that multiplies these two together. We’ll
ignore the Discount field for now.
In addition, show the OrderID, ProductID, UnitPrice,
and Quantity. Order by OrderID and ProductID.

*/

SELECT ProductID, UnitPrice, Quantity, UnitPrice* Quantity  as TotalPrice
FROM [Order Details] ORDER BY OrderID,ProductID  ;

/*
14. How many customers?
How many customers do we have in the Customers
table? Show one value only, and don’t rely on getting
the recordcount at the end of a resultset
*/

SELECT COUNT(*) FROM Customers;


/*
15. When was the first order?
Show the date of the first order ever made in the
Orders table.*/


SELECT TOP(1) OrderDate AS [First Order] FROM orders ;
SELECT FirstOrder = MIN(OrderDate) FROM orders;

/*16. Countries where there are customers
Show a list of countries where the Northwind
company has customers.*/

SELECT Country FROM customers GROUP BY Country;

/*
17. Contact titles for customers
Show a list of all the different values in the
Customers table for ContactTitles. Also include a
count for each ContactTitle.
This is similar in concept to the previous question
“Countries where there are customers”, except we
now want a count for each ContactTitle.

*/


SELECT ContactTitle, COUNT(*) AS TotalContactTitle FROM customers GROUP BY ContactTitle ORDER BY TotalContactTitle DESC; 

SELECT * FROM customers;

/*
18. Products with associated supplier
names
We’d like to show, for each product, the associated
Supplier. Show the ProductID, ProductName, and the
CompanyName of the Supplier. Sort by ProductID.
This question will introduce what may be a new
concept, the Join clause in SQL. The Join clause is
used to join two or more relational database tables
together in a logical way.
Here’s a data model of the relationship between
Products and Suppliers.
*/

SELECT * FROM Products;
SELECT * FROM Suppliers;

SELECT P.ProductID, P.ProductName, S.CompanyName 
FROM Products AS P JOIN Suppliers AS S ON P.SupplierID = S.SupplierID ORDER BY P.ProductID;

