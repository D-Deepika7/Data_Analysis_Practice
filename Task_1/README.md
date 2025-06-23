
# 🧼 Mall Customer Segmentation – Data Cleaning Project

## 📌 Objective
The goal of this task was to clean and prepare a raw dataset by handling missing values, removing duplicates, standardizing formats, and ensuring consistent data types using **Python (Pandas)**.

---

## 🧰 Tools Used
- Python 3.x
- Pandas
- Jupyter Notebook
- Excel (for cross verification)

---

## 📁 Dataset
**Name**: Mall Customer Segmentation Data  
**Source**: [Kaggle](https://www.kaggle.com/vjchoudhary7/customer-segmentation-tutorial-in-python)

### Columns in Dataset:
- `CustomerID`: Unique customer identifier
- `Gender`: Male/Female
- `Age`: Customer's age
- `Annual Income (k$)`: Income in thousands of dollars
- `Spending Score (1-100)`: Mall-assigned spending score

---

## 🔧 Cleaning Steps

1. **Loaded dataset** using Pandas.
2. **Checked for null values** and handled them (none found in this case).
3. **Removed duplicate rows** (no duplicates found in this case).
4. **Standardized text values**:
   - Converted `Gender` to lowercase and stripped whitespace.
5. **Cleaned column headers**:
   - Renamed to lowercase and replaced spaces with underscores.
6. **Converted data types**:
   - Ensured `annual_income` and `spending_score` are float.
7. **Saved the cleaned dataset** as `mall_customers_cleaned.csv`.

---

## ✅ Summary of Changes
| Action                     | Description                                |
|----------------------------|--------------------------------------------|
| Null handling              | No missing values found                    |
| Duplicates handling        | No duplicates found                        |
| Text cleaned               | Gender values standardized (e.g., `male`)  |
| Columns renamed            | snake_case formatting                      |
| Data types enforced        | Income & Score: float                      |
| Output file                | `mall_customers_cleaned.csv`               |

---

## 📎 Author
*Deepika Dohare*  

