-- ===========================================================
-- DATABASE SETUP
-- ===========================================================
DROP DATABASE IF EXISTS smart_shop_db;
CREATE DATABASE smart_shop_db;
USE smart_shop_db;

-- ===========================================================
-- USERS TABLE
-- ===========================================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    age INT,
    city VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, age, city) VALUES
('User 1','user1@example.com',21,'City1'),
('User 2','user2@example.com',22,'City2'),
('User 3','user3@example.com',23,'City3'),
('User 4','user4@example.com',24,'City4'),
('User 5','user5@example.com',25,'City5'),
('User 6','user6@example.com',26,'City6'),
('User 7','user7@example.com',27,'City7'),
('User 8','user8@example.com',28,'City8'),
('User 9','user9@example.com',29,'City9'),
('User 10','user10@example.com',30,'City10'),
('User 11','user11@example.com',21,'City11'),
('User 12','user12@example.com',22,'City12'),
('User 13','user13@example.com',23,'City13'),
('User 14','user14@example.com',24,'City14'),
('User 15','user15@example.com',25,'City15'),
('User 16','user16@example.com',26,'City16'),
('User 17','user17@example.com',27,'City17'),
('User 18','user18@example.com',28,'City18'),
('User 19','user19@example.com',29,'City19'),
('User 20','user20@example.com',30,'City20'),
('User 21','user21@example.com',21,'City21'),
('User 22','user22@example.com',22,'City22'),
('User 23','user23@example.com',23,'City23'),
('User 24','user24@example.com',24,'City24'),
('User 25','user25@example.com',25,'City25'),
('User 26','user26@example.com',26,'City26'),
('User 27','user27@example.com',27,'City27'),
('User 28','user28@example.com',28,'City28'),
('User 29','user29@example.com',29,'City29'),
('User 30','user30@example.com',30,'City30'),
('User 31','user31@example.com',21,'City31'),
('User 32','user32@example.com',22,'City32'),
('User 33','user33@example.com',23,'City33'),
('User 34','user34@example.com',24,'City34'),
('User 35','user35@example.com',25,'City35'),
('User 36','user36@example.com',26,'City36'),
('User 37','user37@example.com',27,'City37'),
('User 38','user38@example.com',28,'City38'),
('User 39','user39@example.com',29,'City39'),
('User 40','user40@example.com',30,'City40'),
('User 41','user41@example.com',21,'City41'),
('User 42','user42@example.com',22,'City42'),
('User 43','user43@example.com',23,'City43'),
('User 44','user44@example.com',24,'City44'),
('User 45','user45@example.com',25,'City45'),
('User 46','user46@example.com',26,'City46'),
('User 47','user47@example.com',27,'City47'),
('User 48','user48@example.com',28,'City48'),
('User 49','user49@example.com',29,'City49'),
('User 50','user50@example.com',30,'City50'),
('User 51','user51@example.com',21,'City51'),
('User 52','user52@example.com',22,'City52'),
('User 53','user53@example.com',23,'City53'),
('User 54','user54@example.com',24,'City54'),
('User 55','user55@example.com',25,'City55'),
('User 56','user56@example.com',26,'City56'),
('User 57','user57@example.com',27,'City57'),
('User 58','user58@example.com',28,'City58'),
('User 59','user59@example.com',29,'City59'),
('User 60','user60@example.com',30,'City60'),
('User 61','user61@example.com',21,'City61'),
('User 62','user62@example.com',22,'City62'),
('User 63','user63@example.com',23,'City63'),
('User 64','user64@example.com',24,'City64'),
('User 65','user65@example.com',25,'City65'),
('User 66','user66@example.com',26,'City66'),
('User 67','user67@example.com',27,'City67'),
('User 68','user68@example.com',28,'City68'),
('User 69','user69@example.com',29,'City69'),
('User 70','user70@example.com',30,'City70'),
('User 71','user71@example.com',21,'City71'),
('User 72','user72@example.com',22,'City72'),
('User 73','user73@example.com',23,'City73'),
('User 74','user74@example.com',24,'City74'),
('User 75','user75@example.com',25,'City75'),
('User 76','user76@example.com',26,'City76'),
('User 77','user77@example.com',27,'City77'),
('User 78','user78@example.com',28,'City78'),
('User 79','user79@example.com',29,'City79'),
('User 80','user80@example.com',30,'City80'),
('User 81','user81@example.com',21,'City81'),
('User 82','user82@example.com',22,'City82'),
('User 83','user83@example.com',23,'City83'),
('User 84','user84@example.com',24,'City84'),
('User 85','user85@example.com',25,'City85'),
('User 86','user86@example.com',26,'City86'),
('User 87','user87@example.com',27,'City87'),
('User 88','user88@example.com',28,'City88'),
('User 89','user89@example.com',29,'City89'),
('User 90','user90@example.com',30,'City90'),
('User 91','user91@example.com',21,'City91'),
('User 92','user92@example.com',22,'City92'),
('User 93','user93@example.com',23,'City93'),
('User 94','user94@example.com',24,'City94'),
('User 95','user95@example.com',25,'City95'),
('User 96','user96@example.com',26,'City96'),
('User 97','user97@example.com',27,'City97'),
('User 98','user98@example.com',28,'City98'),
('User 99','user99@example.com',29,'City99'),
('User 100','user100@example.com',30,'City100');


