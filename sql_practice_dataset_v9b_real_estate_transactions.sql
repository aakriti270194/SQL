
-- SQL Practice Dataset (Version 9B: Real Estate Transactions & Brokerage)

-- Agents
CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- Sellers
CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- Buyers
CREATE TABLE buyers (
    buyer_id INT PRIMARY KEY,
    buyer_name VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- Listings
CREATE TABLE listings (
    listing_id INT PRIMARY KEY,
    seller_id INT,
    agent_id INT,
    property_type VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    list_price DECIMAL(12,2),
    list_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Offers
CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    listing_id INT,
    buyer_id INT,
    offer_price DECIMAL(12,2),
    offer_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id)
);

-- Transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    listing_id INT,
    buyer_id INT,
    agent_id INT,
    sale_price DECIMAL(12,2),
    close_date DATE,
    commission_rate DECIMAL(5,2),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Sample Data
INSERT INTO agents VALUES
(1, 'Aakriti Agrawal', 'aakriti.agent@example.com', '9876543210', 'Delhi'),
(2, 'Rohan Mehta', 'rohan.agent@example.com', '9123456789', 'Mumbai');

INSERT INTO sellers VALUES
(101, 'Neha Kapoor', 'neha.seller@example.com', '9988776655', 'Delhi'),
(102, 'Amit Verma', 'amit.seller@example.com', '8899776655', 'Mumbai');

INSERT INTO buyers VALUES
(201, 'Arjun Singh', 'arjun.buyer@example.com', '7766554433', 'Delhi'),
(202, 'Priya Nair', 'priya.buyer@example.com', '6655443322', 'Bangalore');

INSERT INTO listings VALUES
(301, 101, 1, 'Apartment', 'Delhi', 'Dwarka Sector 10', 8200000, '2024-01-10', 'Sold'),
(302, 102, 2, 'Villa', 'Mumbai', 'Powai Hills', 21500000, '2024-02-05', 'Under Contract');

INSERT INTO offers VALUES
(401, 301, 201, 8000000, '2024-01-20', 'Accepted'),
(402, 302, 202, 21000000, '2024-02-20', 'Countered');

INSERT INTO transactions VALUES
(501, 301, 201, 1, 8050000, '2024-02-15', 2.0);
