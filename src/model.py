import mysql.connector
from datetime import date

class Database:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root123",
            database="student_records"
        )
        self.cur = self.conn.cursor(dictionary=True)

    # ✅ Find next available ID (fills deleted gaps)
    def get_next_available_id(self, table_name):
        self.cur.execute(f"SELECT id FROM {table_name} ORDER BY id ASC")
        ids = [row["id"] for row in self.cur.fetchall()]
        expected = 1
        for tid in ids:
            if tid != expected:
                return expected
            expected += 1
        return expected

    # ✅ Add student (reuses missing IDs)
    def add_student(self, name, email, course_id, password="12345"):
        """Add a new student and create a login in users table"""
        try:
            next_id = self.get_next_available_id("students")

            # ✅ Step 1: Insert into students table
            self.cur.execute(
                "INSERT INTO students (id, name, email, course_id) VALUES (%s, %s, %s, %s)",
                (next_id, name, email, course_id)
            )

            # ✅ Step 2: Insert into users table (check duplicates)
            self.cur.execute("SELECT COUNT(*) AS cnt FROM users WHERE username=%s", (email,))
            result = self.cur.fetchone()

            if result["cnt"] == 0:
                self.cur.execute(
                    "INSERT INTO users (id, username, password, role) VALUES (%s, %s, %s, %s)",
                    (self.get_next_available_id("users"), email, password, "student")
                )
            else:
                print(f"⚠️ User {email} already exists in users table, skipping insert.")

            # ✅ Commit both inserts
            self.conn.commit()
            print(f"✅ Student '{name}' added successfully with login access.")
            return True

        except Exception as e:
            self.conn.rollback()
            print("❌ Error adding student:", e)
            raise



    def get_students(self):
        self.cur.execute("""
            SELECT s.id, s.name, s.email, c.course_name 
            FROM students s
            JOIN courses c ON s.course_id = c.id
            ORDER BY s.id
        """)
        return self.cur.fetchall()

    def delete_student(self, student_id):
        self.cur.execute("DELETE FROM students WHERE id=%s", (student_id,))
        self.conn.commit()

    # ✅ Add marks with auto-grade calculation
    def add_marks(self, student_id, subject_id, marks_obtained):
        self.cur.execute("SELECT subject_name FROM subjects WHERE id=%s", (subject_id,))
        subject = self.cur.fetchone()
        if not subject:
            raise ValueError("Invalid subject ID")

        grade = self.calculate_grade(marks_obtained, 100)  # Assuming total = 100
        next_id = self.get_next_available_id("marks")

        self.cur.execute(
            "INSERT INTO marks (id, student_id, subject_id, marks_obtained) VALUES (%s, %s, %s, %s)",
            (next_id, student_id, subject_id, marks_obtained)
        )
        self.conn.commit()
        return grade

    def calculate_grade(self, marks, total):
        percent = (marks / total) * 100
        if percent >= 90: return "A+"
        elif percent >= 80: return "A"
        elif percent >= 70: return "B"
        elif percent >= 60: return "C"
        elif percent >= 50: return "D"
        else: return "F"

    # ✅ Attendance management
    def add_attendance(self, student_id, subject_id, status):
        next_id = self.get_next_available_id("attendance")
        self.cur.execute(
            "INSERT INTO attendance (id, student_id, subject_id, attendance_date, status) VALUES (%s, %s, %s, %s, %s)",
            (next_id, student_id, subject_id, date.today(), status)
        )
        self.conn.commit()

    def get_attendance(self, student_id):
        self.cur.execute("""
            SELECT a.attendance_date, s.subject_name, a.status
            FROM attendance a
            JOIN subjects s ON a.subject_id = s.id
            WHERE a.student_id = %s
        """, (student_id,))
        return self.cur.fetchall()

    def get_marks(self, student_id):
        self.cur.execute("""
            SELECT m.subject_id, s.subject_name, m.marks_obtained
            FROM marks m
            JOIN subjects s ON m.subject_id = s.id
            WHERE m.student_id = %s
        """, (student_id,))
        return self.cur.fetchall()
    
    def validate_user(self, username, password):
        """Validate user credentials and return user details if correct"""
        self.cur.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
        return self.cur.fetchone()


    def close(self):
        self.cur.close()
        self.conn.close()