-- ===========================================================
-- PRODUCTS TABLE
-- ===========================================================
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120),
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, category, price, stock) VALUES
('Wireless Mouse','Electronics',499.00,120),
('Bluetooth Speaker','Electronics',1999.00,80),
('USB-C Charger','Electronics',899.00,140),
('Gaming Keyboard','Electronics',2499.00,60),
('LED Monitor 24 inch','Electronics',7999.00,40),
('Noise Cancelling Headphones','Electronics',5999.00,55),
('Smartwatch Series A','Electronics',6999.00,70),
('Portable SSD 1TB','Electronics',5499.00,50),
('Wireless Earbuds','Electronics',2499.00,100),
('Laptop Stand','Electronics',1299.00,90),

('Running Shoes','Sports',2999.00,45),
('Yoga Mat','Sports',699.00,100),
('Cricket Bat','Sports',1599.00,30),
('Badminton Racket','Sports',899.00,55),
('Football','Sports',699.00,80),
('Gym Gloves','Sports',299.00,110),
('Skipping Rope','Sports',199.00,150),
('Knee Support','Sports',499.00,70),
('Dumbbells 5kg','Sports',999.00,40),
('Treadmill Lubricant','Sports',199.00,250),

('Coffee Mug','Home',199.00,200),
('Desk Lamp','Home',899.00,90),
('Wall Clock','Home',499.00,70),
('Water Purifier','Home',8999.00,30),
('Electric Kettle','Home',1299.00,75),
('Vacuum Cleaner','Home',4999.00,45),
('Air Purifier','Home',7999.00,35),
('Blender Mixer','Home',2499.00,55),
('Electric Iron','Home',999.00,90),
('Non-Stick Pan','Home',799.00,130),

('Men T-Shirt','Fashion',499.00,200),
('Women Kurti','Fashion',999.00,150),
('Men Jeans','Fashion',1499.00,120),
('Women Saree','Fashion',1999.00,80),
('Jacket Unisex','Fashion',2499.00,50),
('Sneakers','Fashion',2999.00,60),
('Cap','Fashion',199.00,250),
('Sunglasses','Fashion',799.00,180),
('Formal Shoes','Fashion',3499.00,40),
('Wrist Watch Classic','Fashion',1999.00,90),

('Water Bottle','Accessories',249.00,300),
('Travel Backpack','Accessories',1599.00,70),
('Laptop Sleeve','Accessories',899.00,120),
('Wallet','Accessories',599.00,200),
('Belt','Accessories',399.00,180),
('Keychain Metal','Accessories',99.00,350),
('Sling Bag','Accessories',1299.00,90),
('Duffel Bag','Accessories',1999.00,60),
('Handbag Women','Accessories',2499.00,50),
('Phone Case','Accessories',199.00,500),

