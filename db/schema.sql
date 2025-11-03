-- Delete database if it exists
DROP DATABASE IF EXISTS student_records;
CREATE DATABASE student_records;
USE student_records;

-- 1. Create 'courses' table
CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- 2. Create 'subjects' table
CREATE TABLE subjects (
    id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Create 'faculty' table
CREATE TABLE faculty (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- 4. Create 'students' table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. Create 'attendance' table
CREATE TABLE attendance (
    id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Create 'marks' table
CREATE TABLE marks (
    id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks_obtained FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Create 'users' table (for login/admin)
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100),
    role ENUM('admin', 'faculty', 'student')
);

-- 8. Create 'grades' view — auto-calculated based on marks
CREATE VIEW student_grades AS
SELECT
    s.id AS student_id,
    s.name AS student_name,
    sub.subject_name,
    m.marks_obtained,
    CASE
        WHEN m.marks_obtained >= 90 THEN 'A+'
        WHEN m.marks_obtained >= 80 THEN 'A'
        WHEN m.marks_obtained >= 70 THEN 'B'
        WHEN m.marks_obtained >= 60 THEN 'C'
        WHEN m.marks_obtained >= 50 THEN 'D'
        ELSE 'F'
    END AS grade
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN subjects sub ON m.subject_id = sub.id;
