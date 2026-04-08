-- Create Table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    total_spent DECIMAL(10,2),
    number_of_orders INT
);

-- Insert Data
INSERT INTO customers VALUES
(1, 'Amit', 'Bangalore', 25, 12000, 5),
(2, 'Neha', 'Mumbai', 30, 45000, 12),
(3, 'Raj', 'Delhi', 22, 8000, 3),
(4, 'Sneha', 'Bangalore', 28, 60000, 15),
(5, 'Karan', 'Mumbai', 35, 20000, 7),
(6, 'Pooja', 'Delhi', 27, 15000, 6),
(7, 'Arjun', 'Bangalore', 40, 70000, 20),
(8, 'Meera', 'Mumbai', 23, 5000, 2);

-- Queries
SELECT * FROM customers WHERE city = 'Bangalore';

SELECT * FROM customers WHERE total_spent > 20000;

SELECT * FROM customers WHERE age BETWEEN 25 AND 35;

SELECT * FROM customers ORDER BY total_spent DESC;

SELECT SUM(total_spent) AS total_revenue FROM customers;

SELECT AVG(total_spent) AS average_spending FROM customers;

SELECT city, SUM(total_spent) AS total_city_spending FROM customers GROUP BY city;

SELECT city, AVG(age) AS average_age FROM customers GROUP BY city;

SELECT city, COUNT(*) AS customer_count FROM customers GROUP BY city;

SELECT city, SUM(total_spent) AS total_city_spending

FROM customers
GROUP BY city
HAVING SUM(total_spent) > 50000;

SELECT 
    customer_name,
    total_spent,
    
    CASE
        WHEN total_spent >= 50000 THEN 'High Value'
        WHEN total_spent BETWEEN 20000 AND 49999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers;