-- Remaining 50 products (Product 51–100)
('Product 51','Category51',599.00,100),
('Product 52','Category52',699.00,90),
('Product 53','Category53',799.00,80),
('Product 54','Category54',899.00,120),
('Product 55','Category55',999.00,110),
('Product 56','Category56',1099.00,70),
('Product 57','Category57',1199.00,60),
('Product 58','Category58',1299.00,140),
('Product 59','Category59',1399.00,90),
('Product 60','Category60',1499.00,75),
('Product 61','Category61',1599.00,65),
('Product 62','Category62',1699.00,55),
('Product 63','Category63',1799.00,50),
('Product 64','Category64',1899.00,45),
('Product 65','Category65',1999.00,40),
('Product 66','Category66',2099.00,95),
('Product 67','Category67',2199.00,85),
('Product 68','Category68',2299.00,75),
('Product 69','Category69',2399.00,65),
('Product 70','Category70',2499.00,55),
('Product 71','Category71',2599.00,45),
('Product 72','Category72',2699.00,35),
('Product 73','Category73',2799.00,25),
('Product 74','Category74',2899.00,60),
('Product 75','Category75',2999.00,80),
('Product 76','Category76',3099.00,70),
('Product 77','Category77',3199.00,50),
('Product 78','Category78',3299.00,55),
('Product 79','Category79',3399.00,65),
('Product 80','Category80',3499.00,95),
('Product 81','Category81',3599.00,30),
('Product 82','Category82',3699.00,40),
('Product 83','Category83',3799.00,35),
('Product 84','Category84',3899.00,45),
('Product 85','Category85',3999.00,55),
('Product 86','Category86',4099.00,65),
('Product 87','Category87',4199.00,75),
('Product 88','Category88',4299.00,85),
('Product 89','Category89',4399.00,95),
('Product 90','Category90',4499.00,70),
('Product 91','Category91',4599.00,60),
('Product 92','Category92',4699.00,50),
('Product 93','Category93',4799.00,40),
('Product 94','Category94',4899.00,30),
('Product 95','Category95',4999.00,20),
('Product 96','Category96',5099.00,75),
('Product 97','Category97',5199.00,65),
('Product 98','Category98',5299.00,55),
('Product 99','Category99',5399.00,45),
('Product 100','Category100',5499.00,35);


-- ===========================================================
-- ORDERS TABLE
-- ===========================================================
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME,
    total DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (user_id, order_date, total, status) VALUES
(1,'2025-01-01 10:05:00',1999.00,'Completed'),
(2,'2025-01-02 14:20:00',2999.00,'Completed'),
(3,'2025-01-03 11:15:00',1299.00,'Pending'),
(4,'2025-01-04 16:30:00',499.00,'Completed'),
(5,'2025-01-05 09:45:00',899.00,'Completed'),
(6,'2025-01-06 12:10:00',2999.00,'Cancelled'),
(7,'2025-01-07 15:55:00',1599.00,'Completed'),
(8,'2025-01-08 13:40:00',699.00,'Pending'),
(9,'2025-01-09 17:25:00',499.00,'Completed'),
(10,'2025-01-10 19:50:00',249.00,'Completed'),

(11,'2025-01-11 11:05:00',999.00,'Completed'),
(12,'2025-01-12 14:40:00',1599.00,'Completed'),
(13,'2025-01-13 09:30:00',799.00,'Pending'),
(14,'2025-01-14 18:20:00',299.00,'Completed'),
(15,'2025-01-15 16:45:00',1999.00,'Completed'),
(16,'2025-01-16 12:55:00',1399.00,'Completed'),
(17,'2025-01-17 08:25:00',899.00,'Completed'),
(18,'2025-01-18 17:10:00',499.00,'Pending'),
(19,'2025-01-19 15:35:00',2599.00,'Completed'),
(20,'2025-01-20 13:15:00',3499.00,'Completed'),

(21,'2025-01-21 10:00:00',1699.00,'Completed'),
(22,'2025-01-22 14:10:00',1099.00,'Pending'),
(23,'2025-01-23 11:10:00',1899.00,'Completed'),
(24,'2025-01-24 09:50:00',799.00,'Completed'),
(25,'2025-01-25 16:20:00',2299.00,'Completed'),
(26,'2025-01-26 18:15:00',999.00,'Pending'),
(27,'2025-01-27 19:35:00',1599.00,'Completed'),
(28,'2025-01-28 12:30:00',2999.00,'Completed'),
(29,'2025-01-29 17:40:00',1199.00,'Completed'),
(30,'2025-01-30 11:55:00',4999.00,'Cancelled'),

