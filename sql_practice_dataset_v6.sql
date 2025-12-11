
-- SQL Practice Dataset (Version 6: E-commerce System — scalable to 5000+ rows)

-- USERS TABLE
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(150),
    email VARCHAR(200),
    city VARCHAR(100),
    signup_date DATE
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    order_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ORDER ITEMS TABLE
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- REVIEWS TABLE
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- SAMPLE INSERTS (Small dataset preview)
-- USERS
INSERT INTO users (user_id, user_name, email, city, signup_date) VALUES
(1, 'Aakriti Agrawal', 'aakriti@example.com', 'Delhi', '2023-01-10'),
(2, 'Rohan Sharma', 'rohan@example.com', 'Mumbai', '2022-12-20'),
(3, 'Neha Kapoor', 'neha@example.com', 'Bangalore', '2023-02-14');

-- PRODUCTS
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Wireless Earbuds', 'Electronics', 2499),
(102, 'Yoga Mat', 'Fitness', 799),
(103, 'Bluetooth Speaker', 'Electronics', 1599),
(104, 'Running Shoes', 'Footwear', 2999),
(105, 'LED Study Lamp', 'Home Decor', 899);

-- ORDERS
INSERT INTO orders (order_id, user_id, order_date, order_status) VALUES
(5001, 1, '2024-05-02', 'Delivered'),
(5002, 1, '2024-05-10', 'Shipped'),
(5003, 2, '2024-06-01', 'Delivered');

-- ORDER ITEMS
INSERT INTO order_items (item_id, order_id, product_id, quantity, total_amount) VALUES
(1, 5001, 101, 1, 2499),
(2, 5001, 102, 2, 1598),
(3, 5002, 103, 1, 1599),
(4, 5003, 105, 1, 899);

-- REVIEWS
INSERT INTO reviews (review_id, user_id, product_id, rating, review_date) VALUES
(1, 1, 101, 5, '2024-05-05'),
(2, 1, 102, 4, '2024-05-07'),
(3, 2, 105, 5, '2024-06-03');
