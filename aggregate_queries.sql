USE ecommerce;

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers FROM Customer;

-- 2. Total number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM OrderTable
GROUP BY customer_id;

-- 3. Total quantity sold per product
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Item
GROUP BY product_id;

-- 4. Average order amount per customer
SELECT o.customer_id, AVG(p.amount) AS avg_order_amount
FROM OrderTable o
JOIN Payment p ON o.order_id = p.order_id
GROUP BY o.customer_id;

-- 5. Total sales (revenue)
SELECT SUM(amount) AS total_sales FROM Payment;

-- 6. Count of orders by status
SELECT status, COUNT(*) AS count
FROM OrderTable
GROUP BY status;

-- 7. Filter groups using HAVING: customers with more than 1 order
SELECT customer_id, COUNT(order_id) AS total_orders
FROM OrderTable
GROUP BY customer_id
HAVING total_orders > 1;

-- 8. Highest payment made per method
SELECT method, MAX(amount) AS max_paid
FROM Payment
GROUP BY method;

-- 9. Average product price by category
SELECT c.category_name, ROUND(AVG(p.price), 2) AS avg_price
FROM Product p
JOIN Category c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 10. Total revenue per day
SELECT payment_date, SUM(amount) AS total_per_day
FROM Payment
GROUP BY payment_date
ORDER BY payment_date;