(31,'2025-01-31 15:10:00',799.00,'Completed'),
(32,'2025-02-01 10:20:00',2499.00,'Completed'),
(33,'2025-02-02 14:45:00',999.00,'Completed'),
(34,'2025-02-03 12:50:00',1499.00,'Pending'),
(35,'2025-02-04 17:00:00',1299.00,'Completed'),
(36,'2025-02-05 18:30:00',1999.00,'Completed'),
(37,'2025-02-06 16:10:00',699.00,'Completed'),
(38,'2025-02-07 08:35:00',299.00,'Pending'),
(39,'2025-02-08 19:25:00',2799.00,'Completed'),
(40,'2025-02-09 11:45:00',1599.00,'Completed'),

(41,'2025-02-10 10:50:00',1399.00,'Completed'),
(42,'2025-02-11 13:05:00',2299.00,'Completed'),
(43,'2025-02-12 12:35:00',1599.00,'Pending'),
(44,'2025-02-13 16:20:00',499.00,'Completed'),
(45,'2025-02-14 15:50:00',3499.00,'Completed'),
(46,'2025-02-15 18:40:00',2499.00,'Completed'),
(47,'2025-02-16 09:30:00',999.00,'Completed'),
(48,'2025-02-17 14:55:00',2999.00,'Completed'),
(49,'2025-02-18 17:45:00',2199.00,'Pending'),
(50,'2025-02-19 12:30:00',6999.00,'Completed'),

(51,'2025-02-20 11:00:00',799.00,'Completed'),
(52,'2025-02-21 16:10:00',1599.00,'Pending'),
(53,'2025-02-22 18:35:00',1299.00,'Completed'),
(54,'2025-02-23 17:00:00',3499.00,'Completed'),
(55,'2025-02-24 08:10:00',2499.00,'Completed'),
(56,'2025-02-25 10:40:00',699.00,'Pending'),
(57,'2025-02-26 14:50:00',1099.00,'Completed'),
(58,'2025-02-27 15:25:00',499.00,'Completed'),
(59,'2025-02-28 18:00:00',1999.00,'Completed'),
(60,'2025-03-01 13:20:00',1599.00,'Completed'),

(61,'2025-03-02 12:15:00',799.00,'Pending'),
(62,'2025-03-03 14:45:00',1899.00,'Completed'),
(63,'2025-03-04 11:25:00',2999.00,'Completed'),
(64,'2025-03-05 10:30:00',999.00,'Pending'),
(65,'2025-03-06 18:50:00',499.00,'Completed'),
(66,'2025-03-07 13:40:00',899.00,'Completed'),
(67,'2025-03-08 19:10:00',3499.00,'Pending'),
(68,'2025-03-09 08:55:00',2499.00,'Completed'),
(69,'2025-03-10 09:15:00',1299.00,'Completed'),
(70,'2025-03-11 15:10:00',1999.00,'Completed'),

(71,'2025-03-12 16:05:00',1499.00,'Completed'),
(72,'2025-03-13 17:20:00',1599.00,'Pending'),
(73,'2025-03-14 10:00:00',2299.00,'Completed'),
(74,'2025-03-15 11:45:00',699.00,'Completed'),
(75,'2025-03-16 12:10:00',999.00,'Completed'),
(76,'2025-03-17 18:30:00',2799.00,'Completed'),
(77,'2025-03-18 09:20:00',1999.00,'Completed'),
(78,'2025-03-19 16:50:00',3499.00,'Completed'),
(79,'2025-03-20 13:00:00',899.00,'Pending'),
(80,'2025-03-21 14:30:00',7499.00,'Completed'),

(81,'2025-03-22 15:50:00',1399.00,'Completed'),
(82,'2025-03-23 10:25:00',2999.00,'Completed'),
(83,'2025-03-24 11:55:00',1099.00,'Pending'),
(84,'2025-03-25 09:40:00',499.00,'Completed'),
(85,'2025-03-26 17:15:00',1599.00,'Completed'),
(86,'2025-03-27 12:45:00',999.00,'Completed'),
(87,'2025-03-28 18:55:00',2299.00,'Pending'),
(88,'2025-03-29 14:30:00',6999.00,'Completed'),
(89,'2025-03-30 08:35:00',3999.00,'Completed'),
(90,'2025-03-31 16:05:00',1299.00,'Completed'),

