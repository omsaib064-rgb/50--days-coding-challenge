# 📊 Day 7: Quality Control Dashboard (Power BI)

## 🚀 Project Overview

This project focuses on building a **Quality Control Dashboard** using Power BI to monitor product defects in a manufacturing process.
The goal is to transform raw production data into meaningful insights for decision making.

---

## 🎯 Objectives

* Calculate overall defect rate
* Identify top defective products
* Analyze defect trends over time
* Evaluate performance by production batches and inspectors

---

## 📁 Dataset Details

### 🏭 Production Table

* ProductID
* BatchID
* Date
* Status (Pass or Fail)

### 📦 Batches Table

* BatchID
* ProductionLine
* InspectorName

---

## 🔗 Data Modeling

* Created relationship:
  Production[BatchID] → Batches[BatchID]

---

## 🧠 DAX Measures Used

### ✅ Defective Items

Counts total failed products

### ✅ Total Production

Counts total produced items

### ✅ Defect Rate %

Percentage of defective items

### ✅ Daily Defect Rate

Tracks defect trend over time

---

## 📊 Dashboard Visuals

### 🔹 KPI Card

* Displays overall defect rate

### 🔹 Top 5 Defective Products

* Clustered bar chart
* Highlights most problematic products

### 🔹 Defect Trend Over Time

* Line chart showing daily defect rate

### 🔹 Batch Performance Analysis

* Matrix showing defects by:

  * Production Line
  * Inspector Name

---

## 🎛 Interactivity

* Date slicer added for dynamic filtering
* All visuals update based on selected time period

---

## 💡 Key Insights

* Identified high defect products
* Detected trends in defect rates
* Found underperforming production lines
* Evaluated inspector performance

---

## 🛠 Tools Used

* Power BI
* DAX
* Data Modeling

---

## 📌 Conclusion

This dashboard helps management quickly identify quality issues and take corrective actions, improving overall production efficiency.

---

## 📷 Screenshot

(Add your Power BI dashboard screenshot here)

---

## 🔗 Repository Structure

Day7_Quality_Control
│── dataset
│── dashboard.pbix
│── README.md

---

⭐ If you found this project useful, consider giving it a star!





# 🍔🎯🎯🎯🎯🎯

☸️☸️☸️☸️Day 9 Code Challenge – Eating Out on Health Analysis☸️☸️☸️

## 📊 Project Overview

This project analyzes how eating out frequency impacts health indicators like BMI, cholesterol, blood pressure, diabetes, and overall health score using Power BI.

---

 🎯🎯📁 Dataset Features

* Age
* Gender
* Occupation
* Eat Out Frequency
* Preferred Eat Out Type
* Daily Calories
* Exercise Hours Per Week
* Sleep Hours
* BMI
* Blood Pressure
* Cholesterol Level
* Diabetes
* Health Score

---

## ⚙️⚙️⚙️⚙️ Tasks Performed

* Data cleaning using Power Query
* Created calculated columns and DAX measures
* Built interactive dashboard
* Applied conditional formatting
* Generated insights from data

---

## 📐 DAX Measures

* Avg_BMI
* High_Risk_Count
* EatOut_Impact
* Avg Eat-Out Frequency
* Avg Health Score
* % Diabetes
* % Hypertension

---

## 📊 Dashboard Pages

### 1. Overview

* KPI Cards
* Pie Chart
* Bar Chart

### 2. Health Trends

* Stacked Column Chart
* Scatter Plot
* Line Chart

### 3. Demographics & Lifestyle

* Occupation Analysis
* Gender Analysis
* Exercise vs BMI
* Slicers

---

## 🔍 Key Insights

* Frequent eating out leads to higher BMI
* Fast food increases cholesterol risk
* Exercise improves health outcomes
* Students and employees eat out more

---

## 🛠 Tools Used

* Power BI
* Power Query
* DAX

---

## 📸 Screenshots

(Add your dashboard images here)

---

## 🚀 Outcome

Improved skills in Power BI, data visualization, and health data analysis.



                                👍👍👍              END      👍👍👍👍



