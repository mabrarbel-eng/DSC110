-- Week 3 SQL: Data Retrieval Exercises
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

-- This query selects every column and every row from the Patients table.
-- The * means that all columns should be returned.

SELECT * FROM Patients;

-- ============================================================
-- SECTION 3: CREATE THE VISITS TABLE
-- ============================================================

-- This statement creates a table named Visits.
-- It stores information about patient visits, including the visit
-- date, diagnosis, and cost.
-- patient_id connects each visit to a patient in the Patients table.

CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- ============================================================
-- SECTION 4: INSERT DATA INTO THE VISITS TABLE
-- ============================================================

-- This statement adds sample visit records to the Visits table.
-- Each visit has a unique visit ID and is connected to a patient
-- using the patient's patient_id.

INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

-- This query displays all columns and all records from the Visits table.
-- It is useful for checking the data that was inserted.

SELECT * FROM Visits;

-- ============================================================
-- SECTION 5: RETRIEVING SPECIFIC ROWS
-- ============================================================

-- This query retrieves all patients who live in Boston.
-- The WHERE clause filters the results so that only records
-- where the city is Boston are returned.

SELECT * FROM Patients
WHERE city = 'Boston';

-- This query retrieves only female patients.
-- The WHERE clause filters the table using the gender column.

SELECT * FROM Patients
WHERE gender = 'F';

-- ============================================================
-- SECTION 6: RETRIEVING SPECIFIC FIELDS
-- ============================================================

-- This query selects only the patient ID, name, and age.
-- Instead of returning every column, it returns only the
-- specific fields requested.

SELECT patient_id, name, age
FROM Patients;

-- This query selects only the patient's name and city.
-- This demonstrates how SQL can return selected columns
-- instead of the entire table.

SELECT name, city
FROM Patients;

-- ============================================================
-- SECTION 7: SUMMARY STATISTICS
-- ============================================================

-- This query counts the total number of rows in the Patients table.
-- COUNT(*) counts every patient record in the table.

SELECT COUNT(*)
FROM Patients;

-- This query counts the number of unique genders in the Patients table.
-- DISTINCT prevents the same gender value from being counted more than once.

SELECT COUNT(DISTINCT gender)
FROM Patients;

-- This query calculates the average age of all patients.
-- AVG(age) adds the ages and calculates their average.

SELECT AVG(age)
FROM Patients;

-- ============================================================
-- SECTION 8: GROUP BY
-- ============================================================

-- This query calculates the average age separately for each gender.
-- GROUP BY divides the patients into groups based on gender.
-- AVG(age) then calculates the average age within each group.

SELECT gender, AVG(age)
FROM Patients
GROUP BY gender;

-- ============================================================
-- SECTION 9: ORDER BY
-- ============================================================

-- This query calculates the average age for each gender and
-- then sorts the results from the highest average age to the lowest.
-- ORDER BY 2 refers to the second column in the SELECT statement,
-- which is AVG(age).
-- DESC means descending order.

SELECT gender, AVG(age)
FROM Patients
GROUP BY gender
ORDER BY 2 DESC;

-- ============================================================
-- SECTION 10: INNER JOIN
-- ============================================================

-- This query combines information from the Patients and Visits tables.
-- An INNER JOIN returns only patients who have a matching visit record.
-- The tables are connected using patient_id.
-- The patient name and age come from Patients, while visit information
-- comes from Visits.

SELECT
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;

-- ============================================================
-- SECTION 11: LEFT JOIN
-- ============================================================

-- This query also combines the Patients and Visits tables.
-- A LEFT JOIN returns every patient from the Patients table,
-- even if that patient does not have a matching visit.
-- If a patient has no visit record, the visit columns will contain NULL.

SELECT
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v ON p.patient_id = v.patient_id;

-- ============================================================
-- SECTION 12: ADVANCED SQL TOPICS
-- ============================================================

-- CASE WHEN can be used to create categories based on conditions.
-- The practice file lists CASE WHEN as an advanced topic to explore.

-- Window functions can perform calculations across related rows
-- without combining those rows into a single GROUP BY result.

-- A CTE (Common Table Expression), written using WITH, creates a
-- temporary named result that can be used by a later query.

-- These advanced topics are listed in the provided practice file
-- but no specific commands were provided there.

-- End of Week 3 SQL file.
