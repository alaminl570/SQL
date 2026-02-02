/*--- USE CASES - HANDLING NULLS
----  MATHEMATICAL OPERATIONS
--------
Example
1+5 =6
'A'+'B' =AB

------
NULL Example
NULL+5 =NULL
NULL+'B' =NULL

-------------***------------------*/


--- Find the average score of the customers

SELECT
	CustomerID,
	Score,
	AVG(COALESCE (Score,0)) OVER () AS [AVG Score] ---Handling NULL 
FROM Customers;

/*------------------***-----------***--------
Display the full name of customers in a single filed
by merging there first and last names,
and add 10 bonus points to each customer's score.
--------***-----------------***---------------------*/

SELECT
	FirstName+ ' ' +COALESCE(LastName,'') AS [Full Name], ---Handling NULL
	Score,
	COALESCE(Score,0)+10 AS [Bonus] ---Handling NULL
FROM Customers;

/*-------HANDLE THE NULL BEFORE SORTING DATA
-----SQL TASK
Sort the customers from lowest to highest scores,
with NULLS appearing last. -----------***---------------*/

SELECT
	CustomerID,
	Score
FROM Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score ASC;

/*--- NULLIF USE CASES
-------SQL TASK
Find the sales price for each order by 
dividing the sales by the quantity.  --------*/

SELECT
	OrderID,
	Quantity,
	Sales,
	Sales / NULLIF(Quantity,0) AS Price  --- Handling by NULLIF 0 Quantity
FROM Orders;


/*--- IS NULL USE CASES
FILTERING DATA
-------SQL TASK
Identify the customers who have no scores? 
---------------***---------------------------*/

SELECT
	*
FROM Customers
WHERE Score IS NULL;  --- Filtering NULL Score


/*--- IS NOT NULL USE CASES
FILTERING DATA
-------SQL TASK
List all customers who have scores? 
---------------***---------------------------*/

SELECT
* 
FROM Customers
WHERE Score IS NOT NULL;


/*--- IS NULL USE CASES ANTI JOINS
FILTERING DATA
-------SQL TASK
List all details for customers who have not placed any orders? 
---------------***---------------------------*/

SELECT
c.*,
o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

/*---HANDLE THE NULLS BEFOR JOINING TABLES------*/


/*-----------------***--------------***---------------------------

            NULL vs EMPTY vs SPACE
			------***-----***-----
NULL: Means nothing, unknown!
----
EMPTY STRING: String value has zero characters.
------------
BlANK SPACE: String value has one or more space characters.
-----------

------------------***---------------***--------------------------*/






