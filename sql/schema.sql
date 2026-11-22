DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    customer_type ENUM('person', 'company') NOT NULL,
    name          VARCHAR(150) NOT NULL,
    nip           CHAR(10) NULL UNIQUE,
    email         VARCHAR(100) NOT NULL UNIQUE,
    phone         VARCHAR(20) NOT NULL,
    street        VARCHAR(100) NOT NULL,
    postal_code   CHAR(6) NOT NULL,
    city          VARCHAR(50) NOT NULL,
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_customer_nip CHECK (
        (customer_type = 'company' AND nip IS NOT NULL)
        OR (customer_type = 'person' AND nip IS NULL)
    )
);