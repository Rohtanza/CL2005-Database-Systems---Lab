
-- create User
CREATE USER 'dummyuser'@'localhost' IDENTIFIED BY 'NewPassword123!';

-- grant privileges
GRANT SELECT ON themeparkdata.* TO 'dummyuser'@'localhost';
GRANT SELECT ON themeparkdata.hour_view TO 'dummyuser'@'localhost';
GRANT SELECT ON themeparkdata.employee TO 'dummyuser'@'localhost';
GRANT CREATE ON *.* TO 'dummyuser'@'localhost';

-- revoke privileges
REVOKE SELECT ON themeparkdata.hour_view FROM 'dummyuser'@'localhost';

-- grant insert option
GRANT INSERT ON themeparkdata.ticket TO 'dummyuser'@'localhost' WITH GRANT OPTION;

-- transaction control operations
USE themeparkdata;
SET autocommit = 0;
INSERT INTO themeparkdata.employee (EMP_NUM, EMP_TITLE, EMP_LNAME, EMP_FNAME, EMP_DOB, EMP_HIRE_DATE, EMP_AREA_CODE, EMP_PHONE, PARK_CODE)
VALUES (107, 'Mr', 'Doe', 'John', '1985-05-25', '2010-01-15', '1234', '567-8901', 'FR1001');
UPDATE themeparkdata.employee SET EMP_TITLE = 'Ms' WHERE EMP_NUM = 107;
ROLLBACK;
INSERT INTO themeparkdata.employee (EMP_NUM, EMP_TITLE, EMP_LNAME, EMP_FNAME, EMP_DOB, EMP_HIRE_DATE, EMP_AREA_CODE, EMP_PHONE, PARK_CODE)
VALUES (108, 'Mr', 'Doe', 'John', '1985-05-25', '2010-01-15', '1234', '567-8901', 'FR1001');
UPDATE themeparkdata.employee SET EMP_TITLE = 'Ms' WHERE EMP_NUM = 108;
SAVEPOINT sp1;
INSERT INTO themeparkdata.employee (EMP_NUM, EMP_TITLE, EMP_LNAME, EMP_FNAME, EMP_DOB, EMP_HIRE_DATE, EMP_AREA_CODE, EMP_PHONE, PARK_CODE)
VALUES (109, 'Mrs', 'Smith', 'Alice', '1978-12-10', '2008-06-20', '4567', '321-0987', 'ZA1342');
ROLLBACK TO SAVEPOINT sp1;
COMMIT;
