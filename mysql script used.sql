-- create table
CREATE TABLE `employee_db`.`employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `employee_code` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- insert 4 employee
LOCK TABLES `employee_db`.`employees` WRITE;
INSERT INTO `employee_db`.`employees` VALUES 
(1,'Samantha Mackenzie','EMP97',80000),
(2,'Layla Benn','EMP91',92000),
(3,'Luis Alberto','EMP99',84000),
(4,'Rishaan','EMP70',85000);
UNLOCK TABLES;

-- stored procedure - execute withing create procedure window
CREATE PROCEDURE `employee_db`.`usp_employee_add_or_edit` (
IN _id INT,
IN _name VARCHAR(45),
IN _employee_code VARCHAR(45),
IN _salary INT

)
BEGIN
	IF _id = 0 THEN
		INSERT INTO employees(name,employee_code,salary)
		VALUES (_name,_employee_code,_salary);
        
	ELSE
		UPDATE employees
        SET name = _name,
		employee_code = _employee_code,
        salary = _salary
        WHERE id = _id;
	END IF;
    
    SELECT ROW_COUNT() AS 'affectedRows';
END