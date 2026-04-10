
  
  USE company_db;


CREATE TABLE medical_insurance (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    bmi DECIMAL(5,2),
    children INT DEFAULT 0,
    smoker ENUM('Yes','No'),
    region ENUM('northeast','northwest','southeast','southwest'),
    insurance_cost DECIMAL(10,2) NOT NULL
);

INSERT INTO medical_insurance VALUES
(1, 19, 'Female', 27.90, 0, 'Yes', 'southwest', 16884.92),
(2, 18, 'Male', 33.77, 1, 'No', 'southeast', 1725.55),
(3, 28, 'Male', 33.00, 3, 'No', 'southeast', 4449.46),
(4, 33, 'Male', 22.70, 0, 'No', 'northwest', 21984.47),
(5, 32, 'Female', 28.88, 0, 'No', 'southeast', 3866.86),
(6, 31, 'Female', 25.74, 0, 'Yes', 'southeast', 3756.62),
(7, 46, 'Female', 33.44, 1, 'No', 'southeast', 8240.59),
(8, 37, 'Male', 27.74, 2, 'No', 'northwest', 7281.51),
(9, 37, 'Female', 29.83, 2, 'No', 'northeast', 6406.41),
(10, 60, 'Female', 25.84, 0, 'Yes', 'northwest', 28923.14);







SELECT COUNT(*) AS total_records
FROM medical_insurance;

SELECT *
FROM medical_insurance
WHERE smoker = 'Yes' AND age > 40;

SELECT gender, COUNT(*) AS total_count
FROM medical_insurance
GROUP BY gender;

SELECT smoker,
       ROUND(AVG(insurance_cost), 2) AS avg_insurance_cost
FROM medical_insurance
GROUP BY smoker;

SELECT region, AVG(insurance_cost) AS avg_cost
FROM medical_insurance
GROUP BY region
ORDER BY avg_cost DESC
LIMIT 1;

SELECT *
FROM medical_insurance
ORDER BY insurance_cost DESC
LIMIT 5;

SELECT 
  CASE 
    WHEN age BETWEEN 18 AND 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Middle-aged'
    ELSE 'Senior'
  END AS age_group,
  AVG(insurance_cost) AS avg_cost
FROM medical_insurance
GROUP BY age_group;

SELECT smoker, AVG(insurance_cost) AS avg_cost
FROM medical_insurance
WHERE bmi > 30
GROUP BY smoker;

SELECT children, AVG(insurance_cost) AS avg_cost
FROM medical_insance
GROUP BY children;

SELECT gender, AVG(insurance_cost) AS avg_cost
FROM medical_insurance
GROUP BY gender;


