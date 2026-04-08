-- =========================================================
-- Day 19 SQL Coding Challenge: Farm Yield Optimization
-- Company: Agri-Innovate
-- =========================================================

-- =========================================================
-- Task 1.1: Top 3 Most Productive Plots Based on Average Yield
-- Show: plot_name, crop_type, average_yield_kg
-- =========================================================

SELECT 
    p.plot_name,
    p.crop_type,
    ROUND(AVG(y.yield_kg), 2) AS average_yield_kg
FROM plots p
JOIN yields y
    ON p.plot_id = y.plot_id
GROUP BY p.plot_id, p.plot_name, p.crop_type
ORDER BY average_yield_kg DESC
LIMIT 3;


-- =========================================================
-- Task 1.2: Total Water Consumption for Each Plot
-- Show: plot_name, total_water_liters
-- Rank from highest to lowest
-- =========================================================

SELECT 
    p.plot_name,
    ROUND(SUM(i.water_amount_liters), 2) AS total_water_liters
FROM plots p
JOIN irrigation_logs i
    ON p.plot_id = i.plot_id
GROUP BY p.plot_id, p.plot_name
ORDER BY total_water_liters DESC;


-- =========================================================
-- Task 2.1: Average Yield for Each Crop Type Under Different Weather Conditions
-- Show: crop_type, weather_condition, average_yield_kg
-- =========================================================

SELECT 
    p.crop_type,
    y.weather_condition,
    ROUND(AVG(y.yield_kg), 2) AS average_yield_kg
FROM plots p
JOIN yields y
    ON p.plot_id = y.plot_id
GROUP BY p.crop_type, y.weather_condition
ORDER BY p.crop_type, y.weather_condition;


-- =========================================================
-- Task 2.2: Highest Yielding Plot for Each Soil Type
-- Show: soil_type, plot_name, highest_yield_kg
-- =========================================================

WITH plot_max_yield AS (
    SELECT 
        p.soil_type,
        p.plot_name,
        MAX(y.yield_kg) AS highest_yield_kg
    FROM plots p
    JOIN yields y
        ON p.plot_id = y.plot_id
    GROUP BY p.soil_type, p.plot_name
),
ranked_plots AS (
    SELECT *,
           RANK() OVER (PARTITION BY soil_type ORDER BY highest_yield_kg DESC) AS rnk
    FROM plot_max_yield
)
SELECT 
    soil_type,
    plot_name,
    highest_yield_kg
FROM ranked_plots
WHERE rnk = 1
ORDER BY soil_type;


-- =========================================================
-- Task 3.1: Farmer Managing Plots With Lowest Average Water Consumption
-- Show: first_name, last_name, average_water_liters_per_plot
-- =========================================================

WITH plot_water AS (
    SELECT 
        p.plot_id,
        p.farmer_id,
        AVG(i.water_amount_liters) AS avg_water_liters_per_plot
    FROM plots p
    JOIN irrigation_logs i
        ON p.plot_id = i.plot_id
    GROUP BY p.plot_id, p.farmer_id
),
farmer_avg_water AS (
    SELECT 
        f.farmer_id,
        f.first_name,
        f.last_name,
        ROUND(AVG(pw.avg_water_liters_per_plot), 2) AS average_water_liters_per_plot
    FROM farmers f
    JOIN plot_water pw
        ON f.farmer_id = pw.farmer_id
    GROUP BY f.farmer_id, f.first_name, f.last_name
)
SELECT 
    first_name,
    last_name,
    average_water_liters_per_plot
FROM farmer_avg_water
ORDER BY average_water_liters_per_plot ASC
LIMIT 1;


-- =========================================================
-- Task 3.2: Number of Harvests Per Month for Last 12 Months
-- Show: month, number_of_harvests
-- =========================================================

SELECT 
    DATE_FORMAT(harvest_date, '%Y-%m') AS month,
    COUNT(*) AS number_of_harvests
FROM yields
WHERE harvest_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(harvest_date, '%Y-%m')
ORDER BY month;


-- =========================================================
-- Task 4: Bonus Analysis
-- Find plots with:
-- 1. Below-average yield for their crop type
-- 2. Above-average water consumption for same crop type
-- Show: plot_name, crop_type, yield_kg, water_amount_liters
-- =========================================================

WITH plot_yield AS (
    SELECT 
        p.plot_id,
        p.plot_name,
        p.crop_type,
        AVG(y.yield_kg) AS avg_plot_yield
    FROM plots p
    JOIN yields y
        ON p.plot_id = y.plot_id
    GROUP BY p.plot_id, p.plot_name, p.crop_type
),
crop_avg_yield AS (
    SELECT 
        p.crop_type,
        AVG(y.yield_kg) AS crop_avg_yield
    FROM plots p
    JOIN yields y
        ON p.plot_id = y.plot_id
    GROUP BY p.crop_type
),
plot_water AS (
    SELECT 
        p.plot_id,
        p.crop_type,
        AVG(i.water_amount_liters) AS avg_plot_water
    FROM plots p
    JOIN irrigation_logs i
        ON p.plot_id = i.plot_id
    GROUP BY p.plot_id, p.crop_type
),
crop_avg_water AS (
    SELECT 
        p.crop_type,
        AVG(i.water_amount_liters) AS crop_avg_water
    FROM plots p
    JOIN irrigation_logs i
        ON p.plot_id = i.plot_id
    GROUP BY p.crop_type
)
SELECT 
    py.plot_name,
    py.crop_type,
    ROUND(py.avg_plot_yield, 2) AS yield_kg,
    ROUND(pw.avg_plot_water, 2) AS water_amount_liters
FROM plot_yield py
JOIN crop_avg_yield cay
    ON py.crop_type = cay.crop_type
JOIN plot_water pw
    ON py.plot_id = pw.plot_id
JOIN crop_avg_water caw
    ON py.crop_type = caw.crop_type
WHERE py.avg_plot_yield < cay.crop_avg_yield
  AND pw.avg_plot_water > caw.crop_avg_water
ORDER BY py.crop_type, py.plot_name;

