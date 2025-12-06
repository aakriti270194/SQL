
-- SQL Practice Dataset
-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert Customers
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Aakriti', 'Delhi'),
(2, 'Rahul', 'Mumbai'),
(3, 'Sneha', 'Bangalore');

-- Insert Orders
INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(101, 1, '2024-05-05', 5000.00),
(102, 1, '2024-06-10', 7000.00),
(103, 2, '2024-05-15', 4500.00),
(104, 3, '2024-05-20', 8200.00),
(105, 2, '2024-07-01', 3000.00);
