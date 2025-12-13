
# SQL Practice Dataset – Version 7  
## Healthcare Patient & Medical Record System

This project contains a **Healthcare SQL practice database** designed for learners, analysts, and interview preparation.  
It simulates a real-world hospital environment with patients, doctors, appointments, diagnoses, prescriptions, and lab results.

---

## 📌 Project Objective
The goal of this dataset is to help you:
- Practice **real-world SQL queries**
- Understand **healthcare data relationships**
- Build **portfolio-ready SQL projects**
- Prepare for **Data Analyst / BI / SQL interviews**

---

## 🗂️ Database Schema Overview

### Tables Included

| Table Name        | Description |
|------------------|-------------|
| `hospitals`      | Hospital master data |
| `doctors`        | Doctors with specialties and hospital mapping |
| `patients`       | Patient demographic information |
| `appointments`  | Appointment scheduling and status tracking |
| `diagnoses`     | Medical diagnosis per appointment |
| `prescriptions` | Medicines prescribed during visits |
| `lab_results`   | Lab test results linked to appointments |

---

## 🔗 Relationships
- One **hospital** → many **doctors**
- One **doctor** → many **appointments**
- One **patient** → many **appointments**
- One **appointment** → multiple **diagnoses**, **prescriptions**, and **lab results**

All relationships are enforced using **foreign keys**.

---

## 📊 Sample Analysis You Can Perform

- Patient visit frequency analysis  
- Doctor workload & specialty-wise appointments  
- Hospital-wise patient distribution  
- Diagnosis trends over time  
- Prescription patterns  
- Lab test usage by department  

---

## 🧠 Example SQL Questions

```sql
-- 1. List all completed appointments with patient and doctor names
-- 2. Find number of appointments per doctor
-- 3. Identify patients with multiple visits
-- 4. Show diagnosis history for a specific patient
-- 5. Count appointments by hospital and month
```

---

## ⚙️ How to Use

1. Download `sql_practice_dataset_v7.sql`
2. Import into your SQL environment:
   - MySQL
   - PostgreSQL
   - SQLite (minor syntax adjustments)
3. Start writing analytical queries

---

## 🚀 Who Should Use This?
- SQL Beginners & Intermediate Learners
- Data Analysts & BI Professionals
- Healthcare Analytics Enthusiasts
- Interview Preparation Candidates
- Portfolio Builders

---

## 📁 Repository Structure

```
├── sql_practice_dataset_v7.sql
└── README.md
```

---

## 📌 Future Enhancements
- Billing & insurance tables  
- Doctor schedules  
- Large-scale synthetic data (10k+ rows)  
- Power BI / Tableau dashboards  

---

## ⭐ Author
Created for **SQL practice, learning, and portfolio development**.  
Feel free to fork, star, and contribute!

Happy Querying! 🚀
