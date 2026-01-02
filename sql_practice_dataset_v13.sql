
-- SQL Practice Dataset (Version 13: Advanced Banking Transactions System)

-- Banks Table
CREATE TABLE banks (
    bank_id INT PRIMARY KEY,
    bank_name VARCHAR(150),
    country VARCHAR(100)
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150),
    date_of_birth DATE,
    city VARCHAR(100)
);

-- Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    bank_id INT,
    account_type VARCHAR(50),
    open_date DATE,
    balance DECIMAL(14,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (bank_id) REFERENCES banks(bank_id)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(50),
    amount DECIMAL(14,2),
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Loans Table
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(100),
    principal_amount DECIMAL(14,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Loan Payments Table
CREATE TABLE loan_payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid DECIMAL(14,2),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- Insert Banks
INSERT INTO banks VALUES
(1, 'National Bank of India', 'India'),
(2, 'Global Trust Bank', 'India');

-- Insert Customers
INSERT INTO customers VALUES
(101, 'Aakriti Agrawal', '1996-08-12', 'Delhi'),
(102, 'Rohan Mehta', '1988-04-22', 'Mumbai'),
(103, 'Neha Sharma', '1992-11-10', 'Bangalore');

-- Insert Accounts
INSERT INTO accounts VALUES
(1001, 101, 1, 'Savings', '2020-01-15', 250000),
(1002, 102, 1, 'Current', '2019-06-10', 450000),
(1003, 103, 2, 'Savings', '2021-03-05', 180000);

-- Insert Transactions
INSERT INTO transactions VALUES
(5001, 1001, '2024-05-01', 'Debit', 15000, 'ATM Withdrawal'),
(5002, 1001, '2024-05-05', 'Credit', 40000, 'Salary Credit'),
(5003, 1002, '2024-05-03', 'Debit', 80000, 'Vendor Payment'),
(5004, 1003, '2024-05-06', 'Credit', 20000, 'Freelance Income'),
(5005, 1003, '2024-05-08', 'Debit', 10000, 'Online Shopping');

-- Insert Loans
INSERT INTO loans VALUES
(2001, 101, 'Home Loan', 3500000, 7.8, '2021-02-01', 'Active'),
(2002, 102, 'Car Loan', 900000, 9.5, '2020-07-01', 'Closed');

-- Insert Loan Payments
INSERT INTO loan_payments VALUES
(3001, 2001, '2024-05-10', 35000),
(3002, 2001, '2024-06-10', 35000),
(3003, 2002, '2023-12-01', 45000);
