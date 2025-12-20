
-- SQL Practice Dataset (Version 11: Logistics & Supply Chain Management System)

-- Warehouses Table
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(150),
    city VARCHAR(100),
    capacity INT
);

-- Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(150),
    city VARCHAR(100),
    contact_email VARCHAR(150)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    unit_cost DECIMAL(10,2)
);

-- Inventory Table
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    warehouse_id INT,
    product_id INT,
    quantity INT,
    last_updated DATE,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Shipments Table
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    supplier_id INT,
    warehouse_id INT,
    shipment_date DATE,
    shipment_status VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Shipment Items Table
CREATE TABLE shipment_items (
    shipment_item_id INT PRIMARY KEY,
    shipment_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Warehouses
INSERT INTO warehouses VALUES
(1, 'North Hub', 'Delhi', 10000),
(2, 'West Hub', 'Mumbai', 8000),
(3, 'South Hub', 'Bangalore', 9000);

-- Insert Suppliers
INSERT INTO suppliers VALUES
(101, 'Global Supplies Ltd', 'Delhi', 'contact@globalsupplies.com'),
(102, 'FastTrack Distributors', 'Mumbai', 'sales@fasttrack.com'),
(103, 'Prime Logistics', 'Chennai', 'info@primelogistics.com');

-- Insert Products
INSERT INTO products VALUES
(201, 'Laptop', 'Electronics', 42000),
(202, 'Office Chair', 'Furniture', 5500),
(203, 'Router', 'Networking', 2200),
(204, 'Printer', 'Electronics', 15000);

-- Insert Inventory
INSERT INTO inventory VALUES
(1, 1, 201, 120, '2024-06-01'),
(2, 1, 202, 200, '2024-06-01'),
(3, 2, 203, 300, '2024-06-02'),
(4, 2, 204, 80, '2024-06-02'),
(5, 3, 201, 150, '2024-06-03');

-- Insert Shipments
INSERT INTO shipments VALUES
(301, 101, 1, '2024-05-20', 'Delivered'),
(302, 102, 2, '2024-05-22', 'Delivered'),
(303, 103, 3, '2024-05-25', 'In Transit');

-- Insert Shipment Items
INSERT INTO shipment_items VALUES
(401, 301, 201, 50),
(402, 301, 202, 100),
(403, 302, 203, 150),
(404, 302, 204, 40),
(405, 303, 201, 60);
