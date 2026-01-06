
# SQL Practice Dataset – Version 14  
## Marketing & Customer Analytics System

This repository contains **Version 14 of the SQL Practice Dataset**, focused on **Marketing Analytics and Customer Behavior Analysis**.  
It is designed for **Data Analysts, Business Analysts, Marketing Analysts, and SQL interview preparation**.

---

## 📌 Project Objective

This dataset helps you:
- Analyze **marketing campaign performance**
- Understand **customer conversion funnels**
- Measure **ROI and revenue attribution**
- Practice **advanced SQL joins, aggregations, and date analysis**
- Build a **business-focused SQL portfolio project**

---

## 📊 Domain Coverage
- Marketing Campaign Analytics  
- Customer Targeting & Segmentation  
- Lead Generation & Conversion  
- Revenue & ROI Analysis  

---

## 🗂️ Database Schema Overview

### Tables Included

| Table Name | Description |
|-----------|-------------|
| `campaigns` | Marketing campaigns with channel, duration & budget |
| `customers` | Customer demographic data |
| `campaign_targets` | Mapping of campaigns to targeted customers |
| `leads` | Lead generation and conversion status |
| `sales` | Revenue generated from customers |

---

## 🔗 Entity Relationships

- One **campaign** → many **targeted customers**
- One **campaign** → many **leads**
- One **customer** → zero or more **sales**
- Leads connect campaigns to customers
- Sales represent final conversion

All relationships are maintained using **foreign keys**.

---

## 📈 Sample Business Questions You Can Answer

- Which campaign generated the highest revenue?
- What is the conversion rate per campaign?
- Which marketing channel has the best ROI?
- How many customers were targeted but never converted?
- What is the month-wise sales trend?

---

## 🧠 Example SQL Practice Questions

```sql
-- Campaign-wise total leads
-- Conversion rate per campaign
-- Revenue and ROI per campaign
-- Funnel analysis (Target → Lead → Sale)
-- Channel-wise budget utilization
```

---

## ⚙️ How to Use

1. Download `sql_practice_dataset_v14.sql`
2. Import into:
   - MySQL  
   - PostgreSQL  
   - SQLite (minor syntax adjustments)
3. Run queries from `advanced_queries_v14.sql`

---

## 📁 Recommended Repository Structure

```
sql-practice-marketing-analytics/
├── sql_practice_dataset_v14.sql
├── advanced_queries_v14.sql
└── README.md
```

---

## 🚀 Who Should Use This Dataset?

- SQL Learners (Intermediate level)
- Marketing & Growth Analysts
- Business Analysts
- Data Analysts preparing for interviews
- Portfolio Builders

---

## ⭐ Future Enhancements
- Customer lifetime value (CLV) table  
- Multi-touch attribution modeling  
- Campaign cost breakdown  
- Large-scale synthetic data  

---

## 👤 Author
Created for **SQL learning, interview preparation, and portfolio development**.  
Feel free to fork ⭐, star ⭐, and contribute.

Happy Analyzing! 🚀
