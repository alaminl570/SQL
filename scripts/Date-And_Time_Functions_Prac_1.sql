/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------*/

SELECT
	creationTime AS [Creation Time],
	DAY(creationTime) AS Day, --- DataType INT
	MONTH(creationTime) AS Month,
	YEAR(creationTime) AS Year,
	--- DATEPART Examples
	DATEPART(hour, creationTime) AS Hour, --- DataType string
	DATEPART(quarter, creationTime) AS Quarter,
	DATEPART (week, creationTime) AS Week,
	--- DATENAME Examples
	DATENAME(month, creationTime) AS [Month Name], --- DataType string
	DATENAME(weekday, creationTime) AS [Week Day],
	--- DATETRUNC Examples
	DATETRUNC(minute, creationTime) AS [Reset Sec], --- DataType DATETIME
	DATETRUNC(day, creationTime) AS [All Time Reset],
	--- FORMAT Examples
	---FORMAT(creationTime, 'ddd') AS [Short DAY] -- NOT Working for DataType issues
	FORMAT(TRY_CAST(creationTime AS DATETIME2), 'ddd') AS [Short DAY],
	/*---Note: Using DATETIME2 is generally better than DATETIME 
	as it handles the full 7 decimal 
	places of precision shown in your data.*/
	FORMAT(TRY_CAST(creationTime AS DATETIME2), 'MMM') AS [Short Month],
	FORMAT(TRY_CAST(creationTime AS DATETIME2), 'MM-dd-yyyy') AS [USA Format],
	FORMAT(TRY_CAST(creationTime AS DATETIME2), 'dd-MM-yyyy') AS [EURO Format]

FROM orders

