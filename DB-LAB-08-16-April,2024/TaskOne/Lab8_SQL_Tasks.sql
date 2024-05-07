
CREATE DATABASE IF NOT EXISTS person;
USE person;

CREATE TABLE summary (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total_user INT,
    Yahoo INT,
    Hotmail INT,
    Gmail INT
);

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50)
);

DELIMITER //
CREATE PROCEDURE InsertIntoSummary(IN id INT, IN total_user INT, IN Yahoo INT, IN Hotmail INT, IN Gmail INT)
BEGIN
    INSERT INTO summary (id, total_user, Yahoo, Hotmail, Gmail)
    VALUES (id, total_user, Yahoo, Hotmail, Gmail);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertIntoUsers(IN user_id INT, IN username VARCHAR(50), IN password VARCHAR(50), IN email VARCHAR(50))
BEGIN
    INSERT INTO Users (user_id, username, password, email)
    VALUES (user_id, username, password, email);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AverageYahoo()
BEGIN
    SELECT AVG(Yahoo) AS Average_Yahoo FROM summary;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE MinGmail()
BEGIN
    SELECT MIN(Gmail) AS Min_Gmail FROM summary;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE MaxHotmail()
BEGIN
    SELECT MAX(Hotmail) AS Max_Hotmail FROM summary;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE IncrementTotalUser()
BEGIN
    UPDATE summary SET total_user = total_user + 1 WHERE Yahoo <= Hotmail;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER InsertUserTrigger AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    UPDATE summary SET total_user = total_user + 1;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER DeleteUserTrigger AFTER DELETE ON Users
FOR EACH ROW
BEGIN
    UPDATE summary SET total_user = total_user - 1;
END //
DELIMITER ;
