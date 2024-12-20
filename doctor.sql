
CREATE DATABASE IF NOT EXISTS HMSD;
USE HMSD;

-- Doctors Table
CREATE TABLE IF NOT EXISTS Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

-- Patients Table
CREATE TABLE IF NOT EXISTS Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

-- Appointments Table
CREATE TABLE IF NOT EXISTS Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL
);

-- Departments Table
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Room_no VARCHAR(20) NOT NULL
);

--  Doctor_Appointments Table
CREATE TABLE IF NOT EXISTS Doctor_Appointments (
    DoctorID INT NOT NULL,
    AppointmentID INT NOT NULL,
    PRIMARY KEY (DoctorID, AppointmentID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

-- Patient_Appointments Table
CREATE TABLE IF NOT EXISTS Patient_Appointments (
    PatientID INT NOT NULL,
    AppointmentID INT NOT NULL,
    PRIMARY KEY (PatientID, AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

-- Insert data into Doctors
INSERT INTO Doctors (Name, Specialization, Phone) VALUES
    ('Tanvir', 'Cardiologist', '123-456-7890'),
    ('sadman', 'Pediatrician', '987-654-3210'),
    ('Fokhrul', 'Surgeon', '555-123-4567'),
    ('Miraz', 'Dentist', '444-555-1234'),
    ('Muntasir', 'Dermatologist', '333-444-5555');

-- Insert data into Patients
INSERT INTO Patients (Name, Age, Gender, Phone) VALUES
    ('Thamid', 25, 'Female', '111-222-3333'),
    ('Bayzid', 40, 'Male', '222-333-4444'),
    ('Rakib', 55, 'Male', '333-444-5555'),
    ('Sakib', 30, 'Female', '444-555-6666'),
    ('Roman', 60, 'Male', '555-666-7777');

-- Insert data into Appointments
INSERT INTO Appointments (Date, Time, Status) VALUES
    ('2024-12-19', '10:00:00', 'Scheduled'),
    ('2024-12-20', '14:30:00', 'Scheduled'),
    ('2024-12-21', '09:00:00', 'Completed'),
    ('2024-12-22', '16:00:00', 'Cancelled'),
    ('2024-12-23', '11:15:00', 'Scheduled');

-- Insert data into Departments
INSERT INTO Departments (Name, Room_no) VALUES
    ('Cardiology', '101'),
    ('Pediatrics', '102'),
    ('Surgery', '103'),
    ('Dentistry', '104'),
    ('Dermatology', '105');

-- DROP DATABASE HMSD;
-- Query data from Departments
SELECT * FROM Doctors;
