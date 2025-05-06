-- Within this database, design and create two related tables, such as 'Students' and 'Courses'
-- Columns of Students table- Roll_no(Primary),Student_name,Age,DOB,Class
-- Columns of Courses-Course_id(Primary),Course_name,Course_duration,Faculty_name
-- Populate these tables with sample data(10 records each)
-- Write SQL queries to retrieve information about enrolled students and their courses.

-- 1.Create a new database with a specific name- school_database
CREATE DATABASE school_database;

CREATE TABLE Students(
 Roll_no INT Primary KEY,
 Student_name VARCHAR(100),
Age INT,
DOB date,
Class int
);

create table cources(
cource_id int primary key,
cource_name varchar(100),
Cource_duration datetime,
faculty_name varchar(100)
);

-- Populate these tables with sample data(10 records each) for students table

insert into students(Roll_no, Student_name,Age,DOB,Class) values
(1, 'Amit Kumar', 15, '2010-05-20', 9),
(2, 'Riya Sharma', 14, '2011-08-15', 8),
(3, 'Mohit Verma', 13, '2012-12-01', 7),
(4, 'Sneha Gupta', 14, '2011-06-18', 8),
(5, 'Rahul Yadav', 16, '2009-03-05', 10),
(6, 'Anjali Singh', 15, '2010-10-10', 9),
(7, 'Vikas Mehra', 13, '2012-09-22', 7),
(8, 'Priya Nair', 14, '2011-11-30', 8),
(9, 'Rohan Das', 15, '2010-04-12', 9),
(10, 'Kavita Joshi', 16, '2009-01-25', 10);


-- Populate these tables with sample data(10 records each) for cources table

INSERT INTO cources (cource_id, cource_name, cource_duration, faculty_name) VALUES
(1, 'Computer Basics', '2024-06-01 00:00:00', 'Dr. A. Sharma'),
(2, 'Advanced Python', '2024-07-15 00:00:00', 'Ms. R. Kapoor'),
(3, 'Web Development', '2024-08-10 00:00:00', 'Mr. S. Verma'),
(4, 'Data Science', '2024-09-01 00:00:00', 'Dr. K. Mehta'),
(5, 'Digital Marketing', '2024-06-20 00:00:00', 'Ms. P. Iyer'),
(6, 'Graphic Design', '2024-07-01 00:00:00', 'Mr. M. Desai'),
(7, 'Database Management', '2024-06-10 00:00:00', 'Dr. R. Reddy'),
(8, 'Networking Fundamentals', '2024-08-20 00:00:00', 'Mr. V. Singh'),
(9, 'Java Programming', '2024-09-15 00:00:00', 'Ms. S. Ghosh'),
(10, 'Machine Learning', '2024-10-01 00:00:00', 'Dr. N. Khan');


-- Write SQL queries to retrieve information about enrolled students and their courses.

select * from cources;

select * from students 
order by class DESC ;


-- Create a query where students' information needs to be updated (e.g., change the name or age for specific students)-Update for any 4 students

update students 
set student_name = 'debo das' AND age = 34
where Roll_no = 3 ;

update students 
set student_name = 'Kanchan Simlandi',age = 54
where Roll_no = 10;

-- Confirm that the changes have been successfully made by querying the table(Use select query)
select * from students 
order by class desc;


-- Delete Records:

-- In the same database, delete any 4 records from Students table and 5 records from Courses table.
-- Write SQL DELETE statements to remove these records from the respective tables.
-- Check the tables to ensure the unwanted records have been deleted.

delete from students 
where Roll_no < 9 ;



-- Filtering and Counting Data: 
You are given a database(school_database), create a  table named Orders with the following columns: OrderID(Primary key), CustomerID, OrderDate, and TotalAmount. Your task is to write SQL queries to perform the following tasks:
a. Retrieve all orders placed by a specific customer (OrderID=5).
b. Find the total number of orders placed by the all the customers combined. Hint count(column_name)
c. Find the total amount spent by the customer whose .CustomerID is 101
You should use the WHERE clause to filter data based on the given customer ID.

