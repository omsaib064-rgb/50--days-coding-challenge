
SELECT * FROM Energy_Consumption;


CREATE TABLE Energy_Consumption (
    customer_id INT,
    region VARCHAR(20),
    energy_source VARCHAR(20),
    consumption_kwh FLOAT,
    billing_amount FLOAT,
    payment_status VARCHAR(20),
    bill_date DATE
);
INSERT INTO Energy_Consumption VALUES
(101, 'South', 'Solar', 120, 1500, 'Paid', '2024-01-01'),
(102, 'North', 'Coal', 300, 3500, 'Pending', '2024-01-02'),
(103, 'East', 'Wind', 200, 2500, 'Paid', '2024-01-03'),
(104, 'West', 'Hydro', 400, 4500, 'Paid', '2024-01-04'),
(105, 'South', 'Coal', 350, 4000, 'Pending', '2024-01-05'),
(106, 'North', 'Solar', 150, 1800, 'Paid', '2024-01-06'),
(107, 'East', 'Hydro', 280, 3200, 'Pending', '2024-01-07'),
(108, 'West', 'Wind', 220, 2600, 'Paid', '2024-01-08'),
(109, 'South', 'Solar', 180, 2100, 'Paid', '2024-01-09'),
(110, 'North', 'Coal', 500, 6000, 'Pending', '2024-01-10');

SELECT * FROM Energy_Consumption;

SELECT SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption;

SELECT SUM(billing_amount) AS Total_Revenue
FROM Energy_Consumption;
SELECT region,
       SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption
GROUP BY region;

SELECT energy_source,
       SUM(billing_amount) AS Total_Revenue
FROM Energy_Consumption
GROUP BY energy_source;

SELECT region,
       SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption
GROUP BY region
ORDER BY Total_Consumption DESC
LIMIT 1;

SELECT COUNT(*) AS Pending_Count
FROM Energy_Consumption
WHERE payment_status = 'Pending';

SELECT customer_id,
       consumption_kwh
FROM Energy_Consumption
ORDER BY consumption_kwh DESC
LIMIT 3;

SELECT SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption;

SELECT SUM(billing_amount) AS Total_Revenue
FROM Energy_Consumption;

SELECT region,
       SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption
GROUP BY region;

SELECT energy_source,
       SUM(billing_amount) AS Total_Revenue
FROM Energy_Consumption
GROUP BY energy_source;

SELECT region,
       SUM(consumption_kwh) AS Total_Consumption
FROM Energy_Consumption
GROUP BY region
ORDER BY Total_Consumption DESC
LIMIT 1;

SELECT COUNT(*) AS Pending_Count
FROM Energy_Consumption
WHERE payment_status = 'Pending';

SELECT AVG(billing_amount) AS Average_Billing
FROM Energy_Consumption;

SELECT customer_id,
       consumption_kwh
FROM Energy_Consumption
ORDER BY consumption_kwh DESC
LIMIT 3;

SELECT payment_status,
       SUM(billing_amount) AS Revenue
FROM Energy_Consumption
GROUP BY payment_status;
