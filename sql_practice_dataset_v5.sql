
-- SQL Practice Dataset (Version 5: Banking & Credit Risk System)

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150),
    age INT,
    city VARCHAR(100),
    income DECIMAL(12,2)
);

-- Loans Table
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(100),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid DECIMAL(12,2),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- Credit Scores Table
CREATE TABLE credit_scores (
    score_id INT PRIMARY KEY,
    customer_id INT,
    score INT,
    score_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert Customers
INSERT INTO customers (customer_id, customer_name, age, city, income) VALUES
(1, 'Aakriti Agrawal', 29, 'Delhi', 850000),
(2, 'Rohan Sharma', 35, 'Mumbai', 1200000),
(3, 'Priya Verma', 41, 'Bangalore', 950000),
(4, 'Aman Gupta', 30, 'Chennai', 650000);

-- Insert Loans
INSERT INTO loans (loan_id, customer_id, loan_type, loan_amount, interest_rate, loan_date, status) VALUES
(101, 1, 'Home Loan', 4500000, 7.5, '2023-01-15', 'Active'),
(102, 2, 'Car Loan', 900000, 9.2, '2022-11-10', 'Closed'),
(103, 3, 'Personal Loan', 350000, 12.5, '2024-03-05', 'Approved'),
(104, 4, 'Education Loan', 600000, 10.0, '2021-06-20', 'Active');

-- Insert Payments
INSERT INTO payments (payment_id, loan_id, payment_date, amount_paid) VALUES
(1, 101, '2024-01-01', 50000),
(2, 101, '2024-02-01', 50000),
(3, 102, '2023-03-15', 45000),
(4, 102, '2023-04-15', 45000),
(5, 104, '2024-05-01', 30000),
(6, 104, '2024-06-01', 30000);

-- Insert Credit Scores
INSERT INTO credit_scores (score_id, customer_id, score, score_date) VALUES
(1, 1, 780, '2024-01-01'),
(2, 2, 710, '2024-01-01'),
(3, 3, 650, '2024-01-01'),
(4, 4, 590, '2024-01-01');
