
CREATE DATABASE packing_domain;
USE packing_domain;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(20),
    cost_per_unit DECIMAL(10,2)
);

CREATE TABLE production (
    production_id INT PRIMARY KEY,
    product_id INT,
    production_date DATE,
    quantity_produced INT,
    defective_quantity INT,
    
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    selling_price_per_unit DECIMAL(10,2),
    
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

SELECT 
    p.product_name,

    SUM(pr.quantity_produced) AS total_produced,

    SUM(pr.defective_quantity) AS total_defective,

    ROUND(
        SUM(pr.defective_quantity) * 100.0 /
        SUM(pr.quantity_produced),
        2
    ) AS defect_rate_percentage

FROM products p

JOIN production pr
ON p.product_id = pr.product_id

GROUP BY p.product_name;

Formula
Revenue=quantity_sold×selling_price_per_unit

Revenue=Quantity Sold×Selling Price Per Unit

SELECT 
    p.product_name,

    SUM(
        s.quantity_sold *
        s.selling_price_per_unit
    ) AS total_revenue

FROM products p

JOIN sales s
ON p.product_id = s.product_id

GROUP BY p.product_name

ORDER BY total_revenue DESC

LIMIT 1;

SELECT 
    DATE_FORMAT(production_date, '%Y-%m') AS month,

    SUM(quantity_produced) AS total_production

FROM production

GROUP BY month

ORDER BY month;

SELECT 
    MONTH(production_date) AS month,

    SUM(quantity_produced) AS total_production

FROM production

GROUP BY MONTH(production_date)

ORDER BY month;

Formula
Profit=Selling Price−Cost Price

Profit=Selling Price−Cost Price

SELECT 
    p.category,

    SUM(
        s.quantity_sold *
        s.selling_price_per_unit
    ) AS total_revenue,

    SUM(
        s.quantity_sold *
        p.cost_per_unit
    ) AS total_cost,

    SUM(
        (
            s.selling_price_per_unit -
            p.cost_per_unit
        )
        *
        s.quantity_sold
    ) AS total_profit

FROM products p

JOIN sales s
ON p.product_id = s.product_id

GROUP BY p.category;
SELECT 
    pr.production_date AS date,

    p.product_name,

    ROUND(
        (
            pr.defective_quantity * 100.0
        ) /
        pr.quantity_produced,
        2
    ) AS defect_rate_percentage

FROM production pr

JOIN products p
ON pr.product_id = p.product_id

WHERE 
    (
        pr.defective_quantity * 100.0
    ) /
    pr.quantity_produced > 5;
    
Revenue Formula
Revenue=Quantity Sold×Selling Price Per Unit

Revenue=Quantity Sold×Selling Price Per Unit

SELECT 
    sale_date,

    SUM(daily_revenue) OVER (
        ORDER BY sale_date
    ) AS running_total_revenue

FROM (

    SELECT 
        sale_date,

        SUM(
            quantity_sold *
            selling_price_per_unit
        ) AS daily_revenue

    FROM sales

    GROUP BY sale_date

) AS revenue_table;

Formula
Profit Margin=
Revenue
Profit
	​


Profit Margin=
Revenue
Profit
	​
SELECT 
    p.category,

    ROUND(
        SUM(
            (
                s.selling_price_per_unit -
                p.cost_per_unit
            )
            * s.quantity_sold
        )
        /
        SUM(
            s.quantity_sold *
            s.selling_price_per_unit
        ) * 100,
        2
    ) AS profit_margin_percentage

FROM products p

JOIN sales s
ON p.product_id = s.product_id

GROUP BY p.category

ORDER BY profit_margin_percentage DESC

LIMIT 1;

Condition
Produced Quantity>Sold Quantity

Produced Quantity>Sold Quantity

SELECT 
    p.product_name,

    SUM(pr.quantity_produced) AS total_produced,

    SUM(s.quantity_sold) AS total_sold,

    (
        SUM(pr.quantity_produced) -
        SUM(s.quantity_sold)
    ) AS unsold_inventory

FROM products p

JOIN production pr
ON p.product_id = pr.product_id

JOIN sales s
ON p.product_id = s.product_id

GROUP BY p.product_name

HAVING total_produced > total_sold;

