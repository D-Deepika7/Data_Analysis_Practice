
-- 2823
SELECT * FROM sales



-- Monthly Revenue and Order Volume by Year and Month
-- 29

SELECT
    YEAR(ORDERDATE) AS OrderYear,
    MONTH(ORDERDATE) AS OrderMonth,
    SUM(SALES) AS TotalRevenue,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrders
FROM
    sales
GROUP BY
    YEAR(ORDERDATE),
    MONTH(ORDERDATE)
ORDER BY
    OrderYear,
    OrderMonth;




-- Quarterly Revenue and Order Volume
-- 10

SELECT
    YEAR(ORDERDATE) AS OrderYear,
    DATEPART(QUARTER, ORDERDATE) AS OrderQuarter,
    SUM(SALES) AS TotalRevenue,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrders
FROM
    sales
GROUP BY
    YEAR(ORDERDATE),
    DATEPART(QUARTER, ORDERDATE)
ORDER BY
    OrderYear, OrderQuarter;




-- Year-over-Year Growth in Revenue
-- 3

SELECT
    YEAR(ORDERDATE) AS OrderYear,
    SUM(SALES) AS TotalRevenue
INTO #temp_yearly_sales
FROM sales
GROUP BY YEAR(ORDERDATE);



SELECT
    t1.OrderYear,
    t1.TotalRevenue,
    t1.TotalRevenue - t2.TotalRevenue AS RevenueChange,
    ROUND((t1.TotalRevenue - t2.TotalRevenue) * 100.0 / t2.TotalRevenue, 2) AS PercentGrowth
FROM
    #temp_yearly_sales t1
LEFT JOIN
    #temp_yearly_sales t2 ON t1.OrderYear = t2.OrderYear + 1
ORDER BY t1.OrderYear;



-- Sales Trend for a Specific Product or ProductLine
-- 29

SELECT
    PRODUCTLINE,
	YEAR(ORDERDATE) AS OrderYear,
    MONTH(ORDERDATE) AS OrderMonth,
    SUM(SALES) AS ProductRevenue
FROM
    sales
WHERE
    PRODUCTLINE = 'Motorcycles'  
GROUP BY
    PRODUCTLINE,
	YEAR(ORDERDATE),
    MONTH(ORDERDATE)
ORDER BY
    OrderYear, OrderMonth;



-- Filter for Specific Time Periods (e.g., Jan–Mar 2004)
-- 233


SELECT
    *
FROM
    sales
WHERE
    ORDERDATE BETWEEN '2004-01-01' AND '2004-03-31';


SELECT PRODUCTLINE, COUNT(DISTINCT ORDERNUMBER) ORDERS, SUM(SALES) REVENUE
FROM sales
GROUP BY PRODUCTLINE






-- Revenue Trend by Country or Territory (Time + Geo)
-- 49

SELECT
    YEAR(ORDERDATE) AS OrderYear,
    COUNTRY,
    SUM(SALES) AS TotalRevenue
FROM
    sales
GROUP BY
    YEAR(ORDERDATE),
    COUNTRY
ORDER BY
    OrderYear, TotalRevenue DESC;





-- Monthly Averages to Smooth Variability

SELECT
    YEAR(ORDERDATE) AS OrderYear,
    MONTH(ORDERDATE) AS OrderMonth,
    AVG(SALES) AS AvgSalePerOrder
FROM
    sales
GROUP BY
    YEAR(ORDERDATE),
    MONTH(ORDERDATE)
ORDER BY
    OrderYear, OrderMonth;


