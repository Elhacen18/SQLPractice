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
