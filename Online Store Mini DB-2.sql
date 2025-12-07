-- CREATE TABLE Customers (
-- CustomerID INT PRIMARY KEY,
-- CustomerName VARCHAR (50),
-- City VARCHAR (50),
-- JoinDate date
-- );

-- CREATE TABLE Orders (
-- OrderID INT PRIMARY KEY,
-- CustomerID INT,
-- OrderDate DATE,
-- Amount DECIMAL (10,2),
-- FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
-- );


-- INSERT INTO Customers Value 
-- (1, 'Aakriti', 'Delhi', '2024-01-15'),
-- (2, 'Rohan', 'Mumbai', '2024-03-10'),
-- (3, 'Simran', 'Bangalore', '2024-02-05'),
-- (4, 'Amit', 'Delhi', '2024-04-22');

-- INSERT INTO Orders VALUES
-- (101, 1, '2024-04-01', 2500.00),
-- (102, 1, '2024-05-15', 1500.00),
-- (103, 2, '2024-04-20', 3000.00),
-- (104, 3, '2024-05-18', 1200.00),
-- (105, 3, '2024-06-01', 1800.00),
-- (106, 4, '2024-05-05', 500.00);

-- Display all orders placed in May 2024.
-- SELECT * 
-- from Orders 
-- WHERE MONTH(OrderDate) = 5
-- AND YEAR (OrderDate) = 2024;

-- List orders having an amount greater than 1500.
-- SELECT * FROM Orders WHERE Amount > 1500;

-- Show all customers ordered by their JoinDate (oldest first).
-- SELECT * FROM Customers ORDER BY JoinDate DESC;

-- Find the total order amount by each customer.
-- SELECT CustomerID, SUM(Amount) AS TotalAmount FROM Orders GROUP BY CustomerID;

-- OR

-- SELECT c.CustomerName, SUM(o.Amount) AS TotalAmount FROM Customers c
-- JOIN Orders o ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerName;

-- Find the highest order amount in the database.
-- SELECT * FROM Orders WHERE Amount = (SELECT MAX(Amount) FROM Orders);

-- OR

-- SELECT MAX(Amount) AS HighestOrderAmount FROM Orders;

-- OR

-- SELECT 
-- c.CustomerName, o.Amount FROM Orders o
-- JOIN Customers c ON o.CustomerID= c.CustomerID
-- WHERE o.Amount = (SELECT MAX(Amount) FROM Orders);

-- Count how many orders each customer has placed.

-- SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
-- FROM Customers c 
-- LEFT JOIN Orders o
--  ON c.CustomerID= o.CustomerID
-- GROUP BY c.CustomerName;

-- OR

-- SELECT CustomerID, COUNT(*) AS OrderCount
-- FROM Orders
-- GROUP BY CustomerID;

-- Show customer names along with their order amount.

-- SELECT 
--     c.CustomerName, 
--     o.OrderID,
--     o.Amount
-- FROM Customers c 
-- JOIN Orders o ON c.CustomerID = o.CustomerID;

-- OR

-- SELECT
--      c.CustomerName,
--      SUM(o.Amount) AS TotalAmount
-- FROM Customers c
-- JOIN Orders o 
-- 	ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerName;

-- OR

-- SELECT 
--       c.CustomerName,
--       o.Amount
-- FROM Customers c
-- LEFT JOIN Orders o
-- ON c.CustomerID = o.CustomerID;

-- Show customers who have never placed an order.

-- SELECT 
--      c.CustomerName,
--      c.CustomerID
-- FROM Customers c
-- LEFT JOIN Orders o
-- 	ON c.CustomerID = o.CustomerID
-- WHERE o.OrderID IS NULL;

-- OR
 
   -- SELECT * FROM Customers
--    WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- OR

-- SELECT * FROM Customers c
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM Orders o
--     WHERE o.CustomerID =c.CustomerID);