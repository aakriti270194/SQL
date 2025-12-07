
-- Extended SQL Practice Dataset (Version 2)

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table (Many-to-Many)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(1, 'Aakriti Agrawal', 'aakriti@example.com', 'Delhi'),
(2, 'Rohan Sharma', 'rohan@example.com', 'Mumbai'),
(3, 'Priya Singh', 'priya@example.com', 'Bangalore'),
(4, 'Aman Verma', 'aman@example.com', 'Hyderabad');

-- Insert Products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 55000.00),
(2, 'Mouse', 'Electronics', 800.00),
(3, 'Office Chair', 'Furniture', 6000.00),
(4, 'Notebook', 'Stationery', 40.00),
(5, 'Water Bottle', 'Accessories', 350.00);

-- Insert Orders
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1001, 1, '2024-05-10'),
(1002, 2, '2024-05-22'),
(1003, 3, '2024-06-05'),
(1004, 1, '2024-07-10'),
(1005, 4, '2024-07-15');

-- Insert Order Items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1001, 1, 1),
(2, 1001, 2, 2),
(3, 1002, 3, 1),
(4, 1002, 4, 5),
(5, 1003, 1, 1),
(6, 1003, 5, 3),
(7, 1004, 2, 4),
(8, 1005, 3, 2),
(9, 1005, 5, 1);
