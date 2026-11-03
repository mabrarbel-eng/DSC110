-- Week 3 SQL: Data Retrieval Exercises--For this exercise, we'll do it at sqliteonline.com

-- Create Patients table
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

-- Insert sample data into Patients
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');
-- -- Create Visits table
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert sample data into Visits
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);
-- This file contains the SQL commands from the DSC110 Data Retrieval practice.
-- Comments are included to explain what each section and query does.

-- ============================================================
-- SECTION 1: CREATE THE PATIENTS TABLE
-- ============================================================

-- This statement creates a table named Patients.
-- The table stores basic information about each patient.
-- patient_id is the primary key, so each patient must have a unique ID.
-- The name column cannot be left empty because it is NOT NULL.
-- Age, gender, and city store additional patient information.

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

-- ============================================================
-- SECTION 2: INSERT DATA INTO THE PATIENTS TABLE
-- ============================================================

-- This statement adds sample patient records to the Patients table.
-- Each row represents one patient and provides values for the
-- patient ID, name, age, gender, and city.

INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');
SELECT *FROM Patients;
--selects patients who live in cambridge
Select * from patients where  lower (city) = 'cambridge';
--select average age by gender and sort the results by descending age 
--select average age by gender and sort the results by descending average age
SELECT gender, AVG(age) AS average_age FROM patients GROUP BY gender ORDER BY average_age DESC;
--join the patients table with the visits table doing inner join one time and left join another time compare the difference between the two outputs
SELECT * FROM patients INNER JOIN visits ON patients.patient_id = visits.patient_id;
SELECT * FROM patients LEFT JOIN visits ON patients.patient_id = visits.patient_id;
SELECT * FROM Visits;
