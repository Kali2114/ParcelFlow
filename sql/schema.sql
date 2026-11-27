DROP TABLE IF EXISTS scan_events;
DROP TABLE IF EXISTS trip_shipments;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS claims;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS facilities;
DROP TABLE IF EXISTS weight_tariffs;
DROP TABLE IF EXISTS event_types;



CREATE TABLE customers (
    customer_id                 INT AUTO_INCREMENT PRIMARY KEY,
    customer_type               ENUM('person', 'company') NOT NULL,
    name                        VARCHAR(150) NOT NULL,
    nip                         CHAR(10) NULL UNIQUE,
    email                       VARCHAR(100) NOT NULL UNIQUE,
    phone                       VARCHAR(20) NOT NULL,
    street                      VARCHAR(100) NOT NULL,
    postal_code                 CHAR(6) NOT NULL,
    city                        VARCHAR(50) NOT NULL,
    created_at                  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_customer_nip CHECK (
        (customer_type = 'company' AND nip IS NOT NULL)
        OR (customer_type = 'person' AND nip IS NULL)
    )
);


CREATE TABLE weight_tariffs (
    tariff_id                   INT AUTO_INCREMENT PRIMARY KEY,
    weight_from                 DECIMAL(10, 2) NOT NULL,
    weight_to                   DECIMAL(10, 2) NOT NULL,
    price                       DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_tariff_weight_from CHECK (
        weight_from > 0.0
    ),
    CONSTRAINT chk_tariff_weight_to CHECK (
        weight_to > weight_from
    ),
    CONSTRAINT chk_tariff_price CHECK (
        price > 0
    )
);


