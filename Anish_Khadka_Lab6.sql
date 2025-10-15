create database practice930;
create table Employee(
EmployeeID int primary key auto_increment,
EmployeeName varchar(20),
EmployeeSalary decimal(8,2)
);

insert into Employee (EmployeeName,EmployeeSalary)
values
("Jane",100000.0),
("Joseph",85000.0),
("James",90000.00),
("Jennifer",200000.00);

select * from Employee;

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    BirthDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Sales');

SELECT * FROM Departments;

-- Insert into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate, BirthDate) VALUES
(1, 'John', 'Doe', 1, 50000.00, '2015-03-15', '1990-06-25'),
(2, 'Jane', 'Smith', 2, 60000.00, '2016-07-22', '1988-09-14'),
(3, 'Emily', 'Jones', 3, 70000.00, '2017-01-12', '1992-11-30'),
(4, 'Michael', 'Brown', 4, 80000.00, '2018-04-18', '1985-04-10'),
(5, 'Sarah', 'Davis', 1, 55000.00, '2019-02-25', '1993-02-15'),
(6, 'David', 'Wilson', 2, 62000.00, '2020-10-10', '1989-05-20'),
(7, 'Laura', 'Moore', 3, 72000.00, '2021-11-05', '1991-08-05'),
(8, 'James', 'Taylor', 4, 85000.00, '2022-08-16', '1987-12-22');

SELECT * FROM Employees;


-- distinct departments where employees work
SELECT DISTINCT d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- employees who work in Finance or Engineering departments
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Finance', 'Engineering');


-- departments with more than one employee
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 1;


-- list all employees ordered by their salary in descending order
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC;

-- find employees who were hired in the year 2020
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employees
WHERE YEAR(HireDate) = 2020;

-- calculate the average salary of employees
SELECT AVG(Salary) AS AverageSalary
FROM Employees;

-- find the total salary expense for each department
SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- find the highest salary in the company
SELECT MAX(Salary) AS HighestSalary
FROM Employees;

-- find the lowest salary in the company
SELECT MIN(Salary) AS LowestSalary
FROM Employees;



-- convert the first names of all employees to uppercase
SELECT UPPER(FirstName) AS UpperFirstName
FROM Employees;

-- concatenate first and last names of employees
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;


