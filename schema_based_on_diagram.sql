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

-- Create JOIN table for medical_histories and treatments
CREATE TABLE history_treatment (
  history_id INT,
  treatment_id INT,
  CONSTRAINT fk_history FOREIGN KEY history_id REFERENCES medical_histories(id),
  CONSTRAINT fk_treatment FOREIGN KEY treatment_id REFERENCES treatments(id)
);

-- Create INDEX for the foreign keys
CREATE INDEX patient_id_index ON medical_histories(patient_id);

CREATE INDEX medical_history__id_index ON invoices(medical_history__id);

CREATE INDEX invoice_id_index ON invoice_items(invoice_id);

CREATE INDEX treatment_id_index ON invoice_items(treatment_id);

CREATE INDEX history_id_index ON history_treatment(history_id);

CREATE INDEX treatment_id_index ON history_treatment(treatment_id);