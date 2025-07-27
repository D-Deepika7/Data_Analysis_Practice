# Financial KPI Analysis for a Startup

## 🎯 Objective
To analyze and visualize key financial performance metrics for startups, focusing on:
- **Revenue**
- **Burn Rate**
- **CAC (Customer Acquisition Cost)**
- **LTV (Customer Lifetime Value)**

This enables better financial planning, investor reporting, and insights into startup sustainability.

---

## 📊 Dataset
**Source:** [Kaggle - Indian Startup Funding](https://www.kaggle.com/datasets/sudalairajkumar/indian-startup-funding)\
**Format:** CSV with fields like:
- `Startup Name`, `Date`, `City`, `Investment Type`, `Amount in USD`, etc.

Derived monthly metrics include:
- Total investment
- Estimated revenue & expenses
- New customer acquisition and marketing spend (assumed based on startup count)

---

## 🛠️ Tools Used
- **Python (Pandas, Seaborn, Matplotlib)**: Data cleaning, transformation, KPI computation
- **Power BI**: KPI visualization, trend dashboards, and cohort analysis
- **Excel**: Early assumptions modeling and validation

---

## 🧹 Data Cleaning & Processing (Jupyter Notebook)
1. **Loaded and Cleaned Dataset**
   - Converted `Date` to datetime, extracted `Year`, `Month`
   - Cleaned inconsistent values, removed nulls
   - Renamed columns for clarity (e.g., `Amount_USD` → `Total_Investment`)
2. **Grouped Data by Month**
   - Aggregated total investment and unique startup counts per month

---

## 📈 KPI Calculations
Simulated KPIs based on industry-like assumptions:

| KPI | Formula/Assumption |
|-----|--------------------|
| **Revenue** | 60% of Total Investment |
| **Expenses** | 70% of Total Investment |
| **New Customers** | 100 × Unique Startups per Month |
| **Marketing Spend** | 10% of Expenses |
| **CAC** | Marketing Spend ÷ New Customers |
| **Revenue per Customer** | Revenue ÷ New Customers |
| **LTV** | Revenue per Customer × 9 months |
| **Burn Rate** | Expenses - Revenue |
| **Run Rate** | Monthly Expenses projected over 12 months |
| **LTV:CAC Ratio** | LTV ÷ CAC |

📁 Final dataset exported as: `kpis_by_month.csv`

---

## 📊 Power BI Dashboard

### 📄 Pages & Visuals:
1. **Overview Dashboard**
   - KPI Cards: Revenue, CAC, LTV, Burn Rate, Runway
   - Trend Charts (Line/Area): Monthly Investment, Revenue & Expenses

2. **Investment Trend Analysis**
   - Top investors by amount
   - Funding type breakdowns (Pie/Donut)

3. **CAC & LTV Insights**
   - Bar Chart: LTV vs CAC over time
   - LTV:CAC Ratio by month

4. **Cohort Analysis**
   - Customer growth over time grouped by cohort month
   - Heatmaps or stacked area plots



---

## 📚 Learnings
- Monthly grouping and derived metrics help simplify complex finance indicators
- Power BI's DAX and visual slicers are powerful for business-centric storytelling
- Python is efficient for data prep and can complement Excel/BI workflows

---

## ✅ Output Files
- 📊 **Power BI Dashboard**: Startup KPI trends & insights
- 🧮 **Excel Template**: Assumption models
- 📁 **Cleaned Dataset**: `cleaned_startup_funding.csv`, `kpis_by_month.csv`
- 📓 **Jupyter Notebook**: KPI logic, calculations, EDA
- 📄 **Report**: LTV:CAC analysis and trend summary

---

## 📎 Author
*Deepika Dohare*  

---

