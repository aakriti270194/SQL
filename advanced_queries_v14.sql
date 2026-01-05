
-- Advanced SQL Queries & Solutions
-- Version 14: Marketing & Customer Analytics System

-- 1. Campaign-wise Total Leads
SELECT 
    c.campaign_name,
    COUNT(l.lead_id) AS total_leads
FROM campaigns c
LEFT JOIN leads l ON c.campaign_id = l.campaign_id
GROUP BY c.campaign_name;

-- 2. Campaign Conversion Rate
SELECT
    c.campaign_name,
    COUNT(CASE WHEN l.lead_status = 'Converted' THEN 1 END) * 100.0 /
    NULLIF(COUNT(l.lead_id), 0) AS conversion_rate_percentage
FROM campaigns c
LEFT JOIN leads l ON c.campaign_id = l.campaign_id
GROUP BY c.campaign_name;

-- 3. Revenue Generated per Campaign
SELECT
    c.campaign_name,
    SUM(s.sale_amount) AS total_revenue
FROM campaigns c
JOIN campaign_targets ct ON c.campaign_id = ct.campaign_id
JOIN sales s ON ct.customer_id = s.customer_id
GROUP BY c.campaign_name;

-- 4. ROI per Campaign
SELECT
    c.campaign_name,
    c.budget,
    SUM(s.sale_amount) AS revenue,
    (SUM(s.sale_amount) - c.budget) AS roi
FROM campaigns c
JOIN campaign_targets ct ON c.campaign_id = ct.campaign_id
JOIN sales s ON ct.customer_id = s.customer_id
GROUP BY c.campaign_name, c.budget;

-- 5. Funnel Analysis (Target → Lead → Sale)
SELECT
    c.campaign_name,
    COUNT(DISTINCT ct.customer_id) AS targeted_customers,
    COUNT(DISTINCT l.customer_id) AS leads_generated,
    COUNT(DISTINCT s.customer_id) AS converted_customers
FROM campaigns c
LEFT JOIN campaign_targets ct ON c.campaign_id = ct.campaign_id
LEFT JOIN leads l ON c.campaign_id = l.campaign_id
LEFT JOIN sales s ON l.customer_id = s.customer_id
GROUP BY c.campaign_name;

-- 6. Top Customers by Revenue
SELECT
    cu.customer_name,
    SUM(s.sale_amount) AS total_spent
FROM customers cu
JOIN sales s ON cu.customer_id = s.customer_id
GROUP BY cu.customer_name
ORDER BY total_spent DESC;

-- 7. Channel-wise Campaign Performance
SELECT
    channel,
    COUNT(DISTINCT campaign_id) AS total_campaigns,
    SUM(budget) AS total_budget
FROM campaigns
GROUP BY channel;

-- 8. Customers Targeted but Never Converted
SELECT DISTINCT
    cu.customer_name
FROM customers cu
JOIN campaign_targets ct ON cu.customer_id = ct.customer_id
LEFT JOIN sales s ON cu.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

-- 9. Average Sale Amount
SELECT
    AVG(sale_amount) AS avg_sale_value
FROM sales;

-- 10. Month-wise Sales Trend
SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(sale_amount) AS monthly_sales
FROM sales
GROUP BY year, month
ORDER BY year, month;