(91,'2025-04-01 11:10:00',899.00,'Completed'),
(92,'2025-04-02 10:15:00',999.00,'Completed'),
(93,'2025-04-03 18:20:00',1799.00,'Completed'),
(94,'2025-04-04 17:55:00',1999.00,'Pending'),
(95,'2025-04-05 12:05:00',2999.00,'Completed'),
(96,'2025-04-06 13:25:00',2499.00,'Completed'),
(97,'2025-04-07 15:45:00',899.00,'Completed'),
(98,'2025-04-08 16:40:00',1499.00,'Completed'),
(99,'2025-04-09 09:50:00',499.00,'Completed'),
(100,'2025-04-10 19:10:00',999.00,'Completed');

-- ===========================================================
-- ORDER_ITEMS TABLE
-- ===========================================================
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 2, 1, 1999.00),
(1, 10, 1, 1299.00),

(2, 4, 1, 2999.00),
(2, 11, 1, 2499.00),

(3, 33, 1, 1299.00),
(3, 45, 1, 799.00),

(4, 1, 1, 499.00),

(5, 6, 1, 899.00),

(6, 4, 1, 2999.00),

(7, 8, 1, 1599.00),
(7, 18, 1, 499.00),

(8, 3, 1, 699.00),

(9, 5, 1, 499.00),

(10, 7, 1, 249.00),

(11, 22, 1, 999.00),

(12, 12, 1, 1599.00),
(12, 1, 1, 499.00),

(13, 13, 1, 799.00),

(14, 20, 1, 299.00),

(15, 28, 1, 1999.00),

(16, 15, 1, 1399.00),

(17, 17, 1, 899.00),

(18, 21, 1, 499.00),

(19, 25, 1, 2599.00),

(20, 29, 1, 3499.00),

(21, 31, 1, 1699.00),

(22, 41, 1, 1099.00),

(23, 63, 1, 1899.00),

(24, 19, 1, 799.00),

(25, 55, 1, 2299.00),

(26, 44, 1, 999.00),

(27, 47, 1, 1599.00),

(28, 54, 1, 2999.00),

(29, 30, 1, 1199.00),

(30, 60, 1, 4999.00),

(31, 76, 1, 799.00),

(32, 88, 1, 2499.00),

(33, 75, 1, 999.00),

(34, 34, 1, 1499.00),

(35, 53, 1, 1299.00),

(36, 66, 1, 1999.00),

(37, 70, 1, 699.00),

(38, 45, 1, 299.00),

(39, 67, 1, 2799.00),

(40, 48, 1, 1599.00),

(41, 81, 1, 1399.00),

(42, 83, 1, 2299.00),

(43, 56, 1, 1599.00),

(44, 10, 1, 499.00),

(45, 35, 1, 3499.00),

(46, 52, 1, 2499.00),

(47, 40, 1, 999.00),

(48, 57, 1, 2999.00),

(49, 62, 1, 2199.00),

(50, 59, 1, 6999.00),

(51, 91, 1, 799.00),

(52, 92, 1, 1599.00),

(53, 93, 1, 1299.00),

(54, 94, 1, 3499.00),

(55, 95, 1, 2499.00),

(56, 96, 1, 699.00),

(57, 97, 1, 1099.00),

(58, 98, 1, 499.00),

(59, 99, 1, 1999.00),

(60, 100, 1, 1599.00),

(61, 3, 1, 799.00),
(61, 4, 1, 2999.00),

(62, 5, 1, 1899.00),

(63, 6, 1, 2999.00),
(63, 7, 1, 249.00),

(64, 8, 1, 999.00),

(65, 9, 1, 499.00),

(66, 10, 1, 899.00),

(67, 11, 1, 3499.00),

(68, 12, 1, 2499.00),

(69, 13, 1, 1299.00),

(70, 14, 1, 1999.00),

(71, 15, 1, 1499.00),

(72, 16, 1, 1599.00),

(73, 17, 1, 2299.00),

(74, 18, 1, 699.00),

(75, 19, 1, 999.00),

(76, 20, 1, 2799.00),

(77, 21, 1, 1999.00),

(78, 22, 1, 3499.00),

(79, 23, 1, 899.00),
(79, 24, 1, 7499.00),

(80, 25, 1, 3999.00),

(81, 26, 1, 1399.00),

(82, 27, 1, 2999.00),

(83, 28, 1, 1099.00),

(84, 29, 1, 499.00),

(85, 30, 1, 1599.00),

(86, 31, 1, 999.00),

(87, 32, 1, 2299.00),

(88, 33, 1, 6999.00),

