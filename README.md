# 🏫 Student Record Management System

A **role-based academic data management application** built using **Python (Tkinter)** and **MySQL**.  
This project enables **Admins**, **Faculty**, and **Students** to efficiently manage student records, marks, grades, and attendance — with real-time database integration and automatic grade computation.

---

## ⚙️ Tools and Technologies Used

| Component | Description |
|------------|-------------|
| **Programming Language** | Python |
| **GUI Library** | Tkinter |
| **Database** | MySQL |
| **Database Connector** | mysql.connector |
| **IDE** | Visual Studio Code |
| **Database Tool** | MySQL Workbench |
| **Operating System** | Windows 11 |

---

## 🎯 Objective

The main objective of this project is to create a **Student Record Management System** that provides:
- A centralized database for student information  
- Secure **login-based access** for Admins, Faculty, and Students  
- Complete **CRUD (Create, Read, Update, Delete)** functionality  
- **Automatic grade calculation** from marks  
- High **data integrity** and **security**

---

## 🧩 System Overview

### 👨‍💼 Admin
- Add, view, and delete student records  
- Auto-generate user accounts in the `users` table  
- Manage courses, faculty, and student details  

### 👩‍🏫 Faculty
- Add/update student marks and attendance  
- Modify or review existing records  

### 👨‍🎓 Student
- View personal **marks**, **grades**, and **attendance**  
- Access their records through secure login credentials  

---

## 🗄️ Database Design

**Database Name:** `student_records`

### 📚 Main Tables

| Table | Description |
|--------|-------------|
| `courses` | Stores course information |
| `subjects` | Contains subjects linked to each course |
| `faculty` | Holds faculty details |
| `students` | Stores student details (ID, Name, Email, Course) |
| `marks` | Records marks obtained by students |
| `attendance` | Stores attendance data |
| `users` | Manages login credentials and roles |
| `student_grades` *(SQL View)* | Displays auto-calculated grades |

### 🔑 Key Database Features
- **Foreign Key Constraints** ensure relational integrity  
- **ON DELETE CASCADE** for automatic cleanup of linked data  
- **Auto-Incremented IDs** for unique entries  
- **SQL View** for dynamic grade calculation  
- **Role-Based Authentication** managed via the `users` table  

---

## 💻 Application Modules

### 🔐 1. Login System
- Secure login for Admin, Faculty, and Students  
- Role-based redirection after authentication  
- Password verification handled by `validate_user()` function  

### 🧑‍💼 2. Admin Panel
- Add new students (auto-creates user login)  
- View all student data in a structured table  
- Delete students and automatically remove linked user records  
- Auto-generate IDs using a “Next Available ID” function  

### 👩‍🏫 3. Faculty Panel
- Add or update marks per student and subject  
- Record attendance (Present/Absent)  
- Modify existing attendance records  

### 👨‍🎓 4. Student Panel
- View personal marks and auto-generated grades  
- Check attendance history  
- Handles missing student data gracefully  

---

## 🔄 CRUD Operations Summary

| Operation | Description | Example |
|------------|-------------|----------|
| **Create** | Add new student/faculty/subject entries | Add Student Form |
| **Read** | View student and marks data | Student Record Table |
| **Update** | Modify attendance or marks | Faculty Marks Entry |
| **Delete** | Remove records (auto-delete linked entries) | Delete Student |

---

## 📊 Automatic Grade Calculation

Grades are automatically computed based on marks using both **Python logic** and a **MySQL View (`student_grades`)**.

| Marks Range | Grade |
|--------------|-------|
| 90 and above | A+ |
| 80–89 | A |
| 70–79 | B |
| 60–69 | C |
| 50–59 | D |
| Below 50 | F |

---

## 🔐 Data Security & Consistency

- **Foreign Keys & Constraints** prevent invalid data  
- **Role-Based Access Control** ensures limited privileges  
- **Cascade Deletion** keeps the database clean  
- **Transaction Control** rolls back failed operations  
- **Secure Login Authentication** via the `users` table  

---

## 🧠 Working Flow

1. Create and configure MySQL database and tables.  
2. Define foreign key relationships and constraints.  
3. Develop GUI using Tkinter in Python.  
4. Link frontend and backend using `mysql.connector`.  
5. Implement CRUD, login, and grade logic.  
6. Test and validate all modules for reliability.

---

## 🧾 Project Structure

```

Student_Record_Management_System/
│            
├── db/
│   ├── schema.sql  # SQL script for creating database
│   ├── seed_data.sql  # SQL script for inserting initial data
│
├── src/
│   ├── app.py       # Main application file
│   ├── gui.py       # GUI logic
│   ├── model.py     # Operational logic
│   └── db_conn.py   # To connect from database

├── docs/
│   ├── Student Record Management System.pdf # Report
│
└── README.md                # Project documentation

````

---

## 🧾 How to Run the Project

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/student-record-management-system.git
````

### 2️⃣ Install Dependencies

```bash
pip install mysql-connector-python
```

### 3️⃣ Create the Database

Open MySQL Workbench and run:

```sql
CREATE DATABASE student_records;
```

Then import the provided SQL file (`student_records.sql`).

### 4️⃣ Configure Database Connection

Edit database credentials in your Python file:

```python
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="student_records"
)
```

### 5️⃣ Run the Application

```bash
python app.py
```

---

## ✅ Key Achievements

* Auto ID generation for missing entries
* Automatic grade calculation
* Role-based authentication system
* Full CRUD integration between GUI and MySQL
* Reliable transaction and rollback mechanism

---

## 🚀 Future Enhancements

* Integration of performance graphs and charts
* Email/SMS notifications for marks or attendance
* Cloud-hosted MySQL for multi-user online access
* Exportable student performance reports (PDF/Excel)
* Improved modern UI with Tkinter custom themes

---

## 👨‍💻 Author

**Developed by:** Ayush Payal
📧 **Email:** ayushpayal1702@gmail.com
💼 **LinkedIn:** https://www.linkedin.com/in/ayush1765/
🌐 **GitHub:** https://github.com/Ayushcdr17

---

## 🪪 License

This project is licensed under the **MIT License**.
You’re free to use, modify, and distribute it for educational or personal use.
