
# 📊  Task 7 - Sales Data Analysis (SQLite Database using Python)

## 🧩 Objective  
Use SQL inside Python to extract basic sales insights from a SQLite database, summarize results, and visualize them using print statements and bar charts.

---

## 🛠️ Tools Used
- **Python** (with `sqlite3`, `pandas`, `matplotlib`)
- **SQLite** (built into Python)
- **Jupyter Notebook**

---

## 📁 Dataset  
Sample Sales Data: [Kaggle - Sample Sales Data](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data)

---

## 📌 Deliverables
- Jupyter Notebook that:
  - Connects to `sales_data.db`
  - Runs some SQL queries to fetch key sales metrics
  - Displays results using `print()` and a basic `matplotlib` bar chart

---

## ✅ Outcome
- Learned how to write and run SQL queries directly within Python.
- Got hands-on experience importing data from SQLite into pandas and working with it.
- Performed basic but useful summaries to understand the sales data better.
- Created simple bar charts to visualize the sales results using matplotlib.

---

## 📈 Sales Data Analysis Summary

### 1. Data Loading and Preparation
The dataset containing 2,823 sales records was loaded from a CSV file. It included details such as order numbers, product lines, quantities, prices, customer information, and geographical data.

### 2. Data Cleaning and Transformation
- Retained essential columns: `ORDERNUMBER`, `PRODUCTLINE`, `QUANTITYORDERED`, `PRICEEACH`, `SALES`, `ORDERDATE`, and `COUNTRY`
- Converted `ORDERDATE` to datetime format
- Renamed columns for clarity and consistency

### 3. Database Integration
- Saved the cleaned DataFrame into a local SQLite database `sales_data.db`
- Created a table called `sales` and inserted the data
- Enabled SQL-based analysis directly in Python

### 4. Exploratory Data Analysis (EDA)

#### 4.1 Total Sales Summary
- **Total Quantity Sold:** 99,067 units  
- **Total Revenue:** $10,032,628.85

#### 4.2 Revenue by Country
- **Top Country:** United States with ~$3.6 million in sales  
- Followed by: Spain, France, Australia

#### 4.3 Revenue by Product Line
- **Top Product Line:** *Classic Cars* with ~$3.9 million  
- Other top categories: *Vintage Cars*, *Trucks and Buses*, *Motorcycles*

#### 4.4 Monthly Sales Trends
- High seasonality observed with peak months in **November 2003** and **November 2004**
- Both months exceeded **$1 million** in revenue, indicating strong Q4 performance

---

## 📎 Author
*Deepika Dohare*  