(89, 34, 1, 3999.00),

(90, 35, 1, 1299.00),

(91, 36, 1, 899.00),

(92, 37, 1, 999.00),

(93, 38, 1, 1799.00),

(94, 39, 1, 1999.00),

(95, 40, 1, 2999.00),

(96, 41, 1, 2499.00),

(97, 42, 1, 899.00),

(98, 43, 1, 1499.00),

(99, 44, 1, 499.00),

(100, 45, 1, 999.00);


-- ===========================================================
-- PAYMENTS TABLE
-- ===========================================================
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATETIME,
    method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO payments (order_id, amount, payment_date, method, status) VALUES
(1,1999.00,'2025-01-01 11:00:00','UPI','Success'),
(2,2999.00,'2025-01-02 15:00:00','Credit Card','Success'),
(3,1299.00,'2025-01-03 12:00:00','UPI','Pending'),
(4,499.00,'2025-01-04 17:00:00','Wallet','Success'),
(5,899.00,'2025-01-05 10:00:00','UPI','Success'),

(6,2999.00,'2025-01-06 13:00:00','Credit Card','Failed'),
(7,1599.00,'2025-01-07 16:10:00','UPI','Success'),
(8,699.00,'2025-01-08 14:00:00','UPI','Pending'),
(9,499.00,'2025-01-09 18:10:00','Wallet','Success'),
(10,249.00,'2025-01-10 20:00:00','UPI','Success'),

(11,999.00,'2025-01-11 12:00:00','UPI','Success'),
(12,1599.00,'2025-01-12 16:00:00','Credit Card','Success'),
(13,799.00,'2025-01-13 10:00:00','Debit Card','Pending'),
(14,299.00,'2025-01-14 19:00:00','UPI','Success'),
(15,1999.00,'2025-01-15 17:00:00','NetBanking','Success'),

(16,1399.00,'2025-01-16 14:00:00','Debit Card','Success'),
(17,899.00,'2025-01-17 09:00:00','UPI','Success'),
(18,499.00,'2025-01-18 18:00:00','Wallet','Pending'),
(19,2599.00,'2025-01-19 16:00:00','Credit Card','Success'),
(20,3499.00,'2025-01-20 14:00:00','UPI','Success'),

(21,1699.00,'2025-01-21 11:00:00','NetBanking','Success'),
(22,1099.00,'2025-01-22 15:00:00','UPI','Pending'),
(23,1899.00,'2025-01-23 12:00:00','UPI','Success'),
(24,799.00,'2025-01-24 10:00:00','Wallet','Success'),
(25,2299.00,'2025-01-25 17:00:00','Credit Card','Success'),

(26,999.00,'2025-01-26 19:00:00','Debit Card','Pending'),
(27,1599.00,'2025-01-27 20:00:00','UPI','Success'),
(28,2999.00,'2025-01-28 13:00:00','UPI','Success'),
(29,1199.00,'2025-01-29 18:00:00','Wallet','Success'),
(30,4999.00,'2025-01-30 12:30:00','Credit Card','Failed'),

(31,799.00,'2025-01-31 15:00:00','Debit Card','Success'),
(32,2499.00,'2025-02-01 11:00:00','UPI','Success'),
(33,999.00,'2025-02-02 14:00:00','Credit Card','Success'),
(34,1499.00,'2025-02-03 12:00:00','UPI','Pending'),
(35,1299.00,'2025-02-04 17:00:00','Wallet','Success'),

(36,1999.00,'2025-02-05 19:00:00','UPI','Success'),
(37,699.00,'2025-02-06 16:00:00','Debit Card','Success'),
(38,299.00,'2025-02-07 09:00:00','UPI','Pending'),
(39,2799.00,'2025-02-08 20:00:00','Credit Card','Success'),
(40,1599.00,'2025-02-09 12:00:00','UPI','Success'),

(41,1399.00,'2025-02-10 11:00:00','NetBanking','Success'),
(42,2299.00,'2025-02-11 15:00:00','UPI','Success'),
(43,1599.00,'2025-02-12 13:30:00','Debit Card','Pending'),
(44,499.00,'2025-02-13 16:00:00','UPI','Success'),
(45,3499.00,'2025-02-14 17:00:00','Credit Card','Success'),

