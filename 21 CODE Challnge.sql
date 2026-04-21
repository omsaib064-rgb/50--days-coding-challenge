
CREATE DATABASE insurance_db;
USE insurance_db;
CREATE TABLE claims (
    claim_id INT,
    policy_holder VARCHAR(50),
    policy_type VARCHAR(50),
    claim_amount INT,
    claim_date DATE,
    status VARCHAR(20)
);
INSERT INTO claims VALUES
(1, 'Ravi', 'Health', 50000, '2024-01-10', 'Approved'),
(2, 'Anita', 'Vehicle', 20000, '2024-01-12', 'Rejected'),
(3, 'Ravi', 'Health', 30000, '2024-01-20', 'Approved'),
(4, 'Suresh', 'Life', 100000, '2024-01-25', 'Approved'),
(5, 'Anita', 'Vehicle', 15000, '2024-02-01', 'Approved'),
(6, 'Kiran', 'Health', 40000, '2024-02-10', 'Rejected'),
(7, 'Ravi', 'Health', 70000, '2024-02-15', 'Approved'),
(8, 'Suresh', 'Life', 50000, '2024-02-20', 'Rejected');

SELECT *
FROM claims
WHERE claim_amount > (
    SELECT AVG(claim_amount)
    FROM claims
);


SELECT DISTINCT policy_holder
FROM claims
WHERE status = 'Approved';


SELECT DISTINCT c1.policy_holder
FROM claims c1
WHERE EXISTS (
    SELECT 1
    FROM claims c2
    WHERE c2.policy_holder = c1.policy_holder
    AND c2.status = 'Approved'
);

SELECT *
FROM claims c1
WHERE claim_amount > (
    SELECT AVG(claim_amount)
    FROM claims c2
    WHERE c2.policy_holder = c1.policy_holder
);

SELECT *
FROM claims c1
WHERE claim_amount > (
    SELECT AVG(claim_amount)
    FROM claims c2
    WHERE c1.policy_holder = c2.policy_holder
);

SELECT *,
       (SELECT AVG(claim_amount) FROM claims) AS overall_avg
FROM claims;