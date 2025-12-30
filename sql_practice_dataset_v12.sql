
-- SQL Practice Dataset (Version 12: Finance & Accounting System)

-- Companies Table
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(150),
    industry VARCHAR(100),
    city VARCHAR(100)
);

-- Accounts Table (Chart of Accounts)
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(150),
    account_type VARCHAR(50)
);

-- Journal Entries Table
CREATE TABLE journal_entries (
    journal_id INT PRIMARY KEY,
    company_id INT,
    entry_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Journal Lines Table
CREATE TABLE journal_lines (
    line_id INT PRIMARY KEY,
    journal_id INT,
    account_id INT,
    debit DECIMAL(12,2),
    credit DECIMAL(12,2),
    FOREIGN KEY (journal_id) REFERENCES journal_entries(journal_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Invoices Table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    company_id INT,
    customer_name VARCHAR(150),
    invoice_date DATE,
    invoice_amount DECIMAL(12,2),
    status VARCHAR(50),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    amount_paid DECIMAL(12,2),
    payment_mode VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

-- Insert Companies
INSERT INTO companies VALUES
(1, 'Alpha Technologies', 'IT Services', 'Bangalore'),
(2, 'Bright Finance Ltd', 'Financial Services', 'Mumbai');

-- Insert Accounts
INSERT INTO accounts VALUES
(101, 'Cash', 'Asset'),
(102, 'Accounts Receivable', 'Asset'),
(103, 'Accounts Payable', 'Liability'),
(104, 'Revenue', 'Revenue'),
(105, 'Office Expenses', 'Expense');

-- Insert Journal Entries
INSERT INTO journal_entries VALUES
(1001, 1, '2024-05-01', 'Office rent payment'),
(1002, 1, '2024-05-10', 'Client invoice generated'),
(1003, 2, '2024-05-15', 'Utility bill payment');

-- Insert Journal Lines
INSERT INTO journal_lines VALUES
(1, 1001, 105, 25000, 0),
(2, 1001, 101, 0, 25000),
(3, 1002, 102, 50000, 0),
(4, 1002, 104, 0, 50000),
(5, 1003, 105, 8000, 0),
(6, 1003, 101, 0, 8000);

-- Insert Invoices
INSERT INTO invoices VALUES
(2001, 1, 'XYZ Corp', '2024-05-10', 50000, 'Paid'),
(2002, 2, 'ABC Industries', '2024-05-20', 75000, 'Unpaid');

-- Insert Payments
INSERT INTO payments VALUES
(3001, 2001, '2024-05-25', 50000, 'Bank Transfer');
