-- 1- From Sales.Orders, display OrderID, CustomerID, OrderDate, and the next order date for each customer using LEAD. 
--	  Partition by CustomerID and order by OrderDate.

SELECT 
	OrderID,
	CustomerID,
	OrderDate,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder
FROM Sales.Orders;

-- 2- From Sales.Orders, display OrderID, CustomerID, OrderDate, and the previous order date for each customer using LAG. 
--	  Partition by CustomerID and order by OrderDate.

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)
FROM Sales.Orders;

-- 3- From Sales.Orders, display OrderID, CustomerID, OrderDate, and the number of days between the current order and 
--	  the next order for each customer. Use LEAD with DATEDIFF.

SELECT 
*,
DATEDIFF(DAY, CurrentOrder, LEAD(CurrentOrder) OVER (PARTITION BY CustomerID ORDER BY CurrentOrder)) DaysDiff
FROM (
	SELECT
		OrderID,
		CustomerID,
		OrderDate CurrentOrder
	FROM Sales.Orders
) AS DaysBetweenCurrentNext;

-- 4- From Sales.Orders, display OrderID, CustomerID, OrderDate, and the number of days between the current 
--	  order and the previous order for each customer. Use LAG with DATEDIFF.

SELECT 
*,
DATEDIFF(DAY, LAG(CurrentOrder) OVER (PARTITION BY CustomerID ORDER BY CurrentOrder), CurrentOrder) AS DayDiffPre
FROM (
	SELECT
		OrderID,
		CustomerID,
		OrderDate CurrentOrder
	FROM Sales.Orders
) AS DaysBetweenCurrentPrevious;

-- 5- From Sales.Orders, analyze month-over-month sales performance. Group by month of OrderDate. Display the month, 
--	  total sales for the current month, total sales for the previous month using LAG, and the difference between 
--	  current and previous month sales.

SELECT 
*,
SalesCurrentMonth - PreviousMonthSale AS DiffPreviousSales
FROM (
SELECT
	MONTH(OrderDate) AS CurrentMonth,
	SUM(Sales) AS SalesCurrentMonth,
	LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) AS PreviousMonthSale
FROM Sales.Orders
GROUP BY MONTH(OrderDate)
) AS MonthOMonthSales;

-- 6- From Sales.Orders, analyze month-over-month sales performance. Display the month, current month sales, 
--	  previous month sales, and the percentage change rounded to 1 decimal place.

SELECT
	*,
	ROUND(CAST((CurrentSales - PreviousSales) 
	AS FLOAT) / PreviousSales *  100, 1) PerceOfSale
FROM (
	SELECT
		MONTH(OrderDate) MonthOrder,
		SUM(Sales) CurrentSales,
		LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousSales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
) AS MonthOMonthPrevPerc;

-- 7- From Sales.Orders, display OrderID, ProductID, Sales, and the lowest sales for each product using FIRST_VALUE. 
--	  Order by Sales within each product.


SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) LowestSales
FROM Sales.Orders;

-- 8- From Sales.Orders, display OrderID, ProductID, Sales, and the highest sales for each product 
--	  using LAST_VALUE with the correct frame clause.

SELECT
	OrderID,
	ProductID,
	Sales,
	LAST_VALUE(Sales) OVER(
							PARTITION BY ProductID 
							ORDER BY Sales 
							ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
							) AS HighestProductSales
FROM Sales.Orders;

-- 9- From Sales.Orders, display OrderID, ProductID, Sales, the lowest sales for each product using FIRST_VALUE, 
--	  and the difference between the current sales and the lowest sales for each product.

SELECT 
*,
CurrentSales - LowestSales DiffBetweenSales
FROM (
SELECT
	OrderID,
	ProductID,
	Sales CurrentSales,
	FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) LowestSales
FROM Sales.Orders
) AS LowestProductSales;



-- 10- From Sales.Orders, display OrderID, ProductID, Sales, the lowest sales for each product, the highest sales 
--	   for each product, and the difference between the highest and lowest sales for each product.


SELECT 
*,
HighestSales - LowestSales DiffBetweenHighLow
FROM (
SELECT
	OrderID,
	ProductID,
	Sales CurrentSales,
	FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) LowestSales,
	LAST_VALUE(Sales) OVER (
								PARTITION BY ProductID 
								ORDER BY Sales 
								ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
								) AS HighestSales 
FROM Sales.Orders
) AS SalesByProduct;