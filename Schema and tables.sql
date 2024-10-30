#Create a schema/database to store our data
Create database Hospitaldb;

#create tables
#patient table
CREATE TABLE Patient (
	PatientID Varchar(50) not null,
	Firstname Varchar(50) not null,
	Lastname Varchar(50) not null,
	Phone Varchar(50),
	Insurance enum('y','n') not null,
	DateofBirth varchar(50),
    primary key(PatientID)
  );
 
 #insert values into patient table
INSERT INTO Patient (PatientID, Firstname, Lastname, Phone, Insurance, DateofBirth) VALUES
('P001', 'Alice', 'Williams', 1234567890, 'y', '1985-06-15'),
('P002', 'Bob', 'Miller', 2345678901, 'n', '1978-09-20'),
('P003', 'Carol', 'Wilson', 3456789012, 'y', '1992-03-10'),
('P004', 'David', 'Moore', 4567890123, 'y', '2000-11-22'),
('P005', 'Eve', 'Taylor', 5678901234, 'n', '1980-12-05');


select *
from Patient;  
#create Address table
CREATE TABLE Address (
	AddressID varchar(50),
	Streetname Varchar(50),
	County Varchar(50),
	State Varchar(50),
	Country Varchar(50),
	Zipcode Varchar(50),
	PatientID Varchar(50),
    primary key(AddressID),
    FOREIGN KEY(PatientID) references Patient(PatientID)
    
  );
  
INSERT INTO Address (AddressID, Streetname, County, State, Country, Zipcode, PatientID) VALUES
('A001', '123 Main St', 'Orange', 'California', 'USA', 92868, 'P001'),
('A002', '456 Elm St', 'Cook', 'Illinois', 'USA', 60616, 'P002'),
('A003', '789 Maple St', 'King', 'Washington', 'USA', 98101, 'P003'),
('A004', '321 Oak St', 'Harris', 'Texas', 'USA', 77002, 'P004'),
('A005', '654 Pine St', 'Maricopa', 'Arizona', 'USA', 85001, 'P005');

select *
from Address;

#creating Doctors table
CREATE TABLE Doctor (
	DoctorID Varchar(50),
	Docfirstname Varchar(50),
	Doclastname Varchar(50),
	Department Varchar(50),
	PatientID Varchar(50),
    primary key(DoctorID),
    FOREIGN KEY(PatientID) references Patient(PatientID)
  );
  
#
INSERT INTO Doctor (DoctorID, Docfirstname, Doclastname, Department, PatientID) VALUES
('D001', 'John', 'Doe', 'Cardiology', 'P001'),
('D002', 'Jane', 'Smith', 'Neurology', 'P002'),
('D003', 'Emily', 'Davis', 'Cardiology', 'P005'),
('D004', 'Michael', 'Brown', 'Pediatrics', 'P004'),
('D005', 'Sarah', 'Johnson', 'Orthopedics', 'P005');



select *
from Doctor;

#Nurse Table
CREATE TABLE Nurse (
	NurseID Varchar(50),
	Nur_firstname Varchar(50),
	Nur_lastname Varchar(50),
	Department Varchar(50),
    PatientID Varchar(50),
	primary key(NurseID),
	FOREIGN KEY(PatientID) references Patient(PatientID)
  );

INSERT INTO Nurse (NurseID, Nur_firstname, Nur_lastname, Department, PatientID) VALUES
(1, 'Emma', 'Johnson', 'Cardiology', 'P001'),
(2, 'Liam', 'Smith', 'Neurology', 'P002'),
(3, 'Olivia', 'Brown', 'Orthopedics', 'P003'),
(4, 'Noah', 'Williams', 'Pediatrics', 'P004'),
(5, 'Ava', 'Jones', 'Emergency', 'P005'),
(6, 'Isabella', 'Garcia', 'ICU', 'P001'),
(7, 'Mason', 'Martinez', 'Surgery', 'P003'),
(8, 'Sophia', 'Davis', 'Oncology', 'P001'),
(9, 'James', 'Rodriguez', 'Radiology', 'P002'),
(10, 'Amelia', 'Hernandez', 'Maternity', 'P003');

select *
from Nurse;


#CREATE VISITORS TABLE
CREATE TABLE Visitor (
	VisitorID Varchar(50),
    firstname Varchar(50),
    lastname Varchar(50),
    Relation Varchar(50),
    Visit_time DATETIME,
    PatientID Varchar(50),
	primary key(VisitorID),
	FOREIGN KEY(PatientID) references Patient(PatientID)
  );
  
  
INSERT INTO Visitor (VisitorID, firstname, lastname, Relation, Visit_time, PatientID) VALUES
('V001', 'John', 'Doe', 'Father', '2024-07-30 14:30:00', 'P001'),
('V002', 'Jane', 'Smith', 'Mother', '2024-07-30 15:00:00', 'P002'),
('V003', 'Emily', 'Johnson', 'Sister', '2024-07-30 16:15:00', 'P003'),
('V004', 'Michael', 'Brown', 'Brother', '2024-07-30 17:00:00', 'P004'),
('V005', 'Sarah', 'Williams', 'Friend', '2024-07-30 18:30:00', 'P001'),
('V006', 'David', 'Jones', 'Uncle', '2024-07-30 19:00:00', 'P002');


select *
from Visitor;


#CREATE Disease TABLE

CREATE TABLE Disease (
	DiseaseID Varchar(50),
	DiseaseName Varchar(50),
	Treatment Varchar(50),
	Prescription_by Varchar(50),
	Drugs Varchar(50),
	DoctorID Varchar(50),
	primary key(DiseaseID),
	FOREIGN KEY(DoctorID) references Doctor(DoctorID)
  );

INSERT INTO Disease (DiseaseID, DiseaseName, Treatment,Prescription_by, Drugs, DoctorID) VALUES
(1, 'Hypertension', 'Lifestyle changes, medication', 'Dr. Smith', 'Lisinopril, Hydrochlorothiazide', 'D001'),
(2, 'Diabetes', 'Diet, exercise, medication', 'Dr. Johnson', 'Metformin, Insulin', 'D002'),
(3, 'Asthma', 'Inhalers, medication', 'Dr. Brown', 'Albuterol, Fluticasone', 'D003'),
(4, 'Influenza', 'Rest, hydration, antiviral medication', 'Dr. Williams', 'Oseltamivir', 'D004'),
(5, 'COVID-19', 'Isolation, supportive care, antiviral medication', 'Dr. Davis', 'Remdesivir, Dexamethasone', 'D005');


select *
from Disease;

#Room table

CREATE TABLE Room (
	RoomID Varchar(50),
	Room_num Varchar(50),
	Building Varchar(50),
	Block Varchar(50),
	PatientID Varchar(50),
	FOREIGN KEY(PatientID) references Patient(PatientID)
  );
  
INSERT INTO Room (RoomID, Room_num, Building, Block, PatientID) VALUES
(1, '101', 'Main', 'A', 'P001'),
(2, '102', 'Main', 'A', 'P002'),
(3, '103', 'Main', 'B', 'P003'),
(4, '104', 'Main', 'B', 'P004'),
(5, '201', 'East', 'C', 'P005');

select *
from Room;