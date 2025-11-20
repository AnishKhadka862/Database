-- Step 1: Create the Database
CREATE DATABASE HRDatabase;
USE HRDatabase;
-- Step 2: Create Tables-- Departments Table
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
-- Employees Table
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
salary DECIMAL(10,2),
dept_id INT,
manager_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
-- Projects Table
CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
dept_id INT,
budget DECIMAL(10,2),
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
-- Step 3: Insert Sample Data-- Departments
INSERT INTO Departments VALUES
(1, 'Human Resources', 'New York'),
(2, 'Finance', 'Chicago'),
(3, 'IT', 'San Francisco'),
(4, 'Marketing', 'Boston');
-- Employees
INSERT INTO Employees VALUES
(101, 'Alice Johnson', 'HR Manager', 85000, 1, NULL),
(102, 'Bob Smith', 'Recruiter', 50000, 1, 101),
(103, 'Charlie Green', 'Accountant', 60000, 2, NULL),
(104, 'Diana Prince', 'Financial Analyst', 75000, 2, 103),
(105, 'Ethan Clark', 'Software Engineer', 90000, 3, NULL),
(106, 'Fiona Brown', 'System Admin', 70000, 3, 105),
(107, 'George King', 'Marketing Lead', 72000, 4, NULL),
(108, 'Hannah White', 'Marketing Intern', 40000, 4, 107);
-- Projects
INSERT INTO Projects VALUES
(201, 'Recruitment Drive', 1, 20000),
(202, 'Annual Budgeting', 2, 30000),
(203, 'Cloud Migration', 3, 80000),
(204, 'Ad Campaign', 4, 25000);

select * from Departments;
select * from Employees;
select * from Projects;

select emp_name, salary from Employees 
Where salary > (select avg(salary) from employees);


select dept_name from Departments 
where dept_id = (select dept_id from Employees where emp_name = "Diana Prince");



select e.emp_name, d.dept_name from
Employees e join Departments d 
ON e.dept_id = d.dept_id
having e.emp_name = "Diane Prince"; 

select emp_name from employees
where dept_id = (select dept_id from employees where emp_name = "Bob Smith");

select emp_name, salary from Employees
where salary > (select salary from Employees where emp_name = "Charlie Green");

select dept_name from Departments
where dept_id in (select dept_id from Projects
where budget > (select avg(budget) from Projects));

select emp_name from Employees 
where dept_id = 
(select dept_id from Departments 
where location = "Chicago");

select emp_name, salary, dept_id from Employees
where (dept_id,salary) in (select dept_id, max(salary) from Employees 
group by dept_id);

