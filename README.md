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
