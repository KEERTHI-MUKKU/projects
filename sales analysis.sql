create database  sales_analysis;
use sales_analysis;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,
    phone bigint UNIQUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    category VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Sales_Details (
    sale_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Customers (name, email, phone, address) VALUES
("Keerthi", "Keerthi@gmail.com", 9876543210, "Hyderabad"),
("Lakshmi", "Lakshmi@gmail.com", 9123456789, "banglore"),
("Yashwanth", "yashwanth@gmail.com", 9234567890, "Tirupati"),
("Sravai", "Sravani@gmail.com", 9345678901, "Tirupati"),
("Prabhu sree", "Prabhu@.com", 9456789012, "banglore"),
("Sai", "Sai@gmail.com", 9567890123, "Hyderabad"),
("Dinesh", "Dinesh@gmail.com", 9678901234, "Tiruttani"),
("Preethi", "Preethi@gmail.com", 9789012345, "Chennai"),
("Varshini", "Varshini@gmail.com", 9890123456, "Hyderabad"),
("Nitheesh", "Nitheesh@gmail.com", 9901234567, "Tituttani"),
("Homanjali", "Homanjali@gmail.com", 9876543211, "Chennai"),
("Sankeerthana", "Sankeerthana@gmail.com", 9123456782, "Hyderabad"),
("Ankitha", "Ankitha@gmail.com", 9234567893, "Hyderabad"),
("Rukmitha", "Rukmitha@gmail.com", 9345678904, "banglore"),
("Pavan", "Pavan@gmail.com", 9456789015, "Hyderabad"),
("Mithra", "Mithra@gmail.com", 9567890126, "Tirupati"),
("Mounika", "Monika@gmail.com", 9678901237, "Chennai"),
("Umesh", "umesh@gmail.com", 9789012348, "Chennai"),
("Karhik", "Karthik@gmail.com", 9890123458, "pune"),
("Saritha", "Saritha@gmail.com", 9901234560, "Tirupati");
INSERT INTO Products (name, category, price, stock) VALUES
('Laptop', 'Electronics', 800, 50),
('Smartphone', 'Electronics', 500, 100),
('Headphones', 'Accessories', 30, 200),
('Tablet', 'Electronics', 400, 80),
('Smartwatch', 'Wearables', 300, 150),
('Jeans', 'Fashion', 400, 60),
('Keyboard', 'Accessories', 100, 120),
('Shoes', 'Fashion', 60, 180),
('Monitor', 'Electronics', 250, 90),
('Printer', 'Office Equipment', 150, 70),
('Fan', 'Electronics', 900, 25),
('Waching Machine', 'Electronics', 1000, 150),
('Air conditioner', 'Electronics', 100, 300),
('Vaccum cleaner', 'Electronics', 600, 30),
('Dining Table', 'Furniture', 400, 75),
('Handbag', 'Fashion', 800, 30),
('Wireless ear buds', 'Accessories', 160, 60),
('Power bank', 'Accessories', 80, 90),
('Webcam', 'Electronics', 500, 45),
('Desks', 'Office Equipment', 300, 35);
INSERT INTO Sales (customer_id, total_amount, sale_date) VALUES
(1, 850, '2024-01-10'),
(2, 500, '2024-01-12'),
(3, 400, '2024-01-14'),
(4, 300, '2024-01-15'),
(5, 600, '2024-01-18'),
(6, 1000, '2024-01-20'),
(7, 1200, '2024-01-21'),
(8, 200, '2024-01-22'),
(9, 700, '2024-01-25'),
(10, 250, '2024-01-27'),
(1, 900, '2024-02-01'),
(2, 150, '2024-02-05'),
(3, 1100, '2024-02-08'),
(4, 750, '2024-02-12'),
(5, 1300, '2024-02-14'),
(6, 600, '2024-02-18'),
(7, 400, '2024-02-20'),
(8, 350, '2024-02-23'),
(9, 500, '2024-02-26'),
(10, 800, '2024-02-28');
INSERT INTO Sales_Details (sale_id, product_id, quantity, price) VALUES
(1, 1, 1, 800), (1, 3, 1, 50),
(2, 2, 1, 500),
(3, 6, 1, 400),
(4, 4, 1, 300),
(5, 5, 3, 600),
(6, 1, 1, 800), (6, 7, 2, 200),
(7, 2, 2, 1000), (7, 9, 1, 200),
(8, 5, 1, 200),
(9, 10, 2, 700),
(10, 8, 5, 250),
(11, 3, 4, 200), (11, 6, 1, 700);
INSERT INTO Sales_Details (sale_id, product_id, quantity, price) VALUES
(12, 4, 1, 150),
(13, 1, 1, 800), (13, 2, 1, 300),
(14, 3, 5, 750),
(15, 10, 2, 1300);
INSERT INTO Payments (sale_id, payment_method, payment_status) VALUES
(1, 'Credit Card', 'Completed');
INSERT INTO Payments (sale_id, payment_method, payment_status) VALUES
(2, 'Debit Card', 'Completed'),
(3, 'PayPal', 'Completed'),
(4, 'UPI', 'Completed'),
(5, 'Cash', 'Completed'),
(6, 'Credit Card', 'Completed'),
(7, 'Debit Card', 'Completed'),
(8, 'PayPal', 'Completed'),
(9, 'UPI', 'Completed'),
(10, 'Cash', 'completed'),
(11, 'Credit Card','completed'),
(12, 'Debit Card', 'Completed'),
(13, 'PayPal', 'Completed'),
(14, 'UPI', 'Completed'),
(15, 'Cash', 'Completed'),
(16, 'Credit Card', 'Completed'),
(17, 'Debit Card', 'Completed'),
(18, 'PayPal', 'Completed'),
(19, 'UPI', 'Completed'),
(20, 'Cash','completed');
SELECT c.customer_id, c.name, c.email, s.sale_id, s.total_amount, s.sale_date
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
ORDER BY s.sale_date DESC;
SELECT c.customer_id, c.name, SUM(s.total_amount) AS total_spent
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;
SELECT p.name, SUM(sd.quantity) AS total_sold
FROM Products p
JOIN Sales_Details sd ON p.product_id = sd.product_id
GROUP BY p.product_id, p.name
ORDER BY total_sold DESC
LIMIT 5;
SELECT SUM(total_amount) AS total_revenue FROM Sales;
SELECT payment_status, COUNT(*) AS total_payments
FROM Payments
GROUP BY payment_status;
SELECT c.customer_id, c.name, c.email
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;
SELECT product_id, name, stock 
FROM Products
WHERE stock < 30;
SELECT product_id, name, category, stock, price FROM Products;
SELECT * FROM Products ORDER BY price DESC LIMIT 1;
SELECT * FROM Sales ORDER BY total_amount DESC LIMIT 1;
SELECT DATE(sale_date) AS sale_day, COUNT(*) AS total_sales
FROM Sales
ORDER BY total_sales DESC
LIMIT 1;
SELECT SUM(quantity) AS total_products_sold FROM Sales_Details;
select name,distinct(city) from customers order by city;
SELECT address AS city, COUNT(*) AS customer_count
FROM Customers
GROUP BY address;