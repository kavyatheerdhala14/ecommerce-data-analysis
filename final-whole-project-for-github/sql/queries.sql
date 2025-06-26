-- SQL Scripts for E-commerce Analysis
SELECT DATE(order_date) AS order_day, SUM(order_amount) AS daily_sales
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

SELECT category, SUM(order_amount) AS category_revenue
FROM orders
GROUP BY category;

SELECT customer_id, COUNT(order_id) AS total_orders, MIN(order_date) AS first_order, MAX(order_date) AS last_order
FROM orders
GROUP BY customer_id;

SELECT (SELECT COUNT(DISTINCT customer_id) FROM orders) * 100.0 /
       (SELECT COUNT(DISTINCT visitor_id) FROM site_visits) AS conversion_rate;
