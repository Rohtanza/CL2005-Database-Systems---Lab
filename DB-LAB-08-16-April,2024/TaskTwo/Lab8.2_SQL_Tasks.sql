-- Create procedures for product discount
DELIMITER $$
CREATE PROCEDURE PRG_PROD()
BEGIN
    UPDATE product
    SET P_DISCOUNT = P_DISCOUNT * 1.05
    WHERE P_ONHAND >= P_MIN * 2;
END$$
DELIMITER ;

-- Create Procedure with local variables
DELIMITER $$
CREATE PROCEDURE my_procedure_Local_Variables()
BEGIN
    DECLARE a, b, c INT DEFAULT 10;
    SET a = a + 100;
    SET b = 2;
    SET c = a + b;
    SELECT a, b, c;
END$$
DELIMITER ;

-- Create trigger for product updates
-- Make sure the product table exists in the 'themeparkdata' database or adjust accordingly
DELIMITER $$
CREATE TRIGGER prevent_update
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update on this table is not allowed';
END$$
DELIMITER ;

-- Create blog and audit tables
CREATE TABLE blog (
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title TEXT,
    content TEXT,
    deleted TINYINT UNSIGNED NOT NULL DEFAULT '0',
    PRIMARY KEY (id),
    INDEX (deleted)
);

CREATE TABLE audit (
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    blog_id MEDIUMINT UNSIGNED NOT NULL,
    changetype ENUM('NEW', 'EDIT', 'DELETE') NOT NULL,
    changetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX (blog_id),
    INDEX (changetype),
    INDEX (changetime),
    FOREIGN KEY (blog_id) REFERENCES blog (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create triggers for blog table:
DELIMITER $$
CREATE TRIGGER blog_after_insert
AFTER INSERT ON blog
FOR EACH ROW
BEGIN
    INSERT INTO audit (blog_id, changetype) VALUES (NEW.id, 'NEW');
END$$

CREATE TRIGGER blog_after_update
AFTER UPDATE ON blog
FOR EACH ROW
BEGIN
    IF NEW.deleted THEN
        INSERT INTO audit (blog_id, changetype) VALUES (NEW.id, 'DELETE');
    ELSE
        INSERT INTO audit (blog_id, changetype) VALUES (NEW.id, 'EDIT');
    END IF;
END$$
DELIMITER ;
