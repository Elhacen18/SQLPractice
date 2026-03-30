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

SELECT SupplierId, ContactName, ContactTitle FROM Suppliers WHERE  NOT ContactTitle = 'Marketing Manger';

