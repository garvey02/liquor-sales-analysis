-- 1. Weekly Sales Trend 
SELECT
  FORMAT_DATE('%Y-%W', date) AS year_week,
  ROUND(SUM(sale_dollars), 2) AS total_sales
FROM
  `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY year_week
ORDER BY year_week;

-- 2. Top 10 Liquor Products by Total Bottles Sold 
SELECT
  item_description,
  SUM(bottles_sold) AS total_bottles_sold
FROM
  `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY item_description
ORDER BY total_bottles_sold DESC
LIMIT 10;

-- 3. Top 5 Stores by Total Revenue 
SELECT
  store_name,
  ROUND(SUM(sale_dollars), 2) AS total_sales
FROM
  `bigquery-public-data.iowa_liquor_sales.sales`
GROUP BY store_name
ORDER BY total_sales DESC
LIMIT 5;

-- 4. Avg Bottle Price by Item 
SELECT
  item_description,
  ROUND(AVG(sale_dollars / bottles_sold), 2) AS avg_price_per_bottle
FROM
  `bigquery-public-data.iowa_liquor_sales.sales`
WHERE bottles_sold > 0
GROUP BY item_description
ORDER BY avg_price_per_bottle DESC
LIMIT 10;