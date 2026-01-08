
-- SQL Practice Dataset (Version 15: SaaS Subscription & Revenue Analytics System)

-- Plans Table
CREATE TABLE plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(100),
    monthly_price DECIMAL(10,2)
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150),
    country VARCHAR(100),
    signup_date DATE
);

-- Subscriptions Table
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    subscription_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

-- Churn Reasons Table
CREATE TABLE churn_reasons (
    churn_id INT PRIMARY KEY,
    subscription_id INT,
    reason VARCHAR(200),
    churn_date DATE,
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

-- Insert Plans
INSERT INTO plans VALUES
(1, 'Basic', 999),
(2, 'Pro', 1999),
(3, 'Enterprise', 4999);

-- Insert Customers
INSERT INTO customers VALUES
(101, 'Aakriti Agrawal', 'India', '2023-01-10'),
(102, 'Rohan Mehta', 'India', '2023-02-15'),
(103, 'Neha Sharma', 'USA', '2023-03-05'),
(104, 'Amit Verma', 'UK', '2023-04-01');

-- Insert Subscriptions
INSERT INTO subscriptions VALUES
(201, 101, 2, '2023-01-15', NULL, 'Active'),
(202, 102, 1, '2023-02-20', '2024-03-01', 'Cancelled'),
(203, 103, 3, '2023-03-10', NULL, 'Active'),
(204, 104, 2, '2023-04-05', '2024-02-15', 'Cancelled');

-- Insert Payments
INSERT INTO payments VALUES
(301, 201, '2024-05-01', 1999),
(302, 201, '2024-06-01', 1999),
(303, 202, '2024-01-01', 999),
(304, 203, '2024-05-01', 4999),
(305, 203, '2024-06-01', 4999),
(306, 204, '2024-01-01', 1999);

-- Insert Churn Reasons
INSERT INTO churn_reasons VALUES
(401, 202, 'Too expensive', '2024-03-01'),
(402, 204, 'Switched to competitor', '2024-02-15');