CREATE TABLE facilities (
    facility_id                 INT AUTO_INCREMENT PRIMARY KEY,
    hub_id                      INT NULL,
    name                        VARCHAR(50) NOT NULL UNIQUE,
    facility_type               ENUM('branch', 'hub') NOT NULL,
    street                      VARCHAR(100) NOT NULL,
    postal_code                 CHAR(6) NOT NULL,
    city                        VARCHAR(50) NOT NULL,
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
    employee_id                 INT AUTO_INCREMENT PRIMARY KEY,
    first_name                  VARCHAR(100) NOT NULL,
    last_name                   VARCHAR(100) NOT NULL,
    role                        ENUM('courier', 'driver', 'warehouse_worker', 'dispatcher', 'shift_manager', 'branch_manager') NOT NULL,
    hire_date                   DATE NOT NULL,
    facility_id                 INT NOT NULL,
    supervisor_id               INT NULL,
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
    vehicle_id                  INT AUTO_INCREMENT PRIMARY KEY,
    plate_number                VARCHAR(10) UNIQUE NOT NULL,
    vehicle_type                ENUM('truck', 'van') NOT NULL,
    model                       VARCHAR(100) NOT NULL,
    capacity_kg                 DECIMAL(10, 2) NOT NULL,
    base_facility_id            INT NOT NULL,
    CONSTRAINT fk_vehicle_facility
        FOREIGN KEY (base_facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT,
    CONSTRAINT chk_vehicle_capacity CHECK (
        capacity_kg > 0.0
    )
);


CREATE TABLE event_types (
    event_type_id               INT AUTO_INCREMENT PRIMARY KEY,
    code                        VARCHAR(20) UNIQUE NOT NULL,
    title                       VARCHAR(50) NOT NULL
);


CREATE TABLE shipments (
    shipment_id                 INT AUTO_INCREMENT PRIMARY KEY,
    receiver_first_name         VARCHAR(100) NOT NULL,
    receiver_last_name          VARCHAR(100) NOT NULL,
    receiver_phone_number       VARCHAR(20) NULL,
    receiver_street             VARCHAR(100) NOT NULL,
    receiver_postal_code        CHAR(6) NOT NULL,
    receiver_city               VARCHAR(50) NOT NULL,
    tracking_number             CHAR(12) UNIQUE NOT NULL,
    sender_id                   INT NOT NULL,
    destination_facility_id     INT NOT NULL,
    origin_facility_id          INT NOT NULL,
    weight_kg                   DECIMAL(10, 2) NOT NULL,
    price                       DECIMAL(10, 2) NOT NULL,
    cod                         DECIMAL(10, 2) NULL,
    shipping_date               DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_shipment_weight CHECK (
        weight_kg BETWEEN 0.1 AND 100
    ),
    CONSTRAINT chk_shipment_price CHECK (
        price > 0.0
    ),
    CONSTRAINT chk_shipment_cod CHECK (
        cod > 0.0
    ),
    CONSTRAINT fk_shipment_sender
        FOREIGN KEY (sender_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_shipment_origin
        FOREIGN KEY (origin_facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_shipment_destination
        FOREIGN KEY (destination_facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT
);


CREATE TABLE scan_events (
    scan_id                 INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id             INT NOT NULL,
    event_type_id           INT NOT NULL,
    employee_id             INT NOT NULL,
    facility_id             INT NULL,
    scan_date               DATETIME NOT NULL,
    comments                VARCHAR(255) NULL,
    CONSTRAINT fk_scan_shipment
        FOREIGN KEY (shipment_id)
        REFERENCES shipments(shipment_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_scan_event_type
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(event_type_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_scan_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_scan_facility
        FOREIGN KEY (facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT
);


CREATE TABLE trips (
    trip_id                     INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id                  INT NOT NULL,
    driver_id                   INT NOT NULL,
    destination_facility_id     INT NOT NULL,
    origin_facility_id          INT NOT NULL,
    departure_date              DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    arrival_date                DATETIME NULL,
    CONSTRAINT chk_trip_facilities CHECK (
        destination_facility_id <> origin_facility_id
    ),
    CONSTRAINT chk_trip_dates CHECK (
        arrival_date > departure_date
    ),
    CONSTRAINT fk_trip_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_trip_driver
        FOREIGN KEY (driver_id)
        REFERENCES employees(employee_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_trip_destination_facility
        FOREIGN KEY (destination_facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_trip_origin_facility
        FOREIGN KEY (origin_facility_id)
        REFERENCES facilities(facility_id)
        ON DELETE RESTRICT
);


CREATE TABLE trip_shipments (
    trip_shipment_id        INT AUTO_INCREMENT PRIMARY KEY,
    trip_id                 INT NOT NULL,
    shipment_id             INT NOT NULL,
    CONSTRAINT fk_trip_shipment_trip
        FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_trip_shipment_shipment
        FOREIGN KEY (shipment_id)
        REFERENCES shipments(shipment_id)
        ON DELETE RESTRICT,
    CONSTRAINT uq_trip_shipment UNIQUE (
        trip_id, shipment_id
    )
);


CREATE TABLE claims (
    claim_id            INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id         INT NOT NULL,
    claim_type          ENUM('loss', 'damage', 'delay') NOT NULL,
    status              ENUM('new', 'pending', 'accepted', 'rejected') NOT NULL DEFAULT 'new',
    filed_date          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_date       DATETIME NULL,
    claimed_amount      DECIMAL(10, 2) NOT NULL,
    compensation_amount DECIMAL(10, 2) NULL,
    reviewer_id         INT NULL,
    description         VARCHAR(1000) NOT NULL,
    CONSTRAINT chk_claim_amounts CHECK (
        claimed_amount > 0 AND
        compensation_amount >= 0 AND
        claimed_amount >= compensation_amount
    ),
    CONSTRAINT chk_claim_dates CHECK (
        resolved_date > filed_date
    ),
    CONSTRAINT fk_claim_shipment
        FOREIGN KEY (shipment_id)
        REFERENCES shipments(shipment_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_claim_reviewer
        FOREIGN KEY (reviewer_id)
        REFERENCES employees(employee_id)
        ON DELETE RESTRICT,
    CONSTRAINT chk_claim_status CHECK (
        (status = 'new' AND resolved_date IS NULL
        AND compensation_amount IS NULL
        AND reviewer_id IS NULL)
        OR
        (status = 'pending' AND resolved_date IS NULL
        AND compensation_amount IS NULL
        AND reviewer_id IS NOT NULL)
        OR
        (status = 'accepted' AND compensation_amount IS NOT NULL
        AND compensation_amount > 0
        AND resolved_date IS NOT NULL
        AND reviewer_id IS NOT NULL)
        OR
        (status = 'rejected' AND compensation_amount = 0
        AND compensation_amount IS NOT NULL
        AND resolved_date IS NOT NULL
        AND reviewer_id IS NOT NULL)
    )
);

