
-- Advanced SQL Queries & Solutions
-- Version 13: Advanced Banking Transactions System

-- 1. Total Debit vs Credit Amount per Account
SELECT 
    account_id,
    SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END) AS total_debit,
    SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) AS total_credit
FROM transactions
GROUP BY account_id;

-- 2. Monthly Transaction Summary
SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    EXTRACT(MONTH FROM transaction_date) AS month,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY year, month
ORDER BY year, month;

-- 3. Top Customers by Transaction Volume
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_transaction_amount DESC;

-- 4. Running Account Balance (Window Function)
SELECT
    account_id,
    transaction_date,
    transaction_type,
    amount,
    SUM(
        CASE 
            WHEN transaction_type = 'Credit' THEN amount
            ELSE -amount
        END
    ) OVER (PARTITION BY account_id ORDER BY transaction_date) AS running_balance
FROM transactions
ORDER BY account_id, transaction_date;

-- 5. Customers with Both Accounts and Loans
SELECT DISTINCT 
    c.customer_id, 
    c.customer_name
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN loans l ON c.customer_id = l.customer_id;

-- 6. Active Loans with Total EMI Paid
SELECT 
    l.loan_id,
    c.customer_name,
    l.loan_type,
    l.principal_amount,
    SUM(lp.amount_paid) AS total_emi_paid
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
LEFT JOIN loan_payments lp ON l.loan_id = lp.loan_id
WHERE l.status = 'Active'
GROUP BY l.loan_id, c.customer_name, l.loan_type, l.principal_amount;

-- 7. Outstanding Loan Amount
SELECT 
    l.loan_id,
    c.customer_name,
    l.principal_amount - COALESCE(SUM(lp.amount_paid), 0) AS outstanding_amount
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
LEFT JOIN loan_payments lp ON l.loan_id = lp.loan_id
WHERE l.status = 'Active'
GROUP BY l.loan_id, c.customer_name, l.principal_amount;

-- 8. High-Value Transactions (>50000)
SELECT 
    t.transaction_id,
    c.customer_name,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.amount > 50000
ORDER BY t.amount DESC;

-- 9. Bank-wise Total Deposits
SELECT 
    b.bank_name,
    SUM(t.amount) AS total_deposits
FROM banks b
JOIN accounts a ON b.bank_id = a.bank_id
JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Credit'
GROUP BY b.bank_name;

-- 10. Customers with No Transactions
SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;
