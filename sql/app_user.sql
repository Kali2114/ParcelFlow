DROP USER IF EXISTS 'parcelflowapp'@'%';

CREATE USER 'parcelflowapp'@'%' IDENTIFIED BY 'pass123';
GRANT SELECT, INSERT, UPDATE, DELETE ON parcelflow.* TO 'parcelflowapp'@'%';