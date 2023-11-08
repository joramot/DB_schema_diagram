CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount REAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price REAL,
    quantity INT,
    total_price REAL,
    invoce_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoce_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX idx_invoices_items_invoce_id ON invoice_items (invoce_id);
CREATE INDEX idx_invoices_items_treatment_id ON invoice_items (treatment_id);

CREATE TABLE medical_histories_treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_histories_id INT,
    treatments_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);

CREATE INDEX idx_medical_histories_treatments_medical_histories_id ON medical_histories_treatments (medical_histories_id);
CREATE INDEX idx_medical_histories_treatments_treatments_id ON medical_histories_treatments (treatments_id);
