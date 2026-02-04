/*-------------** WINDOW FUNCTIONS **---------------
Perform calculations (e.g. aggregation)
on a specific subset of data,
without losing the level of details of rows.

--- SQL TASK 
Find the total sales for each products,
additionally provide details such order id & order date?

--------------***----------------------***----------------*/

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM (Sales) OVER(PARTITION BY ProductID) [Total Sales]
FROM Orders;

/*-------***-------------------***----------------

---TASK 
Find the total sales across all orders
additionally provide details such order id & order date?

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	SUM (Sales) OVER () [Total Sales]
FROM Orders;

/*-------***-------------------***----------------

SQL TASK:
Find the total sales for each product,
additionally provide details such order id & order date?

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM (Sales) OVER (PARTITION BY ProductID) [Total Sales]
FROM Orders;

/*-------***-------------------***----------------

SQL TASK:
Find the total sales across all orders,
Find the total sales for each product,
additionally provide details such order id & order date?

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	SUM (Sales) OVER () [Total Sales],
	SUM (Sales) OVER (PARTITION BY ProductID) [Sales By Products]
FROM Orders;

/*-------***-------------------***----------------

SQL TASK:
Find the total sales across all orders,
Find the total sales for each product,
additionally provide details such order id & order date?

--- Find the total sales for each combination of product and order status

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM (Sales) OVER () [Total Sales],
	SUM (Sales) OVER (PARTITION BY ProductID) [Sales By Products],
	SUM (Sales) OVER (PARTITION BY ProductID, OrderStatus) [Sales By Products & Status]
FROM Orders;

/*-------***-------------------***----------------

SQL TASK:
Rank each order based on their sales from highest to lowest,
additionally provide details such order id, order date?

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK () OVER (ORDER BY Sales DESC) [Rank Sales]
FROM Orders;

/*-------***-------------------***----------------

--- WINDOW FRAME
-- Defines a subset of rows within each window
that is relevant for the calculation.

Rules: 1. The frame clause can only be used together with order by clause.
*---*  2. Lower value must be BEFORE the higher value.

SQL TASK: EXAMPLE

----------**------------------***--------------------------*/

SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM (Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) [Total Sales]
FROM Orders;

--- 2nd EXAMPLE

SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM (Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) [Total Sales]
FROM Orders;

--- 3rd EXAMPLE

SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM (Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS 2 PRECEDING) [Total Sales]
FROM Orders;

--- SQL uses Default Frame, if ORDER BY is used without FRAME

--OVER (PARTITION BY OrderStatus ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
