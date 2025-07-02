
-- IMPORT THE DATA FILE IN THE DATABASE


---------------               Initial Data Exploration                   ---------------------->

-- View sample records

SELECT TOP 10 * FROM sales;

-- 128975
SELECT *
FROM sales
ORDER BY [index];


-- Count total records

SELECT COUNT(*) AS total_records FROM sales;


-- Check column data types and nulls

SELECT 
    COLUMN_NAME, 
    DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'sales';


-- Null counts per column

SELECT 
    COUNT(*) AS total_rows,
    COUNT(CASE WHEN [Order_ID] IS NULL THEN 1 END) AS null_Order_ID,
    COUNT(CASE WHEN [Date] IS NULL THEN 1 END) AS null_Date,
    COUNT(CASE WHEN [Status] IS NULL THEN 1 END) AS null_Status,
    COUNT(CASE WHEN [Fulfilment] IS NULL THEN 1 END) AS null_Fulfilment,
    COUNT(CASE WHEN [Sales_Channel] IS NULL THEN 1 END) AS null_Sales_Channel,
    COUNT(CASE WHEN [ship_service_level] IS NULL THEN 1 END) AS null_ship_service_level,
    COUNT(CASE WHEN [Style] IS NULL THEN 1 END) AS null_Style,
    COUNT(CASE WHEN [SKU] IS NULL THEN 1 END) AS null_SKU,
    COUNT(CASE WHEN [Category] IS NULL THEN 1 END) AS null_Category,
    COUNT(CASE WHEN [Size] IS NULL THEN 1 END) AS null_Size,
    COUNT(CASE WHEN [ASIN] IS NULL THEN 1 END) AS null_ASIN,
    COUNT(CASE WHEN [Courier_Status] IS NULL THEN 1 END) AS null_Courier_Status,
    COUNT(CASE WHEN [Qty] IS NULL THEN 1 END) AS null_Qty,
    COUNT(CASE WHEN [currency] IS NULL THEN 1 END) AS null_currency,
    COUNT(CASE WHEN [Amount] IS NULL THEN 1 END) AS null_Amount,
    COUNT(CASE WHEN [ship_city] IS NULL THEN 1 END) AS null_ship_city,
    COUNT(CASE WHEN [ship_state] IS NULL THEN 1 END) AS null_ship_state,
    COUNT(CASE WHEN [ship_postal_code] IS NULL THEN 1 END) AS null_ship_postal_code,
    COUNT(CASE WHEN [ship_country] IS NULL THEN 1 END) AS null_ship_country,
    COUNT(CASE WHEN [promotion_ids] IS NULL THEN 1 END) AS null_promotion_ids,
    COUNT(CASE WHEN [B2B] IS NULL THEN 1 END) AS null_B2B,
    COUNT(CASE WHEN [fulfilled_by] IS NULL THEN 1 END) AS null_fulfilled_by,
    COUNT(CASE WHEN [Unnamed_22] IS NULL THEN 1 END) AS null_Unnamed_22
FROM sales;


---------------               Creating INDEXES                   ---------------------->


CREATE INDEX idx_Sales_Date ON Sales([Date]);

CREATE INDEX idx_Sales_Category ON Sales(Category);

CREATE INDEX idx_Sales_ShipCityState ON Sales(ship_city, ship_state);

CREATE INDEX idx_Sales_Status ON Sales(Courier_Status);

CREATE INDEX idx_Sales_Fulfilment ON Sales(Fulfilment);





---------------               Basic Aggregation & Filtering                   ---------------------->
---------------               Subqueries and EDA			                  ---------------------->


-- Total sales amount, total quantity sold and average order value

SELECT 
    ROUND(SUM(Amount),2) AS total_sales,				-- 71,050,985
	SUM(Qty) AS total_quantity,							-- 110,044
    ROUND(AVG(Amount),2) AS avg_order_value				-- 649
FROM sales
WHERE Status LIKE 'Shipped%';


-- Orders by status

SELECT 
    Status, 
    COUNT(*) AS order_count 
FROM sales
GROUP BY Status
ORDER BY order_count DESC;


-- Sales by City

SELECT ship_city, SUM(Amount) AS city_sales
FROM sales
WHERE Status LIKE 'Shipped%'
GROUP BY ship_city
ORDER BY city_sales DESC;


-- Sales by State with Percentage Contribution

SELECT 
    ship_state,
    ROUND(SUM(Amount), 2) AS total_sales,
    ROUND(100.0 * SUM(Amount) / (SELECT SUM(Amount) FROM sales WHERE Status LIKE 'Shipped%'), 2) AS percentage_contribution
FROM 
    sales
WHERE 
    Status LIKE 'Shipped%'
GROUP BY 
    ship_state
ORDER BY 
    total_sales DESC;


-- Top-Selling Categories

SELECT Category, SUM(Qty) AS total_qty
FROM sales
WHERE Status LIKE 'Shipped%'
GROUP BY Category
ORDER BY total_qty DESC;


-- Orders per Day

SELECT CAST([Date] AS DATE) AS order_date, COUNT(*) AS total_orders
FROM sales
GROUP BY CAST([Date] AS DATE)
ORDER BY order_date;


-- Orders per Month

SELECT 
    FORMAT(CAST([Date] AS DATE), 'yyyy-MM') AS order_month,
    COUNT(Order_ID) AS total_orders
FROM sales
GROUP BY FORMAT(CAST([Date] AS DATE), 'yyyy-MM')
ORDER BY order_month;


-- Filter: High-Value Orders

-- Calculate 80th percentile
SELECT 
	PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY Amount) OVER () AS p80_value		-- 837.80
