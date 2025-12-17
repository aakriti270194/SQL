
-- SQL Practice Dataset (Version 9: Real Estate & Property Management System)

-- Owners Table
CREATE TABLE owners (
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- Properties Table
CREATE TABLE properties (
    property_id INT PRIMARY KEY,
    owner_id INT,
    property_type VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    purchase_date DATE,
    property_value DECIMAL(12,2),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

-- Tenants Table
CREATE TABLE tenants (
    tenant_id INT PRIMARY KEY,
    tenant_name VARCHAR(150),
    phone VARCHAR(20),
    occupation VARCHAR(100)
);

-- Leases Table
CREATE TABLE leases (
    lease_id INT PRIMARY KEY,
    property_id INT,
    tenant_id INT,
    lease_start DATE,
    lease_end DATE,
    monthly_rent DECIMAL(10,2),
    security_deposit DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id)
);

-- Payments Table
CREATE TABLE rent_payments (
    payment_id INT PRIMARY KEY,
    lease_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(50),
    FOREIGN KEY (lease_id) REFERENCES leases(lease_id)
);

-- Insert Owners
INSERT INTO owners VALUES
(1, 'Aakriti Agrawal', '9876543210', 'Delhi'),
(2, 'Rohit Sharma', '9123456789', 'Mumbai'),
(3, 'Neha Verma', '9988776655', 'Bangalore');

-- Insert Properties
INSERT INTO properties VALUES
(101, 1, 'Apartment', 'Delhi', 'Dwarka Sector 10', '2019-06-15', 8500000),
(102, 2, 'Villa', 'Mumbai', 'Andheri West', '2018-03-20', 22000000),
(103, 3, 'Office', 'Bangalore', 'Whitefield', '2020-11-10', 15000000);

-- Insert Tenants
INSERT INTO tenants VALUES
(201, 'Rahul Mehta', '9001122334', 'Software Engineer'),
(202, 'Pooja Nair', '9887766554', 'Marketing Manager'),
(203, 'Amit Joshi', '9776655443', 'Startup Founder');

-- Insert Leases
INSERT INTO leases VALUES
(301, 101, 201, '2023-01-01', '2024-12-31', 35000, 70000, 'Active'),
(302, 102, 202, '2022-06-01', '2024-05-31', 85000, 170000, 'Closed'),
(303, 103, 203, '2023-09-01', '2026-08-31', 120000, 240000, 'Active');

-- Insert Rent Payments
INSERT INTO rent_payments VALUES
(401, 301, '2024-05-01', 35000, 'Paid'),
(402, 301, '2024-06-01', 35000, 'Paid'),
(403, 302, '2024-04-01', 85000, 'Paid'),
(404, 303, '2024-05-01', 120000, 'Paid'),
(405, 303, '2024-06-01', 120000, 'Late');