(46,2499.00,'2025-02-15 20:00:00','UPI','Success'),
(47,999.00,'2025-02-16 10:00:00','Wallet','Success'),
(48,2999.00,'2025-02-17 15:00:00','Debit Card','Success'),
(49,2199.00,'2025-02-18 18:00:00','UPI','Pending'),
(50,6999.00,'2025-02-19 13:00:00','Credit Card','Success'),

(51,799.00,'2025-02-20 12:00:00','UPI','Success'),
(52,1599.00,'2025-02-21 17:00:00','Credit Card','Pending'),
(53,1299.00,'2025-02-22 19:00:00','UPI','Success'),
(54,3499.00,'2025-02-23 18:00:00','NetBanking','Success'),
(55,2499.00,'2025-02-24 10:00:00','Wallet','Success'),

(56,699.00,'2025-02-25 13:00:00','UPI','Pending'),
(57,1099.00,'2025-02-26 14:00:00','Credit Card','Success'),
(58,499.00,'2025-02-27 16:00:00','UPI','Success'),
(59,1999.00,'2025-02-28 18:30:00','Debit Card','Success'),
(60,1599.00,'2025-03-01 14:00:00','UPI','Success'),

(61,799.00,'2025-03-02 11:00:00','NetBanking','Pending'),
(62,1899.00,'2025-03-03 15:00:00','UPI','Success'),
(63,2999.00,'2025-03-04 12:00:00','Credit Card','Success'),
(64,999.00,'2025-03-05 09:30:00','UPI','Pending'),
(65,499.00,'2025-03-06 19:00:00','Wallet','Success'),

(66,899.00,'2025-03-07 16:00:00','Debit Card','Success'),
(67,3499.00,'2025-03-08 20:00:00','UPI','Pending'),
(68,2499.00,'2025-03-09 10:00:00','UPI','Success'),
(69,1299.00,'2025-03-10 12:00:00','Credit Card','Success'),
(70,1999.00,'2025-03-11 15:00:00','UPI','Success'),

(71,1499.00,'2025-03-12 17:00:00','Debit Card','Success'),
(72,1599.00,'2025-03-13 19:00:00','UPI','Pending'),
(73,2299.00,'2025-03-14 11:00:00','Credit Card','Success'),
(74,699.00,'2025-03-15 12:00:00','Wallet','Success'),
(75,999.00,'2025-03-16 18:00:00','UPI','Success'),

(76,2799.00,'2025-03-17 20:00:00','Debit Card','Success'),
(77,1999.00,'2025-03-18 10:00:00','UPI','Success'),
(78,3499.00,'2025-03-19 17:00:00','Credit Card','Success'),
(79,899.00,'2025-03-20 14:00:00','UPI','Pending'),
(80,7499.00,'2025-03-21 19:00:00','UPI','Success'),

(81,1399.00,'2025-03-22 15:00:00','Wallet','Success'),
(82,2999.00,'2025-03-23 11:30:00','NetBanking','Success'),
(83,1099.00,'2025-03-24 12:00:00','UPI','Pending'),
(84,499.00,'2025-03-25 10:00:00','UPI','Success'),
(85,1599.00,'2025-03-26 17:00:00','Credit Card','Success'),

(86,999.00,'2025-03-27 13:00:00','Debit Card','Success'),
(87,2299.00,'2025-03-28 19:00:00','UPI','Pending'),
(88,6999.00,'2025-03-29 15:00:00','UPI','Success'),
(89,3999.00,'2025-03-30 09:00:00','Wallet','Success'),
(90,1299.00,'2025-03-31 16:00:00','NetBanking','Success'),

(91,899.00,'2025-04-01 12:00:00','UPI','Success'),
(92,999.00,'2025-04-02 11:00:00','Debit Card','Success'),
(93,1799.00,'2025-04-03 18:00:00','Wallet','Success'),
(94,1999.00,'2025-04-04 17:30:00','Credit Card','Pending'),
(95,2999.00,'2025-04-05 14:00:00','UPI','Success'),

(96,2499.00,'2025-04-06 13:00:00','NetBanking','Success'),
(97,899.00,'2025-04-07 15:00:00','Wallet','Success'),
(98,1499.00,'2025-04-08 16:00:00','UPI','Success'),
(99,499.00,'2025-04-09 10:00:00','UPI','Success'),
(100,999.00,'2025-04-10 19:00:00','Credit Card','Success');
