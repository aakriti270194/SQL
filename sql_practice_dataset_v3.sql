
-- SQL Practice Dataset (Version 3: HR & Payroll System)

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

-- Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Salary History Table
CREATE TABLE salary_history (
    record_id INT PRIMARY KEY,
    employee_id INT,
    effective_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Departments
INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'HR', 'Delhi'),
(2, 'Finance', 'Mumbai'),
(3, 'IT', 'Bangalore'),
(4, 'Operations', 'Hyderabad');

-- Insert Employees
INSERT INTO employees (employee_id, employee_name, email, department_id, hire_date, salary) VALUES
(101, 'Aakriti Agrawal', 'aakriti.hr@example.com', 1, '2022-03-15', 55000),
(102, 'Rohit Mehra', 'rohit.finance@example.com', 2, '2021-07-10', 72000),
(103, 'Megha Reddy', 'megha.it@example.com', 3, '2023-01-20', 68000),
(104, 'Arjun Patel', 'arjun.ops@example.com', 4, '2020-11-05', 60000);

-- Insert Attendance Records
INSERT INTO attendance (attendance_id, employee_id, date, status) VALUES
(1, 101, '2024-05-01', 'Present'),
(2, 102, '2024-05-01', 'Absent'),
(3, 103, '2024-05-01', 'Present'),
(4, 104, '2024-05-01', 'Leave'),
(5, 101, '2024-05-02', 'Present'),
(6, 102, '2024-05-02', 'Present'),
(7, 103, '2024-05-02', 'Absent'),
(8, 104, '2024-05-02', 'Present');

-- Insert Salary History
INSERT INTO salary_history (record_id, employee_id, effective_date, salary) VALUES
(1, 101, '2023-01-01', 50000),
(2, 101, '2024-01-01', 55000),
(3, 102, '2022-01-01', 68000),
(4, 102, '2024-01-01', 72000),
(5, 103, '2023-03-01', 65000),
(6, 103, '2024-03-01', 68000),
(7, 104, '2021-01-01', 58000),
(8, 104, '2023-01-01', 60000);
