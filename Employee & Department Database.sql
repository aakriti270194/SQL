-- CREATE TABLE Departments (
--     DeptID INT PRIMARY KEY,
--     DeptName VARCHAR(50),
--     Location VARCHAR(50)
-- );

-- CREATE TABLE Employees (
--     EmpID INT PRIMARY KEY,
--     EmpName VARCHAR(50),
--     DeptID INT,
--     Salary DECIMAL(10,2),
--     JoinDate DATE,
--     FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
-- );
-- INSERT INTO Departments VALUES
-- (1, 'HR', 'Delhi'),
-- (2, 'Finance', 'Mumbai'),
-- (3, 'IT', 'Bangalore'),
-- (4, 'Marketing', 'Delhi');

-- INSERT INTO Employees VALUES
-- (101, 'Aakriti', 1, 45000, '2023-06-10'),
-- (102, 'Rohan', 2, 60000, '2023-03-15'),
-- (103, 'Simran', 3, 55000, '2024-01-20'),
-- (104, 'Amit', 1, 48000, '2024-05-01'),
-- (105, 'Karan', 3, 70000, '2023-11-11'),
-- (106, 'Meera', 4, 50000, '2024-02-18');

-- 1. Show all employees.

-- SELECT * FROM Employees

-- 2. Show all departments located in Delhi.

-- SELECT * FROM Departments WHERE Location = 'Delhi';

-- 3. Display names and salaries of employees in the HR department.

-- SELECT EmpName, Salary FROM Employees WHERE DeptID = '1';

-- OR

-- SELECT e.EmpName, 
--     e.Salary
-- FROM Employees e
-- JOIN Departments d ON
--     e.DeptID = d.DeptID
-- WHERE d.DeptName = 'HR';

-- 4. Show employees who earn more than 50,000.

-- SELECT * FROM Employees
-- WHERE Salary > 50000;

-- 5. Show employees who joined in 2024.

-- SELECT * FROM Employees
-- WHERE YEAR(JoinDate) =2024;

-- 6. Display all employees ordered by salary (high to low).

-- SELECT * FROM Employees
-- ORDER BY SALARY DESC;

-- 7. Find the highest salary in the company.

-- SELECT MAX(Salary) As Highest_Salary FROM Employees;

-- 8. Find the total salary paid by each department.

-- SELECT DeptID, SUM(Salary) AS TotalSalary FROM Employees 
-- GROUP BY DeptID;

-- OR

-- SELECT d.DeptName,
--     SUM(e.Salary) AS TotalSalary
-- FROM Employees e
-- JOIN departments d 
--     ON e.DeptID=d.DeptID
-- GROUP BY d.DeptName;

-- 9. Show employee names along with their department names.

-- SELECT e.EmpName, d.DeptName
-- FROM Employees e
-- JOIN departments d
-- 	ON e.DeptID=d.DeptID;

-- 10. Show employees working in Bangalore-based departments.

-- SELECT e.EmpName, d.DeptName, d.Location
-- FROM Employees e
-- JOIN departments d
-- ON e.DEPTID=d.DeptID
-- WHERE d.Location = 'Bangalore';

-- 11. Count how many employees are in each department.

-- SELECT d.DeptName, COUNT(e.EmpID) AS EmployeeCount
-- FROM departments d
-- LEFT JOIN Employees e 
-- ON d.DeptID=e.DeptID
-- GROUP BY d.DeptName

-- OR

-- SELECT 
--     DeptID,
--     COUNT(*) AS EmployeeCount
-- FROM employees
-- GROUP BY DeptID;

-- 12. Show department name that has the highest total salary.

-- SELECT d.DeptName,
-- SUM(e.Salary) AS TotalSalary
-- FROM Employees e
-- JOIN Departments d
-- ON e.DeptID = d.deptID
-- GROUP BY d.DeptName
-- ORDER BY TotalSalary DESC
-- LIMIT 4;

-- OR

SELECT DeptName, TotalSalary
FROM (
    SELECT 
        d.DeptName,
        SUM(e.Salary) AS TotalSalary
    FROM Employees e
    JOIN Departments d
        ON e.DeptID = d.DeptID
    GROUP BY d.DeptName
) AS DeptTotals
WHERE TotalSalary = (
    SELECT MAX(TotalSalary)
    FROM (
        SELECT SUM(Salary) AS TotalSalary
        FROM Employees
        GROUP BY DeptID
    ) AS SalaryTotals
);
