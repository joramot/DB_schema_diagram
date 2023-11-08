
CREATE TABLE patiens (
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
    FOREIGN KEY (patient_id) REFERENCES patiens(id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount REAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price REAL,
    quantity INT,
    total_price REAL,
    invoce_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100),
    PRIMARY KEY (id)
);
CREATE TABLE medical_histories_treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_histories_id INT,
    treatments_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);
