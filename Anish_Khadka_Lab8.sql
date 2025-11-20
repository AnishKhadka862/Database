create database lab8;
use lab8;

-- Create the Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0),
    department_id INT,
    salary DECIMAL(10,2) CHECK (salary > 0),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert data into the Departments table
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

Select * from Departments;

-- Insert data into the Employees table
INSERT INTO Employees (employee_id, first_name, last_name, age, department_id, salary) VALUES
(1, 'John', 'Doe', 31, 1, 60000),
(2, 'Robert', 'Luna', 22, 2, 55000),
(3, 'David', 'Robinson', 29, 3, 80000),
(4, 'Betty', 'Smith', 35, 3, 90000),
(5, 'Alice', 'Johnson', 28, 4, 70000),
(6, 'Eve', 'Doe', 32, 5, 65000),
(7, 'Charlie', 'Brown', 27, 3, 75000);

select * from Employees;

select e.employee_id, e.first_name, e.last_name, e.age, e.salary, d.department_name
from Employees e
join Departments d
ON e.department_id = d.department_id
where d.department_name = 'Engineering';



select e.employee_id, e.first_name, e.last_name, e.age, e.salary, d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.salary > (
select avg(e2.salary)
from employees e2
where e2.department_id = e.department_id);


select d.department_name, sum(e.salary) as total_salary
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_name;


select e.*
from employees e
join (
    select department_id
    from employees
    group by department_id
    having count(*) > 1
) d
on e.department_id = d.department_id;



select d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.salary = (select max(salary) from employees);


select d.department_name, avg(e.age) as average_age
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_name;

select e.*
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name in ('HR', 'Finance');

