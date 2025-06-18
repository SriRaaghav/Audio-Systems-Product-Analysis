# 📊 Power BI Sales Dashboard Project

## 📁 Overview

This project presents a dynamic **Sales Analysis Dashboard** created using **Microsoft Power BI**, backed by SQL for data preparation. The dashboard provides business insights on revenue, profit, unit sales, and discount impact across products, countries, and customer segments.

> 🔍 **Goal:** Help management make strategic decisions using key performance indicators visualized clearly.

---

## ⚙️ Tech Stack

- **Power BI Desktop** – Dashboard creation, DAX calculations  
- **SQL Server / MySQL** – Data preprocessing, joining, and filtering  
- **Excel / CSV** – For mock data storage (if applicable)  
- **DAX** – For dynamic calculations like YoY, profit %, etc.

---

## 🛠️ SQL Data Preparation

```sql
SELECT 
    s.Product_ID,
    s.Date,
    d.Product_Name,
    d.Manufacturer,
    d.Category,
    d.Sub_Category,
    s.Customer_Segment,
    s.Country,
    s.Units_Sold,
    d.Cost_per_Unit,
    d.Sale_Price_per_Unit,
    s.Discount_Applied,
    dd.Discount_Band,
    (s.Units_Sold * d.Sale_Price_per_Unit) AS Revenue,
    (s.Units_Sold * d.Cost_per_Unit) AS Total_Cost,
    (s.Units_Sold * d.Sale_Price_per_Unit * (1 - s.Discount_Applied)) AS Discounted_Revenue,
    FORMAT(s.Date, 'MMM') AS Month,
    FORMAT(s.Date, 'yyyy') AS Year
FROM 
    product_data d
JOIN 
    product_sales s ON d.Product_ID = s.Product_ID
JOIN 
    discount_data dd ON s.Discount_Applied = dd.Discount_Range;
```
## Key Features in Dashboard


| Feature                            | Description                                   |
| ---------------------------------- | --------------------------------------------- |
| 🧠 **Product Image & Description** | Visual + textual context for selected product |
| 🎯 **KPI Cards**                   | Revenue, Profit, and YoY % shown clearly      |
| 📅 **Time Series Trend**           | Revenue by Date with Year filters             |
| 🌍 **Geographical Revenue**        | Revenue by Country (Map or Bar)               |
| 💸 **Discount Analysis**           | Revenue distribution by Discount Band         |
| 📂 **Table View**                  | Year-wise Revenue & Profit summary            |
| 🔍 **Slicers**                     | Filters for Product, Year, Country            |
| 🧰 **Tooltip Page**                | On-hover insights for Customer Segments       |

## DAX Highlights

``` 
-- Profit Calculation
Profit = SUM('Sales_Data'[Discounted_Revenue]) - SUM('Sales_Data'[Total_Cost])

-- Year-on-Year (YoY) Profit Growth
Profit YoY % =
VAR CurrentYear = SELECTEDVALUE('Sales_Data'[Year])
VAR LastYear = CurrentYear - 1
VAR CurrentProfit = CALCULATE(SUM('Sales_Data'[Profit]), 'Sales_Data'[Year] = CurrentYear)
VAR LastYearProfit = CALCULATE(SUM('Sales_Data'[Profit]), 'Sales_Data'[Year] = LastYear)
RETURN
    IF(LastYearProfit <> 0, DIVIDE(CurrentProfit - LastYearProfit, LastYearProfit, 0), BLANK())
```

## Files in This Repo

| File                          | Description                                      |
| ----------------------------- | ------------------------------------------------ |
| `PowerBI_SalesDashboard.pbix` | Power BI project file                            |
| `sales_query.sql`             | SQL script for data processing                   |
| `README.md`                   | Project documentation                            |
| `screenshots/`                | Folder containing exported images from dashboard |


## Learnings & Skills Applied

Power BI Visualizations & Design
SQL Joins and Aggregations
DAX for custom metrics
Report Tooltips and Bookmarking
Dashboard Storytelling