FROM sales
WHERE Status LIKE 'Shipped%'

-- 21,896
SELECT *
FROM sales
WHERE Amount > 837.8 AND Status LIKE 'Shipped%'
ORDER BY Amount DESC;


-- Top 10 High-Value Orders per Category


WITH RankedOrders AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Amount DESC) AS rn
    FROM sales
    WHERE Amount > 837.8 AND Status LIKE 'Shipped%'
)
SELECT *
FROM RankedOrders
WHERE rn <= 10
ORDER BY Category, Amount DESC;


---------------               Subqueries                   ---------------------->


-- Find the top-selling SKU (by revenue)
-- 1

SELECT SKU, Amount
FROM sales
WHERE Amount = (
    SELECT MAX(Amount) FROM sales
    WHERE Status NOT LIKE '%Cancelled%'
);


-- Orders with an Amount greater than the average amount
-- 53763

SELECT *
FROM sales
WHERE Amount > (
    SELECT AVG(Amount)
    FROM sales
    WHERE Status NOT LIKE 'Cancelled%'
);


--Show each order and its difference from the average amount

SELECT 
    Order_ID,
    Amount,
    (Amount - (SELECT AVG(Amount) FROM sales WHERE Status NOT LIKE 'Cancelled%')) AS diff_from_avg
FROM sales;



-- Duplicate Order_IDs
-- 6846

SELECT Order_ID, COUNT(*) 
FROM sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;


-- Orders with duplicate Order_IDs
--15443

SELECT *
FROM sales
WHERE Order_ID IN (
    SELECT Order_ID
    FROM sales
    GROUP BY Order_ID
    HAVING COUNT(*) > 1
);

-- Orders with zero amount 
-- 2343

SELECT * FROM sales
WHERE Amount <= 0;


-- Orders count by promotion_id
--5788

SELECT 
    [promotion_ids],
    COUNT([Order_ID]) AS Order_Count
FROM 
    sales
GROUP BY 
    [promotion_ids]
ORDER BY 
    Order_Count DESC;


-- Courier Status Summary

SELECT 
    Courier_Status, 
    COUNT(*) AS Count
FROM Sales
GROUP BY Courier_Status;


-- Order Fulfillment Status Breakdown

SELECT 
    Fulfilment, 
    COUNT(*) AS Order_Count
FROM Sales
GROUP BY Fulfilment;


-- Sales by Category

SELECT 
    Category, 
    COUNT(*) AS Total_Orders, 
    SUM(CAST(Amount AS FLOAT)) AS Total_Sales
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Sales by City
-- 6909

SELECT 
    ship_city, 
    ship_state,
    COUNT(*) AS Total_Orders, 
    SUM(CAST(Amount AS FLOAT)) AS Total_Sales
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY ship_city, ship_state
ORDER BY Total_Sales DESC;


-- B2B vs B2C Orders

SELECT 
    B2B, 
    COUNT(*) AS Order_Count, 
    SUM(CAST(Amount AS FLOAT)) AS Total_Amount
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY B2B;


-- Cancelled Orders Summary
-- 40

SELECT 
    ship_state, 
    COUNT(*) AS Cancelled_Count
FROM Sales
WHERE Status LIKE '%Cancelled%'
GROUP BY ship_state
ORDER BY Cancelled_Count DESC;


-- Top-Selling SKUs
-- 7124

SELECT 
    SKU, 
    COUNT(*) AS Units_Sold, 
    SUM(CAST(Amount AS FLOAT)) AS Total_Revenue
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY SKU
ORDER BY Units_Sold DESC;


-- Sales by Size
-- 11

SELECT 
    Size, 
    COUNT(*) AS Units_Sold, 
    SUM(CAST(Amount AS FLOAT)) AS Total_Revenue
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY Size
ORDER BY Units_Sold DESC;



-- Orders and Sales per Promotion ID (with splitting)
-- 284

SELECT 
    TRIM(value) AS Promotion_IDS,
    COUNT(DISTINCT S.Order_ID) AS Order_Count,
    SUM(CAST(S.Amount AS FLOAT)) AS Total_Sales
FROM Sales S
CROSS APPLY STRING_SPLIT(S.promotion_ids, ',')
WHERE S.Status NOT LIKE '%Cancelled%' 
GROUP BY TRIM(value)
ORDER BY Total_Sales DESC;



------------------------				Views for analysis     ------------------>

CREATE VIEW vw_TotalSalesByDate AS
SELECT 
    [Date],
    SUM(CAST(Amount AS FLOAT)) AS Total_Sales,
    COUNT(*) AS Order_Count
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY [Date];



SELECT * FROM vw_TotalSalesByDate;



CREATE VIEW vw_SalesByCategory AS
SELECT 
    Category,
    COUNT(*) AS Total_Orders,
    SUM(CAST(Amount AS FLOAT)) AS Total_Sales
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY Category;



SELECT * FROM vw_SalesByCategory;




CREATE VIEW vw_CourierStatus AS
SELECT 
    Courier_Status,
    COUNT(*) AS Order_Count
FROM Sales
GROUP BY Courier_Status;



SELECT * FROM vw_CourierStatus;



CREATE VIEW vw_TopCitiesBySales AS
SELECT 
    ship_city,
    ship_state,
    COUNT(*) AS Total_Orders,
    SUM(CAST(Amount AS FLOAT)) AS Total_Sales
FROM Sales
WHERE Status NOT LIKE '%Cancelled%'
GROUP BY ship_city, ship_state;



SELECT * FROM vw_TopCitiesBySales;

