-- Create the database
DROP DATABASE IF EXISTS ClinicBookingSystem;
CREATE DATABASE ClinicBookingSystem;
USE ClinicBookingSystem;

-- Patients Table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Treatments Table
CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    Description TEXT NOT NULL,
    MedicationPrescribed TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Billing Table
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentID INT UNIQUE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus ENUM('Pending', 'Paid', 'Cancelled') DEFAULT 'Pending',
    PaymentDate DATE,
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

-- Patients data
INSERT INTO Patients (FirstName, LastName, DOB, Gender, Phone, Email)
VALUES
('Janet', 'Mwangi', '1990-05-12', 'Female', '0712345678', 'janet.mwangi@example.com'),
('Brian', 'Otieno', '1985-11-23', 'Male', '0723456789', 'brian.otieno@example.com'),
('Lilian', 'Njeri', '1992-03-08', 'Female', '0734567890', 'lilian.njeri@example.com'),
('Kevin', 'Mutiso', '1988-07-19', 'Male', '0745678901', 'kevin.mutiso@example.com'),
('Mercy', 'Wambui', '1995-12-01', 'Female', '0756789012', 'mercy.wambui@example.com'),
('James', 'Kariuki', '1983-09-30', 'Male', '0767890123', 'james.kariuki@example.com'),
('Diana', 'Achieng', '1991-06-14', 'Female', '0778901234', 'diana.achieng@example.com'),
('Peter', 'Kamau', '1987-04-22', 'Male', '0789012345', 'peter.kamau@example.com'),
('Grace', 'Chebet', '1994-08-09', 'Female', '0790123456', 'grace.chebet@example.com'),
('Collins', 'Mwangi', '1986-10-05', 'Male', '0701234567', 'collins.mwangi@example.com');

-- Doctors data
INSERT INTO Doctors (FirstName, LastName, Specialty, Phone, Email)
VALUES
('Alice', 'Kimani', 'Dermatology', '0711111111', 'alice.kimani@clinic.com'),
('David', 'Mutua', 'Cardiology', '0722222222', 'david.mutua@clinic.com'),
('Susan', 'Omondi', 'Pediatrics', '0733333333', 'susan.omondi@clinic.com'),
('John', 'Kiptoo', 'Orthopedics', '0744444444', 'john.kiptoo@clinic.com'),
('Nancy', 'Wanjiru', 'Gynecology', '0755555555', 'nancy.wanjiru@clinic.com'),
('George', 'Otieno', 'Neurology', '0766666666', 'george.otieno@clinic.com'),
('Esther', 'Cherono', 'General Medicine', '0777777777', 'esther.cherono@clinic.com'),
('Michael', 'Mwangi', 'ENT', '0788888888', 'michael.mwangi@clinic.com'),
('Caroline', 'Ndegwa', 'Psychiatry', '0799999999', 'caroline.ndegwa@clinic.com'),
('Paul', 'Kariuki', 'Urology', '0700000000', 'paul.kariuki@clinic.com');

-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1, 1, '2025-09-15 10:00:00', 'Scheduled'),
(2, 2, '2025-09-16 14:30:00', 'Scheduled'),
(3, 3, '2025-09-17 09:00:00', 'Completed'),
(4, 4, '2025-09-18 11:15:00', 'Scheduled'),
(5, 5, '2025-09-19 13:45:00', 'Cancelled'),
(6, 6, '2025-09-20 15:00:00', 'Scheduled'),
(7, 7, '2025-09-21 08:30:00', 'Completed'),
(8, 8, '2025-09-22 10:30:00', 'Scheduled'),
(9, 9, '2025-09-23 12:00:00', 'Scheduled'),
(10, 10, '2025-09-24 14:00:00', 'Scheduled');

-- Treatments
INSERT INTO Treatments (AppointmentID, Description, MedicationPrescribed)
VALUES
(1, 'Skin rash diagnosis', 'Hydrocortisone cream'),
(2, 'Heart check-up', 'Amlodipine'),
(3, 'Child fever treatment', 'Paracetamol syrup'),
(4, 'Knee pain assessment', 'Ibuprofen'),
(5, 'Routine gynecological exam', 'None'),
(6, 'Migraine evaluation', 'Sumatriptan'),
(7, 'General check-up', 'Multivitamins'),
(8, 'Ear infection treatment', 'Amoxicillin'),
(9, 'Anxiety consultation', 'Sertraline'),
(10, 'Kidney function test', 'None');

-- Billing
INSERT INTO Billing (TreatmentID, Amount, PaymentStatus, PaymentDate)
VALUES
(1, 1500.00, 'Paid', '2025-09-15'),
(2, 2500.00, 'Pending', NULL),
(3, 1200.00, 'Paid', '2025-09-17'),
(4, 1800.00, 'Paid', '2025-09-18'),
(5, 2000.00, 'Cancelled', NULL),
(6, 2200.00, 'Pending', NULL),
(7, 1000.00, 'Paid', '2025-09-21'),
(8, 1600.00, 'Paid', '2025-09-22'),
(9, 3000.00, 'Pending', NULL),
(10, 2700.00, 'Paid', '2025-09-24');