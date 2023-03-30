CREATE TABLE viewcandidate(
	id INT NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    percentage INT NOT NULL ,
    gender VARCHAR(1) NOT NULL,
    branch VARCHAR(10) NOT NULL
);

INSERT INTO viewcandidate VALUES(1, "Chandru", 95, "M", "MECH");
INSERT INTO viewcandidate VALUES(2, "Mack", 32, "M", "CSE");
INSERT INTO viewcandidate VALUES(3, "Ajay", 56, "M", "EEE");
INSERT INTO viewcandidate VALUES(4, "Kee", 89, "F", "CSE");
INSERT INTO viewcandidate VALUES(5, "John", 90, "M", "MECH");
INSERT INTO viewcandidate VALUES(6, "Reena", 84, "F", "EEE");
INSERT INTO viewcandidate VALUES(7, "Kim", 95, "M", "CSE");

SELECT * FROM viewcandidate;
-- a view is a virtual table based on the result-set of an SQL statement
-- A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
-- advantages-> views to hide table columns from users by granting them access to the view and not to the table itself. 
-- This helps enhance database security and integrity. 
-- Views help us construct simplified, abstracted interfaces to complex databases
-- SINGLE TABLE
CREATE VIEW view_candidates
AS SELECT * FROM viewcandidate WHERE branch = "MECH";

UPDATE view_candidates
SET percentage = 85 WHERE id = 6;

DELETE FROM view_candidates WHERE id = 8;

SELECT * FROM view_candidates;
SELECT * FROM viewcandidate;

DROP VIEW view_candidates;

CREATE VIEW view_candidates
AS SELECT id, name, percentage FROM viewcandidate WHERE branch = "MECH" WITH CHECK OPTION;
INSERT INTO viewcandidate VALUES(8, "Mon", 95, "F", "MECH"); -- gives error since id, gender, branch are not part of view 
-- ensure the consistency of the view, you use the WITH CHECK OPTION clause

-- MULTIPLE TABLES
CREATE VIEW studentdata AS
SELECT id, name, age, city_name, course FROM persons 
INNER JOIN city
ON persons.city_id = city.cid
INNER JOIN course
ON persons.course_id = course.crid;

SELECT * FROM studentdata;

RENAME TABLE studentdata
TO view_studentdata;
-- Data Definition Language (DDL)
-- DDL changes the structure of the table like creating a table, deleting a table, altering a table, etc.
-- All the command of DDL are auto-committed that means it permanently save all the changes in the database.
-- CREATE, ALTER, DROP, TRUNCATE

-- Data Manipulation Language (DML)
-- DML commands are used to modify the database. It is responsible for all form of changes in the database.
-- The command of DML is not auto-committed that means it can't permanently save all the changes in the database. They can be rollback.
-- INSERT, UPDATE, DELETE

-- Data Control Language (DDL)
-- DCL commands are used to grant and take back authority from any database user.
-- GRANT, REVOKE

-- Transaction Control Language (TCL)
-- TCL commands can only use with DML commands like INSERT, DELETE and UPDATE only.
-- These operations are automatically committed in the database that's why they cannot be used while creating tables or dropping them.
-- COMMIT, ROLLBACK

-- Data Query Language (DQL)
-- DQL is used to fetch the data from the database
-- SELECT
https://www.dotnettricks.com/learn/sqlserver/different-types-of-sql-keys
when a view uses a WITH CASCADED CHECK OPTION, MySQL checks the rules of the view and also the rules of the underlying views recursively
if a view uses a WITH LOCAL CHECK OPTION, MySQL checks the rules of views that have a WITH LOCAL CHECK OPTION and a WITH CASCADED CHECK OPTION.

It is different from the view that uses a WITH CASCADED CHECK OPTION that MySQL checks the rules of all dependent views
advantages. You can use views to hide table columns from users by granting them access to the view and not to the table itself. This helps enhance database security and integrity. Views can also help you construct simplified, abstracted interfaces to complex databases
START TRANSACTION will start the transaction and set the autocommit mode to off. ROLLBACK will revert any changes made to database after transaction started. COMMIT will make all changes made to database permenant after transaction started and set autocommit mode to true. So now we will see how we can have transaction in MySQL Stored Procedure.
To perform the ROLLBACK in MySQL Stored Procedure, we must have to declare exit handler in stored procedure. There are two types of handler we can have in MySQL Stored Procedure.

sqlexception
sqlwarning
sqlexception will execute when there is any error occurs during the query execution and sqlwarning will execute when any warning occurs in MySQL Stored Procedure. Let’s see how we can have those block in Stored Procedure.
https://xpertdeveloper.com/transaction-mysql-stored-procedure/