-- Create the database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Create table for Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    experience_years INT,
    city VARCHAR(30)
);

-- Create table for Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30),
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create table for Appointments
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create table for Bills
CREATE TABLE Bills (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    bill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert Doctors
INSERT INTO Doctors VALUES
(1, 'Dr. Smith', 'Cardiology', 15, 'New York'),
(2, 'Dr. Adams', 'Neurology', 10, 'Boston'),
(3, 'Dr. Patel', 'Orthopedics', 12, 'Chicago'),
(4, 'Dr. Lee', 'Dermatology', 8, 'San Francisco'),
(5, 'Dr. Brown', 'Pediatrics', 5, 'New York');

-- Insert Patients
INSERT INTO Patients VALUES
(101, 'Alice Johnson', 45, 'Female', 'New York', 1),
(102, 'Bob Carter', 52, 'Male', 'Boston', 2),
(103, 'Carol White', 28, 'Female', 'Chicago', 3),
(104, 'David King', 35, 'Male', 'New York', 1),
(105, 'Eva Green', 12, 'Female', 'New York', 5),
(106, 'Frank Miller', 60, 'Male', 'Chicago', 3),
(107, 'Grace Young', 40, 'Female', 'Boston', 2);

-- Insert Appointments
INSERT INTO Appointments VALUES
(1001, 101, 1, '2024-10-02', 'Chest Pain'),
(1002, 102, 2, '2024-10-05', 'Migraine'),
(1003, 103, 3, '2024-10-08', 'Knee Injury'),
(1004, 104, 1, '2024-10-12', 'Routine Check-up'),
(1005, 105, 5, '2024-10-15', 'Fever'),
(1006, 106, 3, '2024-10-18', 'Fracture Follow-up'),
(1007, 107, 2, '2024-10-22', 'Dizziness');

-- Insert Bills
INSERT INTO Bills VALUES
(501, 101, 1200.50, 'Paid', '2024-10-03'),
(502, 102, 850.00, 'Unpaid', '2024-10-06'),
(503, 103, 450.00, 'Paid', '2024-10-09'),
(504, 104, 300.00, 'Paid', '2024-10-13'),
(505, 105, 600.00, 'Unpaid', '2024-10-16'),
(506, 106, 1000.00, 'Paid', '2024-10-19'),
(507, 107, 750.00, 'Unpaid', '2024-10-23');

select * from Patients;
select * from Doctors;
select * from Appointments;
select * from Bills;

-- q1
select p.name as patient_name, d.name as doctor_name, d.specialization
from patients p
inner join doctors d on p.doctor_id = d.doctor_id;

-- q2
select a.appointment_id, a.appointment_date, p.name as patient_name, d.name as doctor_name, a.diagnosis
from appointments a
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.doctor_id = d.doctor_id;

-- q3
select d.name as doctor_name, d.specialization, p.name as patient_name
from doctors d
left join patients p on d.doctor_id = p.doctor_id;

-- q4
select p.name as patient_name, b.total_amount, b.payment_status
from patients p
left join bills b on p.patient_id = b.patient_id;

-- q5
select b.bill_id, b.total_amount, b.payment_status, p.name as patient_name, p.city, d.name as doctor_name
from bills b
left join patients p on b.patient_id = p.patient_id
left join doctors d on p.doctor_id = d.doctor_id;

-- q6
select d.name as doctor_name, p.name as patient_name, a.diagnosis, b.total_amount
from bills b
inner join patients p on b.patient_id = p.patient_id
inner join doctors d on p.doctor_id = d.doctor_id
inner join appointments a on p.patient_id = a.patient_id
where b.payment_status = 'Paid';

-- q7
select d.name as doctor_name, p.name as patient_name, a.appointment_date, a.diagnosis
from appointments a
inner join doctors d on a.doctor_id = d.doctor_id
inner join patients p on a.patient_id = p.patient_id
where d.city = 'New York';

-- q8
select p.patient_id, p.name as patient_name, b.bill_id, b.total_amount, b.payment_status
from patients p
left join bills b on p.patient_id = b.patient_id
union
select p.patient_id, p.name as patient_name, b.bill_id, b.total_amount, b.payment_status
from patients p
right join bills b on p.patient_id = b.patient_id;

-- q9
select d2.name, d2.city
from doctors d1
inner join doctors d2 on d1.city = d2.city
where d1.name = 'Dr. Smith' and d2.name <> 'Dr. Smith';

-- q10
select d.name as doctor_name, sum(b.total_amount) as total_collected
from bills b
inner join patients p on b.patient_id = p.patient_id
inner join doctors d on p.doctor_id = d.doctor_id
where b.payment_status = 'Paid'
group by d.name;


