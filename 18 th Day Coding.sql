-- =========================================
-- PROJECT: Social Media Data Analysis
-- DATABASE: ConnectHub
-- =========================================

-- =========================================
-- 1. CREATE DATABASE
-- =========================================
CREATE DATABASE ConnectHub;
USE ConnectHub;

-- =========================================
-- 2. CREATE TABLES
-- =========================================

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    like_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    comment_date DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Friendships (
    friendship_id INT PRIMARY KEY,
    user_id1 INT,
    user_id2 INT,
    since_date DATE,
    FOREIGN KEY (user_id1) REFERENCES Users(user_id),
    FOREIGN KEY (user_id2) REFERENCES Users(user_id)
);

-- =========================================
-- 3. INSERT SAMPLE DATA
-- =========================================

INSERT INTO Users VALUES
(1, 'Akhil', 'akhil@gmail.com', '2024-01-10'),
(2, 'Sravani', 'sravani@gmail.com', '2024-01-12'),
(3, 'Rahul', 'rahul@gmail.com', '2024-01-15'),
(4, 'Keerthi', 'keerthi@gmail.com', '2024-02-01'),
(5, 'Vamsi', 'vamsi@gmail.com', '2024-02-10');

INSERT INTO Posts VALUES
(101, 1, 'Hello ConnectHub!', '2024-03-01 10:00:00'),
(102, 2, 'My first post!', '2024-03-02 11:00:00'),
(103, 1, 'Learning SQL is fun!', '2024-03-03 09:30:00'),
(104, 3, 'Enjoying data analytics.', '2024-03-04 12:15:00');

INSERT INTO Likes VALUES
(1, 2, 101, '2024-03-01 10:30:00'),
(2, 3, 101, '2024-03-01 11:00:00'),
(3, 4, 102, '2024-03-02 12:00:00'),
(4, 5, 103, '2024-03-03 10:00:00'),
(5, 2, 103, '2024-03-03 10:30:00'),
(6, 5, 101, '2024-03-01 11:30:00');

INSERT INTO Comments VALUES
(1, 101, 2, 'Nice post!', '2024-03-01 10:45:00'),
(2, 101, 3, 'Welcome!', '2024-03-01 11:15:00'),
(3, 102, 1, 'Great start!', '2024-03-02 12:15:00'),
(4, 103, 4, 'Very true!', '2024-03-03 11:00:00'),
(5, 104, 5, 'Awesome!', '2024-03-04 12:45:00');

INSERT INTO Friendships VALUES
(1, 1, 2, '2024-02-15'),
(2, 1, 3, '2024-02-20'),
(3, 2, 4, '2024-02-22'),
(4, 3, 5, '2024-02-25');

-- =========================================
-- 4. TASK 1
-- =========================================

-- 1. Retrieve all posts along with the username of the author
SELECT 
    p.post_id,
    u.username,
    p.content,
    p.post_date
FROM Posts p
INNER JOIN Users u
ON p.user_id = u.user_id;

-- 2. Find all comments on each post along with the commenter’s username
SELECT 
    c.comment_id,
    c.post_id,
    u.username AS commenter_name,
    c.comment_text,
    c.comment_date
FROM Comments c
INNER JOIN Users u
ON c.user_id = u.user_id;

-- =========================================
-- 5. TASK 2
-- =========================================

-- 3. Find the top 3 users with the most posts
SELECT 
    u.user_id,
    u.username,
    COUNT(p.post_id) AS total_posts
FROM Users u
INNER JOIN Posts p
ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
ORDER BY total_posts DESC
LIMIT 3;

-- 4. Retrieve posts that have more likes than the average number of likes per post
SELECT 
    p.post_id,
    p.content,
    COUNT(l.like_id) AS total_likes
FROM Posts p
LEFT JOIN Likes l
ON p.post_id = l.post_id
GROUP BY p.post_id, p.content
HAVING COUNT(l.like_id) > (
    SELECT AVG(like_count)
    FROM (
        SELECT COUNT(*) AS like_count
        FROM Likes
        GROUP BY post_id
    ) AS avg_likes
);

-- 5. Find users who have never posted anything but have liked posts
SELECT DISTINCT
    u.user_id,
    u.username
FROM Users u
INNER JOIN Likes l
ON u.user_id = l.user_id
LEFT JOIN Posts p
ON u.user_id = p.user_id
WHERE p.post_id IS NULL;

-- =========================================
-- 6. TASK 3
-- =========================================

-- 6. Get a list of all friends of user_id = 3
SELECT 
    u.user_id,
    u.username
FROM Users u
WHERE u.user_id IN (
    SELECT user_id2
    FROM Friendships
    WHERE user_id1 = 3

    UNION

    SELECT user_id1
    FROM Friendships
    WHERE user_id2 = 3
);

-- 7. Retrieve posts that were liked by friends of user_id = 3
SELECT DISTINCT
    p.post_id,
    p.content,
    u.username AS post_author
FROM Posts p
INNER JOIN Likes l
ON p.post_id = l.post_id
INNER JOIN Users u
ON p.user_id = u.user_id
WHERE l.user_id IN (
    SELECT user_id2
    FROM Friendships
    WHERE user_id1 = 3

    UNION

    SELECT user_id1
    FROM Friendships
    WHERE user_id2 = 3
);

-- =========================================
-- 7. TASK 4
-- =========================================

-- Stored Procedure: GetUserActivity
DELIMITER $$

CREATE PROCEDURE GetUserActivity(IN input_user_id INT)
BEGIN
    SELECT 
        input_user_id AS user_id,

        (SELECT COUNT(*) 
         FROM Posts 
         WHERE user_id = input_user_id) AS total_posts,

        (SELECT COUNT(*) 
         FROM Likes 
         WHERE user_id = input_user_id) AS total_likes_given,

        (SELECT COUNT(*) 
         FROM Likes l
         INNER JOIN Posts p 
         ON l.post_id = p.post_id
         WHERE p.user_id = input_user_id) AS total_likes_received,

        (SELECT COUNT(*) 
         FROM Comments 
         WHERE user_id = input_user_id) AS total_comments_made;
END $$

DELIMITER ;

-- Execute Procedure
CALL GetUserActivity(3);

-- =========================================
-- 8. TASK 5
-- =========================================

-- 9. Find the most influential user
SELECT 
    u.user_id,
    u.username,
    COUNT(DISTINCT l.like_id) AS total_likes,
    COUNT(DISTINCT c.comment_id) AS total_comments,
    (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS influence_score
FROM Users u
INNER JOIN Posts p
ON u.user_id = p.user_id
LEFT JOIN Likes l
ON p.post_id = l.post_id
LEFT JOIN Comments c
ON p.post_id = c.post_id
GROUP BY u.user_id, u.username
ORDER BY influence_score DESC
LIMIT 1;

-- =========================================
-- 9. PERFORMANCE OPTIMIZATION
-- =========================================

CREATE INDEX idx_posts_user_id ON Posts(user_id);
CREATE INDEX idx_likes_post_id ON Likes(post_id);
CREATE INDEX idx_likes_user_id ON Likes(user_id);
CREATE INDEX idx_comments_post_id ON Comments(post_id);
CREATE INDEX idx_comments_user_id ON Comments(user_id);
CREATE INDEX idx_friendships_user1 ON Friendships(user_id1);
CREATE INDEX idx_friendships_user2 ON Friendships(user_id2);

-- =========================================
-- END OF PROJECT
-- =========================================