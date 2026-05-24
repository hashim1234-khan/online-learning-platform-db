-- 1. DATABASE CREATION
CREATE DATABASE IF NOT EXISTS onlinelearningplatform;
USE onlinelearningplatform;

-- 2. CREATE TABLES
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 3. FINAL PROJECT REPORT QUERY
SELECT 
    e.enrollment_id,
    student.name AS student_name,
    c.course_name,
    instructor.name AS instructor_name
FROM enrollments e
JOIN users student ON e.user_id = student.user_id
JOIN courses c ON e.course_id = c.course_id
JOIN users instructor ON c.instructor_id = instructor.user_id;