use school_database
create table Orders(
OrderID int primary key,
CustomerID int,
OrderDate date,
TotalAmount decimal(10,2)
);

insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(1,101,'2023-10-02',302.87);
insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(2,102,'2023-10-02',105.776);
insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(3,103,'2023-10-02',109.886);
insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(4,101,'2023-10-02',104.0);
insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(5,102,'2023-10-02',1006.8765);



select * from orders;

-- Find the total amount spent by the customer whose .CustomerID is 101
select TotalAmount from orders
where CustomerID = 101;

 -- Retrieve all orders placed by a specific customer (OrderID=5).
 select * from orders
 where OrderID=5;


-- Find the total number of orders placed by the all the customers combined. Hint count(column_name)

-- individually
select CustomerID,count(OrderID)
from orders
group by CustomerID;

-- total 
select count(*) from orders;


-- Date-Based Filtering: 
-- Assume you have a table named Sales with columns: SaleID, ProductID, SaleDate, and SaleAmount. Your task is to write SQL queries to perform the following tasks:
-- a. Retrieve all sales that occurred between two specific dates (take any 2 dates of your choice).
-- b. Calculate the total sales amount for the given date range.
-- You should use the WHERE clause to filter data based on the sale dates within the specified 

create table Sales(
SaleID int primary key, 
ProductID int, 
SaleDate date,  
SaleAmount decimal(10,2)
);

insert into sales (SaleID, ProductID, SaleDate,SaleAmount) values
(1, 101, '2025-01-15', 199.99),
(2, 102, '2025-01-18', 349.50),
(3, 103, '2025-02-02', 89.90),
(4, 101, '2025-02-05', 199.99),
(5, 104, '2025-02-10', 599.00),
(6, 105, '2025-02-20', 129.99),
(7, 106, '2025-03-01', 75.49),
(8, 107, '2025-03-15', 450.00),
(9, 102, '2025-03-20', 349.50),
(10, 108, '2025-04-01', 220.00);

select * from sales order by SaleDate desc;

-- Retrieve all sales that occurred between two specific dates (take any 2 dates of your choice)

select sum(SaleAmount) AS total_sale from sales
where SaleDate between '2025-02-10' AND '2025-03-15';

-- Calculate the total sales amount for the given date range.
select sum(SaleAmount) As Total_sale_ammount from sales
where SaleDate between '2025-01-15' AND '2025-04-01';


-- You are provided with an Employees table containing the following columns: EmployeeID, FirstName, LastName, BirthDate, and Salary. Your task is to write SQL queries to perform the following tasks:
-- a. Retrieve a list of all employees, sorted by their Last names in alphabetical order.
-- b. Retrieve a list of employees who were born before a specific date (choose any specific dates), sorted by their birth dates in ascending order.
-- c. Retrieve a list of employees with their first names, last names, and salaries, sorted by their salaries in descending order.

create table Employees (
EmployeeID int primary key,
FirstName varchar(50),
LastName varchar(50),
BirthDate date,
Salary decimal(10,2) not null
);

insert into Employees (EmployeeID, FirstName, LastName, BirthDate,Salary) values
(1, 'John', 'Doe', '1985-06-15', 55000.00),
(2, 'Jane', 'Smith', '1990-03-22', 62000.00),
(3, 'Alice', 'Johnson', '1988-11-09', 58000.00),
(4, 'Robert', 'Brown', '1992-07-30', 61000.00),
(5, 'Emily', 'Davis', '1986-05-18', 59500.00),
(6, 'Michael', 'Miller', '1984-09-25', 67000.00),
(7, 'Linda', 'Wilson', '1991-01-12', 54000.00),
(8, 'David', 'Moore', '1989-02-27', 56000.00),
(9, 'Sarah', 'Taylor', '1993-04-10', 60000.00),
(10, 'James', 'Anderson', '1987-08-19', 63000.00),
(11, 'Patricia', 'Thomas', '1985-12-03', 65000.00),
(12, 'Christopher', 'Jackson', '1990-10-14', 52000.00),
(13, 'Barbara', 'White', '1983-07-07', 68000.00),
(14, 'Daniel', 'Harris', '1986-03-16', 55500.00),
(15, 'Jennifer', 'Martin', '1988-11-25', 61000.00),
(16, 'Matthew', 'Thompson', '1992-09-09', 57000.00),
(17, 'Susan', 'Garcia', '1987-06-01', 63500.00),
(18, 'Anthony', 'Martinez', '1991-08-28', 54500.00),
(19, 'Jessica', 'Robinson', '1984-01-30', 66000.00),
(20, 'Mark', 'Clark', '1989-12-22', 59000.00);

