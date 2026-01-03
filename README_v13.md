
# SQL Practice Dataset – Version 13  
## Advanced Banking Transactions System

This repository contains **Version 13 of the SQL Practice Dataset**, focused on **Advanced Banking & Financial Transactions**.  
It is designed for **Data Analysts, Finance Professionals, and SQL Interview Preparation**, simulating real-world banking operations.

---

## 📌 Project Objective

This dataset helps you:
- Practice **advanced SQL joins & aggregations**
- Understand **banking transaction flows**
- Analyze **customer behavior & account activity**
- Work with **loan and EMI data**
- Build a **finance-focused SQL portfolio project**

---

## 🏦 Domain Coverage
- Retail Banking  
- Account Transactions  
- Loan Management  
- EMI / Payment Tracking  
- Financial Reporting  

---

## 🗂️ Database Schema Overview

### Tables Included

| Table Name        | Description |
|------------------|-------------|
| `banks`          | Bank master information |
| `customers`      | Customer demographic details |
| `accounts`       | Bank accounts with balances |
| `transactions`  | Debit & credit transaction history |
| `loans`          | Loan master data |
| `loan_payments` | Loan EMI / payment records |

---

## 🔗 Entity Relationships

- One **bank** → many **accounts**
- One **customer** → multiple **accounts**
- One **account** → many **transactions**
- One **customer** → multiple **loans**
- One **loan** → many **loan payments**

All relationships are enforced using **foreign keys**.

---

## 📊 Sample Analysis You Can Perform

- Account-wise debit vs credit analysis  
- Monthly transaction trends  
- High-value transaction detection  
- Customer banking behavior profiling  
- Loan outstanding & repayment tracking  
- EMI consistency analysis  

---

## 🧠 Example SQL Practice Questions

```sql
-- 1. Find total debit and credit amount per account
-- 2. Identify customers with highest transaction volume
-- 3. Monthly transaction summary per bank
-- 4. Active loans with total EMI paid
-- 5. Customers having both loans and savings accounts
```

---

## ⚙️ How to Use

1. Download `sql_practice_dataset_v13.sql`
2. Import into:
   - MySQL  
   - PostgreSQL  
   - SQLite (minor syntax adjustments)
3. Start writing analytical queries

---

## 📁 Recommended Repository Structure

```
sql-practice-banking-advanced/
├── sql_practice_dataset_v13.sql
└── README.md
```

---

## 🚀 Who Should Use This Dataset?

- SQL Learners (Intermediate to Advanced)
- Data Analysts & BI Professionals
- Banking & Finance Professionals
- Interview Preparation Candidates
- Portfolio Builders

---

## ⭐ Future Enhancements
- Credit card transactions  
- Fraud-flag indicators  
- Customer risk scores  
- Daily transaction volumes (large scale data)

---

## 👤 Author
Created for **SQL practice, learning, and professional portfolio development**.  
Feel free to fork, star ⭐, and contribute.

Happy Querying! 🚀
