
-- SQL Practice Dataset (Version 7: Healthcare Patient & Medical Record System)

-- Hospitals Table
CREATE TABLE hospitals (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(200),
    city VARCHAR(100),
    phone VARCHAR(20)
);

-- Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(150),
    specialty VARCHAR(100),
    hospital_id INT,
    email VARCHAR(150),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

-- Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(150),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    hospital_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(255),
    status VARCHAR(50), -- Scheduled / Completed / Cancelled / No-Show
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

-- Diagnoses Table
CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis_code VARCHAR(20),
    diagnosis_description VARCHAR(255),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medication_name VARCHAR(200),
    dosage VARCHAR(100),
    duration_days INT,
    instructions VARCHAR(255),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Lab Results Table
CREATE TABLE lab_results (
    lab_result_id INT PRIMARY KEY,
    appointment_id INT,
    test_name VARCHAR(200),
    result_value VARCHAR(100),
    normal_range VARCHAR(100),
    result_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Sample Data Inserts

-- Hospitals
INSERT INTO hospitals (hospital_id, hospital_name, city, phone) VALUES
(1, 'City Care Hospital', 'Delhi', '011-23456789'),
(2, 'Green Valley Clinic', 'Mumbai', '022-98765432');

-- Doctors
INSERT INTO doctors (doctor_id, doctor_name, specialty, hospital_id, email) VALUES
(201, 'Dr. Suresh Kumar', 'General Medicine', 1, 'suresh.kumar@citycare.org'),
(202, 'Dr. Meera Joshi', 'Pediatrics', 1, 'meera.joshi@citycare.org'),
(203, 'Dr. Anil Rao', 'Cardiology', 2, 'anil.rao@greenvalley.org');

-- Patients
INSERT INTO patients (patient_id, patient_name, date_of_birth, gender, phone, city) VALUES
(301, 'Aakriti Agrawal', '1996-08-12', 'Female', '9876543210', 'Delhi'),
(302, 'Rohit Mehra', '1989-11-05', 'Male', '9123456780', 'Mumbai'),
(303, 'Priya Nair', '2015-04-20', 'Female', '9988776655', 'Delhi');

-- Appointments
INSERT INTO appointments (appointment_id, patient_id, doctor_id, hospital_id, appointment_date, appointment_time, reason, status) VALUES
(4001, 301, 201, 1, '2024-05-10', '10:30:00', 'Fever & Cough', 'Completed'),
(4002, 302, 203, 2, '2024-05-12', '14:00:00', 'Chest Pain', 'Completed'),
(4003, 303, 202, 1, '2024-05-15', '09:00:00', 'Routine Checkup (Child)', 'Completed'),
(4004, 301, 201, 1, '2024-06-01', '11:00:00', 'Follow-up', 'Scheduled');

-- Diagnoses
INSERT INTO diagnoses (diagnosis_id, appointment_id, diagnosis_code, diagnosis_description) VALUES
(5001, 4001, 'J06.9', 'Acute upper respiratory infection, unspecified'),
(5002, 4002, 'I20.9', 'Angina pectoris, unspecified'),
(5003, 4003, 'Z00.121', 'Encounter for routine child health examination with abnormal findings');

-- Prescriptions
INSERT INTO prescriptions (prescription_id, appointment_id, medication_name, dosage, duration_days, instructions) VALUES
(6001, 4001, 'Paracetamol', '500mg', 5, 'Take one tablet twice daily after food'),
(6002, 4002, 'Aspirin', '75mg', 30, 'Take one tablet daily'),
(6003, 4003, 'Multivitamin Syrup', '5ml', 14, 'Once daily');

-- Lab Results
INSERT INTO lab_results (lab_result_id, appointment_id, test_name, result_value, normal_range, result_date) VALUES
(7001, 4001, 'CBC - Hemoglobin', '13.5 g/dL', '12.0-15.5 g/dL', '2024-05-10'),
(7002, 4002, 'ECG - Findings', 'ST depression observed', 'Normal', '2024-05-12'),
(7003, 4003, 'Height & Weight', 'Height: 110 cm; Weight: 18 kg', 'Age appropriate', '2024-05-15');

-- End of dataset