select * from employees;


-- a. Retrieve a list of all employees, sorted by their Last names in alphabetical order.

select EmployeeID, FirstName, LastName from employees
group by EmployeeID
order by LastName;

-- b. Retrieve a list of employees who were born before a specific date (choose any specific dates), sorted by their birth dates in ascending order.

select * from employees
where BirthDate > '1991-12-28'
order by BirthDate asc;


-- c. Retrieve a list of employees with their first names, last names, and salaries, sorted by their salaries in descending order.

select FirstName, LastName,Salary from employees
order by Salary desc;


-- Day-5
-- 7: Inner Join
-- using INNER JOIN to combine data from two related tables:
-- Create two tables: students1 and courses1.
-- The students table should have columns for student_id, student_name, and course_id.
-- The courses table should have columns for course_id and course_name.
-- Insert data into both tables with multiple records.
-- Write an SQL query that performs an INNER JOIN between the students and courses tables, connecting them using the course_id column.
-- Retrieve and display a result set that includes the student_name and course_name of each student along with the course they are enrolled in.

create table students1(
student_id int primary key,
student_name varchar(50),
course_id int
); 

insert into students1 (student_id, student_name,course_id) values
(101, 'Bikram', 1),
(102, 'Aditya', 2),
(103, 'Soumik', 3),
(104, 'Anupam', 1),
(105, 'Anuranjan', 2),
(106, 'Rima', 4);

create table courses1(
course_id int primary key not null,
course_name varchar(50) not null);

insert into courses1(course_id,course_name ) values
(001, 'Python'),
(002, 'MySQL'),
(003, 'PowerBi');


select * from students1 
inner join courses1
on students1.course_id = courses1.course_id;

-- Create two tables: employees and departments.
-- The employees table should have columns for employee_id, employee_name, and department_id.
-- The departments table should have columns for department_id and department_name.

create table employees1(
employee_id int primary key,
employee_name varchar(100),
department_id int

);


insert into employees1 (employee_id,employee_name,department_id) values
(1, 'Aaron Blake', 101),
(2, 'Bella Monroe', 102),
(3, 'Caleb Stone', 101),
(4, 'Diana Harper', 103),
(5, 'Ethan Rhodes', 102),
(6, 'Faith Morgan', 104),
(7, 'Gavin Cross', 101),
(8, 'Hailey Grant', 104),
(9, 'Isaac Reed', 103),
(10, 'Jenna Watts', 102),
(11, 'Kyle Turner', 101),
(12, 'Lily Hayes', 103),
(13, 'Mason Cole', 104),
(14, 'Natalie Ford', 102);

select * from employees1;

create table departments1(
department_id int primary key,
department_name varchar(100)
);


insert into departments1 (department_id,department_name) values

(101, 'Human Resources'),
(102, 'Finance'),
(103, 'Engineering'),
(104, 'Marketing'),
(105, 'Sales'),
(106, 'IT Support'),
(107, 'Legal'),
(108, 'Research and Development'),
(109, 'Operations'),
(110, 'Customer Service'),
(111, 'Procurement'),
(112, 'Public Relations'),
(113, 'Quality Assurance'),
(114, 'Logistics'),
(115, 'Training and Development');


select employee_id,employee_name,department_name from employees1
inner join departments1
on employees1.department_id = departments1.department_id;

-- Write an SQL query that performs a RIGHT JOIN between the employees and departments tables, connecting them using the department_id column.
-- Retrieve and display a result set that includes the employee_name, employee_id, and department_name. Ensure that all departments, even those without any employees, are included in the result.

