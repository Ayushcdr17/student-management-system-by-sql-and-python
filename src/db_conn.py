import mysql.connector
from mysql.connector import Error

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root123",
        database="student_records",
        port=3306
    )

def test_conn():
    try:
        conn = get_connection()
        print("Connected:", conn.is_connected())
        conn.close()
    except Error as e:
        print("Error:", e)

if __name__ == "__main__":
    test_conn()

