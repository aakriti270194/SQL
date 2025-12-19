
-- SQL Practice Dataset (Version 10: Social Media Analytics System)

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    join_date DATE
);

-- Posts Table
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    post_date DATE,
    content VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Likes Table
CREATE TABLE likes (
    like_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    like_date DATE,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Comments Table
CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(300),
    comment_date DATE,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Followers Table
CREATE TABLE followers (
    follower_id INT,
    following_id INT,
    follow_date DATE,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES users(user_id),
    FOREIGN KEY (following_id) REFERENCES users(user_id)
);

-- Insert Users
INSERT INTO users VALUES
(1, 'aakriti_a', 'aakriti@example.com', 'Delhi', '2023-01-15'),
(2, 'rohan_s', 'rohan@example.com', 'Mumbai', '2023-02-10'),
(3, 'neha_k', 'neha@example.com', 'Bangalore', '2023-03-05'),
(4, 'amit_j', 'amit@example.com', 'Pune', '2023-04-20');

-- Insert Posts
INSERT INTO posts VALUES
(101, 1, '2024-05-01', 'Learning SQL is fun!'),
(102, 2, '2024-05-02', 'Data Analytics journey begins.'),
(103, 3, '2024-05-03', 'Healthcare analytics insights.'),
(104, 1, '2024-06-01', 'Working on SQL portfolio projects.');

-- Insert Likes
INSERT INTO likes VALUES
(201, 101, 2, '2024-05-01'),
(202, 101, 3, '2024-05-01'),
(203, 102, 1, '2024-05-02'),
(204, 103, 4, '2024-05-03'),
(205, 104, 2, '2024-06-01');

-- Insert Comments
INSERT INTO comments VALUES
(301, 101, 3, 'Absolutely agree!', '2024-05-01'),
(302, 102, 4, 'All the best!', '2024-05-02'),
(303, 103, 1, 'Very insightful.', '2024-05-03');

-- Insert Followers
INSERT INTO followers VALUES
(2, 1, '2023-03-01'),
(3, 1, '2023-03-02'),
(4, 2, '2023-04-25'),
(1, 3, '2023-05-10'),
(2, 3, '2023-05-15');
