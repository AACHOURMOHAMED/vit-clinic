CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth date
) CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    CONSTRAINT medical_FK FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    status VARCHAR(50)
) CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(50),
    name VARCHAR(50)
) CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT invoices_FK FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
) CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    CONSTRAINT ITEMS_FK FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    treatment_id INT,
    CONSTRAINT TREATMENT_FK FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
)