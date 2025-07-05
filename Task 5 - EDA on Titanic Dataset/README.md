

# Exploratory Data Analysis (EDA) – Titanic Dataset

## 🎯 Objective

- Extract insights using visual and statistical exploration  
- Gain skills in identifying patterns, trends, and anomalies  
- Understand survival patterns among Titanic passengers  
- Explore relationships between variables such as class, fare, age, and family size  
- Develop intuition for data through univariate, bivariate, and multivariate analysis  

---

## 🛠️ Tools & Libraries Used

- **Python**  
- **Jupyter Notebook**  
- **Pandas** – for data manipulation  
- **Matplotlib & Seaborn** – for visualization  

---

## 📊 Steps Performed

### 1. **Data Loading & Cleaning**
- Loaded the Titanic dataset
- Handled missing values
- Separated categorical and continuous columns

### 2. **Univariate Analysis**
- Summary statistics using `.describe()`, `.value_counts()`, `.info()`
- Visuals:
  - **Histograms** for continuous variables
  - **Bar plots** for categorical variables  
- 📝 **Observations**:
  - Most passengers were in 3rd class
  - Majority were male
  - Most passengers embarked from port **S**

### 3. **Bivariate Analysis**
- Explored how individual variables relate to `Survived`
- Visuals:
  - Countplots for `Survived` vs `Sex`, `Pclass`, `Embarked`
  - Boxplots and histograms for `Age`, `Fare` grouped by survival
- 📝 **Observations**:
  - Higher survival among **females** and **1st class** passengers
  - Survivors had **higher average fare** and were **slightly younger**

### 4. **Multivariate Analysis**
- Used `sns.pairplot()` and `sns.heatmap()` to identify deeper relationships
- Explored correlations among numerical features
- Grouped summaries using `.groupby('Survived').agg(...)`
- 📝 **Observations**:
  - Strong correlation between **Fare & Pclass**, **SibSp & Parch**
  - Survivors were more likely to have paid higher fares and be from smaller families

---

## 📈 Outputs

- Summary tables with means, stds, and counts by survival status  
- Correlation matrix  
- Pairplot and heatmap visuals  
- PDF report included with final observations and insights

---

## 📥 Dataset

[Titanic Dataset – Kaggle](https://www.kaggle.com/datasets/yasserh/titanic-dataset)

---

## ✅ Outcome

- Strengthened EDA skills using pandas, seaborn, and matplotlib  
- Built a strong foundation for understanding relationships within real-world data  
- Developed the ability to communicate insights through both numbers and visuals

---

## 📎 Author
*Deepika Dohare*  


