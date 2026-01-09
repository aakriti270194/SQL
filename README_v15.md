
# SQL Practice Dataset – Version 15  
## SaaS Subscription & Revenue Analytics System

This repository contains **Version 15 of the SQL Practice Dataset**, focused on **SaaS subscription lifecycle, revenue analytics, and churn analysis**.  
It is ideal for **Data Analysts, Product Analysts, Growth Analysts, and SQL interview preparation**.

---

## 📌 Project Objective

This dataset helps you:
- Analyze **subscription-based business models**
- Calculate **SaaS KPIs (MRR, churn, ARPU)**
- Track **customer lifecycle from signup to churn**
- Practice **advanced SQL joins and aggregations**
- Build a **product & revenue analytics portfolio project**

---

## 🚀 Domain Coverage
- SaaS & Subscription Analytics  
- Revenue & Payments Tracking  
- Customer Retention & Churn  
- Pricing & Plan Performance  

---

## 🗂️ Database Schema Overview

### Tables Included

| Table Name | Description |
|-----------|-------------|
| `plans` | Subscription plans & monthly pricing |
| `customers` | Customer demographic details |
| `subscriptions` | Subscription lifecycle (active / cancelled) |
| `payments` | Recurring payment transactions |
| `churn_reasons` | Reasons for subscription cancellation |

---

## 🔗 Entity Relationships

- One **plan** → many **subscriptions**
- One **customer** → one or more **subscriptions**
- One **subscription** → many **payments**
- One **cancelled subscription** → zero or one **churn reason**

All relationships are enforced using **foreign keys**.

---

## 📊 Key Business Metrics You Can Calculate

- Monthly Recurring Revenue (MRR)
- Active vs churned subscriptions
- Revenue by plan & country
- Customer churn rate
- Average Revenue Per User (ARPU)
- Customer lifetime value (basic)

---

## 🧠 Example SQL Practice Questions

```sql
-- Calculate monthly recurring revenue (MRR)
-- Find churned customers per month
-- Revenue contribution by each plan
-- Identify top-paying customers
-- Analyze churn reasons frequency
```

---

## ⚙️ How to Use

1. Download `sql_practice_dataset_v15.sql`
2. Import into:
   - MySQL  
   - PostgreSQL  
   - SQLite (minor syntax adjustments)
3. Run analytical queries or add `advanced_queries_v15.sql`

---

## 📁 Recommended Repository Structure

```
sql-practice-saas-analytics/
├── sql_practice_dataset_v15.sql
├── advanced_queries_v15.sql   (optional)
└── README.md
```

---

## 🎯 Who Should Use This Dataset?

- SQL Learners (Intermediate to Advanced)
- SaaS & Product Analysts
- Business & Revenue Analysts
- Data Analysts preparing for interviews
- Portfolio Builders

---

## ⭐ Future Enhancements
- Usage / activity tracking table  
- Cohort analysis support  
- Refunds & upgrades  
- Large-scale synthetic SaaS data  

---

## 👤 Author
Created for **SQL learning, SaaS analytics practice, and portfolio development**.  
Feel free to fork ⭐, star ⭐, and contribute.

Happy Analyzing SaaS Data! 🚀
