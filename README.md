# Sales & Customer Analysis using BigQuery

## Project Overview

This project focuses on analyzing transactional sales data to derive actionable business insights related to **products, customers, revenue, and operations**. Acting as a data analyst, the objective was to understand sales performance, identify high-value customers, and support inventory and marketing decisions using SQL on **Google BigQuery**.

The dataset represents **line-item level sales transactions**, where each row corresponds to a product purchased within an order.

---

## Tools & Technologies

* **Google BigQuery** (Cloud data warehouse)
* **SQL**

  * Aggregations
  * Common Table Expressions (CTEs)
  * Window Functions (NTILE)
  * Subqueries

---

## Dataset Description

The dataset contains sales transactions with the following key attributes:

* Order details (Order ID, Order Date, Quantity, Amount, Profit)
* Product information (Category, Sub-Category)
* Customer information (Customer Name, City, State)
* Payment information (Payment Mode)
* Time dimension (Year-Month)

The data is **denormalized** and analyzed directly at the transactional level.

---

## Key Analyses Performed

### 1. Data Validation & Sanity Checks

* Verified dataset scale and structure
* Confirmed multiple line items per order
* Ensured accurate aggregation using `COUNT(DISTINCT Order ID)`

**Insight:** The dataset is transactional at the line-item level, enabling reliable analysis across orders, customers, and products.

---

### 2. Revenue & Profit Analysis by Category

* Aggregated revenue, profit, and quantity by product category

**Insights:**

* Office Supplies emerged as the most profitable category
* Electronics showed strong revenue but relatively lower margins
* Furniture drove high volume sales with competitive profitability

---

### 3. Sub-Category Performance Analysis

* Identified top-performing sub-categories by revenue and profit

**Insight:** Revenue concentration at the sub-category level helps prioritize inventory and marketing efforts.

---

### 4. Customer Segmentation

* Calculated customer-level metrics (orders, spend, profit)
* Applied **quartile-based segmentation** using window functions

**Insight:** High-value customers (top 25% by spend) contribute disproportionately to revenue, enabling targeted retention strategies.

---

### 5. Monthly Sales Trend Analysis

* Aggregated revenue and profit by month

**Insights:**

* Identified seasonality and growth/decline patterns
* Supported planning for inventory and campaign timing

---

### 6. Payment Mode Analysis

* Evaluated revenue, profit, and order volume by payment method

**Insight:** Identified the most impactful payment channels to optimize operational focus.

---

## Key Takeaways

* Demonstrated end-to-end SQL-driven analysis using BigQuery
* Translated raw transactional data into business insights
* Applied analytical thinking to validate assumptions and design robust metrics

---

## Skills Demonstrated

* SQL (CTEs, window functions, aggregations)
* Data validation and exploratory analysis
* Customer segmentation and revenue analysis
* Business-oriented data interpretation

---

## Outcome

This project showcases the ability to **analyze real-world sales data using cloud-based SQL tools** and present insights that support strategic business decisions in marketing, inventory management, and operations.
