import tkinter as tk
from tkinter import messagebox, ttk
from model import Database

db = Database()

def run():
    root = tk.Tk()
    root.title("Student Academic Record Management System")
    root.geometry("850x600")

    def clear_frame():
        for widget in root.winfo_children():
            widget.destroy()

    # ---------------------- LOGIN SCREEN ----------------------
    def login_screen():
        clear_frame()
        tk.Label(root, text="User Login", font=("Arial", 20, "bold")).pack(pady=30)

        tk.Label(root, text="Username (use your email)").pack()
        username_entry = tk.Entry(root, width=30)
        username_entry.pack(pady=5)

        tk.Label(root, text="Password").pack()
        password_entry = tk.Entry(root, width=30, show="*")
        password_entry.pack(pady=5)

        def validate_login():
            username = username_entry.get()
            password = password_entry.get()

            user = db.validate_user(username.strip().lower(), password.strip())

            if user:
                role = user['role']
                messagebox.showinfo("Login Successful", f"Welcome {username} ({role})")

                if role == "admin":
                    admin_panel()
                elif role == "faculty":
                    faculty_panel()
                elif role == "student":
                    student_panel_user(username)
            else:
                messagebox.showerror("Login Failed", "Invalid username or password")

        tk.Button(root, text="Login", command=validate_login, width=25).pack(pady=10)

    # ---------------------- ADMIN PANEL ----------------------
    def admin_panel():
        clear_frame()
        tk.Label(root, text="Admin Panel", font=("Arial", 18, "bold")).pack(pady=10)
        tk.Button(root, text="Add Student", width=25, command=add_student_ui).pack(pady=10)
        tk.Button(root, text="View Students", width=25, command=view_students_ui).pack(pady=10)
        tk.Button(root, text="Delete Student", width=25, command=delete_student_ui).pack(pady=10)
        tk.Button(root, text="Logout", command=login_screen).pack(pady=10)

    def add_student_ui():
        clear_frame()
        tk.Label(root, text="Add New Student", font=("Arial", 16, "bold")).pack(pady=10)

        name = tk.Entry(root, width=30)
        email = tk.Entry(root, width=30)
        course_id = tk.Entry(root, width=30)
        password = tk.Entry(root, width=30, show="*")

        for t, e in [("Name", name), ("Email (used as username)", email), ("Course ID", course_id), ("Password", password)]:
            tk.Label(root, text=t).pack()
            e.pack()

        def submit():
            if not name.get() or not email.get() or not course_id.get() or not password.get():
                messagebox.showerror("Error", "All fields are required!")
                return

            try:
                success = db.add_student(
                    name.get().strip(),
                    email.get().strip().lower(),
                    course_id.get().strip(),
                    password.get().strip()
                )

                if success:
                    messagebox.showinfo("Success", f"Student '{name.get()}' added successfully with login access.")
                    admin_panel()

            except Exception as e:
                messagebox.showerror("Error", f"Failed to add student: {e}")




        tk.Button(root, text="Submit", command=submit).pack(pady=10)
        tk.Button(root, text="Back", command=admin_panel).pack()

    def view_students_ui():
        clear_frame()
        tk.Label(root, text="All Students", font=("Arial", 16, "bold")).pack(pady=10)
        tree = ttk.Treeview(root, columns=("id", "name", "email", "course"), show="headings")
        for col in ("id", "name", "email", "course"):
            tree.heading(col, text=col.capitalize())
        tree.pack(expand=True, fill="both")

        for s in db.get_students():
            tree.insert("", "end", values=(s["id"], s["name"], s["email"], s["course_name"]))

        tk.Button(root, text="Back", command=admin_panel).pack(pady=10)

    def delete_student_ui():
        clear_frame()
        tk.Label(root, text="Delete Student", font=("Arial", 16, "bold")).pack(pady=10)
        student_id = tk.Entry(root)
        tk.Label(root, text="Enter Student ID").pack()
        student_id.pack()

        def delete():
            sid = student_id.get()
            # Delete student and associated user
            db.cur.execute("SELECT email FROM students WHERE id=%s", (sid,))
            student = db.cur.fetchone()
            if student:
                email = student['email']
                db.cur.execute("DELETE FROM users WHERE username=%s", (email,))
                db.conn.commit()

            db.delete_student(sid)
            messagebox.showinfo("Deleted", "Student and associated user removed successfully")
            admin_panel()

        tk.Button(root, text="Delete", command=delete).pack(pady=10)
        tk.Button(root, text="Back", command=admin_panel).pack()

    # ---------------------- FACULTY PANEL ----------------------
    def faculty_panel():
        clear_frame()
        tk.Label(root, text="Faculty Panel", font=("Arial", 18, "bold")).pack(pady=10)
        tk.Button(root, text="Add Marks", width=25, command=add_marks_ui).pack(pady=10)
        tk.Button(root, text="Add Attendance", width=25, command=add_attendance_ui).pack(pady=10)
        tk.Button(root, text="Logout", command=login_screen).pack(pady=10)

    def add_marks_ui():
        clear_frame()
        tk.Label(root, text="Add Marks", font=("Arial", 16, "bold")).pack(pady=10)
        student_id = tk.Entry(root)
        subject_id = tk.Entry(root)
        marks = tk.Entry(root)
        for t, e in [("Student ID", student_id), ("Subject ID", subject_id), ("Marks Obtained", marks)]:
            tk.Label(root, text=t).pack()
            e.pack()

        def submit():
            grade = db.add_marks(int(student_id.get()), int(subject_id.get()), float(marks.get()))
            messagebox.showinfo("Success", f"Marks added successfully. Grade: {grade}")
            faculty_panel()

        tk.Button(root, text="Submit", command=submit).pack(pady=10)
        tk.Button(root, text="Back", command=faculty_panel).pack()

    def add_attendance_ui():
        clear_frame()
        tk.Label(root, text="Add Attendance", font=("Arial", 16, "bold")).pack(pady=10)
        student_id = tk.Entry(root)
        subject_id = tk.Entry(root)
        status = ttk.Combobox(root, values=["Present", "Absent"])
        for t, e in [("Student ID", student_id), ("Subject ID", subject_id), ("Status", status)]:
            tk.Label(root, text=t).pack()
            e.pack()

        def submit():
            db.add_attendance(int(student_id.get()), int(subject_id.get()), status.get())
            messagebox.showinfo("Success", "Attendance recorded successfully")
            faculty_panel()

        tk.Button(root, text="Submit", command=submit).pack(pady=10)
        tk.Button(root, text="Back", command=faculty_panel).pack()

    # ---------------------- STUDENT PANEL ----------------------
    def student_panel_user(username):
        clear_frame()
        tk.Label(root, text="Student View", font=("Arial", 18, "bold")).pack(pady=10)

        db.cur.execute("SELECT id, name FROM students WHERE email=%s", (username,))
        student = db.cur.fetchone()

        # 🧩 Auto-create missing student record if not found
        if not student:
            db.cur.execute(
                "INSERT INTO students (name, email, course_id) VALUES (%s, %s, %s)",
                ("Unnamed Student", username, 1)
            )
            db.conn.commit()
            db.cur.execute("SELECT id, name FROM students WHERE email=%s", (username,))
            student = db.cur.fetchone()

        sid = student["id"]
        tk.Label(root, text=f"Welcome, {student['name']}", font=("Arial", 16, "bold")).pack(pady=10)


        marks = db.get_marks(sid)
        attendance = db.get_attendance(sid)

        tk.Label(root, text="Marks Report", font=("Arial", 14, "bold")).pack(pady=5)
        if marks:
            for m in marks:
                grade = db.calculate_grade(m['marks_obtained'], 100)
                tk.Label(root, text=f"{m['subject_name']}: {m['marks_obtained']} / 100 → Grade {grade}").pack()
        else:
            tk.Label(root, text="No marks available.").pack()

        tk.Label(root, text="Attendance Record", font=("Arial", 14, "bold")).pack(pady=5)
        if attendance:
            for a in attendance:
                tk.Label(root, text=f"{a['attendance_date']} | {a['subject_name']} | {a['status']}").pack()
        else:
            tk.Label(root, text="No attendance records yet.").pack()

        tk.Button(root, text="Logout", command=login_screen).pack(pady=10)

    # Start app
    login_screen()
    root.mainloop()
