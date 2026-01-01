-- =====================================================
-- Sales & Customer Analysis using BigQuery
-- Dataset: plenary-hangout-330310.classic_models.sales
-- Description:
-- End-to-end SQL analysis covering data validation,
-- revenue & profit analysis, customer segmentation,
-- time trends, and operational insights.
-- =====================================================


-- -----------------------------------------------------
-- 1. Data Familiarity & Sanity Checks
-- Business Question:
-- What does the sales data look like? Are there duplicates
-- or structural issues?
-- -----------------------------------------------------
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT `Order ID`) AS unique_orders,
  COUNT(DISTINCT CustomerName) AS unique_customers,
  COUNT(DISTINCT Category) AS categories
FROM `plenary-hangout-330310.classic_models.sales`;


-- -----------------------------------------------------
-- 2. Revenue & Profit Analysis by Category
-- Business Question:
-- Which product categories drive revenue and profit?
-- -----------------------------------------------------
WITH category_metrics AS (
  SELECT
    Category,
    SUM(Amount) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity
  FROM `plenary-hangout-330310.classic_models.sales`
  GROUP BY Category
)
SELECT *
FROM category_metrics
ORDER BY total_revenue DESC;


-- -----------------------------------------------------
-- 3. Top Sub-Categories by Revenue
-- Business Question:
-- Which sub-categories should be prioritized for
-- inventory and marketing?
-- -----------------------------------------------------
WITH sub_category_sales AS (
  SELECT
    Category,
    `Sub-Category`,
    SUM(Amount) AS revenue,
    SUM(Profit) AS profit
  FROM `plenary-hangout-330310.classic_models.sales`
  GROUP BY Category, `Sub-Category`
)
SELECT *
FROM sub_category_sales
ORDER BY revenue DESC
LIMIT 10;


-- -----------------------------------------------------
-- 4. Customer Segmentation (Quartile-Based)
-- Business Question:
-- Who are the high-value customers and where are they
-- located?
-- -----------------------------------------------------
WITH customer_metrics AS (
  SELECT
    CustomerName,
    State,
    City,
    COUNT(DISTINCT `Order ID`) AS order_count,
    SUM(Amount) AS total_spend,
    SUM(Profit) AS total_profit
  FROM `plenary-hangout-330310.classic_models.sales`
  GROUP BY CustomerName, State, City
),
ranked_customers AS (
  SELECT *,
    NTILE(4) OVER (ORDER BY total_spend DESC) AS spend_quartile
  FROM customer_metrics
)
SELECT *,
  CASE
    WHEN spend_quartile = 1 THEN 'High Value'
    WHEN spend_quartile = 2 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS customer_segment
FROM ranked_customers
ORDER BY total_spend DESC;


-- -----------------------------------------------------
-- 5. Monthly Sales Trend Analysis
-- Business Question:
-- How do revenue and profit trend over time?
-- -----------------------------------------------------
WITH monthly_sales AS (
  SELECT
    `Year-Month`,
    SUM(Amount) AS revenue,
    SUM(Profit) AS profit
  FROM `plenary-hangout-330310.classic_models.sales`
  GROUP BY `Year-Month`
)
SELECT *
FROM monthly_sales
ORDER BY `Year-Month`;


-- -----------------------------------------------------
-- 6. Payment Mode Analysis
-- Business Question:
-- Which payment modes contribute most to revenue and
-- profit?
-- -----------------------------------------------------
SELECT
  PaymentMode,
  COUNT(DISTINCT `Order ID`) AS orders,
  SUM(Amount) AS revenue,
  SUM(Profit) AS profit
FROM `plenary-hangout-330310.classic_models.sales`
GROUP BY PaymentMode
ORDER BY revenue DESC;
