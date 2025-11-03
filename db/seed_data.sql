USE student_records;

-- =====================
-- 1. COURSES (20)
-- =====================
INSERT INTO courses (id, course_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Electronics & Communication'),
(6, 'Information Technology'),
(7, 'Data Science'),
(8, 'Artificial Intelligence'),
(9, 'Chemical Engineering'),
(10, 'Biotechnology'),
(11, 'Aeronautical Engineering'),
(12, 'Industrial Engineering'),
(13, 'Automobile Engineering'),
(14, 'Mechatronics'),
(15, 'Environmental Engineering'),
(16, 'Marine Engineering'),
(17, 'Software Engineering'),
(18, 'Cyber Security'),
(19, 'Robotics'),
(20, 'Structural Engineering');

-- =====================
-- 2. SUBJECTS (20)
-- =====================
INSERT INTO subjects (id, subject_name, course_id) VALUES
(1, 'Data Structures', 1),
(2, 'Algorithms', 1),
(3, 'Thermodynamics', 2),
(4, 'Fluid Mechanics', 2),
(5, 'Circuit Theory', 3),
(6, 'Digital Systems', 5),
(7, 'Machine Learning', 7),
(8, 'Artificial Intelligence', 8),
(9, 'Organic Chemistry', 9),
(10, 'Genetic Engineering', 10),
(11, 'Flight Mechanics', 11),
(12, 'Operations Research', 12),
(13, 'Automotive Design', 13),
(14, 'Control Systems', 14),
(15, 'Environmental Science', 15),
(16, 'Marine Propulsion', 16),
(17, 'Software Testing', 17),
(18, 'Network Security', 18),
(19, 'Robotics Fundamentals', 19),
(20, 'Structural Analysis', 20);

-- =====================
-- 3. FACULTY (20)
-- =====================
INSERT INTO faculty (id, name, email) VALUES
(1, 'Dr. Ramesh Gupta', 'ramesh.gupta@college.edu'),
(2, 'Dr. Sneha Kapoor', 'sneha.kapoor@college.edu'),
(3, 'Prof. Amit Sharma', 'amit.sharma@college.edu'),
(4, 'Dr. Meera Joshi', 'meera.joshi@college.edu'),
(5, 'Prof. Ravi Verma', 'ravi.verma@college.edu'),
(6, 'Dr. Priya Nair', 'priya.nair@college.edu'),
(7, 'Prof. Anil Bansal', 'anil.bansal@college.edu'),
(8, 'Dr. Shweta Singh', 'shweta.singh@college.edu'),
(9, 'Prof. Karan Patel', 'karan.patel@college.edu'),
(10, 'Dr. Deepa Mehta', 'deepa.mehta@college.edu'),
(11, 'Prof. Rajesh Rao', 'rajesh.rao@college.edu'),
(12, 'Dr. Aditi Sinha', 'aditi.sinha@college.edu'),
(13, 'Prof. Neeraj Jain', 'neeraj.jain@college.edu'),
(14, 'Dr. Pooja Iyer', 'pooja.iyer@college.edu'),
(15, 'Prof. Manish Das', 'manish.das@college.edu'),
(16, 'Dr. Shalini Menon', 'shalini.menon@college.edu'),
(17, 'Prof. Arjun Pillai', 'arjun.pillai@college.edu'),
(18, 'Dr. Reema Khan', 'reema.khan@college.edu'),
(19, 'Prof. Vikram Chauhan', 'vikram.chauhan@college.edu'),
(20, 'Dr. Kavita Bhatt', 'kavita.bhatt@college.edu');

-- =====================
-- 4. STUDENTS (20)
-- =====================
INSERT INTO students (id, name, email, course_id) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@student.edu', 1),
(2, 'Isha Verma', 'isha.verma@student.edu', 2),
(3, 'Rohan Mehta', 'rohan.mehta@student.edu', 3),
(4, 'Priya Gupta', 'priya.gupta@student.edu', 4),
(5, 'Karan Singh', 'karan.singh@student.edu', 5),
(6, 'Tanya Joshi', 'tanya.joshi@student.edu', 6),
(7, 'Vivek Nair', 'vivek.nair@student.edu', 7),
(8, 'Neha Patel', 'neha.patel@student.edu', 8),
(9, 'Rahul Das', 'rahul.das@student.edu', 9),
(10, 'Simran Kaur', 'simran.kaur@student.edu', 10),
(11, 'Nikhil Rao', 'nikhil.rao@student.edu', 11),
(12, 'Ritika Menon', 'ritika.menon@student.edu', 12),
(13, 'Aditya Jain', 'aditya.jain@student.edu', 13),
(14, 'Sneha Pillai', 'sneha.pillai@student.edu', 14),
(15, 'Yash Bhatt', 'yash.bhatt@student.edu', 15),
(16, 'Ananya Khan', 'ananya.khan@student.edu', 16),
(17, 'Ravi Das', 'ravi.das@student.edu', 17),
(18, 'Muskan Bansal', 'muskan.bansal@student.edu', 18),
(19, 'Harshit Tiwari', 'harshit.tiwari@student.edu', 19),
(20, 'Diya Chauhan', 'diya.chauhan@student.edu', 20);

-- =====================
-- 5. ATTENDANCE (20)
-- =====================
INSERT INTO attendance (id, student_id, subject_id, attendance_date, status) VALUES
(1, 1, 1, '2025-10-10', 'Present'),
(2, 2, 3, '2025-10-10', 'Absent'),
(3, 3, 5, '2025-10-10', 'Present'),
(4, 4, 4, '2025-10-10', 'Present'),
(5, 5, 6, '2025-10-10', 'Absent'),
(6, 6, 7, '2025-10-10', 'Present'),
(7, 7, 8, '2025-10-10', 'Present'),
(8, 8, 9, '2025-10-10', 'Absent'),
(9, 9, 10, '2025-10-10', 'Present'),
(10, 10, 11, '2025-10-10', 'Present'),
(11, 11, 12, '2025-10-10', 'Absent'),
(12, 12, 13, '2025-10-10', 'Present'),
(13, 13, 14, '2025-10-10', 'Present'),
(14, 14, 15, '2025-10-10', 'Absent'),
(15, 15, 16, '2025-10-10', 'Present'),
(16, 16, 17, '2025-10-10', 'Present'),
(17, 17, 18, '2025-10-10', 'Absent'),
(18, 18, 19, '2025-10-10', 'Present'),
(19, 19, 20, '2025-10-10', 'Present'),
(20, 20, 1, '2025-10-10', 'Present');

-- =====================
-- 6. MARKS (20)
-- =====================
INSERT INTO marks (id, student_id, subject_id, marks_obtained) VALUES
(1, 1, 1, 95),
(2, 2, 3, 88),
(3, 3, 5, 76),
(4, 4, 4, 64),
(5, 5, 6, 57),
(6, 6, 7, 91),
(7, 7, 8, 85),
(8, 8, 9, 48),
(9, 9, 10, 79),
(10, 10, 11, 93),
(11, 11, 12, 67),
(12, 12, 13, 81),
(13, 13, 14, 73),
(14, 14, 15, 54),
(15, 15, 16, 82),
(16, 16, 17, 97),
(17, 17, 18, 59),
(18, 18, 19, 66),
(19, 19, 20, 87),
(20, 20, 2, 92);

-- =====================
-- 7. USERS (20)
-- =====================

-- =====================
-- USERS TABLE (Linking all roles)
-- =====================

-- Admins
INSERT INTO users (id, username, password, role)
VALUES
(1, 'admin1', 'admin123', 'admin');

-- Faculty Users (Linked to faculty table)
INSERT INTO users (id, username, password, role) VALUES
(2, 'ramesh.gupta', '123', 'faculty'),
(3, 'sneha.kapoor', '123', 'faculty'),
(4, 'amit.sharma', '123', 'faculty'),
(5, 'meera.joshi', '123', 'faculty'),
(6, 'ravi.verma', '123', 'faculty'),
(7, 'priya.nair', '123', 'faculty'),
(8, 'anil.bansal', '123', 'faculty'),
(9, 'shweta.singh', '123', 'faculty'),
(10, 'karan.patel', '123', 'faculty'),
(11, 'deepa.mehta', '123', 'faculty'),
(12, 'rajesh.rao', '123', 'faculty'),
(13, 'aditi.sinha', '123', 'faculty'),
(14, 'neeraj.jain', '123', 'faculty'),
(15, 'pooja.iyer', '123', 'faculty'),
(16, 'manish.das', '123', 'faculty'),
(17, 'shalini.menon', '123', 'faculty'),
(18, 'arjun.pillai', '123', 'faculty'),
(19, 'reema.khan', '123', 'faculty'),
(20, 'vikram.chauhan', '123', 'faculty'),
(21, 'kavita.bhatt', '123', 'faculty');

-- Student Users (Linked to students table)
INSERT INTO users (id, username, password, role) VALUES
(22, 'aarav.sharma', '123', 'student'),
(23, 'isha.verma', '123', 'student'),
(24, 'rohan.mehta', '123', 'student'),
(25, 'priya.gupta', '123', 'student'),
(26, 'karan.singh', '123', 'student'),
(27, 'tanya.joshi', '123', 'student'),
(28, 'vivek.nair', '123', 'student'),
(29, 'neha.patel', '123', 'student'),
(30, 'rahul.das', '123', 'student'),
(31, 'simran.kaur', '123', 'student'),
(32, 'nikhil.rao', '123', 'student'),
(33, 'ritika.menon', '123', 'student'),
(34, 'aditya.jain', '123', 'student'),
(35, 'sneha.pillai', '123', 'student'),
(36, 'yash.bhatt', '123', 'student'),
(37, 'ananya.khan', '123', 'student'),
(38, 'ravi.das', '123', 'student'),
(39, 'muskan.bansal', '123', 'student'),
(40, 'harshit.tiwari', '123', 'student'),
(41, 'diya.chauhan', '123', 'student');

