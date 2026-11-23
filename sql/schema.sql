DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS facilities;
DROP TABLE IF EXISTS weight_tariffs;
DROP TABLE IF EXISTS vehicles;


CREATE TABLE customers (
    customer_id        INT AUTO_INCREMENT PRIMARY KEY,
    customer_type      ENUM('person', 'company') NOT NULL,
    name               VARCHAR(150) NOT NULL,
    nip                CHAR(10) NULL UNIQUE,
    email              VARCHAR(100) NOT NULL UNIQUE,
    phone              VARCHAR(20) NOT NULL,
    street             VARCHAR(100) NOT NULL,
    postal_code        CHAR(6) NOT NULL,
    city               VARCHAR(50) NOT NULL,
    created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_customer_nip CHECK (
        (customer_type = 'company' AND nip IS NOT NULL)
        OR (customer_type = 'person' AND nip IS NULL)
    )
);


CREATE TABLE weight_tariffs (
    tariff_id          INT AUTO_INCREMENT PRIMARY KEY,
    weight_from        DECIMAL(10, 2) NOT NULL,
    weight_to          DECIMAL(10, 2) NOT NULL,
    price              DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_weight_from CHECK (
        weight_from > 0.0
    ),
    CONSTRAINT chk_weight_to CHECK (
        weight_to > weight_from
    ),
    CONSTRAINT chk_price CHECK (
        price > 0
    )
);


CREATE TABLE facilities (
    facility_id        INT AUTO_INCREMENT PRIMARY KEY,
    hub_id             INT NULL,
    name               VARCHAR(50) NOT NULL UNIQUE,
    facility_type      ENUM('branch', 'hub') NOT NULL,
    street             VARCHAR(100) NOT NULL,
    postal_code        CHAR(6) NOT NULL,
    city               VARCHAR(50) NOT NULL,
    CONSTRAINT fk_facility_hub
    FOREIGN KEY (hub_id)
    REFERENCES facilities(facility_id)
    ON DELETE RESTRICT,
    CONSTRAINT chk_facility_hub CHECK (
        (facility_type = 'branch' AND hub_id IS NOT NULL)
        OR (facility_type = 'hub' AND hub_id IS NULL)
    )
);


CREATE TABLE employees (
    employee_id        INT AUTO_INCREMENT PRIMARY KEY,
    first_name         VARCHAR(100) NOT NULL,
    last_name          VARCHAR(100) NOT NULL,
    role               ENUM('courier', 'driver', 'warehouse_worker', 'dispatcher', 'shift_manager', 'branch_manager') NOT NULL,
    hire_date          DATE NOT NULL,
    facility_id        INT  NOT NULL,
    supervisor_id      INT NULL,
    CONSTRAINT fk_employee_facility
    FOREIGN KEY (facility_id)
    REFERENCES facilities(facility_id)
    ON DELETE RESTRICT,
    CONSTRAINT fk_employee_supervisor
    FOREIGN KEY (supervisor_id)
    REFERENCES employees(employee_id)
    ON DELETE RESTRICT
);


CREATE TABLE vehicles (
    vehicle_id         INT AUTO_INCREMENT PRIMARY KEY,
    plate_number       VARCHAR(10) UNIQUE NOT NULL,
    vehicle_type       ENUM('truck', 'van') NOT NULL,
    model              VARCHAR(100) NOT NULL,
    capacity_kg        DECIMAL(10, 2) NOT NULL,
    base_facility_id   INT NOT NULL,
    CONSTRAINT fk_vehicle_facility
    FOREIGN KEY (base_facility_id)
    REFERENCES facilities(facility_id)
    ON DELETE RESTRICT,
    CONSTRAINT chk_vehicle_capacity CHECK (
        capacity_kg > 0.0
    )
);