select employee_id,employee_name,department_name
from employees1 inner join departments1
on employees1.department_id = departments1.department_id;

-- Question 9: Sales Analysis
-- Imagine you are working with a sales database that contains information about sales transactions. Your task is to analyze the data using SQL to answer specific questions.

-- Create a table named sales with the following columns:
-- order_id (integer): A unique identifier for each order.
-- customer_id (integer): The ID of the customer making the purchase.
-- product_id (integer): The ID of the product being sold.
-- quantity (integer): The quantity of the product sold.
-- price (decimal): The price per unit of the product.

create table sales1(
 order_id int primary key,
 customer_id int not null,
 product_id int not null,
 quantity int not null,
 price decimal(10,2) not null
);

-- Insert sample data into the sales table with multiple records representing various sales transactions.

select * from sales1;

-- Write an SQL query to find the total sales amount for each customer. Use the GROUP BY clause to group the data by customer_id and calculate the total sales amount for each customer.

select count(*) from sales1; -- count of sales


-- top 100
select customer_id,sum(price) As total_sales from sales1
group by customer_id 
order by total_sales desc limit 100;

ALTER TABLE sales1
ADD COLUMN order_date DATE;

ALTER TABLE  sales1
DROP column order_date;



-- Aggregate Functions 


CREATE TABLE Products(

product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_cost DECIMAL(10, 2) NOT NULL,
    expiry_date DATE NOT NULL,
    manufacturer_name VARCHAR(255) NOT NULL

);

INSERT INTO products (product_name, product_cost, expiry_date, manufacturer_name) VALUES
('Product A', 19.99, '2023-12-31', 'Manufacturer X'),
('Product B', 29.99, '2024-05-15', 'Manufacturer Y'),
('Product C', 9.99, '2023-10-20', 'Manufacturer Z'),
('Product D', 14.50, '2023-11-30', 'Manufacturer X'),
('Product E', 49.99, '2024-04-10', 'Manufacturer W'),
('Product F', 8.75, '2023-09-05', 'Manufacturer Z'),
('Product G', 39.95, '2024-03-25', 'Manufacturer Y'),
('Product H', 24.99, '2023-11-15', 'Manufacturer W'),
('Product I', 12.25, '2023-10-10', 'Manufacturer Z'),
('Product J', 17.99, '2024-02-28', 'Manufacturer X');


select product_id,product_name from products
where manufacturer_name = 'manufactur X';



-- count 
select manufacturer_name,count(manufacturer_name) AS total_count from products
group by manufacturer_name
order by total_count 
desc;

-- Average
select avg(product_cost) AS Average_cost from products;

-- sum
select product_id,sum(product_cost) As total_cost from products
group by product_id
order by total_cost
desc;

select max(product_cost) As max_cost from products;

select min(product_cost) As max_cost from products;


-- DENSE RANK() AND RANK() IN SQL

CREATE DATABASE college;
use college;

create table person(
Name varchar(45) NOT NULL,  
  Product varchar(45) DEFAULT NULL,  
  Country varchar(25) DEFAULT NULL,  
  Year int NOT NULL  
);


INSERT INTO Person(Name, Product, Country, Year)   
VALUES ('Stephen', 'Computer', 'USA', 2015),   
('Joseph', 'Laptop', 'India', 2016),   
('John', 'TV', 'USA', 2016),  
('Donald', 'Laptop', 'England', 2015),  
('Joseph', 'Mobile', 'India', 2015),  
('Peter', 'Mouse', 'England', 2016);  




CREATE TABLE student_scores (
    student_id INT,
    subject VARCHAR(50),
    score INT
);
truncate student_scores;

INSERT INTO student_scores VALUES
(1, 'Math', 80),
(1, 'English', 75),
(1, 'Science', 90),
(2, 'Math', 95),
(2, 'English', 85),
(2, 'Science', 90),
(3, 'Math', 80),
(3, 'English', 85),
(3, 'Science', 80);

-- DENSE RANK() query 

SELECT student_id, subject, score, 
       DENSE_RANK() OVER (PARTITION BY subject ORDER BY score DESC) AS new_rank 
FROM student_scores;