create database assignment8;
use assignment8;

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DepartmentID INT
);
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(50),
EmployeeID INT
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Sam', 'Brown', NULL);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');
INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(101, 'Project A', 1),
(102, 'Project B', 2),
(103, 'Project C', 2),
(104, 'Project D', NULL);

select * from Employees;
select * from Departments;
select * from Projects;

select e.employeeid, e.firstname, e.lastname, d.departmentname
from employees e
inner join departments d on e.departmentid = d.departmentid;


select e.employeeid, e.firstname, e.lastname, d.departmentname
from employees e
left join departments d on e.departmentid = d.departmentid;

select d.departmentid, d.departmentname, e.employeeid, e.firstname, e.lastname
from departments d
left join employees e on d.departmentid = e.departmentid;

select e.employeeid, e.firstname, e.lastname, d.departmentname
from employees e
left join departments d on e.departmentid = d.departmentid
union
select e.employeeid, e.firstname, e.lastname, d.departmentname
from employees e
right join departments d on e.departmentid = d.departmentid;

select e.employeeid, e.firstname, e.lastname, p.projectid, p.projectname
from employees e
cross join projects p;

select e.employeeid, e.firstname, e.lastname, d.departmentname, p.projectname
from employees e
left join departments d on e.departmentid = d.departmentid
left join projects p on e.employeeid = p.employeeid;
    
    
select d.departmentid, d.departmentname
from departments d
left join employees e on d.departmentid = e.departmentid
where e.employeeid is null;

select p.projectid, p.projectname
from projects p
left join employees e on p.employeeid = e.employeeid
where p.employeeid is null;


    