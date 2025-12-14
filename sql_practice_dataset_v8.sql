
-- SQL Practice Dataset (Version 8: Logistics & Supply Chain Management System)

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
    quantity_on_hand INT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Purchase Orders Table
CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    expected_delivery DATE,
    status VARCHAR(50)
);

-- Purchase Order Items
CREATE TABLE purchase_order_items (
    po_item_id INT PRIMARY KEY,
    po_id INT,
    product_id INT,
    quantity_ordered INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Shipments Table
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    po_id INT,
    warehouse_id INT,
    shipment_date DATE,
    arrival_date DATE,
    shipment_status VARCHAR(50),
    FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Insert Warehouses
INSERT INTO warehouses (warehouse_id, warehouse_name, city, capacity) VALUES
(1, 'North Hub Warehouse', 'Delhi', 10000),
(2, 'West Hub Warehouse', 'Mumbai', 8000),
(3, 'South Hub Warehouse', 'Bangalore', 12000);

-- Insert Suppliers
INSERT INTO suppliers (supplier_id, supplier_name, city, contact_email) VALUES
(101, 'Global Electronics Ltd', 'Shenzhen', 'contact@globalelec.com'),
(102, 'FreshFoods Supply Co', 'Pune', 'sales@freshfoods.com'),
(103, 'HomeEssentials Pvt Ltd', 'Ahmedabad', 'info@homeessentials.in');

-- Insert Products
INSERT INTO products (product_id, product_name, category, unit_cost) VALUES
(201, 'LED TV 42 Inch', 'Electronics', 22000),
(202, 'Refrigerator 300L', 'Electronics', 28000),
(203, 'Basmati Rice 10kg', 'Groceries', 650),
(204, 'Cooking Oil 5L', 'Groceries', 750),
(205, 'Office Chair', 'Furniture', 5200);

-- Insert Inventory
INSERT INTO inventory (inventory_id, warehouse_id, product_id, quantity_on_hand) VALUES
(1, 1, 201, 120),
(2, 1, 203, 500),
(3, 2, 202, 80),
(4, 2, 204, 300),
(5, 3, 205, 150);

-- Insert Purchase Orders
INSERT INTO purchase_orders (po_id, supplier_id, order_date, expected_delivery, status) VALUES
(301, 101, '2024-04-15', '2024-04-25', 'Received'),
(302, 102, '2024-05-01', '2024-05-08', 'Delivered'),
(303, 103, '2024-05-10', '2024-05-20', 'Delayed');

-- Insert Purchase Order Items
INSERT INTO purchase_order_items (po_item_id, po_id, product_id, quantity_ordered, unit_price) VALUES
(1, 301, 201, 100, 21500),
(2, 301, 202, 50, 27500),
(3, 302, 203, 400, 630),
(4, 302, 204, 250, 730),
(5, 303, 205, 200, 5100);

-- Insert Shipments
INSERT INTO shipments (shipment_id, po_id, warehouse_id, shipment_date, arrival_date, shipment_status) VALUES
(401, 301, 1, '2024-04-18', '2024-04-24', 'Delivered'),
(402, 302, 2, '2024-05-03', '2024-05-07', 'Delivered'),
(403, 303, 3, '2024-05-12', NULL, 'Delayed');

-- End of Dataset
