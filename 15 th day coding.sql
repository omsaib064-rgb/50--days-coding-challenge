CREATE DATABASE college_db;
USE college_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    score INT
);

INSERT INTO students (student_id, student_name, age, city) VALUES
(1, 'Ravi', 20, 'Hyderabad'),
(2, 'Sneha', 21, 'Warangal'),
(3, 'Arjun', 19, 'Khammam'),
(4, 'Divya', 22, 'Nizamabad'),
(5, 'Kiran', 20, 'Karimnagar');

INSERT INTO courses (course_id, course_name, department) VALUES
(101, 'SQL Basics', 'Computer Science'),
(102, 'Excel for Analysts', 'Commerce'),
(103, 'Statistics', 'Mathematics');

INSERT INTO marks (mark_id, student_id, course_id, score) VALUES
(1, 1, 101, 85),
(2, 2, 101, 72),
(3, 3, 101, 90),
(4, 4, 102, 88),
(5, 5, 103, 67),
(6, 1, 103, 79),
(7, 2, 102, 81);

SELECT * FROM students;


CREATE DATABASE college_db;
USE college_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    score INT
);

INSERT INTO students (student_id, student_name, age, city) VALUES
(1, 'Ravi', 20, 'Hyderabad'),
(2, 'Sneha', 21, 'Warangal'),
(3, 'Arjun', 19, 'Khammam'),
(4, 'Divya', 22, 'Nizamabad'),
(5, 'Kiran', 20, 'Karimnagar');

INSERT INTO courses (course_id, course_name, department) VALUES
(101, 'SQL Basics', 'Computer Science'),
(102, 'Excel for Analysts', 'Commerce'),
(103, 'Statistics', 'Mathematics');

INSERT INTO marks (mark_id, student_id, course_id, score) VALUES
(1, 1, 101, 85),
(2, 2, 101, 72),
(3, 3, 101, 90),
(4, 4, 102, 88),
(5, 5, 103, 67),
(6, 1, 103, 79),
(7, 2, 102, 81);

SELECT * FROM students;

SELECT student_name, city FROM students;

SELECT * FROM courses;

SELECT * FROM students
WHERE city = 'Tumakuru';

SELECT * FROM students
WHERE join_year = 2024;

SELECT * FROM students
WHERE gender = 'F';

-- 6
SELECT * FROM students
WHERE gender = 'F';

-- 7
SELECT * FROM marks
WHERE marks > 80;

-- 8
SELECT course_name FROM courses
WHERE department = 'Commerce';

-- 9
SELECT * FROM students
WHERE city <> 'Bengaluru';

-- 10
SELECT * FROM marks
WHERE marks BETWEEN 70 AND 90;

-- 11
SELECT * FROM students
ORDER BY student_name ASC;

-- 12
SELECT * FROM marks
ORDER BY marks DESC;

-- 13
SELECT * FROM students
ORDER BY join_year DESC;

-- 14
SELECT COUNT(*) AS total_students FROM students;

-- 15
SELECT AVG(marks) AS average_marks FROM marks;

-- 16
SELECT MAX(marks) AS highest_marks FROM marks;

-- 17
SELECT MIN(marks) AS lowest_marks FROM marks;

-- 18
SELECT SUM(marks) AS total_marks FROM marks;