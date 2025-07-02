
# 📊 Ecommerce SQL Data Analysis Project

## 🔍 Objective
This project demonstrates practical SQL skills by extracting, analyzing, and visualizing data from an eCommerce dataset using Microsoft SQL Server Management Studio (SSMS). The goal is to explore, clean, and analyze transactional sales data to derive actionable business insights.

---

## 📁 Dataset
**Source**: [Kaggle - Ecommerce Data](https://www.kaggle.com/datasets/thedevastator/ecommerce-data)  
**Table Used**: `Sales`  
**Total Records**: 128,975  
**Columns**: Order details, shipping info, categories, fulfillment, financials, etc.

---

## 🛠️ Tools & Technologies
- **SQL Server Management Studio (SSMS)**
- **Microsoft Excel** (for initial exploration and exporting results)

---

## 🧮 Techniques Used

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- **Aggregate functions**: `SUM`, `AVG`, `COUNT`, `MAX`
- **Window functions**: `ROW_NUMBER`, `PERCENTILE_CONT`
- **Subqueries**
- **Joins** and `STRING_SPLIT`
- **Views** for modular analysis
- **Indexes** for performance optimization

---

## 📂 Project Structure

- `Ecommerce_SQL_Analysis.sql` – Contains all SQL queries  
- `Output_Tables.xlsx` – Results exported for visualization  
- `Screenshots/` – Screenshots of outputs in SSMS  
- `README.md` – Project overview (this file)

---

## 🧾 Key SQL Tasks & Analysis Performed

### 1. 🧹 Data Exploration & Cleaning
- Checked for `NULL` values and verified column data types
- Identified and filtered out:
  - Cancelled orders (`Status LIKE '%Cancelled%'`)
  - Zero or negative `Amount` entries
- Detected duplicate `Order_ID`s using `GROUP BY` and `HAVING`

---

### 2. 🧮 Basic Aggregations
- Calculated:
  - **Total Sales**
  - **Total Quantity Sold**
  - **Average Order Value**
- Aggregated sales by:
  - **State**, **City**, and **Category**
- Analyzed **daily** and **monthly** order trends

---

### 3. 🔍 Advanced Filtering & Subqueries
- Identified **high-value orders** (Top 20% using `PERCENTILE_CONT`)
- Found **top-selling SKUs** and **most popular categories**
- Compared each order’s amount against the **average transaction value**
- Segmented and analyzed **B2B vs B2C** transactions

---

### 4. 🧱 Indexing (for Optimization)

- `idx_Sales_Date`: Speeds up queries filtering or grouping by order date  
- `idx_Sales_Category`: Optimizes category-based aggregations and filters  
- `idx_Sales_ShipCityState`: Enhances performance on city/state-level sales queries  
- `idx_Sales_Status`: Improves filtering on courier status or shipped/cancelled orders  
- `idx_Sales_Fulfilment`: Boosts efficiency in fulfillment-related queries  

---

### 5. 📈 Views for Reusable Analysis

- `vw_TotalSalesByDate`: Summarizes daily total sales and order counts  
- `vw_SalesByCategory`: Shows sales and order volume by product category  
- `vw_CourierStatus`: Provides order distribution by courier delivery status  
- `vw_TopCitiesBySales`: Ranks cities and states based on total sales and order count  

---
## 📌 Learning Outcomes

✔ Gained hands-on experience with real-world ecommerce sales data  
✔ Practiced writing complex SQL queries including joins, subqueries, and views  
✔ Learned to optimize SQL performance using indexes  
✔ Prepared clean, structured data suitable for dashboarding and business reporting  

---

## 📎 Author
*Deepika Dohare*  

