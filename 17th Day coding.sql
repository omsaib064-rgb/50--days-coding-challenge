/*
=========================================================
PROJECT NAME: Customer Orders Analysis
AUTHOR: Your Name
DESCRIPTION:
This SQL project analyzes customer purchases, orders,
and payments using JOIN operations.

TABLES USED:
1. customers
2. orders
3. payments

TOPICS COVERED:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
=========================================================
*/

-- =====================================================
-- STEP 1: CREATE TABLES
-- =====================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_status VARCHAR(20)
);

-- =====================================================
-- STEP 2: INSERT SAMPLE DATA
-- =====================================================

INSERT INTO customers VALUES
(1, 'Amit', 'Bangalore'),
(2, 'Sneha', 'Mumbai'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Chennai');

INSERT INTO orders VALUES
(101, 1, '2024-01-10', 500),
(102, 1, '2024-02-15', 700),
(103, 2, '2024-03-01', 300),
(104, 5, '2024-03-05', 900);

INSERT INTO payments VALUES
(1, 101, 'Completed'),
(2, 102, 'Pending'),
(3, 103, 'Completed');

-- =====================================================
-- TASK 1: CUSTOMER ORDERS
-- Display customer_name, order_id, amount
-- Include only customers who placed orders
-- =====================================================

SELECT c.customer_name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- =====================================================
-- TASK 2: ALL CUSTOMERS
-- Display all customers and their order_id (if any)
-- Customers without orders should still appear
-- =====================================================

SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- =====================================================
-- TASK 3: INVALID ORDERS
-- Find orders that do not have a matching customer
-- =====================================================

SELECT o.order_id, o.customer_id, o.amount
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- =====================================================
-- TASK 4: ORDER PAYMENT STATUS
-- Display customer_name, order_id, payment_status
-- Include all orders, even if payment is missing
-- =====================================================

SELECT c.customer_name, o.order_id, p.payment_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN payments p
ON o.order_id = p.order_id;

-- =====================================================
-- TASK 5: CUSTOMERS WITHOUT ORDERS
-- Find customers who have never placed an order
-- =====================================================

SELECT c.customer_id, c.customer_name, c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- =====================================================
-- TASK 6: ORDERS WITHOUT PAYMENT
-- Find all orders that do not have a payment record
-- =====================================================

SELECT o.order_id, o.customer_id, o.amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

-- =====================================================
-- TASK 7: TOTAL SPENDING
-- Calculate total amount spent by each customer
-- =====================================================

SELECT c.customer_id, c.customer_name, COALESCE(SUM(o.amount), 0) AS total_spending
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- =====================================================
-- TASK 8: FULLY PAID CUSTOMERS
-- Find customers whose all orders are marked as 'Completed'
-- =====================================================

SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = COUNT(CASE WHEN p.payment_status = 'Completed' THEN 1 END);

-- =====================================================
-- TASK 9: HIGHEST ORDER PER CUSTOMER
-- Display customer_name and highest order amount
-- =====================================================

SELECT c.customer_name, MAX(o.amount) AS highest_order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- TASK 10: TOP 2 CUSTOMERS
-- Find top 2 customers based on total spending
-- =====================================================

SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 2;

