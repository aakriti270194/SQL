
-- SQL Practice Dataset (Version 4: Retail Sales & Inventory System)

-- Stores Table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(150),
    city VARCHAR(100),
    manager_name VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    unit_price DECIMAL(10,2)
);

-- Inventory Table
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    store_id INT,
    product_id INT,
    stock_quantity INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    store_id INT,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Stores
INSERT INTO stores (store_id, store_name, city, manager_name) VALUES
(1, 'FreshMart Supermarket', 'Delhi', 'Aakriti Agrawal'),
(2, 'City Grocery Hub', 'Mumbai', 'Rohan Malhotra'),
(3, 'Daily Needs Store', 'Bangalore', 'Neha Kulkarni');

-- Insert Products
INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Organic Rice 5kg', 'Groceries', 450.00),
(102, 'Olive Oil 1L', 'Groceries', 720.00),
(103, 'Shampoo 500ml', 'Personal Care', 180.00),
(104, 'Detergent Powder 2kg', 'Home Care', 320.00),
(105, 'Dark Chocolate 100g', 'Snacks', 90.00);

-- Insert Inventory
INSERT INTO inventory (inventory_id, store_id, product_id, stock_quantity) VALUES
(1, 1, 101, 120),
(2, 1, 102, 80),
(3, 1, 103, 150),
(4, 2, 101, 200),
(5, 2, 104, 60),
(6, 3, 103, 140),
(7, 3, 105, 300);

-- Insert Sales Records
INSERT INTO sales (sale_id, store_id, product_id, sale_date, quantity_sold, total_amount) VALUES
(1, 1, 101, '2024-05-01', 10, 4500.00),
(2, 1, 102, '2024-05-01', 5, 3600.00),
(3, 1, 105, '2024-05-02', 20, 1800.00),
(4, 2, 104, '2024-05-03', 15, 4800.00),
(5, 2, 101, '2024-05-03', 8, 3600.00),
(6, 3, 103, '2024-05-04', 12, 2160.00),
(7, 3, 105, '2024-05-04', 30, 2700.00);
