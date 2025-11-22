/*Data Engineer Assignment - 2

Task Overview
Sample Data Set is provided to you, It contains two sheets:
1 Customers: Information about customers.
2 Orders: Order details linked by CustomerID.

 Task Description
Part 1: Data Transformation
*/
-- 1. Add this Data to MySQL or MongoDB.

CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    City VARCHAR(100),
    SignupDate DATE,
    Email VARCHAR(150)
);

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);
INSERT INTO customers VALUES
(1,'Amit','Sharma','Mumbai','2022-05-14','amit.sharma@example.com'),
(2,'Priya','Verma','Delhi','2023-02-21','priya.verma@example.com'),
(3,'Rohan','Singh','Pune','2021-09-10','rohan.singh@example.com'),
(4,'Neha','Joshi','Bangalore','2023-06-15','neha.joshi@example.com'),
(5,'Karan','Patel','Ahmedabad','2022-12-05','karan.patel@example.com'),
(6,'Ananya','Gupta','Delhi','2023-03-19','ananya.gupta@example.com'),
(7,'Raj','Mehta','Mumbai','2021-08-28','raj.mehta@example.com'),
(8,'Pooja','Iyer','Chennai','2023-07-07','pooja.iyer@example.com'),
(9,'Vivek','Kumar','Hyderabad','2022-10-02','vivek.kumar@example.com'),
(10,'Meera','Shah','Pune','2023-01-12','meera.shah@example.com'),
(11,'Suresh','Reddy','Hyderabad','2021-04-25','suresh.reddy@example.com'),
(12,'Tanya','Bhatia','Bangalore','2023-09-03','tanya.bhatia@example.com'),
(13,'Gaurav','Jain','Delhi','2022-11-18','gaurav.jain@example.com'),
(14,'Sneha','Kapoor','Mumbai','2023-05-29','sneha.kapoor@example.com'),
(15,'Aditya','Rao','Chennai','2021-03-09','aditya.rao@example.com'),
(16,'Manish','Desai','Ahmedabad','2023-02-10','manish.desai@example.com'),
(17,'Kavita','Nair','Kochi','2022-06-20','kavita.nair@example.com'),
(18,'Arjun','Malhotra','Delhi','2023-04-22','arjun.malhotra@example.com'),
(19,'Ritu','Chawla','Pune','2021-11-15','ritu.chawla@example.com'),
(20,'Deepak','Soni','Mumbai','2023-08-05','deepak.soni@example.com'),
(21,'Sonali','Mishra','Bangalore','2022-01-11','sonali.mishra@example.com'),
(22,'Ashok','Kumar','Chennai','2023-10-18','ashok.kumar@example.com'),
(23,'Varun','Khanna','Delhi','2021-05-07','varun.khanna@example.com'),
(24,'Payal','Agarwal','Jaipur','2023-03-14','payal.agarwal@example.com'),
(25,'Nitin','Saxena','Lucknow','2022-09-09','nitin.saxena@example.com');

INSERT INTO orders VALUES
(101,1,'2022-06-01',4500.50),
(102,2,'2023-03-05',2999),
(103,2,'2023-04-15',1500),
(104,3,'2021-10-22',780),
(105,4,'2023-07-20',5600),
(106,5,'2023-01-02',2300),
(107,6,'2023-03-22',3400.75),
(108,6,'2023-04-10',1200),
(109,7,'2022-02-14',875),
(110,8,'2023-07-18',4600),
(111,9,'2022-11-10',2000),
(112,10,'2023-02-05',3450.50),
(113,11,'2021-05-15',1000),
(114,12,'2023-09-10',2750),
(115,12,'2023-09-21',3200),
(116,13,'2022-12-25',1450),
(117,14,'2023-06-15',5100),
(118,14,'2023-06-28',2150),
(119,15,'2021-04-20',925),
(120,16,'2023-02-18',3700),
(121,17,'2022-08-30',1850),
(122,18,'2023-05-03',4999.99),
(123,18,'2023-05-17',2500),
(124,19,'2021-12-12',1190),
(125,20,'2023-08-09',4800),
(126,21,'2022-02-19',750),
(127,22,'2023-11-05',5400),
(128,23,'2021-06-15',870),
(129,24,'2023-03-20',3200),
(130,25,'2022-10-19',2200),
(131,1,'2023-01-14',3600),
(132,2,'2023-05-21',4500),
(133,5,'2023-04-01',2750.50),
(134,8,'2023-07-25',3300),
(135,10,'2023-02-15',4100);

 SELECT * FROM orders;
 SELECT * FROM customers;

-- 2. Add a column to Orders for the month name from the OrderDate.

ALTER TABLE orders
ADD COLUMN OrderMonth VARCHAR(20);

UPDATE orders
SET OrderMonth = MONTHNAME(OrderDate);

SELECT OrderID, OrderDate, OrderMonth, CustomerID, TotalAmount
FROM orders;

-- 3. Calculate each customer’s total spending and add it to a new dataframe.
CREATE TABLE customer_total_spending AS
SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    SUM(o.TotalAmount) AS TotalSpending
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, FullName;


SELECT * FROM customer_total_spending
ORDER BY TotalSpending DESC;

