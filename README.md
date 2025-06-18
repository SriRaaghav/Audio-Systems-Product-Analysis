# Problem Statement

![Screenshot (826)](https://github.com/user-attachments/assets/5ae9a114-e2b1-4098-942f-6f72be406197)


# 📊 Power BI Sales Dashboard 

## 📁 Overview

This project presents a dynamic **Sales Analysis Dashboard** created using **Microsoft Power BI**, backed by SQL for data preparation. The dashboard provides business insights on revenue, profit, unit sales, and discount impact across products, countries, and customer segments.

> 🔍 **Goal:** Help management make strategic decisions using key performance indicators visualized clearly.

---

## ⚙️ Tech Stack

- **Power BI Desktop** – Dashboard creation, DAX calculations  
- **SQL Server (SSMS Studio)** – Data preprocessing, joining, and filtering  
- **Excel / CSV** – For mock data storage
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

![Screenshot (827)](https://github.com/user-attachments/assets/61a2f258-2d96-4c07-9d1f-0ec41cb1217f)


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

### 1. Profit YoY
``` dax
Profit YoY = 
VAR CurrentYear = SELECTEDVALUE('Query1'[Date].[Year])
VAR LastYear = CurrentYear - 1

VAR CurrentProfit =
    CALCULATE(
        SUM('Query1'[Profit]),
        'Query1'[Date].[Year] = CurrentYear
    )

VAR LastYearProfit =
    CALCULATE(
        SUM('Query1'[Profit]),
        'Query1'[Date].[Year] = LastYear
    )

RETURN
DIVIDE(CurrentProfit - LastYearProfit, LastYearProfit)

```

### 2. Units Sold YoY

``` DAX
Units Sold YoY = 
VAR CurrentYear = SELECTEDVALUE('Query1'[Date].[Year])
VAR LastYear = CurrentYear - 1

VAR CurrentUnits =
    CALCULATE(
        SUM('Query1'[Units_Sold]),
        'Query1'[Date].[Year] = CurrentYear
    )

VAR LastYearUnits =
    CALCULATE(
        SUM('Query1'[Units_Sold]),
        'Query1'[Date].[Year] = LastYear
    )

RETURN
DIVIDE(CurrentUnits - LastYearUnits, LastYearUnits)

```

## Files in This Repo

| File                          | Description                                      |
| ----------------------------- | ------------------------------------------------ |
| `PowerBI_SalesDashboard.pbix` | Power BI project file                            |
| `sales_query.sql`             | SQL script for data processing                   |
| `README.md`                   | Project documentation                            |
| `images/`                     | Folder containing exported images                |


## Learnings & Skills Applied

1. Power BI Visualizations & Design
2. SQL Joins and Aggregations
3. DAX for custom metrics
4. Report Tooltips and Bookmarking
5. Dashboard Storytelling

# Dashboard & Tooltip Design

![Screenshot (825)](https://github.com/user-attachments/assets/a26c67a8-f8cd-451d-9e46-bae85702991d)
![Screenshot (828)](https://github.com/user-attachments/assets/59f006f3-18aa-4f92-a30f-05846be18d86)

# Insights

# 🎧 Product Overview

**Product Name**: Scarlett 2i2  
**Category**: USB Audio Interface

### 🔑 Key Features:
- Two input channels
- Supports microphone/instrument connections
- High-quality, low-latency audio recording
- User-friendly setup

---

## 📈 Overall Performance (YoY Insights)

- **Units Sold YoY**: 📦 3K units  
- **Profit Growth YoY**: 📊 +1.46%

> ⚠️ *While unit sales have improved, the profit margin growth remains modest, indicating possible price pressures or higher discounts offered in 2023.*

---

## 🌍 Revenue by Country (Top 5 Markets)

| Country | Revenue (USD) |
|--------|---------------|
| 🇨🇦 Canada | $191,477 |
| 🇫🇷 France | $176,436 |
| 🇺🇸 USA | $166,803 |
| 🇲🇽 Mexico | $163,592 |
| 🇩🇪 Germany | $146,185 |

### 🔍 Insights:
- Canada leads in revenue, closely followed by France and the USA.
- The product shows strong performance in North America and Western Europe.
- Market potential is high in these regions, especially if growth strategies target mid-tier and high-tier buyers.

---

## 📅 Monthly Revenue Trends (2022 vs 2023)

### 🧠 Trend Observation:
- **2022 (Gray Bars)**: Revenue peaked in **July** and **October**, showing strong seasonality (likely due to academic or holiday cycles).
- **2023 (Blue Bars)**: Consistent monthly growth is evident; **highest revenue** was recorded in **November 2023**.

### 🔍 Insights:
- 2023 performance is more evenly distributed across months, suggesting improved marketing or distribution strategies.
- Continuous upward trend in the latter half of 2023 implies stronger Q3 & Q4 performance, possibly due to targeted campaigns or back-to-school/holiday season sales.

---

## 👥 Customer Type Breakdown (2022 vs 2023)

| Customer Type | 2022 Revenue | 2022 Profit | 2023 Revenue | 2023 Profit |
|---------------|--------------|-------------|--------------|-------------|
| Creator       | $72,332      | $13,941     | $44,616      | $7,061      |
| Education     | $108,498     | $23,600     | $71,487      | $14,790     |
| Enterprise    | $24,505      | $5,704      | $69,290      | $13,547     |
| Government    | $185,224     | $35,258     | $184,548     | $36,078     |
| Small Business| $19,942      | $4,575      | $64,051      | $12,817     |

### 🔍 Insights:
- **Enterprise** and **Small Business** segments saw massive growth in both revenue and profit YoY.
- **Government** sector remained consistent, indicating stable B2G demand.
- **Creator** and **Education** segments saw a decline, signaling either market saturation or reduced spending/budget cuts.

---

## 🧾 Discount Brand Breakdown

| Discount Level | Share % |
|----------------|---------|
| None           | 6.3%    |
| Low            | 26.02%  |
| Medium         | 36.94%  |
| High           | 30.74%  |

### 🔍 Insights:
- Over **67%** of sales occurred with **medium to high discounts**, possibly to drive volume.
- Only **6.3%** of customers paid full price, indicating strong price sensitivity or competitive pressure.
- While discounting helped volume sales (3K units), it likely contributed to the **modest profit growth (+1.46%)**.

---

## 📌 Key Takeaways and Recommendations

### ✅ Strengths:
- **Wide Global Reach**: Strong performance in North America and Europe.
- **Steady Revenue Growth**: Especially evident in 2023.
- **Enterprise & SMB Segment Growth**: New customer segments adopting the product.
- **Discount-Driven Volume Sales**: Effective in driving unit sales.

### ❗ Weaknesses:
- **Decline in Education & Creator Segments**: May need re-targeting.
- **Low Profit Growth**: Heavy discounting impacts margins.
- **Over-reliance on Discounts**: Weakens long-term brand equity and profitability.

---

## 🧭 Strategic Recommendations

1. **Optimize Discounting Strategy**:  
   Shift from blanket discounts to personalized or bundled offers.

2. **Revive Educational & Creator Marketing**:  
   Form partnerships with content creators and institutions.

3. **Upsell & Cross-Sell**:  
   Bundle Scarlett 2i2 with microphones or software packages to increase profit per customer.

4. **Explore New Markets**:  
   Consider regions like **Asia-Pacific** or **South America** with similar audio tech demands.

5. **Improve Margins**:  
   Explore **localized production** or **shipping optimization** to reduce cost per unit.
