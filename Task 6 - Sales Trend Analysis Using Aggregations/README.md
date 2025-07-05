
# 📊 Sales Trend Analysis Using Aggregations

## 🎯 Objective

Analyze sales data to uncover monthly revenue and order volume trends using SQL. This task aimed to enhance skills in grouping, aggregating, and filtering time-based data, and included deriving year-over-year (YoY) growth to observe sales performance across time periods.

---

## 🛠️ Tools Used

- SQL Server Management Studio (SSMS)

---

## 📥 Dataset

- [Sample Sales Dataset from Kaggle](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data)

---

## 🧮 Key Activities

- Imported the dataset into SSMS.
- Used SQL date functions to extract `YEAR` and `MONTH` from `ORDERDATE`.
- Aggregated:
  - Total monthly revenue using `SUM(SALES)`
  - Order volume using `COUNT(DISTINCT ORDERNUMBER)`
- Grouped and ordered results by year and month.
- Filtered specific time ranges for focused analysis.
- Conducted Year-over-Year (YoY) Revenue Growth analysis via a self-join query (without temp tables).

---

## 📝 Insights Extracted

- Identified monthly and yearly sales trends.
- Observed peak and low-performing periods.
- Compared sales performance across years.
- Derived YoY revenue growth to track business momentum.
- Found consistent months with high revenue or dips in performance.

---

## ✅ Outcome

- Gained hands-on experience in SQL-based time-series analysis.
- Learned to apply aggregation and filtering to derive key business metrics.
- Built capability in trend analysis, grouping techniques, and deriving growth metrics without temp tables.

---

## 📎 Author
*Deepika Dohare*  

